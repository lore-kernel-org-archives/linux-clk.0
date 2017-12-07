Return-Path: <sboyd@codeaurora.org>
Date: Wed, 6 Dec 2017 22:23:31 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] Updates for QCOM Alpha PLL
Message-ID: <20171207062331.GI4283@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/28, Abhishek Sahu wrote:
> This patch series does the miscellaneous changes in QCOM Alpha PLL
> operation and structure to support other types of Alpha PLL’s.
> 
> 1. It adds the pll_type which will be used for determining all
>    the properties of Alpha PLL.
> 2. It adds the support for Brammo and Huayra PLL’s for which
>    the support is not available in existing alpha PLL code.
> 3. There won’t be any change in existing users of Alpha PLL’s
>    since all the newly added code will be under flag for the default
>    PLL operations.
> 

Ok. I took a long look at this today. I rewrote a bunch of stuff.
Let me know if anything looks wrong. I'm not really interested in
having a type template design that causes us to jump through one
clk op to another set of them. I'd rather keep it flatter. I also
kept around the macros for the offsets and had it use a register
map in each struct instead. Yes, we have to go modify the PLL
types to point to the right register offset, but really that's
fine and I don't really care. We could have a default fallback
when the reg pointer is NULL, but I'm not sure that is useful.
The alternative is to make a bunch of new ops structures that
passes it down into the final functions but that seemed like more
work for the handful of PLLs we have to worry about. You seem to
agree here. All told, it got cut down by 100 lines so the patches
got smaller.

---8<----
diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 443fd0b85e41..ad7478bf1655 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -20,6 +20,7 @@
 #include "clk-alpha-pll.h"
 #include "common.h"
 
+#define PLL_MODE(p)		((p)->offset + 0x0)
 # define PLL_OUTCTRL		BIT(0)
 # define PLL_BYPASSNL		BIT(1)
 # define PLL_RESET_N		BIT(2)
@@ -38,12 +39,67 @@
 # define PLL_ACTIVE_FLAG	BIT(30)
 # define PLL_LOCK_DET		BIT(31)
 
+#define PLL_L_VAL(p)		((p)->offset + (p)->regs[PLL_OFF_L_VAL])
+#define PLL_ALPHA_VAL(p)	((p)->offset + (p)->regs[PLL_OFF_ALPHA_VAL])
+#define PLL_ALPHA_VAL_U(p)	((p)->offset + (p)->regs[PLL_OFF_ALPHA_VAL_U])
+
+#define PLL_USER_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_USER_CTL])
 # define PLL_POST_DIV_SHIFT	8
+# define PLL_POST_DIV_MASK(p)	GENMASK((p)->width, 0)
 # define PLL_ALPHA_EN		BIT(24)
 # define PLL_ALPHA_MODE		BIT(25)
 # define PLL_VCO_SHIFT		20
 # define PLL_VCO_MASK		0x3
 
+#define PLL_USER_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_USER_CTL_U])
+
+#define PLL_CONFIG_CTL(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL])
+#define PLL_CONFIG_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U])
+#define PLL_TEST_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_TEST_CTL])
+#define PLL_TEST_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U])
+#define PLL_STATUS(p)		((p)->offset + (p)->regs[PLL_OFF_STATUS])
+
+const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
+	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_ALPHA_VAL_U] = 0x0c,
+		[PLL_OFF_USER_CTL] = 0x10,
+		[PLL_OFF_USER_CTL_U] = 0x14,
+		[PLL_OFF_CONFIG_CTL] = 0x18,
+		[PLL_OFF_TEST_CTL] = 0x1c,
+		[PLL_OFF_TEST_CTL_U] = 0x20,
+		[PLL_OFF_STATUS] = 0x24,
+	},
+	[CLK_ALPHA_PLL_TYPE_HUAYRA] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_USER_CTL] = 0x10,
+		[PLL_OFF_CONFIG_CTL] = 0x14,
+		[PLL_OFF_CONFIG_CTL_U] = 0x18,
+		[PLL_OFF_TEST_CTL] = 0x1c,
+		[PLL_OFF_TEST_CTL_U] = 0x20,
+		[PLL_OFF_STATUS] = 0x24,
+	},
+	[CLK_ALPHA_PLL_TYPE_BRAMMO] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_ALPHA_VAL_U] = 0x0c,
+		[PLL_OFF_USER_CTL] = 0x10,
+		[PLL_OFF_CONFIG_CTL] = 0x18,
+		[PLL_OFF_TEST_CTL] = 0x1c,
+		[PLL_OFF_STATUS] = 0x24,
+	},
+};
+
+/*
+ * Even though 40 bits are present, use only 32 for ease of calculation.
+ */
+#define ALPHA_REG_BITWIDTH	40
+#define ALPHA_REG_16BIT_WIDTH	16
+#define ALPHA_BITWIDTH		32U
+#define ALPHA_SHIFT(w)		min(w, ALPHA_BITWIDTH)
+
 #define PLL_HUAYRA_M_WIDTH		8
 #define PLL_HUAYRA_M_SHIFT		8
 #define PLL_HUAYRA_M_MASK		0xff
@@ -51,35 +107,11 @@
 #define PLL_HUAYRA_N_MASK		0xff
 #define PLL_HUAYRA_ALPHA_WIDTH		16
 
-/*
- * Even though 40 bits are present, use only 32 for ease of calculation.
- */
-#define ALPHA_BITWIDTH		32
-
-/* Returns the Alpha register width for pll type */
-#define pll_alpha_width(type)	(alpha_pll_props[type].alpha_width)
-
-/* Returns the flags for pll type */
-#define pll_flags(type)		(alpha_pll_props[type].flags)
-
-/* Returns the alpha_pll_clk_ops for pll type */
-#define pll_clk_ops(hw)		(alpha_pll_props[to_clk_alpha_pll(hw)->	   \
-				 pll_type].ops)
+#define pll_alpha_width(p)					\
+		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
+				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
 
