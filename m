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
Subject: [RFC v2 11/12] clk: qcom: add read-only divider operations
Date: Tue,  8 Aug 2017 23:54:16 +0530
Message-Id: <1502216657-3342-12-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
References: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some of the divider settings are preconfigured and should not
be changed by the clock framework during frequency change. This
patch adds the read-only divider operation for QCOM dividers
which is equivalent to generic divider operations in
'commit 79c6ab509558 ("clk: divider: add CLK_DIVIDER_READ_ONLY flag")'.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-regmap-divider.c | 29 +++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-divider.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk-regmap-divider.c
index 5348491..6cf9005 100644
--- a/drivers/clk/qcom/clk-regmap-divider.c
+++ b/drivers/clk/qcom/clk-regmap-divider.c
@@ -23,6 +23,29 @@ static inline struct clk_regmap_div *to_clk_regmap_div(struct clk_hw *hw)
 	return container_of(to_clk_regmap(hw), struct clk_regmap_div, clkr);
 }
 
+static long div_round_ro_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long *prate)
+{
+	struct clk_regmap_div *divider = to_clk_regmap_div(hw);
+	struct clk_regmap *clkr = &divider->clkr;
+	u32 div;
+	struct clk_hw *hw_parent = clk_hw_get_parent(hw);
+
+	regmap_read(clkr->regmap, divider->reg, &div);
+	div >>= divider->shift;
+	div &= BIT(divider->width) - 1;
+	div += 1;
+
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
+		if (!hw_parent)
+			return -EINVAL;
+
+		*prate = clk_hw_round_rate(hw_parent, rate * div);
+	}
+
+	return DIV_ROUND_UP_ULL((u64)*prate, div);
+}
+
 static long div_round_rate(struct clk_hw *hw, unsigned long rate,
 			   unsigned long *prate)
 {
@@ -68,3 +91,9 @@ static unsigned long div_recalc_rate(struct clk_hw *hw,
 	.recalc_rate = div_recalc_rate,
 };
 EXPORT_SYMBOL_GPL(clk_regmap_div_ops);
+
+const struct clk_ops clk_regmap_div_ro_ops = {
+	.round_rate = div_round_ro_rate,
+	.recalc_rate = div_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_regmap_div_ro_ops);
diff --git a/drivers/clk/qcom/clk-regmap-divider.h b/drivers/clk/qcom/clk-regmap-divider.h
index fc4492e..8c39c27 100644
--- a/drivers/clk/qcom/clk-regmap-divider.h
+++ b/drivers/clk/qcom/clk-regmap-divider.h
@@ -25,5 +25,6 @@ struct clk_regmap_div {
 };
 
 extern const struct clk_ops clk_regmap_div_ops;
+extern const struct clk_ops clk_regmap_div_ro_ops;
 
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
