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
Subject: [PATCH 12/13] clk: qcom: support for 2 bit PLL post divider
Date: Thu, 28 Sep 2017 23:20:49 +0530
Message-Id: <1506621050-10129-13-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Current PLL driver only supports 4 bit PLL post divider so
modified the PLL divider operations to support 2 bit PLL
post divider.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index c682387..62b84fa 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -39,7 +39,6 @@
 # define PLL_LOCK_DET		BIT(31)
 
 # define PLL_POST_DIV_SHIFT	8
-# define PLL_POST_DIV_MASK	0xf
 # define PLL_ALPHA_EN		BIT(24)
 # define PLL_ALPHA_MODE		BIT(25)
 # define PLL_VCO_SHIFT		20
@@ -822,7 +821,7 @@ static int clk_alpha_pll_hwfsm_is_enabled(struct clk_hw *hw)
 		    &ctl);
 
 	ctl >>= PLL_POST_DIV_SHIFT;
-	ctl &= PLL_POST_DIV_MASK;
+	ctl &= BIT(pll->width) - 1;
 
 	return parent_rate >> fls(ctl);
 }
@@ -836,13 +835,26 @@ static int clk_alpha_pll_hwfsm_is_enabled(struct clk_hw *hw)
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
 
-	return divider_round_rate(hw, rate, prate, clk_alpha_div_table,
+	if (pll->width == 2)
+		table = clk_alpha_2bit_div_table;
+	else
+		table = clk_alpha_div_table;
+
+	return divider_round_rate(hw, rate, prate, table,
 				  pll->width, CLK_DIVIDER_POWER_OF_TWO);
 }
 
@@ -857,7 +869,7 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	return regmap_update_bits(pll->clkr.regmap, pll->offset +
 				  pll_user_ctl(pll->pll_type),
-				  PLL_POST_DIV_MASK << PLL_POST_DIV_SHIFT,
+				  (BIT(pll->width) - 1) << PLL_POST_DIV_SHIFT,
 				  div << PLL_POST_DIV_SHIFT);
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