-/* Returns the actual register offset for the reg crossponding to pll type */
-#define pll_reg(type, reg)	alpha_pll_props[type].reg_offsets[reg]
-
-/* Helpers to return the actual register offset */
-#define pll_l(type)		pll_reg(type, PLL_L_VAL)
-#define pll_alpha(type)		pll_reg(type, PLL_ALPHA_VAL)
-#define pll_alpha_u(type)	pll_reg(type, PLL_ALPHA_VAL_U)
-#define pll_user_ctl(type)	pll_reg(type, PLL_USER_CTL)
-#define pll_user_ctl_u(type)	pll_reg(type, PLL_USER_CTL_U)
-#define pll_cfg_ctl(type)	pll_reg(type, PLL_CONFIG_CTL)
-#define pll_test_ctl(type)	pll_reg(type, PLL_TEST_CTL)
-#define pll_test_ctl_u(type)	pll_reg(type, PLL_TEST_CTL_U)
-#define pll_status(type)	pll_reg(type, PLL_STATUS)
-#define pll_cfg_ctl_u(type)	pll_reg(type, PLL_CONFIG_CTL_U)
+#define pll_has_64bit_config(p)	((PLL_CONFIG_CTL_U(p) - PLL_CONFIG_CTL(p)) == 4)
 
 #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
 					   struct clk_alpha_pll, clkr)
@@ -87,86 +119,20 @@
 #define to_clk_alpha_pll_postdiv(_hw) container_of(to_clk_regmap(_hw), \
 					   struct clk_alpha_pll_postdiv, clkr)
 
