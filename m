Return-Path: <chris.brandt@renesas.com>
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/2] clk: renesas: r7s9210: Convert some clocks to early
Date: Fri, 21 Sep 2018 10:20:54 -0500
Message-Id: <20180921152054.117774-3-chris.brandt@renesas.com>
In-Reply-To: <20180921152054.117774-1-chris.brandt@renesas.com>
References: <20180921152054.117774-1-chris.brandt@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

The OSTM timer driver for RZ/A2 uses TIMER_OF_DECLARE which requires the
ostm module clocks to be registers early in boot.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c | 141 +++++++++++++++++++++------------
 1 file changed, 90 insertions(+), 51 deletions(-)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index bd1dd4ff2051..eb9103cfa2ac 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -55,25 +55,25 @@ enum clk_ids {
 
 static struct cpg_core_clk r7s9210_core_clks[] = {
 	/* External Clock Inputs */
-	DEF_INPUT("extal",     CLK_EXTAL),
+	/*	  ".extal"  exists as early clock */
 
 	/* Internal Core Clocks */
-	DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_RZA_MAIN, CLK_EXTAL),
-	DEF_BASE(".pll",       CLK_PLL, CLK_TYPE_RZA_PLL, CLK_MAIN),
+	/*	  ".main"   exists as early clock */
+	/*	  ".pll"    exists as early clock */
 
 	/* Core Clock Outputs */
 	DEF_FIXED("i",      R7S9210_CLK_I,     CLK_PLL,          2, 1),
 	DEF_FIXED("g",      R7S9210_CLK_G,     CLK_PLL,          4, 1),
 	DEF_FIXED("b",      R7S9210_CLK_B,     CLK_PLL,          8, 1),
 	DEF_FIXED("p1",     R7S9210_CLK_P1,    CLK_PLL,         16, 1),
-	DEF_FIXED("p1c",    R7S9210_CLK_P1C,   CLK_PLL,         16, 1),
+	/*	  "p1c"     exists as early clock */
 	DEF_FIXED("p0",     R7S9210_CLK_P0,    CLK_PLL,         32, 1),
 };
 
 static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
-	DEF_MOD_STB("ostm2",	 34,	R7S9210_CLK_P1C),
-	DEF_MOD_STB("ostm1",	 35,	R7S9210_CLK_P1C),
-	DEF_MOD_STB("ostm0",	 36,	R7S9210_CLK_P1C),
+	/*	    "ostm2"	 36	exists as early clock */
+	/*	    "ostm1"	 35	exists as early clock */
+	/*	    "ostm0"	 34	exists as early clock */
 
 	DEF_MOD_STB("scif4",	 43,	R7S9210_CLK_P1C),
 	DEF_MOD_STB("scif3",	 44,	R7S9210_CLK_P1C),
@@ -91,6 +91,71 @@ static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
 
 };
 
+static struct cpg_core_clk r7s9210_early_core_clks[] = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal",     CLK_EXTAL),
+
+	/* Internal Core Clocks */
+	DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_RZA_MAIN, CLK_EXTAL),
+	DEF_BASE(".pll",       CLK_PLL, CLK_TYPE_RZA_PLL, CLK_MAIN),
+
+	/* Core Clock Outputs */
+	DEF_FIXED("p1c",    R7S9210_CLK_P1C,   CLK_PLL,         16, 1),
+};
+
+static const struct mssr_mod_clk r7s9210_early_mod_clks[] __initconst = {
+	DEF_MOD_STB("ostm2",	 34,	R7S9210_CLK_P1C),
+	DEF_MOD_STB("ostm1",	 35,	R7S9210_CLK_P1C),
+	DEF_MOD_STB("ostm0",	 36,	R7S9210_CLK_P1C),
+};
+
+/* The clock dividers in the table vary based on DT and register settings */
+static void r7s9210_update_clk_table(struct clk *extal_clk, void __iomem *base)
+{
+	int i;
+	u16 frqcr;
+	u8 index;
+
+	/* If EXTAL is above 12MHz, then we know it is Mode 1 */
+	if (clk_get_rate(extal_clk) > 12000000)
+		cpg_mode = 1;
+
+	frqcr = clk_readl(base + CPG_FRQCR) & 0xFFF;
+	if (frqcr == 0x012)
+		index = 0;
+	else if (frqcr == 0x112)
+		index = 1;
+	else if (frqcr == 0x212)
+		index = 2;
+	else if (frqcr == 0x322)
+		index = 3;
+	else if (frqcr == 0x333)
+		index = 4;
+	else
+		BUG_ON(1);	/* Illegal FRQCR value */
+
+	for (i = 0; i < ARRAY_SIZE(r7s9210_core_clks); i++) {
+		switch (r7s9210_core_clks[i].id) {
+		case R7S9210_CLK_I:
+			r7s9210_core_clks[i].div = ratio_tab[index].i;
+			break;
+		case R7S9210_CLK_G:
+			r7s9210_core_clks[i].div = ratio_tab[index].g;
+			break;
+		case R7S9210_CLK_B:
+			r7s9210_core_clks[i].div = ratio_tab[index].b;
+			break;
+		case R7S9210_CLK_P1:
+		case R7S9210_CLK_P1C:
+			r7s9210_core_clks[i].div = ratio_tab[index].p1;
+			break;
+		case R7S9210_CLK_P0:
+			r7s9210_core_clks[i].div = 32;
+			break;
+		}
+	}
+}
+
 struct clk * __init rza2_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
 	struct clk **clks, void __iomem *base,
