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
Subject: [RFC 07/12] clk: qcom: add flag for VCO operation
Date: Thu, 27 Jul 2017 16:40:20 +0530
Message-Id: <1501153825-5181-8-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Some of the Alpha PLL’s does not have VCO configuration so this
patch adds the flag and does not perform VCO operation if this
flag is set.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 19 ++++++++++++-------
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index e38f4d2..0ac9f96 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -415,10 +415,13 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	u64 a;
 
 	rate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
-	vco = alpha_pll_find_vco(pll, rate);
-	if (!vco) {
-		pr_err("alpha pll not in a valid vco range\n");
-		return -EINVAL;
+
+	if (!(pll->flags & HAVE_NO_VCO_CONF)) {
+		vco = alpha_pll_find_vco(pll, rate);
+		if (!vco) {
+			pr_err("alpha pll not in a valid vco range\n");
+			return -EINVAL;
+		}
 	}
 
 	regmap_write(pll->clkr.regmap, pll_l(pll), l);
@@ -428,8 +431,10 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	regmap_write(pll->clkr.regmap, pll_alpha(pll), a);
 	regmap_write(pll->clkr.regmap, pll_alpha_u(pll), a >> 32);
 
-	regmap_update_bits(pll->clkr.regmap, pll_alpha(pll),
-			   GENMASK(0, alpha_width - 1), a);
+	if (!(pll->flags & HAVE_NO_VCO_CONF))
+		regmap_update_bits(pll->clkr.regmap, pll_user_ctl(pll),
+				   PLL_VCO_MASK << PLL_VCO_SHIFT,
+				   vco->val << PLL_VCO_SHIFT);
 
 	regmap_update_bits(pll->clkr.regmap, pll_user_ctl(pll),
 			   PLL_ALPHA_EN, PLL_ALPHA_EN);
@@ -479,7 +484,7 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long min_freq, max_freq;
 
 	rate = alpha_pll_round_rate(rate, *prate, &l, &a, alpha_width);
-	if (alpha_pll_find_vco(pll, rate))
+	if ((pll->flags & HAVE_NO_VCO_CONF) || alpha_pll_find_vco(pll, rate))
 		return rate;
 
 	min_freq = pll->vco_table[0].min_freq;
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 6e40e09..01869a8 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -55,6 +55,7 @@ struct clk_alpha_pll {
 #define SUPPORTS_FSM_MODE		BIT(2)
 #define SUPPORTS_64BIT_CONFIG_CTL	BIT(3)
 #define SUPPORTS_DYNAMIC_UPDATE		BIT(4)
+#define HAVE_NO_VCO_CONF		BIT(5)
 	u8 flags;
 
 	struct clk_regmap clkr;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
