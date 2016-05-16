Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <57369D2E.3030002@rock-chips.com>
References: <1463164937-91089-1-git-send-email-briannorris@chromium.org>
	<1463164937-91089-2-git-send-email-briannorris@chromium.org>
	<CAD=FV=XstYhqpStSGw5PObWvpsvd3Nwp_hfEE-56bpFoVUyu+g@mail.gmail.com>
	<57369D2E.3030002@rock-chips.com>
Date: Mon, 16 May 2016 08:49:01 -0700
Message-ID: <CAD=FV=Wda=kXYf4MnjXsW6g8sPAAEv7JO1ZoGXOnJW=aL0yv-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: rockchip: fix incorrect parent for rk3399's {c,g}pll_aclk_perihp_src
From: Doug Anderson <dianders@chromium.org>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: Brian Norris <briannorris@chromium.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Fri, May 13, 2016 at 8:36 PM, Xing Zheng <zhengxing@rock-chips.com> wrot=
e:
> Hi Doug,
>
>
> On 2016=E5=B9=B405=E6=9C=8814=E6=97=A5 04:10, Doug Anderson wrote:
>>
>> Hi,
>>
>> On Fri, May 13, 2016 at 11:42 AM, Brian Norris <briannorris@chromium.org=
>
>> wrote:
>>>
>>> From: Xing Zheng <zhengxing@rock-chips.com>
>>>
>>> There was a typo, swapping 'c' <--> 'g'.
>>>
>>> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
>>> Signed-off-by: Brian Norris <briannorris@chromium.org>
>>> ---
>>>   drivers/clk/rockchip/clk-rk3399.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/rockchip/clk-rk3399.c
>>> b/drivers/clk/rockchip/clk-rk3399.c
>>> index 145756c4f3c8..9f86bfef70f7 100644
>>> --- a/drivers/clk/rockchip/clk-rk3399.c
>>> +++ b/drivers/clk/rockchip/clk-rk3399.c
>>> @@ -832,9 +832,9 @@ static struct rockchip_clk_branch
>>> rk3399_clk_branches[] __initdata =3D {
>>>                          RK3399_CLKGATE_CON(13), 1, GFLAGS),
>>>
>>>          /* perihp */
>>> -       GATE(0, "cpll_aclk_perihp_src", "gpll", CLK_IGNORE_UNUSED,
>>> +       GATE(0, "cpll_aclk_perihp_src", "cpll", CLK_IGNORE_UNUSED,
>>>                          RK3399_CLKGATE_CON(5), 0, GFLAGS),
>>> -       GATE(0, "gpll_aclk_perihp_src", "cpll", CLK_IGNORE_UNUSED,
>>> +       GATE(0, "gpll_aclk_perihp_src", "gpll", CLK_IGNORE_UNUSED,
>>>                          RK3399_CLKGATE_CON(5), 1, GFLAGS),
>>>          COMPOSITE(ACLK_PERIHP, "aclk_perihp", mux_aclk_perihp_p,
>>> CLK_IGNORE_UNUSED,
>>>                          RK3399_CLKSEL_CON(14), 7, 1, MFLAGS, 0, 5,
>>> DFLAGS,
>>
>> Definitely there was a bug since this table itself was inconsistent.
>> ...and I _think_ this fix is correct, but I'll note that the TRM has
>> more inconsistency here.
>>
>> In the big clock table 'CRU Clock Architecture Diagram', I see:
>>    CLK 4 is CPLL
>>    CLK 5 is GPLL
>>    CLK 125 is aclk_perihp_cpll_src and has 4 (CPLL) as source, with
>> g5[0] as the bit
>>    CLK 126 is aclk_perihp_gpll_src and has 5 (GPLL) as source, with
>> g5[1] as the bit
>>
>> In the definition of CRU_CLKGATE_CON5:
>>    bit 0 shows aclk_perihp_gpll_src_en
>>    bit 1 shows aclk_perihp_cpll_src_en
>>
>>
>> Thus the table shows CPLL as gate5[0] and GPLL as gate5[1].  The
>> register definition shows the opposite.  I'll tend to believe the
>> table over the register definition, but I figured I'd bring it up
>> anyway.
>>
>>
>> Xing Zheng: can you confirm that the table is correct and ask
>> documentation folks to fix the register definition for
>> CRU_CLKGATE_CON5?
>
> Yes, previously, our IC & DOC partner confirmed that the definition of
> CRU_CLKGATE_CON5 should be:
>   bit 0 shows aclk_perihp_cpll_src_en
>   bit 1 shows aclk_perihp_gpll_src_en
>
> Sorry to the incorrect register definition, we will fix them and review t=
he
> TRM again.

Great!

Since we now have extra confirmation that Brian's patch is indeed correct:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
