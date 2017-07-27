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
Subject: [RFC 08/12] clk: qcom: support for Huayra PLL
Date: Thu, 27 Jul 2017 16:40:21 +0530
Message-Id: <1501153825-5181-9-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Following are the major differences in Huayra PLL

1. PLL Alpha Value is 16 bits
2. Depending on alpha_mode, the pll_alpha_val can be treated as
   M/N value or as a two’s compliment number.
3. Huayra PLL supports PLL dynamic programming. User can change
   L_VAL, without having to go through the power on sequence.

Since the decoding of alpha val and dynamic programming are
completely different for other Alpha PLL’s so this patch
made adds separate functions for Huayra PLL.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 179 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |   6 ++
 2 files changed, 185 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 0ac9f96..d17d83a 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -41,9 +41,17 @@
 # define PLL_POST_DIV_SHIFT	8
 # define PLL_POST_DIV_MASK	0xf
 # define PLL_ALPHA_EN		BIT(24)
+# define PLL_ALPHA_MODE		BIT(25)
 # define PLL_VCO_SHIFT		20
 # define PLL_VCO_MASK		0x3
 
+#define PLL_HUAYRA_M_WIDTH		8
+#define PLL_HUAYRA_M_SHIFT		8
+#define PLL_HUAYRA_M_MASK		0xff
+#define PLL_HUAYRA_N_SHIFT		0
+#define PLL_HUAYRA_N_MASK		0xff
+#define PLL_HUAYRA_ALPHA_WIDTH		16
+
 /*
  * Even though 40 bits are present, use only 32 for ease of calculation.
  */
@@ -85,6 +93,18 @@
 	[ALPHA_PLL_STATUS] = 0x24,
 };
 
+const u8 huayra_pll_offsets[] = {
+	[ALPHA_PLL_MODE] = 0x00,
+	[ALPHA_PLL_L_VAL] = 0x04,
+	[ALPHA_PLL_ALPHA_VAL] = 0x08,
+	[ALPHA_PLL_USER_CTL] = 0x10,
+	[ALPHA_PLL_CONFIG_CTL] = 0x14,
+	[ALPHA_PLL_CONFIG_CTL_U] = 0x18,
+	[ALPHA_PLL_TEST_CTL] = 0x1c,
+	[ALPHA_PLL_TEST_CTL_U] = 0x20,
+	[ALPHA_PLL_STATUS] = 0x24,
+};
+
 static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 			const char *action)
 {
@@ -493,6 +513,155 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	return clamp(rate, min_freq, max_freq);
 }
 
