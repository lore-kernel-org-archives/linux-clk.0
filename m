Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH 1/2] clk: qcom: common: Add API to register board clocks backwards compatibly
Date: Mon, 26 Oct 2015 18:20:26 -0700
Message-Id: <1445908827-31015-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

We want to put the XO board clocks into the dt files. Add an API
to do this generically. This also makes a place for us to handle
the case where the RPM driver is enabled or disabled.

Cc: Georgi Djakov <georgi.djakov@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

I'm also thinking that maybe we should register the board clock if it
isn't there in DT and then we'll either register the pass through or
we'll skip it depending on if the RPM driver is enabled. That
way the RPM driver doesn't need to know anything, just register the
clock with parent as the board clock.

 drivers/clk/qcom/common.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h |  3 +++
 2 files changed, 50 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 8fa477293ae0..84d4d6fc0dec 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -88,6 +88,53 @@ static void qcom_cc_gdsc_unregister(void *data)
 	gdsc_unregister(data);
 }
 
+int qcom_cc_register_board_clk(struct device *dev, const char *path,
+			       const char *name, unsigned long rate)
+{
+	struct device_node *node = NULL;
+	struct device_node *clocks_node;
+	struct clk_fixed_factor *factor;
+	struct clk_fixed_rate *fixed;
+	struct clk_hw *hw;
+	struct clk_init_data init_data = { .name = name };
+
+	clocks_node = of_find_node_by_path("/clocks");
+	if (clocks_node)
+		node = of_find_node_by_name(clocks_node, path);
+	of_node_put(clocks_node);
+
+	if (node) {
+		factor = devm_kzalloc(dev, sizeof(*factor), GFP_KERNEL);
+		if (!factor)
+			return -EINVAL;
+
+		factor->mult = factor->div = 1;
+		factor->hw.init = &init_data;
+
+		init_data.parent_names = &path;
+		init_data.num_parents = 1;
+		init_data.ops = &clk_fixed_factor_ops;
+
+		hw = &factor->hw;
+	} else {
+		fixed = devm_kzalloc(dev, sizeof(*fixed), GFP_KERNEL);
+		if (!fixed)
+			return -EINVAL;
+
+		fixed->fixed_rate = rate;
+		fixed->hw.init = &init_data;
+
+		init_data.flags = CLK_IS_ROOT;
+		init_data.ops = &clk_fixed_rate_ops;
+
+		hw = &fixed->hw;
+	}
+	of_node_put(node);
+
+	return PTR_ERR_OR_ZERO(devm_clk_register(dev, hw));
+}
+EXPORT_SYMBOL(qcom_cc_register_board_clk);
+
 int qcom_cc_really_probe(struct platform_device *pdev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 7c1fba3ebc03..70e68a8d82a7 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -37,6 +37,9 @@ extern const struct freq_tbl *qcom_find_freq(const struct freq_tbl *f,
 extern int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map,
 			       u8 src);
 
+extern int qcom_cc_register_board_clk(struct device *dev, const char *path,
+				      const char *name, unsigned long rate);
+
 extern struct regmap *qcom_cc_map(struct platform_device *pdev,
 				  const struct qcom_cc_desc *desc);
 extern int qcom_cc_really_probe(struct platform_device *pdev,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
