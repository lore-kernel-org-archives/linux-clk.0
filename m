Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ulrich Hecht <ulrich.hecht@gmail.com>,
	linux-sh@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 11/11] clk: shmobile: rcar-gen2: Remove obsolete rcar_gen2_clocks_init()
Date: Tue,  7 Jul 2015 16:10:17 +0200
Message-Id: <1436278217-20522-12-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1436278217-20522-1-git-send-email-geert+renesas@glider.be>
References: <1436278217-20522-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Since "ARM: shmobile: rcar-gen2: Use syscon to configure the CPG",
rcar_gen2_clocks_init() is no longer called by the R-Car Gen2 platform
code. Remove it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/shmobile/clk-rcar-gen2.c | 7 -------
 include/linux/clk/shmobile.h         | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/clk/shmobile/clk-rcar-gen2.c b/drivers/clk/shmobile/clk-rcar-gen2.c
index b121a49f7575a97b..3f02b40b4911831c 100644
--- a/drivers/clk/shmobile/clk-rcar-gen2.c
+++ b/drivers/clk/shmobile/clk-rcar-gen2.c
@@ -435,10 +435,3 @@ static void __init rcar_gen2_cpg_clocks_init(struct device_node *np)
 }
 CLK_OF_DECLARE(rcar_gen2_cpg_clks, "renesas,rcar-gen2-cpg-clocks",
 	       rcar_gen2_cpg_clocks_init);
-
-void __init rcar_gen2_clocks_init(u32 mode)
-{
-	cpg_mode = mode;
-
-	of_clk_init(NULL);
-}
diff --git a/include/linux/clk/shmobile.h b/include/linux/clk/shmobile.h
index cb19cc1865ca5cfb..95357cdde185d518 100644
--- a/include/linux/clk/shmobile.h
+++ b/include/linux/clk/shmobile.h
@@ -22,7 +22,6 @@ struct generic_pm_domain;
 
 void r8a7778_clocks_init(u32 mode);
 void r8a7779_clocks_init(u32 mode);
-void rcar_gen2_clocks_init(u32 mode);
 
 #ifdef CONFIG_PM_GENERIC_DOMAINS_OF
 void cpg_mstp_add_clk_domain(struct device_node *np);
-- 
1.9.1
