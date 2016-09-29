Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 02/11] clk: qcom: Add support to initialize alpha plls
Date: Thu, 29 Sep 2016 14:05:43 +0530
Message-Id: <1475138152-859-3-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add a function to do initial configuration of the alpha plls

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 31 +++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h | 20 ++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 0cfbb29..a1188c8 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -49,6 +49,7 @@
 #define PLL_USER_CTL_U		0x14
 
 #define PLL_CONFIG_CTL		0x18
+#define PLL_CONFIG_CTL_U	0x20
 #define PLL_TEST_CTL		0x1c
 #define PLL_TEST_CTL_U		0x20
 #define PLL_STATUS		0x24
@@ -106,6 +107,36 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 #define wait_for_pll_offline(pll) \
 	wait_for_pll(pll, PLL_OFFLINE_ACK, 0, "offline")
 
+void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+			     const struct alpha_pll_config *config)
+{
+	u32 val, mask;
+	u32 off = pll->offset;
+
+	regmap_write(regmap, off + PLL_L_VAL, config->l);
+	regmap_write(regmap, off + PLL_ALPHA_VAL, config->alpha);
+	regmap_write(regmap, off + PLL_CONFIG_CTL, config->config_ctl_val);
+	regmap_write(regmap, off + PLL_CONFIG_CTL_U, config->config_ctl_hi_val);
+
+	val = config->main_output_mask;
+	val |= config->aux_output_mask;
+	val |= config->aux2_output_mask;
+	val |= config->early_output_mask;
+	val |= config->pre_div_val;
+	val |= config->post_div_val;
+	val |= config->vco_val;
+
+	mask = config->main_output_mask;
+	mask |= config->aux_output_mask;
+	mask |= config->aux2_output_mask;
+	mask |= config->early_output_mask;
+	mask |= config->pre_div_mask;
+	mask |= config->post_div_mask;
+	mask |= config->vco_mask;
+
+	regmap_update_bits(regmap, off + PLL_USER_CTL, mask, val);
+}
+
 static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 {
 	int ret;
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 0deb286..2f48530 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -53,8 +53,28 @@ struct clk_alpha_pll_postdiv {
 	struct clk_regmap clkr;
 };
 
+struct alpha_pll_config {
+	u32 l;
+	u32 alpha;
+	u32 config_ctl_val;
+	u32 config_ctl_hi_val;
+	u32 main_output_mask;
+	u32 aux_output_mask;
+	u32 aux2_output_mask;
+	u32 early_output_mask;
+	u32 pre_div_val;
+	u32 pre_div_mask;
+	u32 post_div_val;
+	u32 post_div_mask;
+	u32 vco_val;
+	u32 vco_mask;
+};
+
 extern const struct clk_ops clk_alpha_pll_ops;
 extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ops;
 
+void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+			     const struct alpha_pll_config *config);
+
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
