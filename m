Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 08/11] clk: renesas: r8a77990: Correct RCLK handling
Date: Thu, 26 Jul 2018 17:35:14 +0200
Message-Id: <20180726153517.10020-9-geert+renesas@glider.be>
In-Reply-To: <20180726153517.10020-1-geert+renesas@glider.be>
References: <20180726153517.10020-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

According to R-Car Gen3 Hardware Manual Rev.1.00, R-Car E3 has the
RCLK Frequency Control Register (RCKCR), which determines the OSC and
RINT predivider values, and selection of the RCLK clock source between
RINT and the On-Chip Oscillator.

Hence change the OSC and RINT clock definitions to use the RCKCR
divider, and add the missing On-Chip Oscillator and RCLK clock source
switching logic.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
  - Add Reviewed-by,
  - Rename "r_int" to ".r", and "oco" to ".oco", as they are internal
    clocks.

As Figure 8.1g "Block Diagram of CPG (R-Car E3)" shows 1/61 and 1/4
dividers after the On-Chip Oscillator, I assume the OCO runs at 8 MHz.
---
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 9e14f1486fbb93cc..9437219efdd98e34 100644
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
@@ -72,6 +74,10 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	DEF_FIXED(".s3",       CLK_S3,             CLK_PLL1,       6, 1),
 	DEF_FIXED(".sdsrc",    CLK_SDSRC,          CLK_PLL1,       2, 1),
 
+	DEF_DIV6_RO(".r",      CLK_RINT,           CLK_EXTAL, CPG_RCKCR, 32),
+
+	DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
+
 	/* Core Clock Outputs */
 	DEF_FIXED("za2",       R8A77990_CLK_ZA2,   CLK_PLL0D24,    1, 1),
 	DEF_FIXED("za8",       R8A77990_CLK_ZA8,   CLK_PLL0D8,     1, 1),
@@ -100,8 +106,8 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	DEF_FIXED("cl",        R8A77990_CLK_CL,    CLK_PLL1,      48, 1),
 	DEF_FIXED("cp",        R8A77990_CLK_CP,    CLK_EXTAL,      2, 1),
 	DEF_FIXED("cpex",      R8A77990_CLK_CPEX,  CLK_EXTAL,      4, 1),
-	DEF_FIXED("osc",       R8A77990_CLK_OSC,   CLK_EXTAL,    384, 1),
-	DEF_FIXED("r",         R8A77990_CLK_R,     CLK_EXTAL,   1536, 1),
+
+	DEF_DIV6_RO("osc",     R8A77990_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
 
 	DEF_GEN3_PE("s0d6c",   R8A77990_CLK_S0D6C, CLK_S0, 6, CLK_PE, 2),
 	DEF_GEN3_PE("s3d1c",   R8A77990_CLK_S3D1C, CLK_S3, 1, CLK_PE, 1),
@@ -111,6 +117,8 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	DEF_DIV6P1("canfd",    R8A77990_CLK_CANFD, CLK_PLL0D6, 0x244),
 	DEF_DIV6P1("csi0",     R8A77990_CLK_CSI0,  CLK_PLL1D2, 0x00c),
 	DEF_DIV6P1("mso",      R8A77990_CLK_MSO,   CLK_PLL1D2, 0x014),
+
+	DEF_GEN3_RCKSEL("r",   R8A77990_CLK_R, CLK_RINT, 1, CLK_OCO, 61 * 4),
 };
 
 static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
-- 
2.17.1
