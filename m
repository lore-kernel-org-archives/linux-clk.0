Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/8] clk: renesas: rcar-gen2: Always use readl()/writel()
Date: Fri, 16 Mar 2018 14:40:19 +0100
Message-Id: <1521207622-3311-6-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
References: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On arm32, there is no reason to use the (soon deprecated)
clk_readl()/clk_writel().  Hence use the generic readl()/writel()
instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-rcar-gen2.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index d14cbe1ca29ac009..ee32a022e6da9548 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -62,8 +62,7 @@ static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
 	unsigned int mult;
 	unsigned int val;
 
-	val = (clk_readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK)
-	    >> CPG_FRQCRC_ZFC_SHIFT;
+	val = (readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK) >> CPG_FRQCRC_ZFC_SHIFT;
 	mult = 32 - val;
 
 	return div_u64((u64)parent_rate * mult, 32);
@@ -95,21 +94,21 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	mult = div_u64((u64)rate * 32, parent_rate);
 	mult = clamp(mult, 1U, 32U);
 
-	if (clk_readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
+	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
 		return -EBUSY;
 
-	val = clk_readl(zclk->reg);
+	val = readl(zclk->reg);
 	val &= ~CPG_FRQCRC_ZFC_MASK;
 	val |= (32 - mult) << CPG_FRQCRC_ZFC_SHIFT;
-	clk_writel(val, zclk->reg);
+	writel(val, zclk->reg);
 
 	/*
 	 * Set KICK bit in FRQCRB to update hardware setting and wait for
 	 * clock change completion.
 	 */
-	kick = clk_readl(zclk->kick_reg);
+	kick = readl(zclk->kick_reg);
 	kick |= CPG_FRQCRB_KICK;
-	clk_writel(kick, zclk->kick_reg);
+	writel(kick, zclk->kick_reg);
 
 	/*
 	 * Note: There is no HW information about the worst case latency.
@@ -121,7 +120,7 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * "super" safe value.
 	 */
 	for (i = 1000; i; i--) {
-		if (!(clk_readl(zclk->kick_reg) & CPG_FRQCRB_KICK))
+		if (!(readl(zclk->kick_reg) & CPG_FRQCRB_KICK))
 			return 0;
 
 		cpu_relax();
@@ -332,7 +331,7 @@ rcar_gen2_cpg_register_clock(struct device_node *np, struct rcar_gen2_cpg *cpg,
 			mult = config->pll0_mult;
 			div = 3;
 		} else {
-			u32 value = clk_readl(cpg->reg + CPG_PLL0CR);
+			u32 value = readl(cpg->reg + CPG_PLL0CR);
 			mult = ((value >> 24) & ((1 << 7) - 1)) + 1;
 		}
 		parent_name = "main";
-- 
2.7.4
