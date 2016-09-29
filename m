Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 06/11] clk: qcom: Fix .set_rate to handle alpha PLLs w/wo dynamic update
Date: Thu, 29 Sep 2016 14:05:47 +0530
Message-Id: <1475138152-859-7-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Alpha PLLs which do not support dynamic update feature
need to be explicitly disabled before a rate change.
The ones which do support dynamic update do so within a
single vco range, so add a min/max freq check for such
PLLs so they fall in the vco range.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 49 +++++++++++++++++++++++++++++++++-------
 drivers/clk/qcom/clk-alpha-pll.h |  3 +++
 2 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 89c7fdb..6f90a86 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -382,16 +382,41 @@ clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long prate)
 {
+	bool enabled;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	const struct pll_vco *vco;
 	u32 l, off = pll->offset;
 	u64 a;
 
 	rate = alpha_pll_round_rate(rate, prate, &l, &a);
-	vco = alpha_pll_find_vco(pll, rate);
-	if (!vco) {
-		pr_err("alpha pll not in a valid vco range\n");
-		return -EINVAL;
+	enabled = clk_hw_is_enabled(hw);
+
+	if (pll->flags & SUPPORTS_DYNAMIC_UPDATE) {
+		/*
+		 * PLLs which support dynamic updates support one single
+		 * vco range, between min_rate and max_rate supported
+		 */
+		if (rate < pll->min_rate || rate > pll->max_rate) {
+			pr_err("alpha pll rate outside supported min/max range\n");
+			return -EINVAL;
+		}
+	} else {
+		/*
+		 * All alpha PLLs which do not support dynamic update,
+		 * should be disabled before a vco update.
+		 */
+		if (enabled)
+			hw->init->ops->disable(hw);
+
+		vco = alpha_pll_find_vco(pll, rate);
+		if (!vco) {
+			pr_err("alpha pll not in a valid vco range\n");
+			return -EINVAL;
+		}
+
+		regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL,
+				   PLL_VCO_MASK << PLL_VCO_SHIFT,
+				   vco->val << PLL_VCO_SHIFT);
 	}
 
 	regmap_write(pll->clkr.regmap, off + PLL_L_VAL, l);
@@ -404,13 +429,12 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL_U, a >> 32);
 	}
 
-	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL,
-			   PLL_VCO_MASK << PLL_VCO_SHIFT,
-			   vco->val << PLL_VCO_SHIFT);
-
 	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL, PLL_ALPHA_EN,
 			   PLL_ALPHA_EN);
 
+	if (!(pll->flags & SUPPORTS_DYNAMIC_UPDATE) && enabled)
+		hw->init->ops->enable(hw);
+
 	return 0;
 }
 
@@ -423,6 +447,15 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long min_freq, max_freq;
 
 	rate = alpha_pll_round_rate(rate, *prate, &l, &a);
+
+	if (pll->flags & SUPPORTS_DYNAMIC_UPDATE) {
+		if (rate < pll->min_rate)
+			rate = pll->min_rate;
+		else if (rate > pll->max_rate)
+			rate = pll->max_rate;
+		return rate;
+	}
+
 	if (alpha_pll_find_vco(pll, rate))
 		return rate;
 
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index d6e1ee2..e43a9c0 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -37,8 +37,11 @@ struct clk_alpha_pll {
 #define SUPPORTS_OFFLINE_REQ	BIT(0)
 #define SUPPORTS_16BIT_ALPHA	BIT(1)
 #define SUPPORTS_FSM_MODE	BIT(2)
+#define SUPPORTS_DYNAMIC_UPDATE	BIT(3)
 	u8 flags;
 
+	unsigned long min_rate;
+	unsigned long max_rate;
 	struct clk_regmap clkr;
 };
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
