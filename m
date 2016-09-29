Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 05/11] clk: qcom: Add .is_enabled ops for clk-alpha-pll
Date: Thu, 29 Sep 2016 14:05:46 +0530
Message-Id: <1475138152-859-6-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This would be useful in subsequent patches when the .set_rate operation
would need to identify if the PLL is actually enabled

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index c6ddc04e..89c7fdb 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -199,6 +199,33 @@ static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
 	wait_for_pll_disable(pll);
 }
 
+static int pll_is_enabled(struct clk_hw *hw, u32 mask)
+{
+	int ret;
+	u32 val, off;
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+
+	off = pll->offset;
+	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	if (ret)
+		return ret;
+
+	if (val & mask)
+		return 1;
+	else
+		return 0;
+}
+
+static int clk_alpha_pll_hwfsm_is_enabled(struct clk_hw *hw)
+{
+	return pll_is_enabled(hw, PLL_ACTIVE_FLAG);
+}
+
+static int clk_alpha_pll_is_enabled(struct clk_hw *hw)
+{
+	return pll_is_enabled(hw, PLL_LOCK_DET);
+}
+
 static int clk_alpha_pll_enable(struct clk_hw *hw)
 {
 	int ret;
@@ -408,6 +435,7 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 const struct clk_ops clk_alpha_pll_ops = {
 	.enable = clk_alpha_pll_enable,
 	.disable = clk_alpha_pll_disable,
+	.is_enabled = clk_alpha_pll_is_enabled,
 	.recalc_rate = clk_alpha_pll_recalc_rate,
 	.round_rate = clk_alpha_pll_round_rate,
 	.set_rate = clk_alpha_pll_set_rate,
@@ -417,6 +445,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_ops);
 const struct clk_ops clk_alpha_pll_hwfsm_ops = {
 	.enable = clk_alpha_pll_hwfsm_enable,
 	.disable = clk_alpha_pll_hwfsm_disable,
+	.is_enabled = clk_alpha_pll_hwfsm_is_enabled,
 	.recalc_rate = clk_alpha_pll_recalc_rate,
 	.round_rate = clk_alpha_pll_round_rate,
 	.set_rate = clk_alpha_pll_set_rate,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
