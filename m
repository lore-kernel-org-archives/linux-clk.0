Return-Path: <horms@verge.net.au>
Date: Thu, 3 Mar 2016 14:02:12 +0900
From: Simon Horman <horms@verge.net.au>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: shmobile: Remove ARCH_SHMOBILE_MULTI
Message-ID: <20160303050210.GB26062@verge.net.au>
References: <1456189051-519-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVDneo95F3JyFuvGZ_Bk4dL=ve41XONHj4b8DC4X7NMcQ@mail.gmail.com>
 <20160223091000.GA18694@verge.net.au>
 <20160225234434.GM28849@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160225234434.GM28849@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 25, 2016 at 03:44:34PM -0800, Stephen Boyd wrote:
> On 02/23, Simon Horman wrote:
> > On Tue, Feb 23, 2016 at 09:19:27AM +0100, Geert Uytterhoeven wrote:
> > > CC The New Mike ;-)
> > > 
> > > On Tue, Feb 23, 2016 at 1:57 AM, Simon Horman
> > > <horms+renesas@verge.net.au> wrote:
> > > > As of 9b5ba0df4ea4 ("ARM: shmobile: Introduce ARCH_RENESAS") all platforms
> > > > that use Renesas clock drivers now select ARCH_RENESAS. As it is present in
> > > > drivers/clk/Makefile ARCH_SHMOBILE_MULTI may now be removed.
> > > >
> > > > This is part of an ongoing process to migrate from ARCH_SHMOBILE to
> > > > ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
> > > > appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
> > > >
> > > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > 
> > > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > 
> 
> Applied to clk-next
> 
> > > >  drivers/clk/Makefile | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > >  Based on clk-next
> > > >
> > > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > > index bae4be6501df..b19af449d2f3 100644
> > > > --- a/drivers/clk/Makefile
> > > > +++ b/drivers/clk/Makefile
> > > > @@ -70,7 +70,6 @@ obj-$(CONFIG_COMMON_CLK_PXA)          += pxa/
> > > >  obj-$(CONFIG_COMMON_CLK_QCOM)          += qcom/
> > > >  obj-$(CONFIG_ARCH_ROCKCHIP)            += rockchip/
> > > >  obj-$(CONFIG_COMMON_CLK_SAMSUNG)       += samsung/
> > > > -obj-$(CONFIG_ARCH_SHMOBILE_MULTI)      += shmobile/
> > > 
> > > Should we rename clk/shmobile/ to clk/renesas/?
> > > Or is that too much of a hassle?
> > 
> > I think it is a good idea.  And I suspect it shouldn't be too difficult if
> > we coordinate things with Mike to handle any in-flight patches for that
> > directory.
> 
> Feel free to send the patch.

Done :)
