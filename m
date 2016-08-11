Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 09/10] clk: qcom: Add .is_enabled ops for clk-alpha-pll
Date: Thu, 11 Aug 2016 14:10:57 +0530
Message-Id: <1470904858-11930-10-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This would be useful in subsequent patches when the .set_rate operation
would need to identify if the PLL is actually enabled

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 854487e..2184dc1 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -198,6 +198,23 @@ static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
 	wait_for_pll_disable(pll, PLL_ACTIVE_FLAG);
 }
 
+static int clk_alpha_pll_is_enabled(struct clk_hw *hw)
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
+	if (val & PLL_LOCK_DET)
+		return 1;
+	else
+		return 0;
+}
+
 static int clk_alpha_pll_enable(struct clk_hw *hw)
 {
 	int ret;
@@ -398,6 +415,7 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 const struct clk_ops clk_alpha_pll_ops = {
 	.enable = clk_alpha_pll_enable,
 	.disable = clk_alpha_pll_disable,
+	.is_enabled = clk_alpha_pll_is_enabled,
 	.recalc_rate = clk_alpha_pll_recalc_rate,
 	.round_rate = clk_alpha_pll_round_rate,
 	.set_rate = clk_alpha_pll_set_rate,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
