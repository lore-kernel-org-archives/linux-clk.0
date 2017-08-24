Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	robdclark@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH] clk: qcom: Remove unused RCG ops
Date: Thu, 24 Aug 2017 20:36:44 +0300
Message-Id: <20170824173644.10305-1-georgi.djakov@linaro.org>
In-Reply-To: <20170823225543.GJ21656@codeaurora.org>
References: <20170823225543.GJ21656@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The RCGs ops for shared branches are not used now, so remove it.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  |  3 --
 drivers/clk/qcom/clk-rcg2.c | 79 ---------------------------------------------
 2 files changed, 82 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 1b3e8d265bdb..a2495457e564 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -156,7 +156,6 @@ extern const struct clk_ops clk_dyn_rcg_ops;
  * @hid_width: number of bits in half integer divider
  * @parent_map: map from software's parent index to hardware's src_sel field
  * @freq_tbl: frequency table
- * @current_freq: last cached frequency when using branches with shared RCGs
  * @clkr: regmap clock handle
  *
  */
@@ -166,7 +165,6 @@ struct clk_rcg2 {
 	u8			hid_width;
 	const struct parent_map	*parent_map;
 	const struct freq_tbl	*freq_tbl;
-	unsigned long		current_freq;
 	struct clk_regmap	clkr;
 };
 
@@ -174,7 +172,6 @@ struct clk_rcg2 {
 
 extern const struct clk_ops clk_rcg2_ops;
 extern const struct clk_ops clk_rcg2_floor_ops;
-extern const struct clk_ops clk_rcg2_shared_ops;
 extern const struct clk_ops clk_edp_pixel_ops;
 extern const struct clk_ops clk_byte_ops;
 extern const struct clk_ops clk_byte2_ops;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 1a0985ae20d2..bbeaf9c09dbb 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -358,85 +358,6 @@ const struct clk_ops clk_rcg2_floor_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_floor_ops);
 
-static int clk_rcg2_shared_force_enable(struct clk_hw *hw, unsigned long rate)
-{
-	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
-	const char *name = clk_hw_get_name(hw);
-	int ret, count;
-
-	/* force enable RCG */
-	ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
-				 CMD_ROOT_EN, CMD_ROOT_EN);
-	if (ret)
-		return ret;
-
-	/* wait for RCG to turn ON */
-	for (count = 500; count > 0; count--) {
-		ret = clk_rcg2_is_enabled(hw);
-		if (ret)
-			break;
-		udelay(1);
-	}
-	if (!count)
-		pr_err("%s: RCG did not turn on\n", name);
-
-	/* set clock rate */
-	ret = __clk_rcg2_set_rate(hw, rate, CEIL);
-	if (ret)
-		return ret;
-
-	/* clear force enable RCG */
-	return regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
-				 CMD_ROOT_EN, 0);
-}
-
-static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long parent_rate)
-{
-	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
-
-	/* cache the rate */
-	rcg->current_freq = rate;
-
-	if (!__clk_is_enabled(hw->clk))
-		return 0;
-
-	return clk_rcg2_shared_force_enable(hw, rcg->current_freq);
-}
-
-static unsigned long
-clk_rcg2_shared_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
-{
-	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
-
-	return rcg->current_freq = clk_rcg2_recalc_rate(hw, parent_rate);
-}
-
-static int clk_rcg2_shared_enable(struct clk_hw *hw)
-{
-	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
-
-	return clk_rcg2_shared_force_enable(hw, rcg->current_freq);
-}
-
-static void clk_rcg2_shared_disable(struct clk_hw *hw)
-{
-	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
-
-	/* switch to XO, which is the lowest entry in the freq table */
-	clk_rcg2_shared_set_rate(hw, rcg->freq_tbl[0].freq, 0);
-}
-
-const struct clk_ops clk_rcg2_shared_ops = {
-	.enable = clk_rcg2_shared_enable,
-	.disable = clk_rcg2_shared_disable,
-	.get_parent = clk_rcg2_get_parent,
-	.recalc_rate = clk_rcg2_shared_recalc_rate,
-	.determine_rate = clk_rcg2_determine_rate,
-	.set_rate = clk_rcg2_shared_set_rate,
-};
-EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
-
 struct frac_entry {
 	int num;
 	int den;
