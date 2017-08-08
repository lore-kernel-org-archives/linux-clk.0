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
Subject: [RFC v2 03/12] clk: qcom: use offset from alpha pll node
Date: Tue,  8 Aug 2017 23:54:08 +0530
Message-Id: <1502216657-3342-4-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
References: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Alpha PLL is a generic name used for Qualcomm PLL’s which uses L
and Alpha values for configuring the integer and fractional part.
Qualcomm SoC’s use different types of Alpha PLL’s for which basic
software configuration part is common. These PLL’s will have same
basic registers like PLL_MODE, L_VAL, ALPHA_VAL but some of the
register offsets are different in each PLL type.
Also, the offsets are not same in different instances of same
type of PLL in some cases so it’s better to get the offsets
from PLL node itself instead of hardcoding it.

This patch adds the support for giving the PLL offsets array in
PLL node itself and uses the same for calculating the offsets.
Now, this offsets array will be mandatory for all alpha PLL nodes.
This patch provides the default array of offsets which driver can use
where the PLL offsets are same. Some of the existing
Qualcomm SoC’s uses the alpha PLL nodes so this patch added the
default offsets in its nodes.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 130 ++++++++++++++++++++-------------------
 drivers/clk/qcom/clk-alpha-pll.h |  28 +++++++--
 drivers/clk/qcom/gcc-ipq8074.c   |   6 +-
 drivers/clk/qcom/gcc-msm8994.c   |  12 ++--
 drivers/clk/qcom/gcc-msm8996.c   |  12 ++--
 drivers/clk/qcom/mmcc-msm8996.c  |  48 ++++++++++-----
 6 files changed, 142 insertions(+), 94 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6291048..084fbdc 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -20,7 +20,6 @@
 #include "clk-alpha-pll.h"
 #include "common.h"
 
-#define PLL_MODE		0x00
 # define PLL_OUTCTRL		BIT(0)
 # define PLL_BYPASSNL		BIT(1)
 # define PLL_RESET_N		BIT(2)
@@ -36,25 +35,12 @@
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
@@ -62,27 +48,52 @@
 #define ALPHA_BITWIDTH		32
 #define ALPHA_16BIT_MASK	0xffff
 
+#define pll_mode(pll)		(pll->base + pll->offsets[ALPHA_PLL_MODE])
+#define pll_l(pll)		(pll->base + pll->offsets[ALPHA_PLL_L_VAL])
+#define pll_alpha(pll)		(pll->base + pll->offsets[ALPHA_PLL_ALPHA_VAL])
+#define pll_alpha_u(pll)	(pll->base + pll->offsets[ALPHA_PLL_ALPHA_VAL_U])
+#define pll_user_ctl(pll)	(pll->base + pll->offsets[ALPHA_PLL_USER_CTL])
+#define pll_user_ctl_u(pll)	(pll->base + pll->offsets[ALPHA_PLL_USER_CTL_U])
+#define pll_cfg_ctl(pll)	(pll->base + pll->offsets[ALPHA_PLL_CONFIG_CTL])
+#define pll_test_ctl(pll)	(pll->base + pll->offsets[ALPHA_PLL_TEST_CTL])
+#define pll_test_ctl_u(pll)	(pll->base + pll->offsets[ALPHA_PLL_TEST_CTL_U])
+#define pll_status(pll)		(pll->base + pll->offsets[ALPHA_PLL_STATUS])
+#define pll_cfg_ctl_u(pll)	(pll->base + pll->offsets[ALPHA_PLL_CONFIG_CTL_U])
+
 #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
 					   struct clk_alpha_pll, clkr)
 
 #define to_clk_alpha_pll_postdiv(_hw) container_of(to_clk_regmap(_hw), \
 					   struct clk_alpha_pll_postdiv, clkr)
 
