Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:45398 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731809AbeGZQwp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jul 2018 12:52:45 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 09/11] clk: renesas: r8a77995: Correct RCLK handling
Date: Thu, 26 Jul 2018 17:35:15 +0200
Message-Id: <20180726153517.10020-10-geert+renesas@glider.be>
In-Reply-To: <20180726153517.10020-1-geert+renesas@glider.be>
References: <20180726153517.10020-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

According to R-Car Gen3 Hardware Manual Rev.1.00, R-Car D3 has the
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

As Figure 8.1f "Block Diagram of CPG (R-Car D3)" shows 1/61 and 1/4
dividers after the On-Chip Oscillator, I assume the OCO runs at 8 MHz.
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index ea4cafbe6e851aca..49e6a0de54916e2d 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -46,6 +46,8 @@ enum clk_ids {
 	CLK_S3,
 	CLK_SDSRC,
 	CLK_SSPSRC,
+	CLK_RINT,
+	CLK_OCO,
 
 	/* Module Clocks */
 	MOD_CLK_BASE
@@ -72,6 +74,10 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 	DEF_FIXED(".s3",       CLK_S3,             CLK_PLL1,       6, 1),
 	DEF_FIXED(".sdsrc",    CLK_SDSRC,          CLK_PLL1,       2, 1),
 
+	DEF_DIV6_RO(".r",      CLK_RINT,           CLK_EXTAL, CPG_RCKCR, 32),
+
+	DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
+
 	/* Core Clock Outputs */
 	DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
 	DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
@@ -90,8 +96,8 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 
 	DEF_FIXED("cl",        R8A77995_CLK_CL,    CLK_PLL1,      48, 1),
 	DEF_FIXED("cp",        R8A77995_CLK_CP,    CLK_EXTAL,      2, 1),
-	DEF_FIXED("osc",       R8A77995_CLK_OSC,   CLK_EXTAL,    384, 1),
-	DEF_FIXED("r",         R8A77995_CLK_R,     CLK_EXTAL,   1536, 1),
+
+	DEF_DIV6_RO("osc",     R8A77995_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
 
 	DEF_GEN3_PE("s1d4c",   R8A77995_CLK_S1D4C, CLK_S1, 4, CLK_PE, 2),
 	DEF_GEN3_PE("s3d1c",   R8A77995_CLK_S3D1C, CLK_S3, 1, CLK_PE, 1),
@@ -102,6 +108,8 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 
 	DEF_DIV6P1("canfd",    R8A77995_CLK_CANFD, CLK_PLL0D3,    0x244),
 	DEF_DIV6P1("mso",      R8A77995_CLK_MSO,   CLK_PLL1D2,    0x014),
+
+	DEF_GEN3_RCKSEL("r",   R8A77995_CLK_R, CLK_RINT, 1, CLK_OCO, 61 * 4),
 };
 
 static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
-- 
2.17.1

