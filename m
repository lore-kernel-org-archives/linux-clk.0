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
Subject: [PATCH 03/13] clk: qcom: support for alpha pll properties
Date: Thu, 28 Sep 2017 23:20:40 +0530
Message-Id: <1506621050-10129-4-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Alpha PLL is a generic name used for QCOM PLL’s which uses L
and Alpha values for configuring the integer and fractional part.
QCOM SoC’s use different types of Alpha PLL’s for which basic
software configuration part is common with following differences.

1. All These PLL’s will have same basic registers like
   PLL_MODE, L_VAL, ALPHA_VAL but some of the register offsets are
   different in each PLL type.
2. PLL dynamic programming sequence will be different in some
   of the Alpha PLL’s
3. Some of the PLL won’t have 64 bit config control, 64 bit
   user control, VCO configuration etc.

Now, this patch adds the Alpha PLL type in clock node and adds
alpha PLL properties structure inside clk-alpha-pll.c. This PLL
property will contain everything including register offsets, clock
operations and other properties since all these properties will be
fixed for Alpha PLL.

This allows to support other types of Alpha PLL without addition
of new flag and variable in structures of clk_alpha_pll.h. Also, we
don’t have to add operation for each Alpha PLL’s and export them.

In future, we can get rid of most of the flags like following

    struct clk_alpha_pll {
            #define SUPPORTS_OFFLINE_REQ    BIT(0)
            #define SUPPORTS_16BIT_ALPHA    BIT(1)
            #define SUPPORTS_FSM_MODE       BIT(2)
            u8 flags;
    };

    struct clk_alpha_pll_postdiv {
            u8 width;
    };

Since all the above properties will be always same for different
instances of same type of Alpha PLL’s.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 231 ++++++++++++++++++++++++++++++++-------
 drivers/clk/qcom/clk-alpha-pll.h |  10 ++
 2 files changed, 200 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index ab2f23c..d5bfc52 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -35,25 +35,12 @@
 # define PLL_ACTIVE_FLAG	BIT(30)
 # define PLL_LOCK_DET		BIT(31)
 
-#define PLL_L_VAL		0x04
-#define PLL_ALPHA_VAL		0x08
-#define PLL_ALPHA_VAL_U		0x0c
-
-#define PLL_USER_CTL		0x10
 # define PLL_POST_DIV_SHIFT	8
 # define PLL_POST_DIV_MASK	0xf
 # define PLL_ALPHA_EN		BIT(24)
 # define PLL_VCO_SHIFT		20
 # define PLL_VCO_MASK		0x3
 
-#define PLL_USER_CTL_U		0x14
-
-#define PLL_CONFIG_CTL		0x18
-#define PLL_CONFIG_CTL_U	0x20
-#define PLL_TEST_CTL		0x1c
-#define PLL_TEST_CTL_U		0x20
-#define PLL_STATUS		0x24
-
 /*
  * Even though 40 bits are present, use only 32 for ease of calculation.
  */
@@ -61,12 +48,90 @@
 #define ALPHA_BITWIDTH		32
 #define ALPHA_16BIT_MASK	0xffff
 
+/* Returns the alpha_pll_clk_ops for pll type */
+#define pll_clk_ops(hw)		(alpha_pll_props[to_clk_alpha_pll(hw)->	   \
+				 pll_type].ops)
+
+/* Returns the actual register offset for the reg crossponding to pll type */
+#define pll_reg(type, reg)	alpha_pll_props[type].reg_offsets[reg]
+
+/* Helpers to return the actual register offset */
+#define pll_l(type)		pll_reg(type, PLL_L_VAL)
+#define pll_alpha(type)		pll_reg(type, PLL_ALPHA_VAL)
+#define pll_alpha_u(type)	pll_reg(type, PLL_ALPHA_VAL_U)
+#define pll_user_ctl(type)	pll_reg(type, PLL_USER_CTL)
+#define pll_user_ctl_u(type)	pll_reg(type, PLL_USER_CTL_U)
+#define pll_cfg_ctl(type)	pll_reg(type, PLL_CONFIG_CTL)
+#define pll_test_ctl(type)	pll_reg(type, PLL_TEST_CTL)
+#define pll_test_ctl_u(type)	pll_reg(type, PLL_TEST_CTL_U)
+#define pll_status(type)	pll_reg(type, PLL_STATUS)
+#define pll_cfg_ctl_u(type)	pll_reg(type, PLL_CONFIG_CTL_U)
+
 #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
 					   struct clk_alpha_pll, clkr)
 
 #define to_clk_alpha_pll_postdiv(_hw) container_of(to_clk_regmap(_hw), \
 					   struct clk_alpha_pll_postdiv, clkr)
 
