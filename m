Return-Path: <zhengxing@rock-chips.com>
Message-ID: <57A00D08.3070607@rock-chips.com>
Date: Tue, 02 Aug 2016 11:01:28 +0800
From: Xing Zheng <zhengxing@rock-chips.com>
MIME-Version: 1.0
To: Brian Norris <briannorris@chromium.org>
CC: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 dianders@chromium.org, huangtao@rock-chips.com,
 zhangqing@rock-chips.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 4/8] clk: rockchip: rk3399: fix incorrect GATE
 bits for {c, g}pll_aclk_perihp_src
References: <1470045224-31854-1-git-send-email-zhengxing@rock-chips.com> <1470045224-31854-5-git-send-email-zhengxing@rock-chips.com> <20160801202057.GB129313@google.com>
In-Reply-To: <20160801202057.GB129313@google.com>
Content-Type: multipart/alternative;
 boundary="------------040001090209050203030107"
List-ID: <linux-clk.vger.kernel.org>

This is a multi-part message in MIME format.
--------------040001090209050203030107
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2016?08?02? 04:20, Brian Norris wrote:
> On Mon, Aug 01, 2016 at 05:53:39PM +0800, Xing Zheng wrote:
>> Sorry to refer incorrect clock diagram, we double check it that the
>> bits configuration of the Xpll_aclk_perihp_src need to be fixed:
>> bit 1 - shows aclk_perihp_cpll_src_en
>> bit 0 - shows aclk_perihp_gpll_src_en
> Last time, you confirmed with the IC designers that we had things right.
> What's different this time? Have you, for instance, done more thorough
> testing, to show that the logical parent structure this driver outputs
> is actually what the hardware is doing?
I tried to proof it throught the testing that plug/unplug the USB 
ethernet cable on kevin board.

1. the hclk_host0 and hclk_host1 are endpoint clocks.
cpll --> G5[1] --> aclk_perihp_cpll_src --\                   |--> 
hclk_host0
                                                                 | --> 
... ---> |
gpll --> G5[0] --> aclk_perihp_gpll_src --/                   |--> 
hclk_host1

2. on the kevin, there is no clock below the cpll_aclk_perihp_src, and 
the hclk_hostX are below the gpll_aclk_perihp_src:
     pll_cpll                              1            1   
800000000          0 0
        cpll                               7           19   
800000000          0 0
           cpll_aclk_perihp_src            0            0   
800000000          0 0

...
     pll_gpll                              1            1   
594000000          0 0
        gpll                              10           10   
594000000          0 0
           gpll_aclk_perihp_src            2            2   
594000000          0 0
                 hclk_perihp               5            5    
74250000          0 0
                    hclk_host1_arb           2            2    
74250000          0 0
                    hclk_host1             2            2    
74250000          0 0
                    hclk_host0_arb           2            2    
74250000          0 0
                    hclk_host0             2            2    
74250000          0 0

3. by default, G5[0] and G5[1] are enabled:
localhost ~ # mem r 0xff760314
0x000003e0

4. close the G5[1] (aclk_perihp_cpll_src), and plug/unplug USB ethernet 
cable, the DUT still works well:
localhost ~ # mem w 0xff760314 0xffff03e2
localhost ~ # mem r 0xff760314
0x000003e2
plug/unplug ok

5. close the G5[0] (aclk_perihp_gpll_src), , and plug/unplug USB 
ethernet cable, the DUT will be crashed:
localhost ~ # mem w 0xff760314 0xffff03e1
localhost ~ # mem r 0xff760314
0x000003e1
plug/unplug crashed

Hence:
bit 1 - shows aclk_perihp_cpll_src_en
bit 0 - shows aclk_perihp_gpll_src_en