-/**
- * Contains the index which will be used for mapping with actual
- * register offset in Alpha PLL
- */
-enum {
-	PLL_L_VAL,
-	PLL_ALPHA_VAL,
-	PLL_ALPHA_VAL_U,
-	PLL_USER_CTL,
-	PLL_USER_CTL_U,
-	PLL_CONFIG_CTL,
-	PLL_CONFIG_CTL_U,
-	PLL_TEST_CTL,
-	PLL_TEST_CTL_U,
-	PLL_STATUS,
-	PLL_MAX_REGS,
-};
-
-/**
- * struct alpha_pll_clk_ops - operations for alpha PLL
- * @enable: enable function when HW voting FSM is disabled
- * @disable: disable function when HW voting FSM is disabled
- * @is_enabled: check whether PLL is enabled when HW voting FSM is disabled
- * @hwfsm_enable: check whether PLL is enabled when HW voting FSM is enabled
- * @hwfsm_disable: check whether PLL is disabled when HW voting FSM is enabled
- * @hwfsm_is_enabled: check whether PLL is enabled when HW voting FSM is enabled
- * @recalc_rate: recalculate the rate of PLL by reading mode, L and Alpha Value
- * @round_rate: returns the closest supported rate of PLL
- * @set_rate: change the rate of this clock by actually programming the mode, L
- *	      and Alpha Value registers
- */
-struct alpha_pll_clk_ops {
-	int		(*enable)(struct clk_hw *hw);
-	void		(*disable)(struct clk_hw *hw);
-	int		(*is_enabled)(struct clk_hw *hw);
-	int		(*hwfsm_enable)(struct clk_hw *hw);
-	void		(*hwfsm_disable)(struct clk_hw *hw);
-	int		(*hwfsm_is_enabled)(struct clk_hw *hw);
-	unsigned long	(*recalc_rate)(struct clk_hw *hw,
-				       unsigned long parent_rate);
-	long		(*round_rate)(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate);
-	int		(*set_rate)(struct clk_hw *hw, unsigned long rate,
-				    unsigned long parent_rate);
-};
-
-/**
- * struct alpha_pll_props - contains the various properties which
- *			    will be fixed for PLL type.
- * @reg_offsets: register offsets mapping array
- * @alpha_width: alpha value width
- * @ops: clock operations for alpha PLL
- */
-struct alpha_pll_props {
-	u8 reg_offsets[PLL_MAX_REGS];
-	u8 alpha_width;
-
-#define HAVE_64BIT_CONFIG_CTL		BIT(0)
-#define SUPPORTS_DYNAMIC_UPDATE		BIT(1)
-#define SUPPORTS_VCO			BIT(2)
-	u8 flags;
-	struct alpha_pll_clk_ops ops;
-};
-
-static const struct alpha_pll_props alpha_pll_props[];
-
 static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 			const char *action)
 {
-	u32 val, off = pll->offset;
+	u32 val;
 	int count;
 	int ret;
 	const char *name = clk_hw_get_name(&pll->clkr.hw);
 
-	ret = regmap_read(pll->clkr.regmap, off, &val);
+	ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
 	if (ret)
 		return ret;
 
 	for (count = 100; count > 0; count--) {
-		ret = regmap_read(pll->clkr.regmap, off, &val);
+		ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
 		if (ret)
 			return ret;
 		if (inverse && !(val & mask))
@@ -206,22 +172,17 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
 	u32 val, mask;
-	u32 off = pll->offset;
-	u8 type = pll->pll_type, flags = pll_flags(type);
 
-	regmap_write(regmap, off + pll_l(type), config->l);
-	regmap_write(regmap, off + pll_alpha(type), config->alpha);
-	regmap_write(regmap, off + pll_cfg_ctl(type), config->config_ctl_val);
-	regmap_write(regmap, off + pll_cfg_ctl_u(type),
-		     config->config_ctl_hi_val);
+	regmap_write(regmap, PLL_L_VAL(pll), config->l);
+	regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+	regmap_write(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
 
-	if (flags & HAVE_64BIT_CONFIG_CTL)
-		regmap_write(regmap, off + pll_cfg_ctl_u(type),
+	if (pll_has_64bit_config(pll))
+		regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
 			     config->config_ctl_hi_val);
 
-	if (pll_alpha_width(type) > 32)
-		regmap_write(regmap, off + pll_alpha_u(type),
-			     config->alpha_hi);
+	if (pll_alpha_width(pll) > 32)
+		regmap_write(regmap, PLL_ALPHA_VAL_U(pll), config->alpha_hi);
 
 	val = config->main_output_mask;
 	val |= config->aux_output_mask;
@@ -241,19 +202,19 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	mask |= config->post_div_mask;
 	mask |= config->vco_mask;
 
-	regmap_update_bits(regmap, off + pll_user_ctl(type), mask, val);
+	regmap_update_bits(regmap, PLL_USER_CTL(pll), mask, val);
 
 	if (pll->flags & SUPPORTS_FSM_MODE)
-		qcom_pll_set_fsm_mode(regmap, off, 6, 0);
+		qcom_pll_set_fsm_mode(regmap, PLL_MODE(pll), 6, 0);
 }
 
-static int alpha_pll_default_hwfsm_enable(struct clk_hw *hw)
+static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 {
-	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	int ret;
-	u32 val, off = pll->offset;
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 val;
 
-	ret = regmap_read(pll->clkr.regmap, off, &val);
+	ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
 	if (ret)
 		return ret;
 
@@ -262,7 +223,7 @@ static int alpha_pll_default_hwfsm_enable(struct clk_hw *hw)
 	if (pll->flags & SUPPORTS_OFFLINE_REQ)
 		val &= ~PLL_OFFLINE_REQ;
 
-	ret = regmap_write(pll->clkr.regmap, off, val);
+	ret = regmap_write(pll->clkr.regmap, PLL_MODE(pll), val);
 	if (ret)
 		return ret;
 
@@ -272,18 +233,18 @@ static int alpha_pll_default_hwfsm_enable(struct clk_hw *hw)
 	return wait_for_pll_enable_active(pll);
 }
 
-static void alpha_pll_default_hwfsm_disable(struct clk_hw *hw)
+static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
 {
-	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	int ret;
-	u32 val, off = pll->offset;
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 val;
 
-	ret = regmap_read(pll->clkr.regmap, off, &val);
+	ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
 	if (ret)
 		return;
 
 	if (pll->flags & SUPPORTS_OFFLINE_REQ) {
-		ret = regmap_update_bits(pll->clkr.regmap, off,
+		ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
 					 PLL_OFFLINE_REQ, PLL_OFFLINE_REQ);
 		if (ret)
 			return;
@@ -294,7 +255,7 @@ static void alpha_pll_default_hwfsm_disable(struct clk_hw *hw)
 	}
 
 	/* Disable hwfsm */
-	ret = regmap_update_bits(pll->clkr.regmap, off,
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
 				 PLL_FSM_ENA, 0);
 	if (ret)
 		return;
@@ -304,35 +265,35 @@ static void alpha_pll_default_hwfsm_disable(struct clk_hw *hw)
 
 static int pll_is_enabled(struct clk_hw *hw, u32 mask)
 {
-	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	int ret;
-	u32 val, off = pll->offset;
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 val;
 
-	ret = regmap_read(pll->clkr.regmap, off, &val);
+	ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
 	if (ret)
 		return ret;
 
 	return !!(val & mask);
 }
 
-static int alpha_pll_default_hwfsm_is_enabled(struct clk_hw *hw)
+static int clk_alpha_pll_hwfsm_is_enabled(struct clk_hw *hw)
 {
 	return pll_is_enabled(hw, PLL_ACTIVE_FLAG);
 }
 
-static int alpha_pll_default_is_enabled(struct clk_hw *hw)
+static int clk_alpha_pll_is_enabled(struct clk_hw *hw)
 {
 	return pll_is_enabled(hw, PLL_LOCK_DET);
 }
 
-static int alpha_pll_default_enable(struct clk_hw *hw)
+static int clk_alpha_pll_enable(struct clk_hw *hw)
 {
 	int ret;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 val, mask, off = pll->offset;
+	u32 val, mask;
 
 	mask = PLL_OUTCTRL | PLL_RESET_N | PLL_BYPASSNL;
-	ret = regmap_read(pll->clkr.regmap, off, &val);
+	ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
 	if (ret)
 		return ret;
 
@@ -348,7 +309,7 @@ static int alpha_pll_default_enable(struct clk_hw *hw)
 	if ((val & mask) == mask)
 		return 0;
 
-	ret = regmap_update_bits(pll->clkr.regmap, off,
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
 				 PLL_BYPASSNL, PLL_BYPASSNL);
 	if (ret)
 		return ret;
@@ -360,7 +321,7 @@ static int alpha_pll_default_enable(struct clk_hw *hw)
 	mb();
 	udelay(5);
 
-	ret = regmap_update_bits(pll->clkr.regmap, off,
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
 				 PLL_RESET_N, PLL_RESET_N);
 	if (ret)
 		return ret;
@@ -369,7 +330,7 @@ static int alpha_pll_default_enable(struct clk_hw *hw)
 	if (ret)
 		return ret;
 
-	ret = regmap_update_bits(pll->clkr.regmap, off,
+	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll),
 				 PLL_OUTCTRL, PLL_OUTCTRL);
 
 	/* Ensure that the write above goes through before returning. */
@@ -377,13 +338,13 @@ static int alpha_pll_default_enable(struct clk_hw *hw)
 	return ret;
 }
 
-static void alpha_pll_default_disable(struct clk_hw *hw)
+static void clk_alpha_pll_disable(struct clk_hw *hw)
 {
 	int ret;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 val, mask, off = pll->offset;
+	u32 val, mask;
 
-	ret = regmap_read(pll->clkr.regmap, off, &val);
+	ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
 	if (ret)
 		return;
 
@@ -394,21 +355,20 @@ static void alpha_pll_default_disable(struct clk_hw *hw)
 	}
 
 	mask = PLL_OUTCTRL;
-	regmap_update_bits(pll->clkr.regmap, off, mask, 0);
+	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), mask, 0);
 
 	/* Delay of 2 output clock ticks required until output is disabled */
 	mb();
 	udelay(1);
 
 	mask = PLL_RESET_N | PLL_BYPASSNL;