+/**
+ * Contains the index which will be used for mapping with actual
+ * register offset in Alpha PLL
+ */
+enum {
+	PLL_L_VAL,
+	PLL_ALPHA_VAL,
+	PLL_ALPHA_VAL_U,
+	PLL_USER_CTL,
+	PLL_USER_CTL_U,
+	PLL_CONFIG_CTL,
+	PLL_CONFIG_CTL_U,
+	PLL_TEST_CTL,
+	PLL_TEST_CTL_U,
+	PLL_STATUS,
+	PLL_MAX_REGS,
+};
+
+/**
+ * struct alpha_pll_clk_ops - operations for alpha PLL
+ * @enable: enable function when HW voting FSM is disabled
+ * @disable: disable function when HW voting FSM is disabled
+ * @is_enabled: check whether PLL is enabled when HW voting FSM is disabled
+ * @hwfsm_enable: check whether PLL is enabled when HW voting FSM is enabled
+ * @hwfsm_disable: check whether PLL is disabled when HW voting FSM is enabled
+ * @hwfsm_is_enabled: check whether PLL is enabled when HW voting FSM is enabled
+ * @recalc_rate: recalculate the rate of PLL by reading mode, L and Alpha Value
+ * @round_rate: returns the closest supported rate of PLL
+ * @set_rate: change the rate of this clock by actually programming the mode, L
+ *	      and Alpha Value registers
+ */
+struct alpha_pll_clk_ops {
+	int		(*enable)(struct clk_hw *hw);
+	void		(*disable)(struct clk_hw *hw);
+	int		(*is_enabled)(struct clk_hw *hw);
+	int		(*hwfsm_enable)(struct clk_hw *hw);
+	void		(*hwfsm_disable)(struct clk_hw *hw);
+	int		(*hwfsm_is_enabled)(struct clk_hw *hw);
+	unsigned long	(*recalc_rate)(struct clk_hw *hw,
+				       unsigned long parent_rate);
+	long		(*round_rate)(struct clk_hw *hw, unsigned long rate,
+				      unsigned long *parent_rate);
+	int		(*set_rate)(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate);
+};
+
+/**
+ * struct alpha_pll_props - contains the various properties which
+ *			    will be fixed for PLL type.
+ * @reg_offsets: register offsets mapping array
+ * @ops: clock operations for alpha PLL
+ */
+struct alpha_pll_props {
+	u8 reg_offsets[PLL_MAX_REGS];
+	struct alpha_pll_clk_ops ops;
+};
+
+static const struct alpha_pll_props alpha_pll_props[];
+
 static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 			const char *action)
 {
@@ -112,11 +177,13 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 {
 	u32 val, mask;
 	u32 off = pll->offset;
+	u8 type = pll->pll_type;
 
-	regmap_write(regmap, off + PLL_L_VAL, config->l);
-	regmap_write(regmap, off + PLL_ALPHA_VAL, config->alpha);
-	regmap_write(regmap, off + PLL_CONFIG_CTL, config->config_ctl_val);
-	regmap_write(regmap, off + PLL_CONFIG_CTL_U, config->config_ctl_hi_val);
+	regmap_write(regmap, off + pll_l(type), config->l);
+	regmap_write(regmap, off + pll_alpha(type), config->alpha);
+	regmap_write(regmap, off + pll_cfg_ctl(type), config->config_ctl_val);
+	regmap_write(regmap, off + pll_cfg_ctl_u(type),
+		     config->config_ctl_hi_val);
 
 	val = config->main_output_mask;
 	val |= config->aux_output_mask;
@@ -134,13 +201,13 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	mask |= config->post_div_mask;
 	mask |= config->vco_mask;
 
-	regmap_update_bits(regmap, off + PLL_USER_CTL, mask, val);
+	regmap_update_bits(regmap, off + pll_user_ctl(type), mask, val);
 
 	if (pll->flags & SUPPORTS_FSM_MODE)
 		qcom_pll_set_fsm_mode(regmap, off, 6, 0);
 }
 
-static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
+static int alpha_pll_default_hwfsm_enable(struct clk_hw *hw)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	int ret;
@@ -165,7 +232,7 @@ static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 	return wait_for_pll_enable_active(pll);
 }
 
-static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
+static void alpha_pll_default_hwfsm_disable(struct clk_hw *hw)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	int ret;
@@ -208,17 +275,17 @@ static int pll_is_enabled(struct clk_hw *hw, u32 mask)
 	return !!(val & mask);
 }
 
-static int clk_alpha_pll_hwfsm_is_enabled(struct clk_hw *hw)
+static int alpha_pll_default_hwfsm_is_enabled(struct clk_hw *hw)
 {
 	return pll_is_enabled(hw, PLL_ACTIVE_FLAG);
 }
 
