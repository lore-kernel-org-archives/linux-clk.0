Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	stephen.boyd@linaro.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 3/6] clk: qcom: Add support to initialize alpha plls
Date: Mon, 11 Jul 2016 16:20:36 +0530
Message-Id: <1468234239-28693-4-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1468234239-28693-1-git-send-email-rnayak@codeaurora.org>
References: <1468234239-28693-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add a function to do initial configuration of the alpha plls

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 23 +++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h | 13 +++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index bae31f9..8b8710f 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -112,6 +112,29 @@ static int wait_for_pll_offline(struct clk_alpha_pll *pll, u32 mask)
 #define PLL_OFFLINE_ACK		BIT(28)
 #define PLL_ACTIVE_FLAG		BIT(30)
 
+void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+			     const struct alpha_pll_config *config)
+{
+	u32 val, mask;
+
+	regmap_write(regmap, pll->offset + PLL_CONFIG_CTL,
+		     config->config_ctl_val);
+
+	val = config->main_output_mask;
+	val |= config->aux_output_mask;
+	val |= config->aux2_output_mask;
+	val |= config->early_output_mask;
+	val |= config->post_div_val;
+
+	mask = config->main_output_mask;
+	mask |= config->aux_output_mask;
+	mask |= config->aux2_output_mask;
+	mask |= config->early_output_mask;
+	mask |= config->post_div_mask;
+
+	regmap_update_bits(regmap, pll->offset + PLL_USER_CTL, mask, val);
+}
+
 static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 {
 	int ret;
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index f78bf4c..12a349e 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -51,8 +51,21 @@ struct clk_alpha_pll_postdiv {
 	struct clk_regmap clkr;
 };
 
+struct alpha_pll_config {
+	u32 config_ctl_val;
+	u32 main_output_mask;
+	u32 aux_output_mask;
+	u32 aux2_output_mask;
+	u32 early_output_mask;
+	u32 post_div_val;
+	u32 post_div_mask;
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
