Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/7] clk: renesas: r8a7795: Reformat core clock table
Date: Mon, 13 Mar 2017 17:19:51 +0100
Message-Id: <1489421994-19707-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
References: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

For easier comparison with other clock drivers.
No functional changes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 4e176e7f958b133d..608178618da87bef 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -53,8 +53,8 @@ enum clk_ids {
 
 static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 	/* External Clock Inputs */
-	DEF_INPUT("extal",  CLK_EXTAL),
-	DEF_INPUT("extalr", CLK_EXTALR),
+	DEF_INPUT("extal",      CLK_EXTAL),
+	DEF_INPUT("extalr",     CLK_EXTALR),
 
 	/* Internal Core Clocks */
 	DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_GEN3_MAIN, CLK_EXTAL),
@@ -89,23 +89,23 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 	DEF_FIXED("s3d2",       R8A7795_CLK_S3D2,  CLK_S3,         2, 1),
 	DEF_FIXED("s3d4",       R8A7795_CLK_S3D4,  CLK_S3,         4, 1),
 
-	DEF_GEN3_SD("sd0",      R8A7795_CLK_SD0,   CLK_SDSRC,     0x0074),
-	DEF_GEN3_SD("sd1",      R8A7795_CLK_SD1,   CLK_SDSRC,     0x0078),
-	DEF_GEN3_SD("sd2",      R8A7795_CLK_SD2,   CLK_SDSRC,     0x0268),
-	DEF_GEN3_SD("sd3",      R8A7795_CLK_SD3,   CLK_SDSRC,     0x026c),
+	DEF_GEN3_SD("sd0",      R8A7795_CLK_SD0,   CLK_SDSRC,     0x074),
+	DEF_GEN3_SD("sd1",      R8A7795_CLK_SD1,   CLK_SDSRC,     0x078),
+	DEF_GEN3_SD("sd2",      R8A7795_CLK_SD2,   CLK_SDSRC,     0x268),
+	DEF_GEN3_SD("sd3",      R8A7795_CLK_SD3,   CLK_SDSRC,     0x26c),
 
 	DEF_FIXED("cl",         R8A7795_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",         R8A7795_CLK_CP,    CLK_EXTAL,      2, 1),
 
-	DEF_DIV6P1("mso",       R8A7795_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
-	DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV4, 0x250),
 	DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
 	DEF_DIV6P1("csi0",      R8A7795_CLK_CSI0,  CLK_PLL1_DIV4, 0x00c),
+	DEF_DIV6P1("mso",       R8A7795_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
+	DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV4, 0x250),
 
-	DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, CPG_RCKCR, 8),
+	DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
 	DEF_DIV6_RO("r_int",    CLK_RINT,          CLK_EXTAL, CPG_RCKCR, 32),
 
-	DEF_BASE("r",           R8A7795_CLK_R, CLK_TYPE_GEN3_R, CLK_RINT),
+	DEF_BASE("r",           R8A7795_CLK_R,     CLK_TYPE_GEN3_R, CLK_RINT),
 };
 
 static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
-- 
2.7.4