+const u8 clk_alpha_pll_offsets[] = {
+	[ALPHA_PLL_MODE] = 0x00,
+	[ALPHA_PLL_L_VAL] = 0x04,
+	[ALPHA_PLL_ALPHA_VAL] = 0x08,
+	[ALPHA_PLL_ALPHA_VAL_U] = 0x0c,
+	[ALPHA_PLL_USER_CTL] = 0x10,
+	[ALPHA_PLL_USER_CTL_U] = 0x14,
+	[ALPHA_PLL_CONFIG_CTL] = 0x18,
+	[ALPHA_PLL_TEST_CTL] = 0x1c,
+	[ALPHA_PLL_TEST_CTL_U] = 0x20,
+	[ALPHA_PLL_STATUS] = 0x24,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_offsets);
+
 static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 			const char *action)
 {
-	u32 val, off;
+	u32 val;
 	int count;
 	int ret;
 	const char *name = clk_hw_get_name(&pll->clkr.hw);
 
-	off = pll->offset;
-	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	ret = regmap_read(pll->clkr.regmap, pll_mode(pll), &val);
 	if (ret)
 		return ret;
 
 	for (count = 100; count > 0; count--) {
-		ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+		ret = regmap_read(pll->clkr.regmap, pll_mode(pll), &val);
 		if (ret)
 			return ret;
 		if (inverse && !(val & mask))
@@ -113,18 +124,17 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
 	u32 val, mask;
-	u32 off = pll->offset;
 
-	regmap_write(regmap, off + PLL_L_VAL, config->l);
-	regmap_write(regmap, off + PLL_ALPHA_VAL, config->alpha);
-	regmap_write(regmap, off + PLL_CONFIG_CTL, config->config_ctl_val);
+	regmap_write(regmap, pll_l(pll), config->l);
+	regmap_write(regmap, pll_alpha(pll), config->alpha);
+	regmap_write(regmap, pll_cfg_ctl(pll), config->config_ctl_val);
 
 	if (pll->flags & SUPPORTS_64BIT_CONFIG_CTL)
-		regmap_write(regmap, off + PLL_CONFIG_CTL_U,
+		regmap_write(regmap, pll_cfg_ctl_u(pll),
 			     config->config_ctl_hi_val);
 
 	if (!(pll->flags & SUPPORTS_16BIT_ALPHA))
-		regmap_write(regmap, off + PLL_ALPHA_VAL_U, config->alpha_hi);
+		regmap_write(regmap, pll_alpha_u(pll), config->alpha_hi);
 
 	val = config->main_output_mask;
 	val |= config->aux_output_mask;
@@ -144,20 +154,19 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	mask |= config->post_div_mask;
 	mask |= config->vco_mask;
 
-	regmap_update_bits(regmap, off + PLL_USER_CTL, mask, val);
+	regmap_update_bits(regmap, pll_user_ctl(pll), mask, val);
 
 	if (pll->flags & SUPPORTS_FSM_MODE)
-		qcom_pll_set_fsm_mode(regmap, off + PLL_MODE, 6, 0);
+		qcom_pll_set_fsm_mode(regmap, pll_mode(pll), 6, 0);
 }
 
 static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 {
 	int ret;
-	u32 val, off;
+	u32 val;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 
-	off = pll->offset;
-	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	ret = regmap_read(pll->clkr.regmap, pll_mode(pll), &val);
 	if (ret)
 		return ret;
 
@@ -166,7 +175,7 @@ static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 	if (pll->flags & SUPPORTS_OFFLINE_REQ)
 		val &= ~PLL_OFFLINE_REQ;
 
-	ret = regmap_write(pll->clkr.regmap, off + PLL_MODE, val);
+	ret = regmap_write(pll->clkr.regmap, pll_mode(pll), val);
 	if (ret)
 		return ret;
 
@@ -179,16 +188,15 @@ static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
 static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
 {
 	int ret;
-	u32 val, off;
+	u32 val;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 
-	off = pll->offset;
-	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	ret = regmap_read(pll->clkr.regmap, pll_mode(pll), &val);
 	if (ret)
 		return;
 
 	if (pll->flags & SUPPORTS_OFFLINE_REQ) {
-		ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+		ret = regmap_update_bits(pll->clkr.regmap, pll_mode(pll),
 					 PLL_OFFLINE_REQ, PLL_OFFLINE_REQ);
 		if (ret)
 			return;
@@ -199,7 +207,7 @@ static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
 	}
 
 	/* Disable hwfsm */
-	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+	ret = regmap_update_bits(pll->clkr.regmap, pll_mode(pll),
 				 PLL_FSM_ENA, 0);
 	if (ret)
 		return;
@@ -210,11 +218,10 @@ static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
 static int pll_is_enabled(struct clk_hw *hw, u32 mask)
 {
 	int ret;
-	u32 val, off;
+	u32 val;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 
-	off = pll->offset;
-	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	ret = regmap_read(pll->clkr.regmap, pll_mode(pll), &val);
 	if (ret)
 		return ret;
 
@@ -235,12 +242,10 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 {
 	int ret;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 val, mask, off;
-
-	off = pll->offset;
+	u32 val, mask;
 
 	mask = PLL_OUTCTRL | PLL_RESET_N | PLL_BYPASSNL;
-	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	ret = regmap_read(pll->clkr.regmap, pll_mode(pll), &val);
 	if (ret)
 		return ret;
 
@@ -256,7 +261,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 	if ((val & mask) == mask)
 		return 0;
 
-	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+	ret = regmap_update_bits(pll->clkr.regmap, pll_mode(pll),
 				 PLL_BYPASSNL, PLL_BYPASSNL);
 	if (ret)
 		return ret;
@@ -268,7 +273,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 	mb();
 	udelay(5);
 
-	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+	ret = regmap_update_bits(pll->clkr.regmap, pll_mode(pll),
 				 PLL_RESET_N, PLL_RESET_N);
 	if (ret)
 		return ret;
@@ -277,7 +282,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 	if (ret)
 		return ret;
 
-	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+	ret = regmap_update_bits(pll->clkr.regmap, pll_mode(pll),
 				 PLL_OUTCTRL, PLL_OUTCTRL);
 
 	/* Ensure that the write above goes through before returning. */
@@ -289,11 +294,9 @@ static void clk_alpha_pll_disable(struct clk_hw *hw)
 {
 	int ret;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 val, mask, off;
-
-	off = pll->offset;
+	u32 val, mask;
 
-	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	ret = regmap_read(pll->clkr.regmap, pll_mode(pll), &val);
 	if (ret)
 		return;
 
@@ -304,14 +307,14 @@ static void clk_alpha_pll_disable(struct clk_hw *hw)
 	}
 
 	mask = PLL_OUTCTRL;
-	regmap_update_bits(pll->clkr.regmap, off + PLL_MODE, mask, 0);
+	regmap_update_bits(pll->clkr.regmap, pll_mode(pll), mask, 0);
 
 	/* Delay of 2 output clock ticks required until output is disabled */
 	mb();
 	udelay(1);
 
 	mask = PLL_RESET_N | PLL_BYPASSNL;
-	regmap_update_bits(pll->clkr.regmap, off + PLL_MODE, mask, 0);
+	regmap_update_bits(pll->clkr.regmap, pll_mode(pll), mask, 0);
 }
 
 static unsigned long alpha_pll_calc_rate(u64 prate, u32 l, u32 a)
@@ -364,17 +367,16 @@ static unsigned long alpha_pll_calc_rate(u64 prate, u32 l, u32 a)
 	u32 l, low, high, ctl;
 	u64 a = 0, prate = parent_rate;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 off = pll->offset;
 
-	regmap_read(pll->clkr.regmap, off + PLL_L_VAL, &l);
+	regmap_read(pll->clkr.regmap, pll_l(pll), &l);
 
-	regmap_read(pll->clkr.regmap, off + PLL_USER_CTL, &ctl);
+	regmap_read(pll->clkr.regmap, pll_user_ctl(pll), &ctl);
 	if (ctl & PLL_ALPHA_EN) {
-		regmap_read(pll->clkr.regmap, off + PLL_ALPHA_VAL, &low);
+		regmap_read(pll->clkr.regmap, pll_alpha(pll), &low);
 		if (pll->flags & SUPPORTS_16BIT_ALPHA) {
 			a = low & ALPHA_16BIT_MASK;
 		} else {
-			regmap_read(pll->clkr.regmap, off + PLL_ALPHA_VAL_U,
+			regmap_read(pll->clkr.regmap, pll_alpha_u(pll),
 				    &high);
 			a = (u64)high << 32 | low;
 			a >>= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
@@ -389,7 +391,7 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	const struct pll_vco *vco;
-	u32 l, off = pll->offset;
+	u32 l;
 	u64 a;
 
 	rate = alpha_pll_round_rate(rate, prate, &l, &a);
@@ -399,21 +401,21 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
-	regmap_write(pll->clkr.regmap, off + PLL_L_VAL, l);
+	regmap_write(pll->clkr.regmap, pll_l(pll), l);
 
 	if (pll->flags & SUPPORTS_16BIT_ALPHA) {
-		regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL,
+		regmap_write(pll->clkr.regmap, pll_alpha(pll),
 			     a & ALPHA_16BIT_MASK);
 	} else {
 		a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
-		regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL_U, a >> 32);
+		regmap_write(pll->clkr.regmap, pll_alpha_u(pll), a >> 32);
 	}
 
-	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL,
+	regmap_update_bits(pll->clkr.regmap, pll_user_ctl(pll),
 			   PLL_VCO_MASK << PLL_VCO_SHIFT,
 			   vco->val << PLL_VCO_SHIFT);
 
-	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL, PLL_ALPHA_EN,
+	regmap_update_bits(pll->clkr.regmap, pll_user_ctl(pll), PLL_ALPHA_EN,
 			   PLL_ALPHA_EN);
 
 	return 0;
@@ -463,7 +465,7 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 	u32 ctl;
 
-	regmap_read(pll->clkr.regmap, pll->offset + PLL_USER_CTL, &ctl);
+	regmap_read(pll->clkr.regmap, pll_user_ctl(pll), &ctl);
 
 	ctl >>= PLL_POST_DIV_SHIFT;
 	ctl &= PLL_POST_DIV_MASK;
@@ -499,7 +501,7 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	/* 16 -> 0xf, 8 -> 0x7, 4 -> 0x3, 2 -> 0x1, 1 -> 0x0 */
 	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate) - 1;
 
-	return regmap_update_bits(pll->clkr.regmap, pll->offset + PLL_USER_CTL,
+	return regmap_update_bits(pll->clkr.regmap, pll_user_ctl(pll),
 				  PLL_POST_DIV_MASK << PLL_POST_DIV_SHIFT,
 				  div << PLL_POST_DIV_SHIFT);
 }
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 39686db..4901d92 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -17,6 +17,20 @@
 #include <linux/clk-provider.h>
 #include "clk-regmap.h"
 
+enum {
+	ALPHA_PLL_MODE,
+	ALPHA_PLL_L_VAL,
+	ALPHA_PLL_ALPHA_VAL,
+	ALPHA_PLL_ALPHA_VAL_U,
+	ALPHA_PLL_USER_CTL,
+	ALPHA_PLL_USER_CTL_U,
+	ALPHA_PLL_CONFIG_CTL,
+	ALPHA_PLL_CONFIG_CTL_U,
+	ALPHA_PLL_TEST_CTL,
+	ALPHA_PLL_TEST_CTL_U,
+	ALPHA_PLL_STATUS,
+};
+
 struct pll_vco {
 	unsigned long min_freq;
 	unsigned long max_freq;
@@ -25,12 +39,14 @@ struct pll_vco {
 
 /**
  * struct clk_alpha_pll - phase locked loop (PLL)
- * @offset: base address of registers
+ * @base: base address of registers
+ * @offsets: array containing offsets of all PLL registers from base address
  * @vco_table: array of VCO settings
  * @clkr: regmap clock handle
  */
 struct clk_alpha_pll {
-	u32 offset;
+	u32 base;
+	const u8 *offsets;
 
 	const struct pll_vco *vco_table;
 	size_t num_vco;
@@ -45,12 +61,14 @@ struct clk_alpha_pll {
 
 /**
  * struct clk_alpha_pll_postdiv - phase locked loop (PLL) post-divider
- * @offset: base address of registers
+ * @base: base address of registers
+ * @offsets: array containing offsets of all PLL registers from base address
  * @width: width of post-divider
  * @clkr: regmap clock handle
  */
 struct clk_alpha_pll_postdiv {
-	u32 offset;
+	u32 base;
+	const u8 *offsets;
 	u8 width;
 
 	struct clk_regmap clkr;
@@ -76,6 +94,8 @@ struct alpha_pll_config {
 	u32 vco_mask;
 };
 
+extern const u8 clk_alpha_pll_offsets[];
+
 extern const struct clk_ops clk_alpha_pll_ops;
 extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ops;
diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 0f735d3..29380d2 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -51,7 +51,8 @@ enum {
 };
 
 static struct clk_alpha_pll gpll0_main = {
-	.offset = 0x21000,
+	.base = 0x21000,
+	.offsets = clk_alpha_pll_offsets,
 	.clkr = {
 		.enable_reg = 0x0b000,
 		.enable_mask = BIT(0),
@@ -81,7 +82,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv gpll0 = {
-	.offset = 0x21000,
+	.base = 0x21000,
+	.offsets = clk_alpha_pll_offsets,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
 		.parent_names = (const char *[]){
diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 7983288..da6b0d1 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -72,7 +72,8 @@ enum {
 };
 
 static struct clk_alpha_pll gpll0_early = {
-	.offset = 0x00000,
+	.base = 0x00000,
+	.offsets = clk_alpha_pll_offsets,
 	.clkr = {
 		.enable_reg = 0x1480,
 		.enable_mask = BIT(0),
@@ -87,7 +88,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv gpll0 = {
-	.offset = 0x00000,
+	.base = 0x00000,
+	.offsets = clk_alpha_pll_offsets,
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "gpll0",
@@ -98,7 +100,8 @@ enum {
 };
 
 static struct clk_alpha_pll gpll4_early = {
-	.offset = 0x1dc0,
+	.base = 0x1dc0,
+	.offsets = clk_alpha_pll_offsets,
 	.clkr = {
 		.enable_reg = 0x1480,
 		.enable_mask = BIT(4),
@@ -113,7 +116,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv gpll4 = {
-	.offset = 0x1dc0,
+	.base = 0x1dc0,
+	.offsets = clk_alpha_pll_offsets,
 	.clkr.hw.init = &(struct clk_init_data)
 	{
 		.name = "gpll4",
diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 8abc200..fcf1b15 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -226,7 +226,8 @@ enum {
 };
 
 static struct clk_alpha_pll gpll0_early = {
-	.offset = 0x00000,
+	.base = 0x00000,
+	.offsets = clk_alpha_pll_offsets,
 	.clkr = {
 		.enable_reg = 0x52000,
 		.enable_mask = BIT(0),
@@ -251,7 +252,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv gpll0 = {
-	.offset = 0x00000,
+	.base = 0x00000,
+	.offsets = clk_alpha_pll_offsets,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
 		.parent_names = (const char *[]){ "gpll0_early" },
@@ -261,7 +263,8 @@ enum {
 };
 
 static struct clk_alpha_pll gpll4_early = {
-	.offset = 0x77000,
+	.base = 0x77000,
+	.offsets = clk_alpha_pll_offsets,
 	.clkr = {
 		.enable_reg = 0x52000,
 		.enable_mask = BIT(4),
@@ -275,7 +278,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv gpll4 = {
-	.offset = 0x77000,
+	.base = 0x77000,
+	.offsets = clk_alpha_pll_offsets,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4",
 		.parent_names = (const char *[]){ "gpll4_early" },
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 352394d..2447740 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -266,7 +266,8 @@ enum {
 };
 
 static struct clk_alpha_pll mmpll0_early = {
-	.offset = 0x0,
+	.base = 0x0,
+	.offsets = clk_alpha_pll_offsets,
 	.vco_table = mmpll_p_vco,
 	.num_vco = ARRAY_SIZE(mmpll_p_vco),
 	.clkr = {
@@ -282,7 +283,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv mmpll0 = {
-	.offset = 0x0,
+	.base = 0x0,
+	.offsets = clk_alpha_pll_offsets,
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll0",
@@ -294,7 +296,8 @@ enum {
 };
 
 static struct clk_alpha_pll mmpll1_early = {
-	.offset = 0x30,
+	.base = 0x30,
+	.offsets = clk_alpha_pll_offsets,
 	.vco_table = mmpll_p_vco,
 	.num_vco = ARRAY_SIZE(mmpll_p_vco),
 	.clkr = {
@@ -310,7 +313,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv mmpll1 = {
-	.offset = 0x30,
+	.base = 0x30,
+	.offsets = clk_alpha_pll_offsets,
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll1",
@@ -322,7 +326,8 @@ enum {
 };
 
 static struct clk_alpha_pll mmpll2_early = {
-	.offset = 0x4100,
+	.base = 0x4100,
+	.offsets = clk_alpha_pll_offsets,
 	.vco_table = mmpll_gfx_vco,
 	.num_vco = ARRAY_SIZE(mmpll_gfx_vco),
 	.clkr.hw.init = &(struct clk_init_data){
@@ -334,7 +339,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv mmpll2 = {
-	.offset = 0x4100,
+	.base = 0x4100,
+	.offsets = clk_alpha_pll_offsets,
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll2",
@@ -346,7 +352,8 @@ enum {
 };
 
 static struct clk_alpha_pll mmpll3_early = {
-	.offset = 0x60,
+	.base = 0x60,
+	.offsets = clk_alpha_pll_offsets,
 	.vco_table = mmpll_p_vco,
 	.num_vco = ARRAY_SIZE(mmpll_p_vco),
 	.clkr.hw.init = &(struct clk_init_data){
@@ -358,7 +365,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv mmpll3 = {
-	.offset = 0x60,
+	.base = 0x60,
+	.offsets = clk_alpha_pll_offsets,
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll3",
@@ -370,7 +378,8 @@ enum {
 };
 
 static struct clk_alpha_pll mmpll4_early = {
-	.offset = 0x90,
+	.base = 0x90,
+	.offsets = clk_alpha_pll_offsets,
 	.vco_table = mmpll_t_vco,
 	.num_vco = ARRAY_SIZE(mmpll_t_vco),
 	.clkr.hw.init = &(struct clk_init_data){
@@ -382,7 +391,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv mmpll4 = {
-	.offset = 0x90,
+	.base = 0x90,
+	.offsets = clk_alpha_pll_offsets,
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll4",
@@ -394,7 +404,8 @@ enum {
 };
 
 static struct clk_alpha_pll mmpll5_early = {
-	.offset = 0xc0,
+	.base = 0xc0,
+	.offsets = clk_alpha_pll_offsets,
 	.vco_table = mmpll_p_vco,
 	.num_vco = ARRAY_SIZE(mmpll_p_vco),
 	.clkr.hw.init = &(struct clk_init_data){
@@ -406,7 +417,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv mmpll5 = {
-	.offset = 0xc0,
+	.base = 0xc0,
+	.offsets = clk_alpha_pll_offsets,
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll5",
@@ -418,7 +430,8 @@ enum {
 };
 
 static struct clk_alpha_pll mmpll8_early = {
-	.offset = 0x4130,
+	.base = 0x4130,
+	.offsets = clk_alpha_pll_offsets,
 	.vco_table = mmpll_gfx_vco,
 	.num_vco = ARRAY_SIZE(mmpll_gfx_vco),
 	.clkr.hw.init = &(struct clk_init_data){
@@ -430,7 +443,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv mmpll8 = {
-	.offset = 0x4130,
+	.base = 0x4130,
+	.offsets = clk_alpha_pll_offsets,
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll8",
@@ -442,7 +456,8 @@ enum {
 };
 
 static struct clk_alpha_pll mmpll9_early = {
-	.offset = 0x4200,
+	.base = 0x4200,
+	.offsets = clk_alpha_pll_offsets,
 	.vco_table = mmpll_t_vco,
 	.num_vco = ARRAY_SIZE(mmpll_t_vco),
 	.clkr.hw.init = &(struct clk_init_data){
@@ -454,7 +469,8 @@ enum {
 };
 
 static struct clk_alpha_pll_postdiv mmpll9 = {
-	.offset = 0x4200,
+	.base = 0x4200,
+	.offsets = clk_alpha_pll_offsets,
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll9",
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
