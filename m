Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, xf@rock-chips.com, huangtao@rock-chips.com, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, xxx@rock-chips.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] clk: rockchip: rk3228: make noc and some special clk as critical_clocks
Date: Thu, 30 Mar 2017 15:10:24 +0200
Message-ID: <6718031.Ukr0mjLQLl@phil>
In-Reply-To: <20170330124417.73ucpdkoonuiyhxz@lukather>
References: <1490695614-3220-1-git-send-email-zhangqing@rock-chips.com> <1490695614-3220-3-git-send-email-zhangqing@rock-chips.com> <20170330124417.73ucpdkoonuiyhxz@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, 30. M=E4rz 2017, 14:44:17 CEST schrieb Maxime Ripard:
> On Tue, Mar 28, 2017 at 06:06:52PM +0800, Elaine Zhang wrote:
> > Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> > ---
> >  drivers/clk/rockchip/clk-rk3228.c | 30 +++++++++++++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/c=
lk-rk3228.c
> > index db6e5a9e6de6..4d3203f887e2 100644
> > --- a/drivers/clk/rockchip/clk-rk3228.c
> > +++ b/drivers/clk/rockchip/clk-rk3228.c
> > @@ -445,7 +445,7 @@ enum rk3228_plls {
> >  			RK2928_CLKGATE_CON(2), 12, GFLAGS,
> >  			&rk3228_spdif_fracmux),
> > =20
> > -	GATE(0, "jtag", "ext_jtag", 0,
> > +	GATE(0, "jtag", "ext_jtag", CLK_IGNORE_UNUSED,
>=20
> CLK_IGNORE_UNUSED only prevents a given clock from being gated at
> late_initcall time, but will not prevent it from being gated later in
> the life of the system, for example if a reparenting occurs, or if all
> the clocks sharing the same clock tree become disabled.
>=20
> If your clock really should never ever be gated in order for Linux to
> operate properly, you should use CLK_IS_CRITICAL.

in the scope of the jtag clock, that is actually ok. As it only gates
some clock supplied from an external source (ext_jtag).
