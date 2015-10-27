Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v2 1/2] clk: qcom: common: Add API to register board clocks backwards compatibly
Date: Tue, 27 Oct 2015 16:04:59 -0700
Message-Id: <1445987100-19492-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

We want to put the XO board clocks into the dt files, but we also
need to be backwards compatible with an older dtb. Add an API to
the common code to do this. This also makes a place for us to
handle the case when the RPM clock driver is enabled and we don't
want to register the fixed factor clock.

Cc: Georgi Djakov <georgi.djakov@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Changes from v1:
 * New sleep_clk specific API
 * Added in the RPM enabled config check
 * Always register the board clk if it's missing

 drivers/clk/qcom/common.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h |  4 +++
 2 files changed, 80 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 8fa477293ae0..09b3606e12be 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -88,6 +88,82 @@ static void qcom_cc_gdsc_unregister(void *data)
 	gdsc_unregister(data);
 }
 
+/*
+ * Backwards compatibility with old DTs. Register a pass-through factor 1/1
+ * clock to translate 'path' clk into 'name' clk and regsiter the 'path'
+ * clk as a fixed rate clock if it isn't present.
+ */
+static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
+				       const char *name, unsigned long rate,
+				       bool add_factor)
+{
+	struct device_node *node = NULL;
+	struct device_node *clocks_node;
+	struct clk_fixed_factor *factor;
+	struct clk_fixed_rate *fixed;
+	struct clk *clk;
+	struct clk_init_data init_data = { };
+
+	clocks_node = of_find_node_by_path("/clocks");
+	if (clocks_node)
+		node = of_find_node_by_name(clocks_node, path);
+	of_node_put(clocks_node);
+
+	if (!node) {
+		fixed = devm_kzalloc(dev, sizeof(*fixed), GFP_KERNEL);
+		if (!fixed)
+			return -EINVAL;
+
+		fixed->fixed_rate = rate;
+		fixed->hw.init = &init_data;
+
+		init_data.name = path;
+		init_data.flags = CLK_IS_ROOT;
+		init_data.ops = &clk_fixed_rate_ops;
+
+		clk = devm_clk_register(dev, &fixed->hw);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+	}
+	of_node_put(node);
+
+	if (add_factor) {
+		factor = devm_kzalloc(dev, sizeof(*factor), GFP_KERNEL);
+		if (!factor)
+			return -EINVAL;
+
+		factor->mult = factor->div = 1;
+		factor->hw.init = &init_data;
+
+		init_data.name = name;
+		init_data.parent_names = &path;
+		init_data.num_parents = 1;
+		init_data.flags = 0;
+		init_data.ops = &clk_fixed_factor_ops;
+
+		clk = devm_clk_register(dev, &factor->hw);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+	}
+
+	return 0;
+}
+
+int qcom_cc_register_board_clk(struct device *dev, const char *path,
+			       const char *name, unsigned long rate)
+{
+	return _qcom_cc_register_board_clk(dev, path, name, rate,
+					   !IS_ENABLED(CONFIG_QCOM_RPMCC));
+}
+EXPORT_SYMBOL_GPL(qcom_cc_register_board_clk);
+
+int qcom_cc_register_sleep_clk(struct device *dev)
+{
+	return _qcom_cc_register_board_clk(dev, "sleep_clk", "sleep_clk_src",
+					   32768, true);
+}
+EXPORT_SYMBOL_GPL(qcom_cc_register_sleep_clk);
+
 int qcom_cc_really_probe(struct platform_device *pdev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 7c1fba3ebc03..ae9bdeb21f29 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -37,6 +37,10 @@ extern const struct freq_tbl *qcom_find_freq(const struct freq_tbl *f,
 extern int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map,
 			       u8 src);
 
+extern int qcom_cc_register_board_clk(struct device *dev, const char *path,
+				      const char *name, unsigned long rate);
+extern int qcom_cc_register_sleep_clk(struct device *dev);
+
 extern struct regmap *qcom_cc_map(struct platform_device *pdev,
 				  const struct qcom_cc_desc *desc);
 extern int qcom_cc_really_probe(struct platform_device *pdev,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