-	regmap_update_bits(pll->clkr.regmap, off, mask, 0);
+	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), mask, 0);
 }
 
 static unsigned long
 alpha_pll_calc_rate(u64 prate, u32 l, u32 a, u32 alpha_width)
 {
-	return (prate * l) + ((prate * a) >>
-		(alpha_width < ALPHA_BITWIDTH ? alpha_width : ALPHA_BITWIDTH));
+	return (prate * l) + ((prate * a) >> ALPHA_SHIFT(alpha_width));
 }
 
 static unsigned long
@@ -428,8 +388,7 @@ alpha_pll_round_rate(unsigned long rate, unsigned long prate, u32 *l, u64 *a,
 	}
 
 	/* Upper ALPHA_BITWIDTH bits of Alpha */
-	quotient = remainder << (alpha_width < ALPHA_BITWIDTH ?
-				 alpha_width : ALPHA_BITWIDTH);
+	quotient = remainder << ALPHA_SHIFT(alpha_width);
 
 	remainder = do_div(quotient, prate);
 
@@ -454,21 +413,20 @@ alpha_pll_find_vco(const struct clk_alpha_pll *pll, unsigned long rate)
 }
 
 static unsigned long
-alpha_pll_default_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	u32 l, low, high, ctl;
 	u64 a = 0, prate = parent_rate;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u8 type = pll->pll_type;
-	u32 off = pll->offset, alpha_width = pll_alpha_width(type);
+	u32 alpha_width = pll_alpha_width(pll);
 
-	regmap_read(pll->clkr.regmap, off + pll_l(type), &l);
+	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
 
-	regmap_read(pll->clkr.regmap, off + pll_user_ctl(type), &ctl);
+	regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
 	if (ctl & PLL_ALPHA_EN) {
-		regmap_read(pll->clkr.regmap, off + pll_alpha(type), &low);
+		regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &low);
 		if (alpha_width > 32) {
-			regmap_read(pll->clkr.regmap, off + pll_alpha_u(type),
+			regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
 				    &high);
 			a = (u64)high << 32 | low;
 		} else {
@@ -492,7 +450,7 @@ static int clk_alpha_pll_update_latch(struct clk_alpha_pll *pll)
 	/* Latch the input to the PLL */
 	regmap_update_bits(pll->clkr.regmap, off, PLL_UPDATE, PLL_UPDATE);
 
-	/* Make sure PLL_UPDATE request goes through*/
+	/* Make sure PLL_UPDATE request goes through */
 	mb();
 
 	/* Wait for 2 reference cycle before checking ACK bit */
@@ -512,7 +470,7 @@ static int clk_alpha_pll_update_latch(struct clk_alpha_pll *pll)
 
 		regmap_update_bits(pll->clkr.regmap, off, PLL_UPDATE, 0);
 
-		/* Make sure PLL_UPDATE request goes through*/
+		/* Make sure PLL_UPDATE request goes through */
 		mb();
 	} else {
 		ret = wait_for_pll_update(pll);
@@ -530,60 +488,56 @@ static int clk_alpha_pll_update_latch(struct clk_alpha_pll *pll)
 	return 0;
 }
 
-static int alpha_pll_default_set_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long prate)
+static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long prate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	const struct pll_vco *vco;
-	u8 type = pll->pll_type, flags = pll_flags(type);
-	u32 l, off = pll->offset, alpha_width = pll_alpha_width(type);
+	u32 l, alpha_width = pll_alpha_width(pll);
 	u64 a;
 
 	rate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
-	if (flags & SUPPORTS_VCO) {
-		vco = alpha_pll_find_vco(pll, rate);
-		if (!vco) {
-			pr_err("alpha pll not in a valid vco range\n");
-			return -EINVAL;
-		}
+	vco = alpha_pll_find_vco(pll, rate);
+	if (pll->vco_table && !vco) {
+		pr_err("alpha pll not in a valid vco range\n");
+		return -EINVAL;
 	}
 
-	regmap_write(pll->clkr.regmap, off + pll_l(type), l);
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
 
 	if (alpha_width > ALPHA_BITWIDTH)
 		a <<= alpha_width - ALPHA_BITWIDTH;
 
 	if (alpha_width > 32)
-		regmap_write(pll->clkr.regmap, off + pll_alpha_u(type),
-			     a >> 32);
+		regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), a >> 32);
 
-	regmap_write(pll->clkr.regmap, off + pll_alpha(type), a);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
 
-	if (flags & SUPPORTS_VCO)
-		regmap_update_bits(pll->clkr.regmap, off + pll_user_ctl(type),
+	if (vco) {
+		regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
 				   PLL_VCO_MASK << PLL_VCO_SHIFT,
 				   vco->val << PLL_VCO_SHIFT);
+	}
 
-	regmap_update_bits(pll->clkr.regmap, off + pll_user_ctl(type),
+	regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
 			   PLL_ALPHA_EN, PLL_ALPHA_EN);
 
