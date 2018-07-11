Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/11] clk: renesas: r8a77990: Correct RCLK handling
Date: Wed, 11 Jul 2018 16:20:57 +0200
Message-Id: <20180711142100.3765-9-geert+renesas@glider.be>
In-Reply-To: <20180711142100.3765-1-geert+renesas@glider.be>
References: <20180711142100.3765-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

According to R-Car Gen3 Hardware Manual Rev.1.00, R-Car E3 has the
RCLK Frequency Control Register (RCKCR), which determines the OSC and
RINT predivider values, and selection of the RCLK clock source between
RINT and the On-Chip Oscillator.

Hence change the OSC and RINT clock definitions to use the RCKCR
divider, and add the missing On-Chip Oscillator and RCLK clock source
switching logic.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
As Figure 8.1g "Block Diagram of CPG (R-Car E3)" shows 1/61 and 1/4
dividers after the On-Chip Oscillator, I assume the OCO runs at 8 MHz.
---
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 9e14f1486fbb93cc..6fcc0abdb20c442d 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -44,6 +44,8 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
+	CLK_RINT,
+	CLK_OCO,
 
 	/* Module Clocks */
 	MOD_CLK_BASE
@@ -100,8 +102,8 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	DEF_FIXED("cl",        R8A77990_CLK_CL,    CLK_PLL1,      48, 1),
 	DEF_FIXED("cp",        R8A77990_CLK_CP,    CLK_EXTAL,      2, 1),
 	DEF_FIXED("cpex",      R8A77990_CLK_CPEX,  CLK_EXTAL,      4, 1),
-	DEF_FIXED("osc",       R8A77990_CLK_OSC,   CLK_EXTAL,    384, 1),
-	DEF_FIXED("r",         R8A77990_CLK_R,     CLK_EXTAL,   1536, 1),
+	DEF_DIV6_RO("osc",     R8A77990_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
+	DEF_DIV6_RO("r_int",   CLK_RINT,           CLK_EXTAL, CPG_RCKCR, 32),
 
 	DEF_GEN3_PE("s0d6c",   R8A77990_CLK_S0D6C, CLK_S0, 6, CLK_PE, 2),
 	DEF_GEN3_PE("s3d1c",   R8A77990_CLK_S3D1C, CLK_S3, 1, CLK_PE, 1),
@@ -111,6 +113,9 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	DEF_DIV6P1("canfd",    R8A77990_CLK_CANFD, CLK_PLL0D6, 0x244),
 	DEF_DIV6P1("csi0",     R8A77990_CLK_CSI0,  CLK_PLL1D2, 0x00c),
 	DEF_DIV6P1("mso",      R8A77990_CLK_MSO,   CLK_PLL1D2, 0x014),
+
+	DEF_RATE("oco",        CLK_OCO,            8 * 1000 * 1000),
+	DEF_GEN3_RCKSEL("r",   R8A77990_CLK_R, CLK_RINT, 1, CLK_OCO, 61 * 4),
 };
 
 static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
-- 
2.17.1
