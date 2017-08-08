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
Subject: [RFC v2 09/12] clk: qcom: support for 2 bit PLL post divider
Date: Tue,  8 Aug 2017 23:54:14 +0530
Message-Id: <1502216657-3342-10-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
References: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Current PLL driver only supports 4 bit PLL post divider so
modified the PLL divider operations to support 2 bit PLL
post divider.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index b491dbe..4725f80 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -39,7 +39,6 @@
 # define PLL_LOCK_DET		BIT(31)
 
 # define PLL_POST_DIV_SHIFT	8
-# define PLL_POST_DIV_MASK	0xf
 # define PLL_ALPHA_EN		BIT(24)
 # define PLL_ALPHA_MODE		BIT(25)
 # define PLL_VCO_SHIFT		20
@@ -738,7 +737,7 @@ static long clk_alpha_huayra_pll_round_rate(struct clk_hw *hw,
 	regmap_read(pll->clkr.regmap, pll_user_ctl(pll), &ctl);
 
 	ctl >>= PLL_POST_DIV_SHIFT;
-	ctl &= PLL_POST_DIV_MASK;
+	ctl &= BIT(pll->width) - 1;
 
 	return parent_rate >> fls(ctl);
 }
@@ -752,13 +751,26 @@ static long clk_alpha_huayra_pll_round_rate(struct clk_hw *hw,
 	{ }
 };
 
+static const struct clk_div_table clk_alpha_2bit_div_table[] = {
+	{ 0x0, 1 },
+	{ 0x1, 2 },
+	{ 0x3, 4 },
+	{ }
+};
+
 static long
 clk_alpha_pll_postdiv_round_rate(struct clk_hw *hw, unsigned long rate,
 				 unsigned long *prate)
 {
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
+	const struct clk_div_table *table;
+
+	if (pll->width == 2)
+		table = clk_alpha_2bit_div_table;
+	else
+		table = clk_alpha_div_table;
 
-	return divider_round_rate(hw, rate, prate, clk_alpha_div_table,
+	return divider_round_rate(hw, rate, prate, table,
 				  pll->width, CLK_DIVIDER_POWER_OF_TWO);
 }
 
@@ -772,7 +784,7 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate) - 1;
 
 	return regmap_update_bits(pll->clkr.regmap, pll_user_ctl(pll),
-				  PLL_POST_DIV_MASK << PLL_POST_DIV_SHIFT,
+				  (BIT(pll->width) - 1) << PLL_POST_DIV_SHIFT,
 				  div << PLL_POST_DIV_SHIFT);
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