-	if (!clk_hw_is_enabled(hw) || !(flags & SUPPORTS_DYNAMIC_UPDATE))
+	if (!clk_hw_is_enabled(hw) || !(pll->flags & SUPPORTS_DYNAMIC_UPDATE))
 		return 0;
 
 	return clk_alpha_pll_update_latch(pll);
 }
 
-static long alpha_pll_default_round_rate(struct clk_hw *hw, unsigned long rate,
-					 unsigned long *prate)
+static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *prate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u8 type = pll->pll_type;
-	u32 l, alpha_width = pll_alpha_width(type);
+	u32 l, alpha_width = pll_alpha_width(pll);
 	u64 a;
 	unsigned long min_freq, max_freq;
 
 	rate = alpha_pll_round_rate(rate, *prate, &l, &a, alpha_width);
-	if (!(pll_flags(type) & SUPPORTS_VCO) || alpha_pll_find_vco(pll, rate))
+	if (!pll->vco_table || alpha_pll_find_vco(pll, rate))
 		return rate;
 
 	min_freq = pll->vco_table[0].min_freq;
@@ -644,26 +598,29 @@ alpha_pll_huayra_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	u64 rate = parent_rate, tmp;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u8 type = pll->pll_type;
-	u32 l, alpha = 0, ctl, alpha_m, alpha_n, off = pll->offset;
+	u32 l, alpha = 0, ctl, alpha_m, alpha_n;
 
-	regmap_read(pll->clkr.regmap, off + pll_l(type), &l);
-	regmap_read(pll->clkr.regmap, off + pll_user_ctl(type), &ctl);
+	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
+	regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
 
 	if (ctl & PLL_ALPHA_EN) {
-		regmap_read(pll->clkr.regmap, off + pll_alpha(type), &alpha);
+		regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &alpha);
 		/*
 		 * Depending upon alpha_mode, it can be treated as M/N value or
-		 * as a two’s compliment number. When
-		 * alpha_mode=1 pll_alpha_val<15:8>=M & pll_apla_val<7:0>=N
+		 * as a two’s compliment number. When alpha_mode=1,
+		 * pll_alpha_val<15:8>=M and pll_apla_val<7:0>=N
+		 *
 		 *		Fout=FIN*(L+(M/N))
+		 *
 		 * M is a signed number (-128 to 127) and N is unsigned
 		 * (0 to 255). M/N has to be within +/-0.5.
 		 *
-		 * alpha_mode=0, it is a two’s compliment number in the range
-		 * of [-0.5, 0.5).
-		 *		Fout=FIN*(L+(alpha_val)/2^16),where alpha_val is
-		 * two’s compliment number.
+		 * When alpha_mode=0, it is a two’s compliment number in the
+		 * range [-0.5, 0.5).
+		 *
+		 *		Fout=FIN*(L+(alpha_val)/2^16)
+		 *
+		 * where alpha_val is two’s compliment number.
 		 */
 		if (!(ctl & PLL_ALPHA_MODE))
 			return alpha_huayra_pll_calc_rate(rate, l, alpha);
@@ -694,16 +651,14 @@ static int alpha_pll_huayra_set_rate(struct clk_hw *hw, unsigned long rate,
 				     unsigned long prate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u8 type = pll->pll_type;
-	u32 l, a, ctl, cur_alpha = 0, off = pll->offset;
+	u32 l, a, ctl, cur_alpha = 0;
 
 	rate = alpha_huayra_pll_round_rate(rate, prate, &l, &a);
 
-	regmap_read(pll->clkr.regmap, off + pll_user_ctl(type), &ctl);
+	regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
 
 	if (ctl & PLL_ALPHA_EN)
-		regmap_read(pll->clkr.regmap, off + pll_alpha(type),
-			    &cur_alpha);
+		regmap_read(pll->clkr.regmap, PLL_ALPHA_VAL(pll), &cur_alpha);
 
 	/*
 	 * Huayra PLL supports PLL dynamic programming. User can change L_VAL,
@@ -716,20 +671,20 @@ static int alpha_pll_huayra_set_rate(struct clk_hw *hw, unsigned long rate,
 			return -EBUSY;
 		}
 
-		regmap_write(pll->clkr.regmap, off + pll_l(type), l);
+		regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
 		/* Ensure that the write above goes to detect L val change. */
 		mb();
 		return wait_for_pll_enable_lock(pll);
 	}
 
-	regmap_write(pll->clkr.regmap, off + pll_l(type), l);
-	regmap_write(pll->clkr.regmap, off + pll_alpha(type), a);
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
 
 	if (a == 0)
-		regmap_update_bits(pll->clkr.regmap, off + pll_user_ctl(type),
+		regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
 				   PLL_ALPHA_EN, 0x0);
 	else
-		regmap_update_bits(pll->clkr.regmap, off + pll_user_ctl(type),
+		regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
 				   PLL_ALPHA_EN | PLL_ALPHA_MODE, PLL_ALPHA_EN);
 
 	return 0;
@@ -743,54 +698,6 @@ static long alpha_pll_huayra_round_rate(struct clk_hw *hw, unsigned long rate,
 	return alpha_huayra_pll_round_rate(rate, *prate, &l, &a);
 }
 
