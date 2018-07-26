Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rcar-gen3: Rename rint to .r
Date: Thu, 26 Jul 2018 17:25:24 +0200
Message-Id: <20180726152524.9393-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

All other internal clock names have a period prepended.

Hence rename the internal RCLK from "rint" to ".r", and move it to the
section where all other internal clocks are defined.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v4.20.

 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 3 ++-
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 3 ++-
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index a85dd50e89110d5d..ccaea9e1849d9330 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -73,6 +73,8 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
 
+	DEF_DIV6_RO(".r",       CLK_RINT,          CLK_EXTAL, CPG_RCKCR, 32),
+
 	/* Core Clock Outputs */
 	DEF_BASE("z",           R8A7795_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0),
 	DEF_BASE("z2",          R8A7795_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2),
@@ -112,7 +114,6 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 	DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV4, 0x250),
 
 	DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
-	DEF_DIV6_RO("r_int",    CLK_RINT,          CLK_EXTAL, CPG_RCKCR, 32),
 
 	DEF_BASE("r",           R8A7795_CLK_R,     CLK_TYPE_GEN3_R, CLK_RINT),
 };
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index dfb267a92f2a20d3..6a4ef3d04aa060bc 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -73,6 +73,8 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
 
+	DEF_DIV6_RO(".r",       CLK_RINT,          CLK_EXTAL, CPG_RCKCR, 32),
+
 	/* Core Clock Outputs */
 	DEF_BASE("z",           R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0),
 	DEF_BASE("z2",          R8A7796_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2),
@@ -111,7 +113,6 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_DIV6P1("hdmi",      R8A7796_CLK_HDMI,  CLK_PLL1_DIV4, 0x250),
 
 	DEF_DIV6_RO("osc",      R8A7796_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
-	DEF_DIV6_RO("r_int",    CLK_RINT,          CLK_EXTAL, CPG_RCKCR, 32),
 
 	DEF_BASE("r",           R8A7796_CLK_R,     CLK_TYPE_GEN3_R, CLK_RINT),
 };
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 8fae5e9c4a77242d..7a7eb9658058a09e 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -68,6 +68,8 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 	DEF_FIXED(".s3",	CLK_S3,			CLK_PLL1_DIV2,	6, 1),
 	DEF_FIXED(".sdsrc",	CLK_SDSRC,		CLK_PLL1_DIV2,	2, 1),
 
+	DEF_DIV6_RO(".r",	CLK_RINT, CLK_EXTAL, CPG_RCKCR, 32),
+
 	/* Core Clock Outputs */
 	DEF_BASE("z",		R8A77965_CLK_Z,		CLK_TYPE_GEN3_Z, CLK_PLL0),
 	DEF_FIXED("ztr",	R8A77965_CLK_ZTR,	CLK_PLL1_DIV2,	6, 1),
@@ -105,7 +107,6 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 	DEF_DIV6P1("hdmi",	R8A77965_CLK_HDMI,	CLK_PLL1_DIV4,	0x250),
 
 	DEF_DIV6_RO("osc",	R8A77965_CLK_OSC, CLK_EXTAL, CPG_RCKCR, 8),
-	DEF_DIV6_RO("r_int",	CLK_RINT, CLK_EXTAL, CPG_RCKCR, 32),
 
 	DEF_BASE("r",		R8A77965_CLK_R,	CLK_TYPE_GEN3_R, CLK_RINT),
 };
-- 
2.17.1
