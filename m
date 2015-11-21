Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: hl <hl@rock-chips.com>
Cc: dianders@chromium.org, mturquette@baylibre.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, linux-clk@vger.kernel.org, sboyd@codeaurora.org, dbasehore@chromium.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: rockchip: dmc: support rk3399 dmc clock driver
Date: Sat, 21 Nov 2015 19:30:29 +0100
Message-ID: <1589931.xBgSB4kSK8@phil>
In-Reply-To: <564E794B.8070002@rock-chips.com>
References: <1447928471-14448-1-git-send-email-hl@rock-chips.com> <42589302.5BMrDbIv8M@phil> <564E794B.8070002@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Lin,

Am Freitag, 20. November 2015, 09:37:15 schrieb hl:
> On 20/11/15 05:47, Heiko Stuebner wrote:
> > Hi Lin,
> >
> > Am Donnerstag, 19. November 2015, 18:21:10 schrieb Lin Huang:
> >> support rk3399 dmc clock driver. Note, ddr set rate function will
> >> use dcf controller which run in ATF, it need to fishish it when rk3399
> >> arm trust firmware ready.
> > this unfinalized state is slightly unfortunate and I think this code will
> > need to wait until CRU and DDRC specs are available.
> >
> > Because this is clearly part of the CRU (labeled CRU_CLKSEL6_CON etc)
> > so shouldn't be a separate driver at all and also what your driver currently
> > only does can still simply be described in the regular scheme as part of
> > a full clock driver like
> >
> > PNAME(mux_ddrc_p) = { "pll_dpll", "pll_gpll", "pll_alpll", "pll_abpll" };
> > COMPOSITE_NOGATE(0, "ddrc", mux_ddrc_p, 0,
> > 					RK3399_CLKSEL_CON(6), 4, 2, MFLAGS, 0, 3,
> > 					DFLAGS | CLK_DIVIDER_POWER_OF_TWO),
> >
> > So the code needs to actually demonstrate why a separate clock type is
> > really necessary.
> >
> > I do understand that we will probably need a special way to talk to this
> > dcf controller but seeing how this interaction will work is really a
> > prequisite to finding a correct solution.
>
>      if we can use common clock driver, i can put the dfi controller as 
> a  independent driver
>      into devfreq,  this is the best way. But how do we separate the ddr 
> clk_set_rate() ,
>      so we can manipulate dcf controller(actually, we use SMC handle dcf 
> controller in arm trust firmware ),
>      i check clock driver code, it seem there is not way to do that for now.

the core problem I have right now is, that I don't understand how the
interaction with the dfi controller works at all :-) .

One thing that might work, is that your dfi-driver takes the ddrc-clock
from the clock controller and then registers a clock notifier to get
notified before and after the clock-rate changes. But that depends as
stated above on how the dfi-controller needs to be handled.

For example the current armclk-handling uses a clock notifier around the
actual rate change ... so you could use that as inspiration.


Heiko