+static unsigned long
+alpha_pll_huayra_calc_rate(u64 prate, u32 l, u32 a)
+{
+	/*
+	 * a contains 16 bit alpha_val in two’s compliment number in the range
+	 * of [-0.5, 0.5).
+	 */
+	if (a >= BIT(PLL_HUAYRA_ALPHA_WIDTH - 1))
+		l -= 1;
+
+	return (prate * l) + (prate * a >> PLL_HUAYRA_ALPHA_WIDTH);
+}
+
+static unsigned long
+alpha_pll_huayra_round_rate(unsigned long rate, unsigned long prate,
+			    u32 *l, u32 *a)
+{
+	u64 remainder;
+	u64 quotient;
+
+	quotient = rate;
+	remainder = do_div(quotient, prate);
+	*l = quotient;
+
+	if (!remainder) {
+		*a = 0;
+		return rate;
+	}
+
+	quotient = remainder << PLL_HUAYRA_ALPHA_WIDTH;
+	remainder = do_div(quotient, prate);
+
+	if (remainder)
+		quotient++;
+
+	/*
+	 * alpha_val should be in two’s compliment number in the range
+	 * of [-0.5, 0.5) so if quotient >= 0.5 then increment the l value
+	 * since alpha value will be subtracted in this case.
+	 */
+	if (quotient >= BIT(PLL_HUAYRA_ALPHA_WIDTH - 1))
+		*l += 1;
+
+	*a = quotient;
+	return alpha_pll_huayra_calc_rate(prate, *l, *a);
+}
+
+static unsigned long
+clk_alpha_pll_huayra_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	u32 l, alpha = 0, ctl, alpha_m, alpha_n;
+	u64 rate = parent_rate, tmp;
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+
+	regmap_read(pll->clkr.regmap, pll_l(pll), &l);
+	regmap_read(pll->clkr.regmap, pll_user_ctl(pll), &ctl);
+
+	if (ctl & PLL_ALPHA_EN) {
+		regmap_read(pll->clkr.regmap, pll_alpha(pll), &alpha);
+		/*
+		 * Depending upon alpha_mode, it can be treated as M/N value or
+		 * as a two’s compliment number. When
+		 * alpha_mode=1 pll_alpha_val<15:8>=M & pll_apla_val<7:0>=N
+		 *		Fout=FIN*(L+(M/N))
+		 * M is a signed number (-128 to 127) and N is unsigned
+		 * (0 to 255). M/N has to be within +/-0.5.
+		 *
+		 * alpha_mode=0, it is a two’s compliment number in the range
+		 * of [-0.5, 0.5).
+		 *		Fout=FIN*(L+(alpha_val)/2^16),where alpha_val is
+		 * two’s compliment number.
+		 */
+		if (!(ctl & PLL_ALPHA_MODE))
+			return alpha_pll_huayra_calc_rate(rate, l, alpha);
+
+		alpha_m = alpha >> PLL_HUAYRA_M_SHIFT & PLL_HUAYRA_M_MASK;
+		alpha_n = alpha >> PLL_HUAYRA_N_SHIFT & PLL_HUAYRA_N_MASK;
+
+		rate *= l;
+		tmp = parent_rate;
+		if (alpha_m >= BIT(PLL_HUAYRA_M_WIDTH - 1)) {
+			alpha_m = BIT(PLL_HUAYRA_M_WIDTH) - alpha_m;
+			tmp *= alpha_m;
+			do_div(tmp, alpha_n);
+			rate -= tmp;
+		} else {
+			tmp *= alpha_m;
+			do_div(tmp, alpha_n);
+			rate += tmp;
+		}
+
+		return rate;
+	}
+
+	return alpha_pll_huayra_calc_rate(rate, l, alpha);
+}
+
+static int clk_alpha_pll_huayra_set_rate(struct clk_hw *hw, unsigned long rate,
+					 unsigned long prate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 l, a, ctl, cur_alpha = 0;
+
+	rate = alpha_pll_huayra_round_rate(rate, prate, &l, &a);
+
+	regmap_read(pll->clkr.regmap, pll_user_ctl(pll), &ctl);
+
+	if (ctl & PLL_ALPHA_EN)
+		regmap_read(pll->clkr.regmap, pll_alpha(pll), &cur_alpha);
+
+	/*
+	 * Huayra PLL supports PLL dynamic programming. User can change L_VAL,
+	 * without having to go through the power on sequence.
+	 */
+	if (clk_hw_is_enabled(hw)) {
+		if (cur_alpha != a) {
+			pr_err("clock needs to be gated %s\n",
+			       clk_hw_get_name(hw));
+			return -EBUSY;
+		}
+
+		regmap_write(pll->clkr.regmap, pll_l(pll), l);
+		/* Ensure that the write above goes to detect L val change. */
+		mb();
+		return wait_for_pll_enable_lock(pll);
+	}
+
+	regmap_write(pll->clkr.regmap, pll_l(pll), l);
+	regmap_write(pll->clkr.regmap, pll_alpha(pll), a);
+
+	if (a == 0)
+		regmap_update_bits(pll->clkr.regmap, pll_user_ctl(pll),
+				   PLL_ALPHA_EN, 0x0);
+	else
+		regmap_update_bits(pll->clkr.regmap, pll_user_ctl(pll),
+				   PLL_ALPHA_EN | PLL_ALPHA_MODE, PLL_ALPHA_EN);
+
+	return 0;
+}
+
+static long clk_alpha_pll_huayra_round_rate(struct clk_hw *hw,
+					    unsigned long rate,
+					    unsigned long *prate)
+{
+	u32 l, a;
+
+	return alpha_pll_huayra_round_rate(rate, *prate, &l, &a);
+}
+
 const struct clk_ops clk_alpha_pll_ops = {
 	.enable = clk_alpha_pll_enable,
 	.disable = clk_alpha_pll_disable,
@@ -513,6 +682,16 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_hwfsm_ops);
 
+const struct clk_ops clk_alpha_pll_huayra_ops = {
+	.enable = clk_alpha_pll_enable,
+	.disable = clk_alpha_pll_disable,
+	.is_enabled = clk_alpha_pll_is_enabled,
+	.recalc_rate = clk_alpha_pll_huayra_recalc_rate,
+	.round_rate = clk_alpha_pll_huayra_round_rate,
+	.set_rate = clk_alpha_pll_huayra_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_huayra_ops);
+
 static unsigned long
 clk_alpha_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 01869a8..c98e7469 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -61,6 +61,10 @@ struct clk_alpha_pll {
 	struct clk_regmap clkr;
 };
 
+#define CLK_HUAYRA_PLL_FLAGS	(HAVE_NO_VCO_CONF | SUPPORTS_DYNAMIC_UPDATE | \
+				 SUPPORTS_64BIT_CONFIG_CTL |		      \
+				 SUPPORTS_16BIT_ALPHA)
+
 /**
  * struct clk_alpha_pll_postdiv - phase locked loop (PLL) post-divider
  * @base: base address of registers
@@ -97,9 +101,11 @@ struct alpha_pll_config {
 };
 
 extern const u8 alpha_pll_offsets[];
+extern const u8 huayra_pll_offsets[];
 
 extern const struct clk_ops clk_alpha_pll_ops;
 extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
+extern const struct clk_ops clk_alpha_pll_huayra_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ops;
 
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
