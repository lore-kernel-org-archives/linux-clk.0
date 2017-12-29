Return-Path: <sboyd@codeaurora.org>
Date: Thu, 28 Dec 2017 16:14:17 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexander Kochetkov <al.kochet@gmail.com>
Cc: linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	LAK <linux-arm-kernel@lists.infradead.org>,
	linux-rockchip@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: Re: [PATCH 1/2] clk: rename clk_core_get_boundaries() to
 clk_hw_get_boundaries() and expose
Message-ID: <20171229001417.GC7997@codeaurora.org>
References: <1513872282-5370-1-git-send-email-al.kochet@gmail.com>
 <1513872282-5370-2-git-send-email-al.kochet@gmail.com>
 <20171221200743.GM7997@codeaurora.org>
 <8EC4D15B-4A89-43FA-953E-95AF81417067@gmail.com>
 <20171227010638.GP7997@codeaurora.org>
 <4B1BB338-F1F9-4231-BDCA-5FBB1F61BC44@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <4B1BB338-F1F9-4231-BDCA-5FBB1F61BC44@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/28, Alexander Kochetkov wrote:
> Initial thread here:
> https://www.spinics.net/lists/linux-clk/msg21682.html
> 
> 
> > 27 дек. 2017 г., в 4:06, Stephen Boyd <sboyd@codeaurora.org> написал(а):
> > 
> > Are these limits the min/max limits that the parent clk can
> > output at? Or the min/max limits that software has constrained on
> > the clk?
> > 
> 
> Don’t know how to answer. For example, parent can output 768MHz,
> but some IP work unstable with that parent rate. This issues was observed by
> me and I didn’t get official confirmation from rockchip. So, I limit
> such clock to 192MHz using clk_set_max_rate(). May be I have to limit clk rate
> using another approach.

I'm asking if the rate is capped on the consumer side with
clk_set_max_rate() or if it's capped on the clk provider side to
express a hardware constraint.

> 
> Anybody from rockchip can confirm that? Or may be contact me clarifying details?
> 
> > I haven't looked in detail at this
> > rockchip_fractional_approximation() code, but it shouldn't be
> > doing the work of both the child rate determination and the
> > parent rate determination in one place. It should work with the
> > parent to figure out the rate the parent can provide and then
> > figure out how to achieve the desired rate from there.
> 
> Here is clock tree:
> 
>         clock                       rate
>         -----                       ----
>         xin24m                      24000000
>           pll_gpll                    768000000
>              gpll                       768000000
>                 i2s_src              768000000
>                    i2s0_pre         192000000
>                       i2s0_frac     16384000
>                          sclk_i2s0  16384000
> 
> I limit i2s0_pre rate to 192MHz in order to I2S IP work properly.
> rockchip_fractional_approximation() get called for i2s0_frac.
> if i2s0_pre rate is 20x times less than i2s0_frac, than rockchip_fractional_approximation()
> tries to set i2s0_pre rate to i2s_src rate. It tries to increase it’s parent rate in order
> to maximise relation between nominator and denominator.
> 
> If I convert rockchip_fractional_approximation() to rockchip_determine_rate(), than I get
> min=0, max=192MHz limits inside rockchip_determine_rate(). May be there should be
> new logic inside clk framework based on some new clk flags, that will provide max=768MHz
> for rockchip_determine_rate().
> 
> Also found, that rockchip_fractional_approximation() increase parents rate unconditionally
> without taking into account CLK_SET_RATE_PARENT flag.
> 
> Stephen, thanks a lot for deep description of determine_rate() background. I’ll taking some
> time thinking about possible solutions.
> 

Sounds like there are some things to be figured out here still. I
can take a closer look next week. Maybe Heiko will respond before
then.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
