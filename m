Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <20180711142100.3765-1-geert+renesas@glider.be>
 <20180711142100.3765-6-geert+renesas@glider.be> <20180712135618.fviccj5rg4jgguvp@verge.net.au>
In-Reply-To: <20180712135618.fviccj5rg4jgguvp@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jul 2018 16:23:53 +0200
Message-ID: <CAMuHMdWyt7FeocWyf9RFwx2QRZdqZbpn++vjSF-6SpM4w-ZdvQ@mail.gmail.com>
Subject: Re: [PATCH 05/11] clk: renesas: r8a77980: Add OSC predivider
 configuration and clock
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Simon,

On Thu, Jul 12, 2018 at 3:56 PM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jul 11, 2018 at 04:20:54PM +0200, Geert Uytterhoeven wrote:
> > R-Car Gen3 Hardware Manual Rev.0.54 documents the relation between the
> > MD13 and MD14 mode pins, and the OSC EXTAL predivider, as used by the
> > OSC clock.  Hence augment the configuration structure with all
> > documented predivider values.
> >
> > Add the OSC clock using the configured predivider.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c

> > @@ -171,23 +173,23 @@ static const unsigned int r8a77980_crit_mod_clks[] __initconst = {
> >   */
> >
> >  /*
> > - *   MD              EXTAL           PLL2    PLL1    PLL3
> > + *   MD              EXTAL           PLL2    PLL1    PLL3    OSC
> >   * 14 13     (MHz)
> > - * --------------------------------------------------
> > - * 0  0              16.66 x 1       x240    x192    x192
> > - * 0  1              20    x 1       x200    x160    x160
> > - * 1  0              27    x 1       x148    x118    x118
> > - * 1  1              33.33 / 2       x240    x192    x192
> > + * --------------------------------------------------------
> > + * 0  0              16.66 x 1       x240    x192    x192    /16
> > + * 0  1              20    x 1       x200    x160    x160    /19
> > + * 1  0              27    x 1       x148    x118    x118    /24
>
> Not related to this patch, but in the Users' Manual 1.0
> EXTAL is listed as 27MHz in table 8.4e but 25MHz (below) table 8.2e.

Nice catch:
  - Divider 24 is correct for 25 MHz, but not for 27 Mhz.
  - Multipliers 148 and 118 are correct for 27 MHz, but not for 25 MHz.
Needs clarification...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
