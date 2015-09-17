Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v5 2/4] clk: qcom: Add support for RCGs with shared branches
Date: Thu, 17 Sep 2015 19:39:27 +0300
Message-Id: <1442507969-18062-3-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1442507969-18062-1-git-send-email-georgi.djakov@linaro.org>
References: <1442507969-18062-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Some root clock generators may have child branches that are controlled
by different CPUs. These RCGs require some special operations:
 - some enable bits have to be toggled when we set the rate;
 - if RCG is disabled we only cache the rate and set it later when enabled;
 - when the RCG is disabled, the mux is set to the safe source;

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  |    4 +-
 drivers/clk/qcom/clk-rcg2.c |   91 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 31f92d70e8e0..5012e5b90cfb 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -153,8 +153,8 @@ extern const struct clk_ops clk_dyn_rcg_ops;
  * @hid_width: number of bits in half integer divider
  * @parent_map: map from software's parent index to hardware's src_sel field
  * @freq_tbl: frequency table
+ * @current_freq: last cached frequency when using branches with shared RCGs
  * @clkr: regmap clock handle
- * @lock: register lock
  *
  */
 struct clk_rcg2 {
@@ -163,12 +163,14 @@ struct clk_rcg2 {
 	u8			hid_width;
 	const struct parent_map	*parent_map;
 	const struct freq_tbl	*freq_tbl;
+	unsigned long		current_freq;
 	struct clk_regmap	clkr;
 };
 
 #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
 
 extern const struct clk_ops clk_rcg2_ops;
+extern const struct clk_ops clk_rcg2_shared_ops;
 extern const struct clk_ops clk_edp_pixel_ops;
 extern const struct clk_ops clk_byte_ops;
 extern const struct clk_ops clk_byte2_ops;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index d941dea6f7c7..c7b9b32742e5 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -300,6 +300,97 @@ const struct clk_ops clk_rcg2_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_ops);
 
+static int clk_rcg2_shared_force_enable(struct clk_hw *hw, unsigned long rate)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	const char *name = clk_hw_get_name(hw);
+	int ret, count;
+
+	/* force enable RCG */
+	ret = regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
+				 CMD_ROOT_EN, CMD_ROOT_EN);
+	if (ret)
+		return ret;
+
+	/* wait for RCG to turn ON */
+	for (count = 500; count > 0; count--) {
+		ret = clk_rcg2_is_enabled(hw);
+		if (ret)
+			break;
+		udelay(1);
+	}
+	if (!count)
+		pr_err("%s: RCG did not turn on\n", name);
+
+	/* set clock rate */
+	ret = __clk_rcg2_set_rate(hw, rate);
+	if (ret)
+		return ret;
+
+	/* clear force enable RCG */
+	return regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
+				 CMD_ROOT_EN, 0);
+}
+
+static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+
+	/* cache the rate */
+	rcg->current_freq = rate;
+
+	if (!__clk_is_enabled(hw->clk))
+		return 0;
+
+	return clk_rcg2_shared_force_enable(hw, rcg->current_freq);
+}
+
+static unsigned long
+clk_rcg2_shared_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	unsigned long rate;
+	u32 cfg, hid_div, mask;
+
+	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+
+	mask = BIT(rcg->hid_width) - 1;
+	hid_div = cfg >> CFG_SRC_DIV_SHIFT;
+	hid_div &= mask;
+
+	rate = (parent_rate * 2) / (hid_div + 1);
+
+	rcg->current_freq = rate;
+
+	return rate;
+}
+
+static int clk_rcg2_shared_enable(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+
+	return clk_rcg2_shared_force_enable(hw, rcg->current_freq);
+}
+
+static void clk_rcg2_shared_disable(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+
+	/* switch to XO, which is the lowest entry in the freq table */
+	clk_rcg2_shared_set_rate(hw, rcg->freq_tbl[0].freq, 0);
+}
+
+const struct clk_ops clk_rcg2_shared_ops = {
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_get_parent,
+	.recalc_rate = clk_rcg2_shared_recalc_rate,
+	.determine_rate = clk_rcg2_determine_rate,
+	.set_rate = clk_rcg2_shared_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
+
 struct frac_entry {
 	int num;
 	int den;
