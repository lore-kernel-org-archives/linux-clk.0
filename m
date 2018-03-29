Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] clk: renesas: r8a7794: Fix LB clock divider
Date: Thu, 29 Mar 2018 19:33:10 +0200
Message-Id: <1522344790-20061-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1522344790-20061-1-git-send-email-geert+renesas@glider.be>
References: <1522344790-20061-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

The CLK_TYPE_GEN2_LB clock type is meant for SoCs like R-Car H2, where
the LB clock divider depends on the value of the MD18 pin.

On R-Car E2, the LB clock divider is fixed to 24.  Hence model the clock
as a fixed factor clock instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7794-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a7794-cpg-mssr.c b/drivers/clk/renesas/r8a7794-cpg-mssr.c
index 2a40bbeaeeafc2a4..3ce74f063fa86b19 100644
--- a/drivers/clk/renesas/r8a7794-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7794-cpg-mssr.c
@@ -55,7 +55,6 @@ static const struct cpg_core_clk r8a7794_core_clks[] __initconst = {
 	DEF_FIXED(".pll1_div2", CLK_PLL1_DIV2, CLK_PLL1, 2, 1),
 
 	/* Core Clock Outputs */
-	DEF_BASE("lb",   R8A7794_CLK_LB,   CLK_TYPE_GEN2_LB,   CLK_PLL1),
 	DEF_BASE("adsp", R8A7794_CLK_ADSP, CLK_TYPE_GEN2_ADSP, CLK_PLL1),
 	DEF_BASE("sdh",  R8A7794_CLK_SDH,  CLK_TYPE_GEN2_SDH,  CLK_PLL1),
 	DEF_BASE("sd0",  R8A7794_CLK_SD0,  CLK_TYPE_GEN2_SD0,  CLK_PLL1),
@@ -69,6 +68,7 @@ static const struct cpg_core_clk r8a7794_core_clks[] __initconst = {
 	DEF_FIXED("hp",     R8A7794_CLK_HP,    CLK_PLL1,         12, 1),
 	DEF_FIXED("i",      R8A7794_CLK_I,     CLK_PLL1,          2, 1),
 	DEF_FIXED("b",      R8A7794_CLK_B,     CLK_PLL1,         12, 1),
+	DEF_FIXED("lb",     R8A7794_CLK_B,     CLK_PLL1,         24, 1),
 	DEF_FIXED("p",      R8A7794_CLK_P,     CLK_PLL1,         24, 1),
 	DEF_FIXED("cl",     R8A7794_CLK_CL,    CLK_PLL1,         48, 1),
 	DEF_FIXED("cp",     R8A7794_CLK_CP,    CLK_PLL1,         48, 1),
-- 
2.7.4
