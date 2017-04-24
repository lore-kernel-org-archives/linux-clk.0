Return-Path: <pdeschrijver@nvidia.com>
Date: Mon, 24 Apr 2017 11:03:08 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Yoshihiro Kaneko <ykaneko0929@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk
	<linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Add Z clock divider support
Message-ID: <20170424080308.GJ30730@tbergstrom-lnx.Nvidia.com>
References: <1492624001-3758-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdWfouuGZqPGV7_-cXUmYe-SXd9popja8T43V5hPP+DQQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <CAMuHMdWfouuGZqPGV7_-cXUmYe-SXd9popja8T43V5hPP+DQQw@mail.gmail.com>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 21, 2017 at 03:59:10PM +0200, Geert Uytterhoeven wrote:
> Hi Kaneko-san, and Mike, Stephen (see below),
> 
> On Wed, Apr 19, 2017 at 7:46 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch adds Z clock divider support for R-Car Gen3 SoC.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> 
> I gave this patch a try on Salvator-X.  On both R-Car H3 and M3-W,
> /sys/kernel/debug/clk/clk_summary reports:
> 
>        .pll0                              0            0  2999999880
>        0 0
>           z                               0            0  3000000000
>        0 0
> 
> The Z clock runs at 1.5 GHz, so the numbers are off by a factor of two.
> It seems the PLL post-divider of 1/2 is not taken into account.
> 
> > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> 
> > +static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
> > +                                          unsigned long parent_rate)
> > +{
> > +       struct cpg_z_clk *zclk = to_z_clk(hw);
> > +       unsigned int mult;
> > +       unsigned int val;
> > +       unsigned long rate;
> > +
> > +       val = (clk_readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK)
> > +           >> CPG_FRQCRC_ZFC_SHIFT;
> > +       mult = 32 - val;
> > +
> > +       rate = div_u64((u64)parent_rate * mult + 16, 32);
> > +       /* Round to closest value at 100MHz unit */
> > +       rate = 100000000*DIV_ROUND_CLOSEST(rate, 100000000);
> 
> Mike, Stephen: what's your opinion about such rounding tricks?
> 

Is this an actual divider or a pulse skipper?

Peter.