@@ -99,9 +164,6 @@ struct clk * __init rza2_cpg_clk_register(struct device *dev,
 	struct clk *parent;
 	unsigned int mult = 1;
 	unsigned int div = 1;
-	u16 frqcr;
-	u8 index;
-	int i;
 
 	parent = clks[core->parent];
 	if (IS_ERR(parent))
@@ -123,47 +185,8 @@ struct clk * __init rza2_cpg_clk_register(struct device *dev,
 	}
 
 	/* Adjust the dividers based on the current FRQCR setting */
-	if (core->id == CLK_MAIN) {
-
-		/* If EXTAL is above 12MHz, then we know it is Mode 1 */
-		if (clk_get_rate(parent) > 12000000)
-			cpg_mode = 1;
-
-		frqcr = clk_readl(base + CPG_FRQCR) & 0xFFF;
-		if (frqcr == 0x012)
-			index = 0;
-		else if (frqcr == 0x112)
-			index = 1;
-		else if (frqcr == 0x212)
-			index = 2;
-		else if (frqcr == 0x322)
-			index = 3;
-		else if (frqcr == 0x333)
-			index = 4;
-		else
-			BUG_ON(1);	/* Illegal FRQCR value */
-
-		for (i = 0; i < ARRAY_SIZE(r7s9210_core_clks); i++) {
-			switch (r7s9210_core_clks[i].id) {
-			case R7S9210_CLK_I:
-				r7s9210_core_clks[i].div = ratio_tab[index].i;
-				break;
-			case R7S9210_CLK_G:
-				r7s9210_core_clks[i].div = ratio_tab[index].g;
-				break;
-			case R7S9210_CLK_B:
-				r7s9210_core_clks[i].div = ratio_tab[index].b;
-				break;
-			case R7S9210_CLK_P1:
-			case R7S9210_CLK_P1C:
-				r7s9210_core_clks[i].div = ratio_tab[index].p1;
-				break;
-			case R7S9210_CLK_P0:
-				r7s9210_core_clks[i].div = 32;
-				break;
-			}
-		}
-	}
+	if (core->id == CLK_MAIN)
+		r7s9210_update_clk_table(parent, base);
 
 	return clk_register_fixed_factor(NULL, core->name,
 					 __clk_get_name(parent), 0, mult, div);
@@ -181,9 +204,25 @@ const struct cpg_mssr_info r7s9210_cpg_mssr_info __initconst = {
 	.num_mod_clks = ARRAY_SIZE(r7s9210_mod_clks),
 	.num_hw_mod_clks = 11 * 32, /* includes STBCR0 which doesn't exist */
 
+	/* Early Core Clocks */
+	.early_core_clks = r7s9210_early_core_clks,
+	.num_early_core_clks = ARRAY_SIZE(r7s9210_early_core_clks),
+
+	/* Early Module Clocks */
+	.early_mod_clks = r7s9210_early_mod_clks,
+	.num_early_mod_clks = ARRAY_SIZE(r7s9210_early_mod_clks),
+
 	/* Callbacks */
 	.cpg_clk_register = rza2_cpg_clk_register,
 
 	/* RZ/A2 has Standby Control Registers */
 	.stbyctrl = true,
 };
+
+static void __init r7s9210_cpg_mssr_early_init(struct device_node *np)
+{
+	cpg_mssr_early_init(np, &r7s9210_cpg_mssr_info);
+}
+
+CLK_OF_DECLARE_DRIVER(cpg_mstp_clks, "renesas,r7s9210-cpg-mssr",
+		      r7s9210_cpg_mssr_early_init);
-- 
2.16.1
