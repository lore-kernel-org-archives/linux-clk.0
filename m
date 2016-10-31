Return-Path: <horms@verge.net.au>
Date: Mon, 31 Oct 2016 10:52:17 +0100
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
Message-ID: <20161031095214.GA2335@verge.net.au>
References: <20161021154737.3803065-1-arnd@arndb.de>
 <CAMuHMdU6nVn=P0B5Xeqh5T-Mn8YEK_4oH1kvAPcpQzkviX669w@mail.gmail.com>
 <3808786.t4RxxDciQu@wuerfel>
 <CAMuHMdWq9_xHZgMtho87yRnR+RBVA22Ss+8dPRb4OQ+Vrni69A@mail.gmail.com>
 <CAMuHMdXRjgETtjBHHu2mHt9iEfe_rL5fpD-pgPH9MWniOFubQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMuHMdXRjgETtjBHHu2mHt9iEfe_rL5fpD-pgPH9MWniOFubQQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Oct 31, 2016 at 10:23:00AM +0100, Geert Uytterhoeven wrote:
> On Tue, Oct 25, 2016 at 10:37 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Fri, Oct 21, 2016 at 11:07 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Friday, October 21, 2016 8:01:49 PM CEST Geert Uytterhoeven wrote:
> >>> > diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
> >>> > index 90dd0db7d9c6..762d122eddec 100644
> >>> > --- a/drivers/clk/renesas/Makefile
> >>> > +++ b/drivers/clk/renesas/Makefile
> >>> > @@ -4,11 +4,7 @@ obj-$(CONFIG_ARCH_R8A73A4)             += clk-r8a73a4.o clk-div6.o
> >>> >  obj-$(CONFIG_ARCH_R8A7740)             += clk-r8a7740.o clk-div6.o
> >>> >  obj-$(CONFIG_ARCH_R8A7778)             += clk-r8a7778.o
> >>> >  obj-$(CONFIG_ARCH_R8A7779)             += clk-r8a7779.o
> >>> > -obj-$(CONFIG_ARCH_R8A7790)             += clk-rcar-gen2.o clk-div6.o
> >>> > -obj-$(CONFIG_ARCH_R8A7791)             += clk-rcar-gen2.o clk-div6.o
> >>> > -obj-$(CONFIG_ARCH_R8A7792)             += clk-rcar-gen2.o clk-div6.o
> >>> > -obj-$(CONFIG_ARCH_R8A7793)             += clk-rcar-gen2.o clk-div6.o
> >>> > -obj-$(CONFIG_ARCH_R8A7794)             += clk-rcar-gen2.o clk-div6.o
> >>> > +obj-$(CONFIG_ARCH_RCAR_GEN2)           += clk-rcar-gen2.o clk-div6.o
> >>> >  obj-$(CONFIG_ARCH_R8A7795)             += r8a7795-cpg-mssr.o rcar-gen3-cpg.o
> >>> >  obj-$(CONFIG_ARCH_R8A7796)             += r8a7796-cpg-mssr.o rcar-gen3-cpg.o
> >>> >  obj-$(CONFIG_ARCH_SH73A0)              += clk-sh73a0.o clk-div6.o
> >>>
> >>> Please don't fix it this way, as it will make it _harder_ to convert the R-Car
> >>> Gen2 SoCs to the modern CPG/MSSR driver later.
> >>
> >> Ok, I see. How about just adding another line for r8a7743 and
> >> dropping that again after the timer_init has been converted?
> >
> > That's an option, but it touches a different subsystem ;-)
> 
> Alternatively, the call to rcar_gen2_clocks_init() in
> arch/arm/mach-shmobile/setup-rcar-gen2.c:rcar_gen2_timer_init()
> can be protected temporarily by
> 
>     #if defined(CONFIG_R8A7790) || ... || defined(CONFIG_R8A7794)
> 
> until "[PATCH v4 00/23] soc: renesas: Add R-Car RST driver for
> obtaining mode pin state" went it, which will remove that call.

I believe Geert has something like the following in mind.
It makes sense to me as it should resolve the problem in question
and although it is a work-around it should not be in place for long as
the patchset mentioned immediately above would remove it.

From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] ARM: shmobile: only call rcar_gen2_clocks_init() if present

The RZ/G1M (r8a7743) uses the R-Car Gen2 core, but not the R-Car Gen2 clock
driver. This is a harbinger of a transition for R-Car Gen2 SoCs. As the
process to get all the required pieces in place is somewhat complex it
seems useful to try to disentangle dependencies where possible.

The approach here is to temporarily disable calling rcar_gen2_clocks_init()
if no R-Car Gen2 SoC are configured and thus the symbol will not be
present.

Fixes: 1254f607fc3d ("ARM: shmobile: r8a7743: basic SoC support")
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---

The current likely path to removing need for this is for
"[PATCH v4 00/23] soc: renesas: Add R-Car RST driver for obtaining mode
pin state" to be accepted. In particular patch 20 removes the call to
rcar_gen2_clocks_init() in rcar_gen2_timer_init().
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 875bcb8c1026..657262556dc4 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -131,7 +131,13 @@ void __init rcar_gen2_timer_init(void)
 	iounmap(base);
 #endif /* CONFIG_ARM_ARCH_TIMER */
 
-	rcar_gen2_clocks_init(mode);
+	if (IS_ENABLED(CONFIG_ARCH_R8A7790) ||
+	    IS_ENABLED(CONFIG_ARCH_R8A7791) ||
+	    IS_ENABLED(CONFIG_ARCH_R8A7792) ||
+	    IS_ENABLED(CONFIG_ARCH_R8A7793) ||
+	    IS_ENABLED(CONFIG_ARCH_R8A7794))
+		rcar_gen2_clocks_init(mode);
+
 	clocksource_probe();
 }
 
-- 
2.7.0.rc3.207.g0ac5344