-static int clk_alpha_pll_is_enabled(struct clk_hw *hw)
+static int alpha_pll_default_is_enabled(struct clk_hw *hw)
 {
 	return pll_is_enabled(hw, PLL_LOCK_DET);
 }
 
-static int clk_alpha_pll_enable(struct clk_hw *hw)
+static int alpha_pll_default_enable(struct clk_hw *hw)
 {
 	int ret;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
@@ -270,7 +337,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 	return ret;
 }
 
-static void clk_alpha_pll_disable(struct clk_hw *hw)
+static void alpha_pll_default_disable(struct clk_hw *hw)
 {
 	int ret;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
@@ -342,22 +409,23 @@ static unsigned long alpha_pll_calc_rate(u64 prate, u32 l, u32 a)
 }
 
 static unsigned long
-clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+alpha_pll_default_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	u32 l, low, high, ctl;
 	u64 a = 0, prate = parent_rate;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 off = pll->offset;
+	u8 type = pll->pll_type;
 
-	regmap_read(pll->clkr.regmap, off + PLL_L_VAL, &l);
+	regmap_read(pll->clkr.regmap, off + pll_l(type), &l);
 
-	regmap_read(pll->clkr.regmap, off + PLL_USER_CTL, &ctl);
+	regmap_read(pll->clkr.regmap, off + pll_user_ctl(type), &ctl);
 	if (ctl & PLL_ALPHA_EN) {
-		regmap_read(pll->clkr.regmap, off + PLL_ALPHA_VAL, &low);
+		regmap_read(pll->clkr.regmap, off + pll_alpha(type), &low);
 		if (pll->flags & SUPPORTS_16BIT_ALPHA) {
 			a = low & ALPHA_16BIT_MASK;
 		} else {
-			regmap_read(pll->clkr.regmap, off + PLL_ALPHA_VAL_U,
+			regmap_read(pll->clkr.regmap, off + pll_alpha_u(type),
 				    &high);
 			a = (u64)high << 32 | low;
 			a >>= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
@@ -367,12 +435,13 @@ static unsigned long alpha_pll_calc_rate(u64 prate, u32 l, u32 a)
 	return alpha_pll_calc_rate(prate, l, a);
 }
 
-static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long prate)
+static int alpha_pll_default_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long prate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	const struct pll_vco *vco;
 	u32 l, off = pll->offset;
+	u8 type = pll->pll_type;
 	u64 a;
 
 	rate = alpha_pll_round_rate(rate, prate, &l, &a);
@@ -382,28 +451,29 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
-	regmap_write(pll->clkr.regmap, off + PLL_L_VAL, l);
+	regmap_write(pll->clkr.regmap, off + pll_l(type), l);
 
 	if (pll->flags & SUPPORTS_16BIT_ALPHA) {
-		regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL,
+		regmap_write(pll->clkr.regmap, off + pll_alpha(type),
 			     a & ALPHA_16BIT_MASK);
 	} else {
 		a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
-		regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL_U, a >> 32);
+		regmap_write(pll->clkr.regmap, off + pll_alpha_u(type),
+			     a >> 32);
 	}
 
-	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL,
+	regmap_update_bits(pll->clkr.regmap, off + pll_user_ctl(type),
 			   PLL_VCO_MASK << PLL_VCO_SHIFT,
 			   vco->val << PLL_VCO_SHIFT);
 
-	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL, PLL_ALPHA_EN,
-			   PLL_ALPHA_EN);
+	regmap_update_bits(pll->clkr.regmap, off + pll_user_ctl(type),
+			   PLL_ALPHA_EN, PLL_ALPHA_EN);
 
 	return 0;
 }
 
-static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static long alpha_pll_default_round_rate(struct clk_hw *hw, unsigned long rate,
+					 unsigned long *prate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	u32 l;
@@ -420,6 +490,54 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	return clamp(rate, min_freq, max_freq);
 }
 
