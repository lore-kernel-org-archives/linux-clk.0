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
Subject: [PATCH 09/13] clk: qcom: add flag for VCO operation
Date: Thu, 28 Sep 2017 23:20:46 +0530
Message-Id: <1506621050-10129-10-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Some of the Alpha PLL’s does not have VCO configuration so this
patch adds the flag and does not perform VCO operation if this
flag is set.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6f2d165..bb35c60 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -139,6 +139,7 @@ struct alpha_pll_props {
 
 #define HAVE_64BIT_CONFIG_CTL		BIT(0)
 #define SUPPORTS_DYNAMIC_UPDATE		BIT(1)
+#define SUPPORTS_VCO			BIT(2)
 	u8 flags;
 	struct alpha_pll_clk_ops ops;
 };
@@ -527,15 +528,17 @@ static int alpha_pll_default_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	const struct pll_vco *vco;
-	u8 type = pll->pll_type;
+	u8 type = pll->pll_type, flags = pll_flags(type);
 	u32 l, off = pll->offset, alpha_width = pll_alpha_width(type);
 	u64 a;
 
 	rate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
-	vco = alpha_pll_find_vco(pll, rate);
-	if (!vco) {
-		pr_err("alpha pll not in a valid vco range\n");
-		return -EINVAL;
+	if (flags & SUPPORTS_VCO) {
+		vco = alpha_pll_find_vco(pll, rate);
+		if (!vco) {
+			pr_err("alpha pll not in a valid vco range\n");
+			return -EINVAL;
+		}
 	}
 
 	regmap_write(pll->clkr.regmap, off + pll_l(type), l);
@@ -549,15 +552,15 @@ static int alpha_pll_default_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	regmap_write(pll->clkr.regmap, off + pll_alpha(type), a);
 
-	regmap_update_bits(pll->clkr.regmap, off + pll_user_ctl(type),
-			   PLL_VCO_MASK << PLL_VCO_SHIFT,
-			   vco->val << PLL_VCO_SHIFT);
+	if (flags & SUPPORTS_VCO)
+		regmap_update_bits(pll->clkr.regmap, off + pll_user_ctl(type),
+				   PLL_VCO_MASK << PLL_VCO_SHIFT,
+				   vco->val << PLL_VCO_SHIFT);
 
 	regmap_update_bits(pll->clkr.regmap, off + pll_user_ctl(type),
 			   PLL_ALPHA_EN, PLL_ALPHA_EN);
 
-	if (!clk_hw_is_enabled(hw) ||
-	    !(pll_flags(type) & SUPPORTS_DYNAMIC_UPDATE))
+	if (!clk_hw_is_enabled(hw) || !(flags & SUPPORTS_DYNAMIC_UPDATE))
 		return 0;
 
 	return clk_alpha_pll_update_latch(pll);
@@ -567,12 +570,13 @@ static long alpha_pll_default_round_rate(struct clk_hw *hw, unsigned long rate,
 					 unsigned long *prate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 l, alpha_width = pll_alpha_width(pll->pll_type);
+	u8 type = pll->pll_type;
+	u32 l, alpha_width = pll_alpha_width(type);
 	u64 a;
 	unsigned long min_freq, max_freq;
 
 	rate = alpha_pll_round_rate(rate, *prate, &l, &a, alpha_width);
-	if (alpha_pll_find_vco(pll, rate))
+	if (!(pll_flags(type) & SUPPORTS_VCO) || alpha_pll_find_vco(pll, rate))
 		return rate;
 
 	min_freq = pll->vco_table[0].min_freq;
@@ -721,6 +725,7 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 			[PLL_STATUS] = 0x24,
 		},
 		.alpha_width = 40,
+		.flags = SUPPORTS_VCO,
 		.ops = {
 			.enable = alpha_pll_default_enable,
 			.disable = alpha_pll_default_disable,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
