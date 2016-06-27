Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] clk: renesas: r8a7796: Add watchdog core clocks
Date: Mon, 27 Jun 2016 19:39:24 +0200
Message-Id: <1467049165-7025-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1467049165-7025-1-git-send-email-geert+renesas@glider.be>
References: <1467049165-7025-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Add all core clocks related to the Watchdog Timer (WDT) controller on
the Renesas R-Car M3-W (r8a7796) SoC: OSC, Internal RCLK, and RCLK.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index c84b549c14d2e57d..ea9ed38943a3969c 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -45,6 +45,7 @@ enum clk_ids {
 	CLK_S3,
 	CLK_SDSRC,
 	CLK_SSPSRC,
+	CLK_RINT,
 
 	/* Module Clocks */
 	MOD_CLK_BASE
@@ -94,6 +95,11 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 
 	DEF_FIXED("cl",         R8A7796_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",         R8A7796_CLK_CP,    CLK_EXTAL,      2, 1),
+
+	DEF_DIV6_RO("osc",      R8A7796_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
+	DEF_DIV6_RO("r_int",    CLK_RINT,          CLK_EXTAL, CPG_RCKCR, 32),
+
+	DEF_BASE("r",           R8A7796_CLK_R,     CLK_TYPE_GEN3_R, CLK_RINT),
 };
 
 static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
-- 
1.9.1
