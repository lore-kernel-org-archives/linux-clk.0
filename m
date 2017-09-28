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
Subject: [PATCH 01/13] clk: qcom: remove redundant PLL_MODE macro offset
Date: Thu, 28 Sep 2017 23:20:38 +0530
Message-Id: <1506621050-10129-2-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The PLL_MODE offset macro is redundant which is defined as zero.
The offset in PLL structure is the address of PLL_MODE register
itself so the PLL_MODE can be removed. It will help in subsequent
patches to support different PLL offset registers to reduce the
code diff.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 47a1da3..b9be822 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -20,7 +20,6 @@
 #include "clk-alpha-pll.h"
 #include "common.h"
 
-#define PLL_MODE		0x00
 # define PLL_OUTCTRL		BIT(0)
 # define PLL_BYPASSNL		BIT(1)
 # define PLL_RESET_N		BIT(2)
@@ -77,12 +76,12 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 	const char *name = clk_hw_get_name(&pll->clkr.hw);
 
 	off = pll->offset;
-	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	ret = regmap_read(pll->clkr.regmap, off, &val);
 	if (ret)
 		return ret;
 
 	for (count = 100; count > 0; count--) {
-		ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+		ret = regmap_read(pll->clkr.regmap, off, &val);
 		if (ret)
 			return ret;
 		if (inverse && !(val & mask))
@@ -139,7 +138,7 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	regmap_update_bits(regmap, off + PLL_USER_CTL, mask, val);
 
 	if (pll->flags & SUPPORTS_FSM_MODE)
-		qcom_pll_set_fsm_mode(regmap, off + PLL_MODE, 6, 0);
+		qcom_pll_set_fsm_mode(regmap, off, 6, 0);
 }
 
 static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
@@ -149,7 +148,7 @@ static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 
 	off = pll->offset;
-	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	ret = regmap_read(pll->clkr.regmap, off, &val);
 	if (ret)
 		return ret;
 
@@ -158,7 +157,7 @@ static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 	if (pll->flags & SUPPORTS_OFFLINE_REQ)
 		val &= ~PLL_OFFLINE_REQ;
 
-	ret = regmap_write(pll->clkr.regmap, off + PLL_MODE, val);
+	ret = regmap_write(pll->clkr.regmap, off, val);
 	if (ret)
 		return ret;
 
@@ -175,12 +174,12 @@ static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 
 	off = pll->offset;
-	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	ret = regmap_read(pll->clkr.regmap, off, &val);
 	if (ret)
 		return;
 
 	if (pll->flags & SUPPORTS_OFFLINE_REQ) {
-		ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+		ret = regmap_update_bits(pll->clkr.regmap, off,
 					 PLL_OFFLINE_REQ, PLL_OFFLINE_REQ);
 		if (ret)
 			return;
@@ -191,7 +190,7 @@ static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
 	}
 
 	/* Disable hwfsm */
-	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+	ret = regmap_update_bits(pll->clkr.regmap, off,
 				 PLL_FSM_ENA, 0);
 	if (ret)
 		return;
@@ -206,7 +205,7 @@ static int pll_is_enabled(struct clk_hw *hw, u32 mask)
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 
 	off = pll->offset;
-	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	ret = regmap_read(pll->clkr.regmap, off, &val);
 	if (ret)
 		return ret;
 
@@ -232,7 +231,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 	off = pll->offset;
 
 	mask = PLL_OUTCTRL | PLL_RESET_N | PLL_BYPASSNL;
-	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	ret = regmap_read(pll->clkr.regmap, off, &val);
 	if (ret)
 		return ret;
 
@@ -248,7 +247,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 	if ((val & mask) == mask)
 		return 0;
 
-	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+	ret = regmap_update_bits(pll->clkr.regmap, off,
 				 PLL_BYPASSNL, PLL_BYPASSNL);
 	if (ret)
 		return ret;
@@ -260,7 +259,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 	mb();
 	udelay(5);
 
-	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+	ret = regmap_update_bits(pll->clkr.regmap, off,
 				 PLL_RESET_N, PLL_RESET_N);
 	if (ret)
 		return ret;
@@ -269,7 +268,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 	if (ret)
 		return ret;
 
-	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+	ret = regmap_update_bits(pll->clkr.regmap, off,
 				 PLL_OUTCTRL, PLL_OUTCTRL);
 
 	/* Ensure that the write above goes through before returning. */
@@ -285,7 +284,7 @@ static void clk_alpha_pll_disable(struct clk_hw *hw)
 
 	off = pll->offset;
 
-	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	ret = regmap_read(pll->clkr.regmap, off, &val);
 	if (ret)
 		return;
 
@@ -296,14 +295,14 @@ static void clk_alpha_pll_disable(struct clk_hw *hw)
 	}
 
 	mask = PLL_OUTCTRL;
-	regmap_update_bits(pll->clkr.regmap, off + PLL_MODE, mask, 0);
+	regmap_update_bits(pll->clkr.regmap, off, mask, 0);
 
 	/* Delay of 2 output clock ticks required until output is disabled */
 	mb();
 	udelay(1);
 
 	mask = PLL_RESET_N | PLL_BYPASSNL;
-	regmap_update_bits(pll->clkr.regmap, off + PLL_MODE, mask, 0);
+	regmap_update_bits(pll->clkr.regmap, off, mask, 0);
 }
 
 static unsigned long alpha_pll_calc_rate(u64 prate, u32 l, u32 a)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