>
> I think maybe this would qualify as:
>
> Fixes: 3bd14ae9da91 ("clk: rockchip: fix incorrect parent for rk3399's {c,g}pll_aclk_perihp_src")
>
> The above is not exactly a pure regression (we really want both
> changes), but apparently it wasn't a complete fix.
OK, I will add the commit message
"Fixes: 3bd14ae9da91 ("clk: rockchip: fix incorrect parent for rk3399's 
{c,g}pll_aclk_perihp_src")"
at next version.
>
>> Signed-off-by: Xing Zheng<zhengxing@rock-chips.com>
>> ---
>>
>> Changes in v2: None
> Uhh, isn't this patch brand new in v2? I don't think that means
> "Changes ... None".
Yes, I will add change log into this patch at next version.

Thanks.
>
> Brian
>
>>   drivers/clk/rockchip/clk-rk3399.c |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
>> index 2182391..8bf0d19 100644
>> --- a/drivers/clk/rockchip/clk-rk3399.c
>> +++ b/drivers/clk/rockchip/clk-rk3399.c
>> @@ -833,9 +833,9 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
>>
>>   	/* perihp */
>>   	GATE(0, "cpll_aclk_perihp_src", "cpll", CLK_IGNORE_UNUSED,
>> -			RK3399_CLKGATE_CON(5), 0, GFLAGS),
>> -	GATE(0, "gpll_aclk_perihp_src", "gpll", CLK_IGNORE_UNUSED,
>>   			RK3399_CLKGATE_CON(5), 1, GFLAGS),
>> +	GATE(0, "gpll_aclk_perihp_src", "gpll", CLK_IGNORE_UNUSED,
>> +			RK3399_CLKGATE_CON(5), 0, GFLAGS),
>>   	COMPOSITE(ACLK_PERIHP, "aclk_perihp", mux_aclk_perihp_p, CLK_IGNORE_UNUSED,
>>   			RK3399_CLKSEL_CON(14), 7, 1, MFLAGS, 0, 5, DFLAGS,
>>   			RK3399_CLKGATE_CON(5), 2, GFLAGS),
>> -- 
>> 1.7.9.5
>>
>>
>
>


-- 
- Xing Zheng


--------------040001090209050203030107
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 2016&#24180;08&#26376;02&#26085; 04:20, Brian Norris wrote:
    <blockquote cite="mid:20160801202057.GB129313@google.com"
      type="cite">
      <pre wrap="">On Mon, Aug 01, 2016 at 05:53:39PM +0800, Xing Zheng wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Sorry to refer incorrect clock diagram, we double check it that the
bits configuration of the Xpll_aclk_perihp_src need to be fixed:
bit 1 - shows aclk_perihp_cpll_src_en
bit 0 - shows aclk_perihp_gpll_src_en
</pre>
      </blockquote>
      <pre wrap="">
