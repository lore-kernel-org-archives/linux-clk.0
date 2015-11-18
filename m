Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/5] clk: qcom: Add Alpha PLL support
Date: Tue, 17 Nov 2015 17:07:21 -0800
Message-Id: <1447808844-27049-3-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1447808844-27049-1-git-send-email-sboyd@codeaurora.org>
References: <1447808844-27049-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add support for configuring rates of, enabling, and disabling
Alpha PLLs. This is sufficient for the types of PLLs found in
the global and multimedia clock controllers.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/clk-alpha-pll.c | 355 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  57 +++++++
 3 files changed, 413 insertions(+)
 create mode 100644 drivers/clk/qcom/clk-alpha-pll.c
 create mode 100644 drivers/clk/qcom/clk-alpha-pll.h

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index fe6252349e55..472200040788 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -2,6 +2,7 @@ obj-$(CONFIG_COMMON_CLK_QCOM) += clk-qcom.o
 
 clk-qcom-y += common.o
 clk-qcom-y += clk-regmap.o
+clk-qcom-y += clk-alpha-pll.o
 clk-qcom-y += clk-pll.o
 clk-qcom-y += clk-rcg.o
 clk-qcom-y += clk-rcg2.o
diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
new file mode 100644
index 000000000000..e6a03eaf7a93
--- /dev/null
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -0,0 +1,355 @@
+/*
+ * Copyright (c) 2015, The Linux Foundation. All rights reserved.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/export.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/delay.h>
+
+#include "clk-alpha-pll.h"
+
+#define PLL_MODE		0x00
+# define PLL_OUTCTRL		BIT(0)
+# define PLL_BYPASSNL		BIT(1)
+# define PLL_RESET_N		BIT(2)
+# define PLL_LOCK_COUNT_SHIFT	8
+# define PLL_LOCK_COUNT_MASK	0x3f
+# define PLL_BIAS_COUNT_SHIFT	14
+# define PLL_BIAS_COUNT_MASK	0x3f
+# define PLL_VOTE_FSM_ENA	BIT(20)
+# define PLL_VOTE_FSM_RESET	BIT(21)
+# define PLL_ACTIVE_FLAG	BIT(30)
+# define PLL_LOCK_DET		BIT(31)
+
+#define PLL_L_VAL		0x04
+#define PLL_ALPHA_VAL		0x08
+#define PLL_ALPHA_VAL_U		0x0c
+
+#define PLL_USER_CTL		0x10
+# define PLL_POST_DIV_SHIFT	8
+# define PLL_POST_DIV_MASK	0xf
+# define PLL_ALPHA_EN		BIT(24)
+# define PLL_VCO_SHIFT		20
+# define PLL_VCO_MASK		0x3
+
+#define PLL_USER_CTL_U		0x14
+
+#define PLL_CONFIG_CTL		0x18
+#define PLL_TEST_CTL		0x1c
+#define PLL_TEST_CTL_U		0x20
+#define PLL_STATUS		0x24
+
+/*
+ * Even though 40 bits are present, use only 32 for ease of calculation.
+ */
+#define ALPHA_REG_BITWIDTH	40
+#define ALPHA_BITWIDTH		32
+
+#define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
+					   struct clk_alpha_pll, clkr)
+
+#define to_clk_alpha_pll_postdiv(_hw) container_of(to_clk_regmap(_hw), \
+					   struct clk_alpha_pll_postdiv, clkr)
+
+static int wait_for_pll(struct clk_alpha_pll *pll)
+{
+	u32 val, mask, off;
+	int count;
+	int ret;
+	const char *name = clk_hw_get_name(&pll->clkr.hw);
+
+	off = pll->offset;
+	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	if (ret)
+		return ret;
+
+	if (val & PLL_VOTE_FSM_ENA)
+		mask = PLL_ACTIVE_FLAG;
+	else
+		mask = PLL_LOCK_DET;
+
+	/* Wait for pll to enable. */
+	for (count = 100; count > 0; count--) {
+		ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+		if (ret)
+			return ret;
+		if ((val & mask) == mask)
+			return 0;
+
+		udelay(1);
+	}
+
+	WARN(1, "%s didn't enable after voting for it!\n", name);
+	return -ETIMEDOUT;
+}
+
+static int clk_alpha_pll_enable(struct clk_hw *hw)
+{
+	int ret;
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 val, mask, off;
+
+	off = pll->offset;
+
+	mask = PLL_OUTCTRL | PLL_RESET_N | PLL_BYPASSNL;
+	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	if (ret)
+		return ret;
+
+	/* If in FSM mode, just vote for it */
+	if (val & PLL_VOTE_FSM_ENA) {
+		ret = clk_enable_regmap(hw);
+		if (ret)
+			return ret;
+		return wait_for_pll(pll);
+	}
+
+	/* Skip if already enabled */
+	if ((val & mask) == mask)
+		return 0;
+
+	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+				 PLL_BYPASSNL, PLL_BYPASSNL);
+	if (ret)
+		return ret;
+
+	/*
+	 * H/W requires a 5us delay between disabling the bypass and
+	 * de-asserting the reset.
+	 */
+	mb();
+	udelay(5);
+
+	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+				 PLL_RESET_N, PLL_RESET_N);
+	if (ret)
+		return ret;
+
+	ret = wait_for_pll(pll);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+				 PLL_OUTCTRL, PLL_OUTCTRL);
+
+	/* Ensure that the write above goes through before returning. */
+	mb();
+	return ret;
+}
+
+static void clk_alpha_pll_disable(struct clk_hw *hw)
+{
+	int ret;
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 val, mask, off;
+
+	off = pll->offset;
+
+	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	if (ret)
+		return;
+
+	/* If in FSM mode, just unvote it */
+	if (val & PLL_VOTE_FSM_ENA) {
+		clk_disable_regmap(hw);
+		return;
+	}
+
+	mask = PLL_OUTCTRL;
+	regmap_update_bits(pll->clkr.regmap, off + PLL_MODE, mask, 0);
+
+	/* Delay of 2 output clock ticks required until output is disabled */
+	mb();
+	udelay(1);
+
+	mask = PLL_RESET_N | PLL_BYPASSNL;
+	regmap_update_bits(pll->clkr.regmap, off + PLL_MODE, mask, 0);
+}
+
+static unsigned long alpha_pll_calc_rate(u64 prate, u32 l, u32 a)
+{
+	return (prate * l) + ((prate * a) >> ALPHA_BITWIDTH);
+}
+
+static unsigned long
+alpha_pll_round_rate(unsigned long rate, unsigned long prate, u32 *l, u64 *a)
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
+	/* Upper ALPHA_BITWIDTH bits of Alpha */
+	quotient = remainder << ALPHA_BITWIDTH;
+	remainder = do_div(quotient, prate);
+
+	if (remainder)
+		quotient++;
+
+	*a = quotient;
+	return alpha_pll_calc_rate(prate, *l, *a);
+}
+
+static const struct pll_vco *
+alpha_pll_find_vco(const struct clk_alpha_pll *pll, unsigned long rate)
+{
+	const struct pll_vco *v = pll->vco_table;
+	const struct pll_vco *end = v + pll->num_vco;
+
+	for (; v < end; v++)
+		if (rate >= v->min_freq && rate <= v->max_freq)
+			return v;
+
+	return NULL;
+}
+
+static unsigned long
+clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	u32 l, low, high, ctl;
+	u64 a = 0, prate = parent_rate;
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 off = pll->offset;
+
+	regmap_read(pll->clkr.regmap, off + PLL_L_VAL, &l);
+
+	regmap_read(pll->clkr.regmap, off + PLL_USER_CTL, &ctl);
+	if (ctl & PLL_ALPHA_EN) {
+		regmap_read(pll->clkr.regmap, off + PLL_ALPHA_VAL, &low);
+		regmap_read(pll->clkr.regmap, off + PLL_ALPHA_VAL_U, &high);
+		a = (u64)high << 32 | low;
+		a >>= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
+	}
+
+	return alpha_pll_calc_rate(prate, l, a);
+}
+
+static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long prate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	const struct pll_vco *vco;
+	u32 l, off = pll->offset;
+	u64 a;
+
+	rate = alpha_pll_round_rate(rate, prate, &l, &a);
+	vco = alpha_pll_find_vco(pll, rate);
+	if (!vco) {
+		pr_err("alpha pll not in a valid vco range\n");
+		return -EINVAL;
+	}
+
+	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
+
+	regmap_write(pll->clkr.regmap, off + PLL_L_VAL, l);
+	regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL, a);
+	regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL_U, a >> 32);
+
+	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL,
+			   PLL_VCO_MASK << PLL_VCO_SHIFT,
+			   vco->val << PLL_VCO_SHIFT);
+
+	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL, PLL_ALPHA_EN,
+			   PLL_ALPHA_EN);
+
+	return 0;
+}
+
+static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *prate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 l;
+	u64 a;
+	unsigned long min_freq, max_freq;
+
+	rate = alpha_pll_round_rate(rate, *prate, &l, &a);
+	if (alpha_pll_find_vco(pll, rate))
+		return rate;
+
+	min_freq = pll->vco_table[0].min_freq;
+	max_freq = pll->vco_table[pll->num_vco - 1].max_freq;
+
+	return clamp(rate, min_freq, max_freq);
+}
+
+const struct clk_ops clk_alpha_pll_ops = {
+	.enable = clk_alpha_pll_enable,
+	.disable = clk_alpha_pll_disable,
+	.recalc_rate = clk_alpha_pll_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = clk_alpha_pll_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_ops);
+
+static unsigned long
+clk_alpha_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
+	u32 ctl;
+
+	regmap_read(pll->clkr.regmap, pll->offset + PLL_USER_CTL, &ctl);
+
+	ctl >>= PLL_POST_DIV_SHIFT;
+	ctl &= PLL_POST_DIV_MASK;
+
+	return parent_rate >> fls(ctl);
+}
+
+static const struct clk_div_table clk_alpha_div_table[] = {
+	{ 0x0, 1 },
+	{ 0x1, 2 },
+	{ 0x3, 4 },
+	{ 0x7, 8 },
+	{ 0xf, 16 },
+	{ }
+};
+
+static long
+clk_alpha_pll_postdiv_round_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long *prate)
+{
+	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
+
+	return divider_round_rate(hw, rate, prate, clk_alpha_div_table,
+				  pll->width, CLK_DIVIDER_POWER_OF_TWO);
+}
+
+static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long parent_rate)
+{
+	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
+	int div;
+
+	/* 16 -> 0xf, 8 -> 0x7, 4 -> 0x3, 2 -> 0x1, 1 -> 0x0 */
+	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate) - 1;
+
+	return regmap_update_bits(pll->clkr.regmap, pll->offset + PLL_USER_CTL,
+				  PLL_POST_DIV_MASK << PLL_POST_DIV_SHIFT,
+				  div << PLL_POST_DIV_SHIFT);
+}
+
+const struct clk_ops clk_alpha_pll_postdiv_ops = {
+	.recalc_rate = clk_alpha_pll_postdiv_recalc_rate,
+	.round_rate = clk_alpha_pll_postdiv_round_rate,
+	.set_rate = clk_alpha_pll_postdiv_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
new file mode 100644
index 000000000000..90ce2016e1a0
--- /dev/null
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -0,0 +1,57 @@
+/*
+ * Copyright (c) 2015, The Linux Foundation. All rights reserved.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __QCOM_CLK_ALPHA_PLL_H__
+#define __QCOM_CLK_ALPHA_PLL_H__
+
+#include <linux/clk-provider.h>
+#include "clk-regmap.h"
+
+struct pll_vco {
+	unsigned long min_freq;
+	unsigned long max_freq;
+	u32 val;
+};
+
+/**
+ * struct clk_alpha_pll - phase locked loop (PLL)
+ * @offset: base address of registers
+ * @vco_table: array of VCO settings
+ * @clkr: regmap clock handle
+ */
+struct clk_alpha_pll {
+	u32 offset;
+
+	const struct pll_vco *vco_table;
+	size_t num_vco;
+
+	struct clk_regmap clkr;
+};
+
+/**
+ * struct clk_alpha_pll_postdiv - phase locked loop (PLL) post-divider
+ * @offset: base address of registers
+ * @width: width of post-divider
+ * @clkr: regmap clock handle
+ */
+struct clk_alpha_pll_postdiv {
+	u32 offset;
+	u8 width;
+
+	struct clk_regmap clkr;
+};
+
+extern const struct clk_ops clk_alpha_pll_ops;
+extern const struct clk_ops clk_alpha_pll_postdiv_ops;
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
