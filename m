Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 07/13] clk: qcom: support for alpha mode configuration
Date: Thu, 28 Sep 2017 23:20:44 +0530
Message-Id: <1506621050-10129-8-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The current configuration does not fully configure PLL alpha mode
and values so this patch

1. Configures PLL_ALPHA_VAL_U for PLL which supports 40 bit alpha.
2. Adds alpha enable and alpha mode configuration support.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 6 ++++++
 drivers/clk/qcom/clk-alpha-pll.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index b33d120..07030d3 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -198,6 +198,10 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 		regmap_write(regmap, off + pll_cfg_ctl_u(type),
 			     config->config_ctl_hi_val);
 
+	if (pll_alpha_width(type) > 32)
+		regmap_write(regmap, off + pll_alpha_u(type),
+			     config->alpha_hi);
+
 	val = config->main_output_mask;
 	val |= config->aux_output_mask;
 	val |= config->aux2_output_mask;
@@ -205,6 +209,8 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	val |= config->pre_div_val;
 	val |= config->post_div_val;
 	val |= config->vco_val;
+	val |= config->alpha_en_mask;
+	val |= config->alpha_mode_mask;
 
 	mask = config->main_output_mask;
 	mask |= config->aux_output_mask;
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index b9caefc..17aa27c 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -67,12 +67,15 @@ struct clk_alpha_pll_postdiv {
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