Last time, you confirmed with the IC designers that we had things right.
What's different this time? Have you, for instance, done more thorough
testing, to show that the logical parent structure this driver outputs
is actually what the hardware is doing?</pre>
    </blockquote>
    I tried to proof it throught the testing that plug/unplug the USB
    ethernet cable on kevin board.<br>
    <br>
    1. the hclk_host0 and hclk_host1 are endpoint clocks.<br>
    cpll --&gt; G5[1] --&gt; aclk_perihp_cpll_src --\&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    |--&gt; hclk_host0<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
    --&gt; ... ---&gt; |<br>
    gpll --&gt; G5[0] --&gt; aclk_perihp_gpll_src --/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    |--&gt; hclk_host1<br>
    <br>
    2. on the kevin, there is no clock below the cpll_aclk_perihp_src,
    and the hclk_hostX are below the gpll_aclk_perihp_src:<br>
    &nbsp;&nbsp;&nbsp; pll_cpll&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;
    800000000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0&nbsp; <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpll&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19&nbsp;&nbsp;
    800000000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0 <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpll_aclk_perihp_src&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;
    800000000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0 <br>
    <br>
    ...<br>
    &nbsp;&nbsp;&nbsp; pll_gpll&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;
    594000000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0&nbsp; <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpll&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10&nbsp;&nbsp;
    594000000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0&nbsp; <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpll_aclk_perihp_src&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;
    594000000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0&nbsp; <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hclk_perihp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;
    74250000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0&nbsp; <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hclk_host1_arb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;
    74250000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0&nbsp; <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hclk_host1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;
    74250000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0&nbsp; <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hclk_host0_arb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;
    74250000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0&nbsp; <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hclk_host0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;
    74250000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 0 <br>
    <br>
    3. by default, G5[0] and G5[1] are enabled:<br>
    localhost ~ # mem r 0xff760314<br>
    0x000003e0<br>
    <br>
    4. close the G5[1] (aclk_perihp_cpll_src), and plug/unplug USB
    ethernet cable, the DUT still works well:<br>
    localhost ~ # mem w 0xff760314
    0xffff03e2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br>
    localhost ~ # mem r 0xff760314<br>
    0x000003e2<br>
    plug/unplug ok<br>
    <br>
    5. close the G5[0] (aclk_perihp_gpll_src), , and plug/unplug USB
    ethernet cable, the DUT will be crashed:<br>
    localhost ~ # mem w 0xff760314 0xffff03e1
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br>
    localhost ~ # mem r 0xff760314<br>
    0x000003e1<br>
    <font color="#ff0000">plug/unplug crashed</font><br>
    <br>
    Hence:<br>
    bit 1 - shows aclk_perihp_cpll_src_en<br>
    bit 0 - shows aclk_perihp_gpll_src_en<br>
    <br>
    <blockquote cite="mid:20160801202057.GB129313@google.com"
      type="cite">
      <pre wrap="">

I think maybe this would qualify as:

Fixes: 3bd14ae9da91 ("clk: rockchip: fix incorrect parent for rk3399's {c,g}pll_aclk_perihp_src")

The above is not exactly a pure regression (we really want both
changes), but apparently it wasn't a complete fix.</pre>
    </blockquote>
    OK, I will add the commit message<br>
    "Fixes: 3bd14ae9da91 ("clk: rockchip: fix incorrect parent for
    rk3399's {c,g}pll_aclk_perihp_src")"<br>
    at next version.<br>
    <blockquote cite="mid:20160801202057.GB129313@google.com"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">Signed-off-by: Xing Zheng <a class="moz-txt-link-rfc2396E" href="mailto:zhengxing@rock-chips.com">&lt;zhengxing@rock-chips.com&gt;</a>
---

Changes in v2: None
</pre>
      </blockquote>
      <pre wrap="">
Uhh, isn't this patch brand new in v2? I don't think that means
"Changes ... None".</pre>
    </blockquote>
    Yes, I will add change log into this patch at next version.<br>
    <br>
    Thanks.
    <blockquote cite="mid:20160801202057.GB129313@google.com"
      type="cite">
      <pre wrap="">

Brian

</pre>
      <blockquote type="cite">
        <pre wrap=""> drivers/clk/rockchip/clk-rk3399.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 2182391..8bf0d19 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -833,9 +833,9 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
 
 	/* perihp */
 	GATE(0, "cpll_aclk_perihp_src", "cpll", CLK_IGNORE_UNUSED,
-			RK3399_CLKGATE_CON(5), 0, GFLAGS),
-	GATE(0, "gpll_aclk_perihp_src", "gpll", CLK_IGNORE_UNUSED,
 			RK3399_CLKGATE_CON(5), 1, GFLAGS),
+	GATE(0, "gpll_aclk_perihp_src", "gpll", CLK_IGNORE_UNUSED,
+			RK3399_CLKGATE_CON(5), 0, GFLAGS),
 	COMPOSITE(ACLK_PERIHP, "aclk_perihp", mux_aclk_perihp_p, CLK_IGNORE_UNUSED,
 			RK3399_CLKSEL_CON(14), 7, 1, MFLAGS, 0, 5, DFLAGS,
 			RK3399_CLKGATE_CON(5), 2, GFLAGS),
-- 
1.7.9.5


</pre>
      </blockquote>
      <pre wrap="">


</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
- Xing Zheng</pre>
  </body>
</html>

--------------040001090209050203030107--
