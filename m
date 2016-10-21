Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <damm+renesas@opensource.se>, Simon Horman <horms+renesas@verge.net.au>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: fix link error for rcar-gen2
Date: Fri, 21 Oct 2016 23:07:47 +0200
Message-ID: <3808786.t4RxxDciQu@wuerfel>
In-Reply-To: <CAMuHMdU6nVn=P0B5Xeqh5T-Mn8YEK_4oH1kvAPcpQzkviX669w@mail.gmail.com>
References: <20161021154737.3803065-1-arnd@arndb.de> <CAMuHMdU6nVn=P0B5Xeqh5T-Mn8YEK_4oH1kvAPcpQzkviX669w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Friday, October 21, 2016 8:01:49 PM CEST Geert Uytterhoeven wrote:
> > diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
> > index 90dd0db7d9c6..762d122eddec 100644
> > --- a/drivers/clk/renesas/Makefile
> > +++ b/drivers/clk/renesas/Makefile
> > @@ -4,11 +4,7 @@ obj-$(CONFIG_ARCH_R8A73A4)             += clk-r8a73a4.o clk-div6.o
> >  obj-$(CONFIG_ARCH_R8A7740)             += clk-r8a7740.o clk-div6.o
> >  obj-$(CONFIG_ARCH_R8A7778)             += clk-r8a7778.o
> >  obj-$(CONFIG_ARCH_R8A7779)             += clk-r8a7779.o
> > -obj-$(CONFIG_ARCH_R8A7790)             += clk-rcar-gen2.o clk-div6.o
> > -obj-$(CONFIG_ARCH_R8A7791)             += clk-rcar-gen2.o clk-div6.o
> > -obj-$(CONFIG_ARCH_R8A7792)             += clk-rcar-gen2.o clk-div6.o
> > -obj-$(CONFIG_ARCH_R8A7793)             += clk-rcar-gen2.o clk-div6.o
> > -obj-$(CONFIG_ARCH_R8A7794)             += clk-rcar-gen2.o clk-div6.o
> > +obj-$(CONFIG_ARCH_RCAR_GEN2)           += clk-rcar-gen2.o clk-div6.o
> >  obj-$(CONFIG_ARCH_R8A7795)             += r8a7795-cpg-mssr.o rcar-gen3-cpg.o
> >  obj-$(CONFIG_ARCH_R8A7796)             += r8a7796-cpg-mssr.o rcar-gen3-cpg.o
> >  obj-$(CONFIG_ARCH_SH73A0)              += clk-sh73a0.o clk-div6.o
> 
> Please don't fix it this way, as it will make it _harder_ to convert the R-Car
> Gen2 SoCs to the modern CPG/MSSR driver later.
> 

Ok, I see. How about just adding another line for r8a7743 and
dropping that again after the timer_init has been converted?

	Arnd
