Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: andy.gross@linaro.org,
	david.brown@linaro.org,
	rnayak@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [RFC v2 02/12] clk: qcom: support for alpha mode configuration
Date: Tue,  8 Aug 2017 23:54:07 +0530
Message-Id: <1502216657-3342-3-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
References: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The current configuration does not fully configure PLL alpha mode
and values so this patch

1. Configures PLL_ALPHA_VAL_U for PLL which supports 40 bit alpha.
2. Adds alpha enable and alpha mode configuration support.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 5 +++++
 drivers/clk/qcom/clk-alpha-pll.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index e6cde2d..6291048 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -123,6 +123,9 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 		regmap_write(regmap, off + PLL_CONFIG_CTL_U,
 			     config->config_ctl_hi_val);
 
+	if (!(pll->flags & SUPPORTS_16BIT_ALPHA))
+		regmap_write(regmap, off + PLL_ALPHA_VAL_U, config->alpha_hi);
+
 	val = config->main_output_mask;
 	val |= config->aux_output_mask;
 	val |= config->aux2_output_mask;
@@ -130,6 +133,8 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	val |= config->pre_div_val;
 	val |= config->post_div_val;
 	val |= config->vco_val;
+	val |= config->alpha_en_mask;
+	val |= config->alpha_mode_mask;
 
 	mask = config->main_output_mask;
 	mask |= config->aux_output_mask;
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index bbd6aa9..39686db 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -59,12 +59,15 @@ struct clk_alpha_pll_postdiv {
 struct alpha_pll_config {
 	u32 l;
 	u32 alpha;
+	u32 alpha_hi;
 	u32 config_ctl_val;
 	u32 config_ctl_hi_val;
 	u32 main_output_mask;
 	u32 aux_output_mask;
 	u32 aux2_output_mask;
 	u32 early_output_mask;
+	u32 alpha_en_mask;
+	u32 alpha_mode_mask;
 	u32 pre_div_val;
 	u32 pre_div_mask;
 	u32 post_div_val;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
