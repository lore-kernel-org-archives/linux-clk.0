Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 05/10] clk: qcom: Add support for PLLs with early output
Date: Thu, 11 Aug 2016 14:10:53 +0530
Message-Id: <1470904858-11930-6-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some PLLs can have an additional early output (apart from
the main and aux outputs). Add support for the PLL driver
so it can be used to initialize/configure the early output

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-pll.c | 2 ++
 drivers/clk/qcom/clk-pll.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/clk-pll.c b/drivers/clk/qcom/clk-pll.c
index 08d2fa2..b463432 100644
--- a/drivers/clk/qcom/clk-pll.c
+++ b/drivers/clk/qcom/clk-pll.c
@@ -268,6 +268,7 @@ static void clk_pll_configure(struct clk_pll *pll, struct regmap *regmap,
 	val |= config->mn_ena_mask;
 	val |= config->main_output_mask;
 	val |= config->aux_output_mask;
+	val |= config->early_output_mask;
 
 	mask = config->vco_mask;
 	mask |= config->pre_div_mask;
@@ -275,6 +276,7 @@ static void clk_pll_configure(struct clk_pll *pll, struct regmap *regmap,
 	mask |= config->mn_ena_mask;
 	mask |= config->main_output_mask;
 	mask |= config->aux_output_mask;
+	mask |= config->early_output_mask;
 
 	regmap_update_bits(regmap, pll->config_reg, mask, val);
 }
diff --git a/drivers/clk/qcom/clk-pll.h b/drivers/clk/qcom/clk-pll.h
index 083727e..dbe22a9 100644
--- a/drivers/clk/qcom/clk-pll.h
+++ b/drivers/clk/qcom/clk-pll.h
@@ -81,6 +81,7 @@ struct pll_config {
 	u32 mn_ena_mask;
 	u32 main_output_mask;
 	u32 aux_output_mask;
+	u32 early_output_mask;
 };
 
 void clk_pll_configure_sr(struct clk_pll *pll, struct regmap *regmap,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