+static int clk_alpha_pll_enable(struct clk_hw *hw)
+{
+	return pll_clk_ops(hw).enable(hw);
+}
+
+static void clk_alpha_pll_disable(struct clk_hw *hw)
+{
+	pll_clk_ops(hw).disable(hw);
+}
+
+static int clk_alpha_pll_is_enabled(struct clk_hw *hw)
+{
+	return pll_clk_ops(hw).is_enabled(hw);
+}
+
+static unsigned long
+clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	return pll_clk_ops(hw).recalc_rate(hw, parent_rate);
+}
+
+static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *prate)
+{
+	return pll_clk_ops(hw).round_rate(hw, rate, prate);
+}
+
+static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long prate)
+{
+	return pll_clk_ops(hw).set_rate(hw, rate, prate);
+}
+
+static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
+{
+	return pll_clk_ops(hw).hwfsm_enable(hw);
+}
+
+static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
+{
+	pll_clk_ops(hw).hwfsm_disable(hw);
+}
+
+static int clk_alpha_pll_hwfsm_is_enabled(struct clk_hw *hw)
+{
+	return pll_clk_ops(hw).hwfsm_is_enabled(hw);
+}
+
 const struct clk_ops clk_alpha_pll_ops = {
 	.enable = clk_alpha_pll_enable,
 	.disable = clk_alpha_pll_disable,
@@ -446,7 +564,8 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 	u32 ctl;
 
-	regmap_read(pll->clkr.regmap, pll->offset + PLL_USER_CTL, &ctl);
+	regmap_read(pll->clkr.regmap, pll->offset + pll_user_ctl(pll->pll_type),
+		    &ctl);
 
 	ctl >>= PLL_POST_DIV_SHIFT;
 	ctl &= PLL_POST_DIV_MASK;
@@ -482,7 +601,8 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	/* 16 -> 0xf, 8 -> 0x7, 4 -> 0x3, 2 -> 0x1, 1 -> 0x0 */
 	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate) - 1;
 
-	return regmap_update_bits(pll->clkr.regmap, pll->offset + PLL_USER_CTL,
+	return regmap_update_bits(pll->clkr.regmap, pll->offset +
+				  pll_user_ctl(pll->pll_type),
 				  PLL_POST_DIV_MASK << PLL_POST_DIV_SHIFT,
 				  div << PLL_POST_DIV_SHIFT);
 }
@@ -493,3 +613,32 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	.set_rate = clk_alpha_pll_postdiv_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_ops);
+
+/* Contains actual property values for different PLL types */
+static const struct
+alpha_pll_props alpha_pll_props[CLK_ALPHA_PLL_TYPE_MAX] = {
+	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
+		.reg_offsets = {
+			[PLL_L_VAL] = 0x04,
+			[PLL_ALPHA_VAL] = 0x08,
+			[PLL_ALPHA_VAL_U] = 0x0c,
+			[PLL_USER_CTL] = 0x10,
+			[PLL_USER_CTL_U] = 0x14,
+			[PLL_CONFIG_CTL] = 0x18,
+			[PLL_TEST_CTL] = 0x1c,
+			[PLL_TEST_CTL_U] = 0x20,
+			[PLL_STATUS] = 0x24,
+		},
+		.ops = {
+			.enable = alpha_pll_default_enable,
+			.disable = alpha_pll_default_disable,
+			.is_enabled = alpha_pll_default_is_enabled,
+			.hwfsm_enable = alpha_pll_default_hwfsm_enable,
+			.hwfsm_disable = alpha_pll_default_hwfsm_disable,
+			.hwfsm_is_enabled = alpha_pll_default_hwfsm_is_enabled,
+			.recalc_rate = alpha_pll_default_recalc_rate,
+			.round_rate = alpha_pll_default_round_rate,
+			.set_rate = alpha_pll_default_set_rate,
+		},
+	},
+};
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index d6e1ee2..4c91fbc 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -17,6 +17,12 @@
 #include <linux/clk-provider.h>
 #include "clk-regmap.h"
 
+/* Alpha PLL types */
+enum {
+	CLK_ALPHA_PLL_TYPE_DEFAULT,
+	CLK_ALPHA_PLL_TYPE_MAX,
+};
+
 struct pll_vco {
 	unsigned long min_freq;
 	unsigned long max_freq;
@@ -27,6 +33,7 @@ struct pll_vco {
  * struct clk_alpha_pll - phase locked loop (PLL)
  * @offset: base address of registers
  * @vco_table: array of VCO settings
+ * @pll_type: alpha pll type
  * @clkr: regmap clock handle
  */
 struct clk_alpha_pll {
@@ -38,6 +45,7 @@ struct clk_alpha_pll {
 #define SUPPORTS_16BIT_ALPHA	BIT(1)
 #define SUPPORTS_FSM_MODE	BIT(2)
 	u8 flags;
+	u8 pll_type;
 
 	struct clk_regmap clkr;
 };
@@ -45,11 +53,13 @@ struct clk_alpha_pll {
 /**
  * struct clk_alpha_pll_postdiv - phase locked loop (PLL) post-divider
  * @offset: base address of registers
+ * @pll_type: alpha pll type
  * @width: width of post-divider
  * @clkr: regmap clock handle
  */
 struct clk_alpha_pll_postdiv {
 	u32 offset;
+	u8 pll_type;
 	u8 width;
 
 	struct clk_regmap clkr;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
