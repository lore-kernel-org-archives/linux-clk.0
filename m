Return-Path: <horms@verge.net.au>
Date: Wed, 2 Nov 2016 09:37:32 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: fix link error for rcar-gen2
Message-ID: <20161102083731.GB30742@verge.net.au>
References: <20161021154737.3803065-1-arnd@arndb.de>
 <CAMuHMdU6nVn=P0B5Xeqh5T-Mn8YEK_4oH1kvAPcpQzkviX669w@mail.gmail.com>
 <3808786.t4RxxDciQu@wuerfel>
 <CAMuHMdWq9_xHZgMtho87yRnR+RBVA22Ss+8dPRb4OQ+Vrni69A@mail.gmail.com>
 <CAMuHMdXRjgETtjBHHu2mHt9iEfe_rL5fpD-pgPH9MWniOFubQQ@mail.gmail.com>
 <20161031095214.GA2335@verge.net.au>
 <CAMuHMdVHmRcN0Tc1mWpeU5CCzqZY+naj-eU6hfiTe=tRD9XjNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMuHMdVHmRcN0Tc1mWpeU5CCzqZY+naj-eU6hfiTe=tRD9XjNg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Nov 02, 2016 at 09:14:02AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Oct 31, 2016 at 10:52 AM, Simon Horman <horms@verge.net.au> wrote:
> > From: Simon Horman <horms+renesas@verge.net.au>
> > Subject: [PATCH] ARM: shmobile: only call rcar_gen2_clocks_init() if present
> >
> > The RZ/G1M (r8a7743) uses the R-Car Gen2 core, but not the R-Car Gen2 clock
> > driver. This is a harbinger of a transition for R-Car Gen2 SoCs. As the
> > process to get all the required pieces in place is somewhat complex it
> > seems useful to try to disentangle dependencies where possible.
> >
> > The approach here is to temporarily disable calling rcar_gen2_clocks_init()
> > if no R-Car Gen2 SoC are configured and thus the symbol will not be
> > present.
> >
> > Fixes: 1254f607fc3d ("ARM: shmobile: r8a7743: basic SoC support")
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >
> > The current likely path to removing need for this is for
> > "[PATCH v4 00/23] soc: renesas: Add R-Car RST driver for obtaining mode
> > pin state" to be accepted. In particular patch 20 removes the call to
> > rcar_gen2_clocks_init() in rcar_gen2_timer_init().
> > ---
> >  arch/arm/mach-shmobile/setup-rcar-gen2.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> > index 875bcb8c1026..657262556dc4 100644
> > --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
> > +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> > @@ -131,7 +131,13 @@ void __init rcar_gen2_timer_init(void)
> >         iounmap(base);
> >  #endif /* CONFIG_ARM_ARCH_TIMER */
> >
> > -       rcar_gen2_clocks_init(mode);
> > +       if (IS_ENABLED(CONFIG_ARCH_R8A7790) ||
> > +           IS_ENABLED(CONFIG_ARCH_R8A7791) ||
> > +           IS_ENABLED(CONFIG_ARCH_R8A7792) ||
> > +           IS_ENABLED(CONFIG_ARCH_R8A7793) ||
> > +           IS_ENABLED(CONFIG_ARCH_R8A7794))
> > +               rcar_gen2_clocks_init(mode);
> 
> Upon second thought (triggered bySergei conflict notification), this needs
> an else clause:
> 
>         else
>                 of_clk_init(NULL);

Thanks, I will add that.
