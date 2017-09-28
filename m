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
Subject: [PATCH 02/13] clk: qcom: minor code reorganization related with offset variable
Date: Thu, 28 Sep 2017 23:20:39 +0530
Message-Id: <1506621050-10129-3-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This patch does minor code reorganization related with offset
variable assignment. The offset variable can be directly defined
which will help in subsequent patches to support different PLL
offset registers.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index b9be822..ab2f23c 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -70,12 +70,11 @@
 static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 			const char *action)
 {
-	u32 val, off;
+	u32 val, off = pll->offset;
 	int count;
 	int ret;
 	const char *name = clk_hw_get_name(&pll->clkr.hw);
 
-	off = pll->offset;
 	ret = regmap_read(pll->clkr.regmap, off, &val);
 	if (ret)
 		return ret;
@@ -143,11 +142,10 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 
 static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 {
-	int ret;
-	u32 val, off;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	int ret;
+	u32 val, off = pll->offset;
 
-	off = pll->offset;
 	ret = regmap_read(pll->clkr.regmap, off, &val);
 	if (ret)
 		return ret;
@@ -169,11 +167,10 @@ static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 
 static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
 {
-	int ret;
-	u32 val, off;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	int ret;
+	u32 val, off = pll->offset;
 
-	off = pll->offset;
 	ret = regmap_read(pll->clkr.regmap, off, &val);
 	if (ret)
 		return;
@@ -200,11 +197,10 @@ static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
 
 static int pll_is_enabled(struct clk_hw *hw, u32 mask)
 {
-	int ret;
-	u32 val, off;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	int ret;
+	u32 val, off = pll->offset;
 
-	off = pll->offset;
 	ret = regmap_read(pll->clkr.regmap, off, &val);
 	if (ret)
 		return ret;
@@ -226,9 +222,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 {
 	int ret;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 val, mask, off;
-
-	off = pll->offset;
+	u32 val, mask, off = pll->offset;
 
 	mask = PLL_OUTCTRL | PLL_RESET_N | PLL_BYPASSNL;
 	ret = regmap_read(pll->clkr.regmap, off, &val);
@@ -280,9 +274,7 @@ static void clk_alpha_pll_disable(struct clk_hw *hw)
 {
 	int ret;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 val, mask, off;
-
-	off = pll->offset;
+	u32 val, mask, off = pll->offset;
 
 	ret = regmap_read(pll->clkr.regmap, off, &val);
 	if (ret)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
