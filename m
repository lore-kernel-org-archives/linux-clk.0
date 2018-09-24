Return-Path: <chris.brandt@renesas.com>
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 3/3] clk: renesas: r7s9210: Move table update to separate function
Date: Mon, 24 Sep 2018 11:49:37 -0500
Message-Id: <20180924164937.36536-4-chris.brandt@renesas.com>
In-Reply-To: <20180924164937.36536-1-chris.brandt@renesas.com>
References: <20180924164937.36536-1-chris.brandt@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Same functionality, just easier to read.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c | 94 ++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index 7ab9030ef8b9..f9c22b61883b 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -97,6 +97,53 @@ static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
 
 };
 
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
@@ -105,9 +152,6 @@ struct clk * __init rza2_cpg_clk_register(struct device *dev,
 	struct clk *parent;
 	unsigned int mult = 1;
 	unsigned int div = 1;
-	u16 frqcr;
-	u8 index;
-	int i;
 
 	parent = clks[core->parent];
 	if (IS_ERR(parent))
@@ -128,48 +172,8 @@ struct clk * __init rza2_cpg_clk_register(struct device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	/* Adjust the dividers based on the current FRQCR setting */
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
-- 
2.16.1
