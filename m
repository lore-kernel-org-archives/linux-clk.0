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
Subject: [RFC v2 10/12] clk: qcom: add read-only alpha pll post divider operations
Date: Tue,  8 Aug 2017 23:54:15 +0530
Message-Id: <1502216657-3342-11-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
References: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some of the divider settings are preconfigured and should not
be changed by the clock framework during frequency change. This
patch adds the read-only divider operation for QCOM alpha pll
post divider which is equivalent to generic divider operations in
'commit 79c6ab509558 ("clk: divider: add CLK_DIVIDER_READ_ONLY flag")'.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 25 +++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 4725f80..69d069f 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -774,6 +774,25 @@ static long clk_alpha_huayra_pll_round_rate(struct clk_hw *hw,
 				  pll->width, CLK_DIVIDER_POWER_OF_TWO);
 }
 
+static long
+clk_alpha_pll_postdiv_round_ro_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *prate)
+{
+	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
+	u32 ctl, div;
+
+	regmap_read(pll->clkr.regmap, pll_user_ctl(pll), &ctl);
+
+	ctl >>= PLL_POST_DIV_SHIFT;
+	ctl &= BIT(pll->width) - 1;
+	div = 1 << fls(ctl);
+
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)
+		*prate = clk_hw_round_rate(clk_hw_get_parent(hw), div * rate);
+
+	return DIV_ROUND_UP_ULL((u64)*prate, div);
+}
+
 static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 					  unsigned long parent_rate)
 {
@@ -794,3 +813,9 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	.set_rate = clk_alpha_pll_postdiv_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_ops);
+
+const struct clk_ops clk_alpha_pll_postdiv_ro_ops = {
+	.round_rate = clk_alpha_pll_postdiv_round_ro_rate,
+	.recalc_rate = clk_alpha_pll_postdiv_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_ro_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 8a0dab6..2b96beb 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -109,6 +109,7 @@ struct alpha_pll_config {
 extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
 extern const struct clk_ops clk_alpha_huayra_pll_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ops;
+extern const struct clk_ops clk_alpha_pll_postdiv_ro_ops;
 
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
