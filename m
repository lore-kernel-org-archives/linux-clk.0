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
Subject: [RFC v2 04/12] clk: qcom: fix 16 bit alpha support calculation
Date: Tue,  8 Aug 2017 23:54:09 +0530
Message-Id: <1502216657-3342-5-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
References: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The alpha value calculation function has been written for 40 bit
alpha which is not coming properly for 16 bit

1. Alpha value is being calculated on the basis of
   ALPHA_BITWIDTH to make the computation easy for 40 bit alpha.
   After calculating the 32 bit alpha, It is being converted to 40
   bit alpha by making making lower bits zero. But if actual alpha
   register width is less than ALPHA_BITWIDTH, then the actual width
   can be used for calculation

2. During 40 bit alpha pll set rate, the lower alpha register is
   not being configured

Now the changes have been made to calculate the rate and register
values from alpha_width instead hardcoding it so that it can work
for all the cases.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 56 +++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 084fbdc..6694fd5 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -45,8 +45,11 @@
  * Even though 40 bits are present, use only 32 for ease of calculation.
  */
 #define ALPHA_REG_BITWIDTH	40
+#define ALPHA_REG_16BIT_WIDTH	16
 #define ALPHA_BITWIDTH		32
-#define ALPHA_16BIT_MASK	0xffff
+
+#define pll_alpha_width(pll)  (pll->flags & SUPPORTS_16BIT_ALPHA ?	\
+			       ALPHA_REG_16BIT_WIDTH : ALPHA_REG_BITWIDTH)
 
 #define pll_mode(pll)		(pll->base + pll->offsets[ALPHA_PLL_MODE])
 #define pll_l(pll)		(pll->base + pll->offsets[ALPHA_PLL_L_VAL])
@@ -317,13 +320,16 @@ static void clk_alpha_pll_disable(struct clk_hw *hw)
 	regmap_update_bits(pll->clkr.regmap, pll_mode(pll), mask, 0);
 }
 
-static unsigned long alpha_pll_calc_rate(u64 prate, u32 l, u32 a)
+static unsigned long
+alpha_pll_calc_rate(u64 prate, u32 l, u32 a, u32 alpha_width)
 {
-	return (prate * l) + ((prate * a) >> ALPHA_BITWIDTH);
+	return (prate * l) + ((prate * a) >>
+		(alpha_width < ALPHA_BITWIDTH ? alpha_width : ALPHA_BITWIDTH));
 }
 
 static unsigned long
-alpha_pll_round_rate(unsigned long rate, unsigned long prate, u32 *l, u64 *a)
+alpha_pll_round_rate(unsigned long rate, unsigned long prate, u32 *l, u64 *a,
+		     u32 alpha_width)
 {
 	u64 remainder;
 	u64 quotient;
@@ -338,14 +344,16 @@ static unsigned long alpha_pll_calc_rate(u64 prate, u32 l, u32 a)
 	}
 
 	/* Upper ALPHA_BITWIDTH bits of Alpha */
-	quotient = remainder << ALPHA_BITWIDTH;
+	quotient = remainder << (alpha_width < ALPHA_BITWIDTH ?
+				 alpha_width : ALPHA_BITWIDTH);
+
 	remainder = do_div(quotient, prate);
 
 	if (remainder)
 		quotient++;
 
 	*a = quotient;
-	return alpha_pll_calc_rate(prate, *l, *a);
+	return alpha_pll_calc_rate(prate, *l, *a, alpha_width);
 }
 
 static const struct pll_vco *
@@ -364,26 +372,28 @@ static unsigned long alpha_pll_calc_rate(u64 prate, u32 l, u32 a)
 static unsigned long
 clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
-	u32 l, low, high, ctl;
-	u64 a = 0, prate = parent_rate;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 l, low, high, ctl, alpha_width = pll_alpha_width(pll);
+	u64 a = 0, prate = parent_rate;
 
 	regmap_read(pll->clkr.regmap, pll_l(pll), &l);
 
 	regmap_read(pll->clkr.regmap, pll_user_ctl(pll), &ctl);
 	if (ctl & PLL_ALPHA_EN) {
 		regmap_read(pll->clkr.regmap, pll_alpha(pll), &low);
-		if (pll->flags & SUPPORTS_16BIT_ALPHA) {
-			a = low & ALPHA_16BIT_MASK;
-		} else {
+		if (alpha_width > 32) {
 			regmap_read(pll->clkr.regmap, pll_alpha_u(pll),
 				    &high);
 			a = (u64)high << 32 | low;
-			a >>= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
+		} else {
+			a = low & GENMASK(0, alpha_width - 1);
 		}
+
+		if (alpha_width > ALPHA_BITWIDTH)
+			a >>= alpha_width - ALPHA_BITWIDTH;
 	}
 
-	return alpha_pll_calc_rate(prate, l, a);
+	return alpha_pll_calc_rate(prate, l, a, alpha_width);
 }
 
 static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -391,10 +401,10 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	const struct pll_vco *vco;
-	u32 l;
+	u32 l, alpha_width = pll_alpha_width(pll);
 	u64 a;
 
-	rate = alpha_pll_round_rate(rate, prate, &l, &a);
+	rate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
 	vco = alpha_pll_find_vco(pll, rate);
 	if (!vco) {
 		pr_err("alpha pll not in a valid vco range\n");
@@ -403,13 +413,13 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	regmap_write(pll->clkr.regmap, pll_l(pll), l);
 
-	if (pll->flags & SUPPORTS_16BIT_ALPHA) {
-		regmap_write(pll->clkr.regmap, pll_alpha(pll),
-			     a & ALPHA_16BIT_MASK);
-	} else {
-		a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
+	if (alpha_width > ALPHA_BITWIDTH)
+		a <<= alpha_width - ALPHA_BITWIDTH;
+
+	if (alpha_width > 32)
 		regmap_write(pll->clkr.regmap, pll_alpha_u(pll), a >> 32);
-	}
+
+	regmap_write(pll->clkr.regmap, pll_alpha(pll), a);
 
 	regmap_update_bits(pll->clkr.regmap, pll_user_ctl(pll),
 			   PLL_VCO_MASK << PLL_VCO_SHIFT,
@@ -425,11 +435,11 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 				     unsigned long *prate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 l;
+	u32 l, alpha_width = pll_alpha_width(pll);
 	u64 a;
 	unsigned long min_freq, max_freq;
 
-	rate = alpha_pll_round_rate(rate, *prate, &l, &a);
+	rate = alpha_pll_round_rate(rate, *prate, &l, &a, alpha_width);
 	if (alpha_pll_find_vco(pll, rate))
 		return rate;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
