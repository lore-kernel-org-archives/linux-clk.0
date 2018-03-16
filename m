Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/8] clk: renesas: sh73a0: Always use readl()/writel()
Date: Fri, 16 Mar 2018 14:40:21 +0100
Message-Id: <1521207622-3311-8-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
References: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On arm32, there is no reason to use the (soon deprecated)
clk_readl()/clk_writel().  Hence use the generic readl()/writel()
instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-sh73a0.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/clk-sh73a0.c b/drivers/clk/renesas/clk-sh73a0.c
index eea38f6ea77e995d..6cfa6b51904117a5 100644
--- a/drivers/clk/renesas/clk-sh73a0.c
+++ b/drivers/clk/renesas/clk-sh73a0.c
@@ -85,7 +85,7 @@ sh73a0_cpg_register_clock(struct device_node *np, struct sh73a0_cpg *cpg,
 
 	if (!strcmp(name, "main")) {
 		/* extal1, extal1_div2, extal2, extal2_div2 */
-		u32 parent_idx = (clk_readl(cpg->reg + CPG_CKSCR) >> 28) & 3;
+		u32 parent_idx = (readl(cpg->reg + CPG_CKSCR) >> 28) & 3;
 
 		parent_name = of_clk_get_parent_name(np, parent_idx >> 1);
 		div = (parent_idx & 1) + 1;
@@ -110,11 +110,11 @@ sh73a0_cpg_register_clock(struct device_node *np, struct sh73a0_cpg *cpg,
 		default:
 			return ERR_PTR(-EINVAL);
 		}
-		if (clk_readl(cpg->reg + CPG_PLLECR) & BIT(enable_bit)) {
-			mult = ((clk_readl(enable_reg) >> 24) & 0x3f) + 1;
+		if (readl(cpg->reg + CPG_PLLECR) & BIT(enable_bit)) {
+			mult = ((readl(enable_reg) >> 24) & 0x3f) + 1;
 			/* handle CFG bit for PLL1 and PLL2 */
 			if (enable_bit == 1 || enable_bit == 2)
-				if (clk_readl(enable_reg) & BIT(20))
+				if (readl(enable_reg) & BIT(20))
 					mult *= 2;
 		}
 	} else if (!strcmp(name, "dsi0phy") || !strcmp(name, "dsi1phy")) {
@@ -193,9 +193,9 @@ static void __init sh73a0_cpg_clocks_init(struct device_node *np)
 		return;
 
 	/* Set SDHI clocks to a known state */
-	clk_writel(0x108, cpg->reg + CPG_SD0CKCR);
-	clk_writel(0x108, cpg->reg + CPG_SD1CKCR);
-	clk_writel(0x108, cpg->reg + CPG_SD2CKCR);
+	writel(0x108, cpg->reg + CPG_SD0CKCR);
+	writel(0x108, cpg->reg + CPG_SD1CKCR);
+	writel(0x108, cpg->reg + CPG_SD2CKCR);
 
 	for (i = 0; i < num_clks; ++i) {
 		const char *name;
-- 
2.7.4
