Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/8] clk: renesas: div6: Always use readl()/writel()
Date: Fri, 16 Mar 2018 14:40:15 +0100
Message-Id: <1521207622-3311-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
References: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On arm32/arm64, there is no reason to use the (soon deprecated)
clk_readl()/clk_writel().  Hence use the generic readl()/writel()
instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-div6.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index 151336d2ba59e689..9febbf42c3df6979 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -53,9 +53,9 @@ static int cpg_div6_clock_enable(struct clk_hw *hw)
 	struct div6_clock *clock = to_div6_clock(hw);
 	u32 val;
 
-	val = (clk_readl(clock->reg) & ~(CPG_DIV6_DIV_MASK | CPG_DIV6_CKSTP))
+	val = (readl(clock->reg) & ~(CPG_DIV6_DIV_MASK | CPG_DIV6_CKSTP))
 	    | CPG_DIV6_DIV(clock->div - 1);
-	clk_writel(val, clock->reg);
+	writel(val, clock->reg);
 
 	return 0;
 }
@@ -65,7 +65,7 @@ static void cpg_div6_clock_disable(struct clk_hw *hw)
 	struct div6_clock *clock = to_div6_clock(hw);
 	u32 val;
 
-	val = clk_readl(clock->reg);
+	val = readl(clock->reg);
 	val |= CPG_DIV6_CKSTP;
 	/*
 	 * DIV6 clocks require the divisor field to be non-zero when stopping
@@ -75,14 +75,14 @@ static void cpg_div6_clock_disable(struct clk_hw *hw)
 	 */
 	if (!(val & CPG_DIV6_DIV_MASK))
 		val |= CPG_DIV6_DIV_MASK;
-	clk_writel(val, clock->reg);
+	writel(val, clock->reg);
 }
 
 static int cpg_div6_clock_is_enabled(struct clk_hw *hw)
 {
 	struct div6_clock *clock = to_div6_clock(hw);
 
-	return !(clk_readl(clock->reg) & CPG_DIV6_CKSTP);
+	return !(readl(clock->reg) & CPG_DIV6_CKSTP);
 }
 
 static unsigned long cpg_div6_clock_recalc_rate(struct clk_hw *hw,
@@ -122,10 +122,10 @@ static int cpg_div6_clock_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	clock->div = div;
 
-	val = clk_readl(clock->reg) & ~CPG_DIV6_DIV_MASK;
+	val = readl(clock->reg) & ~CPG_DIV6_DIV_MASK;
 	/* Only program the new divisor if the clock isn't stopped. */
 	if (!(val & CPG_DIV6_CKSTP))
-		clk_writel(val | CPG_DIV6_DIV(clock->div - 1), clock->reg);
+		writel(val | CPG_DIV6_DIV(clock->div - 1), clock->reg);
 
 	return 0;
 }
@@ -139,7 +139,7 @@ static u8 cpg_div6_clock_get_parent(struct clk_hw *hw)
 	if (clock->src_width == 0)
 		return 0;
 
-	hw_index = (clk_readl(clock->reg) >> clock->src_shift) &
+	hw_index = (readl(clock->reg) >> clock->src_shift) &
 		   (BIT(clock->src_width) - 1);
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
 		if (clock->parents[i] == hw_index)
@@ -163,8 +163,8 @@ static int cpg_div6_clock_set_parent(struct clk_hw *hw, u8 index)
 	mask = ~((BIT(clock->src_width) - 1) << clock->src_shift);
 	hw_index = clock->parents[index];
 
-	clk_writel((clk_readl(clock->reg) & mask) |
-		(hw_index << clock->src_shift), clock->reg);
+	writel((readl(clock->reg) & mask) | (hw_index << clock->src_shift),
+	       clock->reg);
 
 	return 0;
 }
@@ -241,7 +241,7 @@ struct clk * __init cpg_div6_register(const char *name,
 	 * Read the divisor. Disabling the clock overwrites the divisor, so we
 	 * need to cache its value for the enable operation.
 	 */
-	clock->div = (clk_readl(clock->reg) & CPG_DIV6_DIV_MASK) + 1;
+	clock->div = (readl(clock->reg) & CPG_DIV6_DIV_MASK) + 1;
 
 	switch (num_parents) {
 	case 1:
-- 
2.7.4
