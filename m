Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.136]:47560 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753448AbcENDg2 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 13 May 2016 23:36:28 -0400
Subject: Re: [PATCH 2/2] clk: rockchip: fix incorrect parent for rk3399's
 {c,g}pll_aclk_perihp_src
To: Doug Anderson <dianders@chromium.org>,
	Brian Norris <briannorris@chromium.org>
References: <1463164937-91089-1-git-send-email-briannorris@chromium.org>
 <1463164937-91089-2-git-send-email-briannorris@chromium.org>
 <CAD=FV=XstYhqpStSGw5PObWvpsvd3Nwp_hfEE-56bpFoVUyu+g@mail.gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	Brian Norris <computersforpeace@gmail.com>
From: Xing Zheng <zhengxing@rock-chips.com>
Message-ID: <57369D2E.3030002@rock-chips.com>
Date: Sat, 14 May 2016 11:36:14 +0800
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XstYhqpStSGw5PObWvpsvd3Nwp_hfEE-56bpFoVUyu+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Doug,

On 2016年05月14日 04:10, Doug Anderson wrote:
> Hi,
>
> On Fri, May 13, 2016 at 11:42 AM, Brian Norris <briannorris@chromium.org> wrote:
>> From: Xing Zheng <zhengxing@rock-chips.com>
>>
>> There was a typo, swapping 'c' <--> 'g'.
>>
>> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
>> Signed-off-by: Brian Norris <briannorris@chromium.org>
>> ---
>>   drivers/clk/rockchip/clk-rk3399.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
>> index 145756c4f3c8..9f86bfef70f7 100644
>> --- a/drivers/clk/rockchip/clk-rk3399.c
>> +++ b/drivers/clk/rockchip/clk-rk3399.c
>> @@ -832,9 +832,9 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
>>                          RK3399_CLKGATE_CON(13), 1, GFLAGS),
>>
>>          /* perihp */
>> -       GATE(0, "cpll_aclk_perihp_src", "gpll", CLK_IGNORE_UNUSED,
>> +       GATE(0, "cpll_aclk_perihp_src", "cpll", CLK_IGNORE_UNUSED,
>>                          RK3399_CLKGATE_CON(5), 0, GFLAGS),
>> -       GATE(0, "gpll_aclk_perihp_src", "cpll", CLK_IGNORE_UNUSED,
>> +       GATE(0, "gpll_aclk_perihp_src", "gpll", CLK_IGNORE_UNUSED,
>>                          RK3399_CLKGATE_CON(5), 1, GFLAGS),
>>          COMPOSITE(ACLK_PERIHP, "aclk_perihp", mux_aclk_perihp_p, CLK_IGNORE_UNUSED,
>>                          RK3399_CLKSEL_CON(14), 7, 1, MFLAGS, 0, 5, DFLAGS,
> Definitely there was a bug since this table itself was inconsistent.
> ...and I _think_ this fix is correct, but I'll note that the TRM has
> more inconsistency here.
>
> In the big clock table 'CRU Clock Architecture Diagram', I see:
>    CLK 4 is CPLL
>    CLK 5 is GPLL
>    CLK 125 is aclk_perihp_cpll_src and has 4 (CPLL) as source, with
> g5[0] as the bit
>    CLK 126 is aclk_perihp_gpll_src and has 5 (GPLL) as source, with
> g5[1] as the bit
>
> In the definition of CRU_CLKGATE_CON5:
>    bit 0 shows aclk_perihp_gpll_src_en
>    bit 1 shows aclk_perihp_cpll_src_en
>
>
> Thus the table shows CPLL as gate5[0] and GPLL as gate5[1].  The
> register definition shows the opposite.  I'll tend to believe the
> table over the register definition, but I figured I'd bring it up
> anyway.
>
>
> Xing Zheng: can you confirm that the table is correct and ask
> documentation folks to fix the register definition for
> CRU_CLKGATE_CON5?
Yes, previously, our IC & DOC partner confirmed that the definition of 
CRU_CLKGATE_CON5 should be:
   bit 0 shows aclk_perihp_cpll_src_en
   bit 1 shows aclk_perihp_gpll_src_en

Sorry to the incorrect register definition, we will fix them and review 
the TRM again.

Thanks.

-- 
- Xing Zheng