-static int clk_alpha_pll_enable(struct clk_hw *hw)
-{
-	return pll_clk_ops(hw).enable(hw);
-}
-
-static void clk_alpha_pll_disable(struct clk_hw *hw)
-{
-	pll_clk_ops(hw).disable(hw);
-}
-
-static int clk_alpha_pll_is_enabled(struct clk_hw *hw)
-{
-	return pll_clk_ops(hw).is_enabled(hw);
-}
-
-static unsigned long
-clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
-{
-	return pll_clk_ops(hw).recalc_rate(hw, parent_rate);
-}
-
-static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
-{
-	return pll_clk_ops(hw).round_rate(hw, rate, prate);
-}
-
-static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long prate)
-{
-	return pll_clk_ops(hw).set_rate(hw, rate, prate);
-}
-
-static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
-{
-	return pll_clk_ops(hw).hwfsm_enable(hw);
-}
-
-static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
-{
-	pll_clk_ops(hw).hwfsm_disable(hw);
-}
-
-static int clk_alpha_pll_hwfsm_is_enabled(struct clk_hw *hw)
-{
-	return pll_clk_ops(hw).hwfsm_is_enabled(hw);
-}
-
 const struct clk_ops clk_alpha_pll_ops = {
 	.enable = clk_alpha_pll_enable,
 	.disable = clk_alpha_pll_disable,
@@ -801,6 +708,16 @@ const struct clk_ops clk_alpha_pll_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_ops);
 
+const struct clk_ops clk_alpha_pll_huayra_ops = {
+	.enable = clk_alpha_pll_enable,
+	.disable = clk_alpha_pll_disable,
+	.is_enabled = clk_alpha_pll_is_enabled,
+	.recalc_rate = alpha_pll_huayra_recalc_rate,
+	.round_rate = alpha_pll_huayra_round_rate,
+	.set_rate = alpha_pll_huayra_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_huayra_ops);
+
 const struct clk_ops clk_alpha_pll_hwfsm_ops = {
 	.enable = clk_alpha_pll_hwfsm_enable,
 	.disable = clk_alpha_pll_hwfsm_disable,
@@ -817,11 +734,10 @@ clk_alpha_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 	u32 ctl;
 
-	regmap_read(pll->clkr.regmap, pll->offset + pll_user_ctl(pll->pll_type),
-		    &ctl);
+	regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
 
 	ctl >>= PLL_POST_DIV_SHIFT;
-	ctl &= BIT(pll->width) - 1;
+	ctl &= PLL_POST_DIV_MASK(pll);
 
 	return parent_rate >> fls(ctl);
 }
@@ -865,8 +781,7 @@ clk_alpha_pll_postdiv_round_ro_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 	u32 ctl, div;
 
-	regmap_read(pll->clkr.regmap, pll->offset + pll_user_ctl(pll->pll_type),
-		    &ctl);
+	regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &ctl);
 
 	ctl >>= PLL_POST_DIV_SHIFT;
 	ctl &= BIT(pll->width) - 1;
@@ -887,9 +802,8 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	/* 16 -> 0xf, 8 -> 0x7, 4 -> 0x3, 2 -> 0x1, 1 -> 0x0 */
 	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate) - 1;
 
-	return regmap_update_bits(pll->clkr.regmap, pll->offset +
-				  pll_user_ctl(pll->pll_type),
-				  (BIT(pll->width) - 1) << PLL_POST_DIV_SHIFT,
+	return regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
+				  PLL_POST_DIV_MASK(pll) << PLL_POST_DIV_SHIFT,
 				  div << PLL_POST_DIV_SHIFT);
 }
 
@@ -905,83 +819,3 @@ const struct clk_ops clk_alpha_pll_postdiv_ro_ops = {
 	.recalc_rate = clk_alpha_pll_postdiv_recalc_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_ro_ops);
-
-/* Contains actual property values for different PLL types */
-static const struct
-alpha_pll_props alpha_pll_props[CLK_ALPHA_PLL_TYPE_MAX] = {
-	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
-		.reg_offsets = {
-			[PLL_L_VAL] = 0x04,
-			[PLL_ALPHA_VAL] = 0x08,
-			[PLL_ALPHA_VAL_U] = 0x0c,
-			[PLL_USER_CTL] = 0x10,
-			[PLL_USER_CTL_U] = 0x14,
-			[PLL_CONFIG_CTL] = 0x18,
-			[PLL_TEST_CTL] = 0x1c,
-			[PLL_TEST_CTL_U] = 0x20,
-			[PLL_STATUS] = 0x24,
-		},
-		.alpha_width = 40,
-		.flags = SUPPORTS_VCO,
-		.ops = {
-			.enable = alpha_pll_default_enable,
-			.disable = alpha_pll_default_disable,
-			.is_enabled = alpha_pll_default_is_enabled,
-			.hwfsm_enable = alpha_pll_default_hwfsm_enable,
-			.hwfsm_disable = alpha_pll_default_hwfsm_disable,
-			.hwfsm_is_enabled = alpha_pll_default_hwfsm_is_enabled,
-			.recalc_rate = alpha_pll_default_recalc_rate,
-			.round_rate = alpha_pll_default_round_rate,
-			.set_rate = alpha_pll_default_set_rate,
-		},
-	},
-	[CLK_ALPHA_PLL_TYPE_HUAYRA] =  {
-		.reg_offsets = {
-			[PLL_L_VAL] = 0x04,
-			[PLL_ALPHA_VAL] = 0x08,
-			[PLL_USER_CTL] = 0x10,
-			[PLL_CONFIG_CTL] = 0x14,
-			[PLL_CONFIG_CTL_U] = 0x18,
-			[PLL_TEST_CTL] = 0x1c,
-			[PLL_TEST_CTL_U] = 0x20,
-			[PLL_STATUS] = 0x24,
-		},
-		.alpha_width = 16,
-		.flags = SUPPORTS_DYNAMIC_UPDATE | HAVE_64BIT_CONFIG_CTL,
-		.ops = {
-			.enable = alpha_pll_default_enable,
-			.disable = alpha_pll_default_disable,
-			.is_enabled = alpha_pll_default_is_enabled,
-			.hwfsm_enable = alpha_pll_default_hwfsm_enable,
-			.hwfsm_disable = alpha_pll_default_hwfsm_disable,
-			.hwfsm_is_enabled = alpha_pll_default_hwfsm_is_enabled,
-			.recalc_rate = alpha_pll_huayra_recalc_rate,
-			.round_rate = alpha_pll_huayra_round_rate,
-			.set_rate = alpha_pll_huayra_set_rate,
-		},
-	},
-	[CLK_ALPHA_PLL_TYPE_BRAMMO] =  {
-		.reg_offsets = {
-			[PLL_L_VAL] = 0x04,
-			[PLL_ALPHA_VAL] = 0x08,
-			[PLL_ALPHA_VAL_U] = 0x0c,
-			[PLL_USER_CTL] = 0x10,
-			[PLL_CONFIG_CTL] = 0x18,
-			[PLL_TEST_CTL] = 0x1c,
-			[PLL_STATUS] = 0x24,
-		},
-		.alpha_width = 40,
-		.flags = SUPPORTS_DYNAMIC_UPDATE,
-		.ops = {
-			.enable = alpha_pll_default_enable,
-			.disable = alpha_pll_default_disable,
-			.is_enabled = alpha_pll_default_is_enabled,
-			.hwfsm_enable = alpha_pll_default_hwfsm_enable,
-			.hwfsm_disable = alpha_pll_default_hwfsm_disable,
-			.hwfsm_is_enabled = alpha_pll_default_hwfsm_is_enabled,
-			.recalc_rate = alpha_pll_default_recalc_rate,
-			.round_rate = alpha_pll_default_round_rate,
-			.set_rate = alpha_pll_default_set_rate,
-		},
-	},
-};
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index a9f8751227f7..7593e8a56cf2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -25,6 +25,22 @@ enum {
 	CLK_ALPHA_PLL_TYPE_MAX,
 };
 
+enum {
+	PLL_OFF_L_VAL,
+	PLL_OFF_ALPHA_VAL,
+	PLL_OFF_ALPHA_VAL_U,
+	PLL_OFF_USER_CTL,
+	PLL_OFF_USER_CTL_U,
+	PLL_OFF_CONFIG_CTL,
+	PLL_OFF_CONFIG_CTL_U,
+	PLL_OFF_TEST_CTL,
+	PLL_OFF_TEST_CTL_U,
+	PLL_OFF_STATUS,
+	PLL_OFF_MAX_REGS
+};
+
+extern const u8 clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_MAX][PLL_OFF_MAX_REGS];
+
 struct pll_vco {
 	unsigned long min_freq;
 	unsigned long max_freq;
@@ -35,18 +51,19 @@ struct pll_vco {
  * struct clk_alpha_pll - phase locked loop (PLL)
  * @offset: base address of registers
  * @vco_table: array of VCO settings
- * @pll_type: alpha pll type
+ * @regs: alpha pll register map (see @clk_alpha_pll_regs)
  * @clkr: regmap clock handle
  */
 struct clk_alpha_pll {
 	u32 offset;
+	const u8 *regs;
 
 	const struct pll_vco *vco_table;
 	size_t num_vco;
 #define SUPPORTS_OFFLINE_REQ	BIT(0)
-#define SUPPORTS_FSM_MODE	BIT(1)
+#define SUPPORTS_FSM_MODE	BIT(2)
+#define SUPPORTS_DYNAMIC_UPDATE	BIT(3)
 	u8 flags;
-	u8 pll_type;
 
 	struct clk_regmap clkr;
 };
@@ -54,14 +71,14 @@ struct clk_alpha_pll {
 /**
  * struct clk_alpha_pll_postdiv - phase locked loop (PLL) post-divider
  * @offset: base address of registers
- * @pll_type: alpha pll type
+ * @regs: alpha pll register map (see @clk_alpha_pll_regs)
  * @width: width of post-divider
  * @clkr: regmap clock handle
  */
 struct clk_alpha_pll_postdiv {
 	u32 offset;
-	u8 pll_type;
 	u8 width;
+	const u8 *regs;
 
 	struct clk_regmap clkr;
 };
@@ -89,6 +106,7 @@ struct alpha_pll_config {
 extern const struct clk_ops clk_alpha_pll_ops;
 extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ops;
+extern const struct clk_ops clk_alpha_pll_huayra_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ro_ops;
 
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 0f735d37690f..ed2d00f55378 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -52,6 +52,7 @@ static const struct parent_map gcc_xo_gpll0_gpll0_out_main_div2_map[] = {
 
 static struct clk_alpha_pll gpll0_main = {
 	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr = {
 		.enable_reg = 0x0b000,
 		.enable_mask = BIT(0),
@@ -82,6 +83,7 @@ static struct clk_fixed_factor gpll0_out_main_div2 = {
 
 static struct clk_alpha_pll_postdiv gpll0 = {
 	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
 		.parent_names = (const char *[]){
diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 7983288d9141..1e38efc37180 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -73,6 +73,7 @@ static struct clk_fixed_factor xo = {
 
 static struct clk_alpha_pll gpll0_early = {
 	.offset = 0x00000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr = {
 		.enable_reg = 0x1480,
 		.enable_mask = BIT(0),
@@ -88,6 +89,7 @@ static struct clk_alpha_pll gpll0_early = {
 
 static struct clk_alpha_pll_postdiv gpll0 = {
 	.offset = 0x00000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "gpll0",
@@ -99,6 +101,7 @@ static struct clk_alpha_pll_postdiv gpll0 = {
 
 static struct clk_alpha_pll gpll4_early = {
 	.offset = 0x1dc0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr = {
 		.enable_reg = 0x1480,
 		.enable_mask = BIT(4),
@@ -114,6 +117,7 @@ static struct clk_alpha_pll gpll4_early = {
 
 static struct clk_alpha_pll_postdiv gpll4 = {
 	.offset = 0x1dc0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "gpll4",
diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 7ddec886fcd3..5d7451209206 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -227,6 +227,7 @@ static struct clk_fixed_factor xo = {
 
 static struct clk_alpha_pll gpll0_early = {
 	.offset = 0x00000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr = {
 		.enable_reg = 0x52000,
 		.enable_mask = BIT(0),
@@ -252,6 +253,7 @@ static struct clk_fixed_factor gpll0_early_div = {
 
 static struct clk_alpha_pll_postdiv gpll0 = {
 	.offset = 0x00000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
 		.parent_names = (const char *[]){ "gpll0_early" },
@@ -262,6 +264,7 @@ static struct clk_alpha_pll_postdiv gpll0 = {
 
 static struct clk_alpha_pll gpll4_early = {
 	.offset = 0x77000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr = {
 		.enable_reg = 0x52000,
 		.enable_mask = BIT(4),
@@ -276,6 +279,7 @@ static struct clk_alpha_pll gpll4_early = {
 
 static struct clk_alpha_pll_postdiv gpll4 = {
 	.offset = 0x77000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4",
 		.parent_names = (const char *[]){ "gpll4_early" },
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 352394d8fd8c..66a2fa4ec93c 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -267,6 +267,7 @@ static struct pll_vco mmpll_t_vco[] = {
 
 static struct clk_alpha_pll mmpll0_early = {
 	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.vco_table = mmpll_p_vco,
 	.num_vco = ARRAY_SIZE(mmpll_p_vco),
 	.clkr = {
@@ -283,6 +284,7 @@ static struct clk_alpha_pll mmpll0_early = {
 
 static struct clk_alpha_pll_postdiv mmpll0 = {
 	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll0",
@@ -295,6 +297,7 @@ static struct clk_alpha_pll_postdiv mmpll0 = {
 
 static struct clk_alpha_pll mmpll1_early = {
 	.offset = 0x30,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.vco_table = mmpll_p_vco,
 	.num_vco = ARRAY_SIZE(mmpll_p_vco),
 	.clkr = {
@@ -311,6 +314,7 @@ static struct clk_alpha_pll mmpll1_early = {
 
 static struct clk_alpha_pll_postdiv mmpll1 = {
 	.offset = 0x30,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll1",
@@ -323,6 +327,7 @@ static struct clk_alpha_pll_postdiv mmpll1 = {
 
 static struct clk_alpha_pll mmpll2_early = {
 	.offset = 0x4100,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.vco_table = mmpll_gfx_vco,
 	.num_vco = ARRAY_SIZE(mmpll_gfx_vco),
 	.clkr.hw.init = &(struct clk_init_data){
@@ -335,6 +340,7 @@ static struct clk_alpha_pll mmpll2_early = {
 
 static struct clk_alpha_pll_postdiv mmpll2 = {
 	.offset = 0x4100,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll2",
@@ -347,6 +353,7 @@ static struct clk_alpha_pll_postdiv mmpll2 = {
 
 static struct clk_alpha_pll mmpll3_early = {
 	.offset = 0x60,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.vco_table = mmpll_p_vco,
 	.num_vco = ARRAY_SIZE(mmpll_p_vco),
 	.clkr.hw.init = &(struct clk_init_data){
@@ -359,6 +366,7 @@ static struct clk_alpha_pll mmpll3_early = {
 
 static struct clk_alpha_pll_postdiv mmpll3 = {
 	.offset = 0x60,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll3",
@@ -371,6 +379,7 @@ static struct clk_alpha_pll_postdiv mmpll3 = {
 
 static struct clk_alpha_pll mmpll4_early = {
 	.offset = 0x90,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.vco_table = mmpll_t_vco,
 	.num_vco = ARRAY_SIZE(mmpll_t_vco),
 	.clkr.hw.init = &(struct clk_init_data){
@@ -383,6 +392,7 @@ static struct clk_alpha_pll mmpll4_early = {
 
 static struct clk_alpha_pll_postdiv mmpll4 = {
 	.offset = 0x90,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll4",
@@ -395,6 +405,7 @@ static struct clk_alpha_pll_postdiv mmpll4 = {
 
 static struct clk_alpha_pll mmpll5_early = {
 	.offset = 0xc0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.vco_table = mmpll_p_vco,
 	.num_vco = ARRAY_SIZE(mmpll_p_vco),
 	.clkr.hw.init = &(struct clk_init_data){
@@ -407,6 +418,7 @@ static struct clk_alpha_pll mmpll5_early = {
 
 static struct clk_alpha_pll_postdiv mmpll5 = {
 	.offset = 0xc0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll5",
@@ -419,6 +431,7 @@ static struct clk_alpha_pll_postdiv mmpll5 = {
 
 static struct clk_alpha_pll mmpll8_early = {
 	.offset = 0x4130,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.vco_table = mmpll_gfx_vco,
 	.num_vco = ARRAY_SIZE(mmpll_gfx_vco),
 	.clkr.hw.init = &(struct clk_init_data){
@@ -431,6 +444,7 @@ static struct clk_alpha_pll mmpll8_early = {
 
 static struct clk_alpha_pll_postdiv mmpll8 = {
 	.offset = 0x4130,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll8",
@@ -443,6 +457,7 @@ static struct clk_alpha_pll_postdiv mmpll8 = {
 
 static struct clk_alpha_pll mmpll9_early = {
 	.offset = 0x4200,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.vco_table = mmpll_t_vco,
 	.num_vco = ARRAY_SIZE(mmpll_t_vco),
 	.clkr.hw.init = &(struct clk_init_data){
@@ -455,6 +470,7 @@ static struct clk_alpha_pll mmpll9_early = {
 
 static struct clk_alpha_pll_postdiv mmpll9 = {
 	.offset = 0x4200,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll9",

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
