Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: mturquette@baylibre.com, linux-clk@vger.kernel.org, sboyd@codeaurora.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] clk: renesas: cpg-mssr: add common R-Car Gen2 support
Date: Wed, 05 Oct 2016 23:52:25 +0300
Message-ID: <13815645.d8PJGpIqtG@wasted.cogentembedded.com>
In-Reply-To: <19700058.YBgRO3SXUI@wasted.cogentembedded.com>
References: <19700058.YBgRO3SXUI@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Add the common R-Car  Gen2 (and RZ/G) Clock Pulse Generator / Module Standby
and Software Reset support code, using the CPG/MSSR driver core. 

Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
<geert+renesas@glider.be>.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/clk/renesas/rcar-gen2-cpg.c |  377 ++++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen2-cpg.h |   42 ++++
 2 files changed, 419 insertions(+)

Index: renesas/drivers/clk/renesas/rcar-gen2-cpg.c
===================================================================
--- /dev/null
+++ renesas/drivers/clk/renesas/rcar-gen2-cpg.c
@@ -0,0 +1,377 @@
+/*
+ * R-Car Gen2 Clock Pulse Generator
+ *
+ * Copyright (C) 2016 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation.
+ */
+
+#include <linux/bug.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+
+#include "renesas-cpg-mssr.h"
+#include "rcar-gen2-cpg.h"
+
+#define CPG_FRQCRB		0x0004
+#define CPG_FRQCRB_KICK		BIT(31)
+#define CPG_SDCKCR		0x0074
+#define CPG_PLL0CR		0x00d8
+#define CPG_FRQCRC		0x00e0
+#define CPG_FRQCRC_ZFC_MASK	(0x1f << 8)
+#define CPG_FRQCRC_ZFC_SHIFT	8
+#define CPG_ADSPCKCR		0x025c
+#define CPG_RCANCKCR		0x0270
+
+static spinlock_t cpg_lock;
+
+/*
+ * Z Clock
+ *
+ * Traits of this clock:
+ * prepare - clk_prepare only ensures that parents are prepared
+ * enable - clk_enable only ensures that parents are enabled
+ * rate - rate is adjustable.  clk->rate = parent->rate * mult / 32
+ * parent - fixed parent.  No clk_set_parent support
+ */
+
+struct cpg_z_clk {
+	struct clk_hw hw;
+	void __iomem *reg;
+	void __iomem *kick_reg;
+};
+
+#define to_z_clk(_hw)	container_of(_hw, struct cpg_z_clk, hw)
+
+static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int mult;
+	unsigned int val;
+
+	val = (readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK) >> CPG_FRQCRC_ZFC_SHIFT;
+	mult = 32 - val;
+
+	return div_u64((u64)parent_rate * mult, 32);
+}
+
+static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long *parent_rate)
+{
+	unsigned long prate  = *parent_rate;
+	unsigned int mult;
+
+	if (!prate)
+		prate = 1;
+
+	mult = div_u64((u64)rate * 32, prate);
+	mult = clamp(mult, 1U, 32U);
+
+	return *parent_rate / 32 * mult;
+}
+
+static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int mult;
+	u32 val, kick;
+	unsigned int i;
+
+	mult = div_u64((u64)rate * 32, parent_rate);
+	mult = clamp(mult, 1U, 32U);
+
+	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
+		return -EBUSY;
+
+	val = readl(zclk->reg);
+	val &= ~CPG_FRQCRC_ZFC_MASK;
+	val |= (32 - mult) << CPG_FRQCRC_ZFC_SHIFT;
+	writel(val, zclk->reg);
+
+	/*
+	 * Set KICK bit in FRQCRB to update hardware setting and wait for
+	 * clock change completion.
+	 */
+	kick = readl(zclk->kick_reg);
+	kick |= CPG_FRQCRB_KICK;
+	writel(kick, zclk->kick_reg);
+
+	/*
+	 * Note: There is no HW information about the worst case latency.
+	 *
+	 * Using experimental measurements, it seems that no more than
+	 * ~10 iterations are needed, independently of the CPU rate.
+	 * Since this value might be dependent on external xtal rate, pll1
+	 * rate or even the other emulation clocks rate, use 1000 as a
+	 * "super" safe value.
+	 */
+	for (i = 1000; i; i--) {
+		if (!(readl(zclk->kick_reg) & CPG_FRQCRB_KICK))
+			return 0;
+
+		cpu_relax();
+	}
+
+	return -ETIMEDOUT;
+}
+
+static const struct clk_ops cpg_z_clk_ops = {
+	.recalc_rate = cpg_z_clk_recalc_rate,
+	.round_rate = cpg_z_clk_round_rate,
+	.set_rate = cpg_z_clk_set_rate,
+};
+
+static struct clk * __init cpg_z_clk_register(const char *name,
+					      const char *parent_name,
+					      void __iomem *base)
+{
+	struct clk_init_data init;
+	struct cpg_z_clk *zclk;
+	struct clk *clk;
+
+	zclk = kzalloc(sizeof(*zclk), GFP_KERNEL);
+	if (!zclk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &cpg_z_clk_ops;
+	init.flags = 0;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	zclk->reg = base + CPG_FRQCRC;
+	zclk->kick_reg = base + CPG_FRQCRB;
+	zclk->hw.init = &init;
+
+	clk = clk_register(NULL, &zclk->hw);
+	if (IS_ERR(clk))
+		kfree(zclk);
+
+	return clk;
+}
+
+static struct clk * __init cpg_rcan_clk_register(const char *name,
+						 const char *parent_name,
+						 void __iomem *base)
+{
+	struct clk_fixed_factor *fixed;
+	struct clk_gate *gate;
+	struct clk *clk;
+
+	fixed = kzalloc(sizeof(*fixed), GFP_KERNEL);
+	if (!fixed)
+		return ERR_PTR(-ENOMEM);
+
+	fixed->mult = 1;
+	fixed->div = 6;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate) {
+		kfree(fixed);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	gate->reg = base + CPG_RCANCKCR;
+	gate->bit_idx = 8;
+	gate->flags = CLK_GATE_SET_TO_DISABLE;
+	gate->lock = &cpg_lock;
+
+	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
+				     &fixed->hw, &clk_fixed_factor_ops,
+				     &gate->hw, &clk_gate_ops, 0);
+	if (IS_ERR(clk)) {
+		kfree(gate);
+		kfree(fixed);
+	}
+
+	return clk;
+}
+
+/* ADSP divisors */
+static const struct clk_div_table cpg_adsp_div_table[] = {
+	{  1,  3 }, {  2,  4 }, {  3,  6 }, {  4,  8 },
+	{  5, 12 }, {  6, 16 }, {  7, 18 }, {  8, 24 },
+	{ 10, 36 }, { 11, 48 }, {  0,  0 },
+};
+
+static struct clk * __init cpg_adsp_clk_register(const char *name,
+						 const char *parent_name,
+						 void __iomem *base)
+{
+	struct clk_divider *div;
+	struct clk_gate *gate;
+	struct clk *clk;
+
+	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	div->reg = base + CPG_ADSPCKCR;
+	div->width = 4;
+	div->table = cpg_adsp_div_table;
+	div->lock = &cpg_lock;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate) {
+		kfree(div);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	gate->reg = base + CPG_ADSPCKCR;
+	gate->bit_idx = 8;
+	gate->flags = CLK_GATE_SET_TO_DISABLE;
+	gate->lock = &cpg_lock;
+
+	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
+				     &div->hw, &clk_divider_ops,
+				     &gate->hw, &clk_gate_ops, 0);
+	if (IS_ERR(clk)) {
+		kfree(gate);
+		kfree(div);
+	}
+
+	return clk;
+}
+
+/* SDHI divisors */
+static const struct clk_div_table cpg_sdh_div_table[] = {
+	{  0,  2 }, {  1,  3 }, {  2,  4 }, {  3,  6 },
+	{  4,  8 }, {  5, 12 }, {  6, 16 }, {  7, 18 },
+	{  8, 24 }, { 10, 36 }, { 11, 48 }, {  0,  0 },
+};
+
+static const struct clk_div_table cpg_sd01_div_table[] = {
+	{  4,  8 }, {  5, 12 }, {  6, 16 }, {  7, 18 },
+	{  8, 24 }, { 10, 36 }, { 11, 48 }, { 12, 10 },
+	{  0,  0 },
+};
+
+static const struct rcar_gen2_cpg_pll_config *cpg_pll_config __initdata;
+static u32 cpg_mode __initdata;
+
+struct clk * __init rcar_gen2_cpg_clk_register(struct device *dev,
+					       const struct cpg_core_clk *core,
+					       const struct cpg_mssr_info *info,
+					       struct clk **clks,
+					       void __iomem *base)
+{
+	const struct clk_div_table *table = NULL;
+	const struct clk *parent;
+	const char *parent_name;
+	unsigned int mult = 1;
+	unsigned int div = 1;
+	unsigned int shift;
+	u32 value;
+
+	parent = clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	parent_name = __clk_get_name(parent);
+
+	switch (core->type) {
+	/* R-Car Gen2 */
+	case CLK_TYPE_GEN2_MAIN:
+		div = cpg_pll_config->extal_div;
+		break;
+
+	case CLK_TYPE_GEN2_PLL0:
+		/*
+		 * PLL0 is a configurable multiplier clock. Register it as a
+		 * fixed factor clock for now as there's no generic multiplier
+		 * clock implementation and we currently have no need to change
+		 * the multiplier value.
+		 */
+		value = readl(base + CPG_PLL0CR);
+		mult = (((value >> 24) & 0x7f) + 1);
+		break;
+
+	case CLK_TYPE_GEN2_PLL1:
+		mult = cpg_pll_config->pll1_mult / 2;
+		break;
+
+	case CLK_TYPE_GEN2_PLL3:
+		mult = cpg_pll_config->pll3_mult;
+		break;
+
+	case CLK_TYPE_GEN2_Z:
+		return cpg_z_clk_register(core->name, parent_name, base);
+
+	case CLK_TYPE_GEN2_LB:
+		div = cpg_mode & BIT(18) ? 36 : 24;
+		break;
+
+	case CLK_TYPE_GEN2_ADSP:
+		return cpg_adsp_clk_register(core->name, parent_name, base);
+
+	case CLK_TYPE_GEN2_SDH:
+		table = cpg_sdh_div_table;
+		shift = 8;
+		break;
+
+	case CLK_TYPE_GEN2_SD0:
+		table = cpg_sd01_div_table;
+		shift = 4;
+		break;
+
+	case CLK_TYPE_GEN2_SD1:
+		table = cpg_sd01_div_table;
+		shift = 0;
+		break;
+
+	case CLK_TYPE_GEN2_QSPI:
+		div = (cpg_mode & (BIT(3) | BIT(2) | BIT(1))) == BIT(2) ?
+		      8 : 10;
+		break;
+
+	case CLK_TYPE_GEN2_RCAN:
+		return cpg_rcan_clk_register(core->name, parent_name, base);
+
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!table)
+		return clk_register_fixed_factor(NULL, core->name, parent_name,
+						 0, mult, div);
+	else
+		return clk_register_divider_table(NULL, core->name,
+						  parent_name, 0,
+						  base + CPG_SDCKCR, shift, 4,
+						  0, table, &cpg_lock);
+}
+
+/*
+ * Reset register definitions.
+ */
+#define MODEMR	0xe6160060
+
+u32 __init rcar_gen2_read_modemr(void)
+{
+	void __iomem *modemr = ioremap_nocache(MODEMR, 4);
+	u32 mode;
+
+	BUG_ON(!modemr);
+	mode = ioread32(modemr);
+	iounmap(modemr);
+
+	return mode;
+}
+
+int __init rcar_gen2_cpg_init(const struct rcar_gen2_cpg_pll_config *config)
+{
+	cpg_pll_config = config;
+
+	spin_lock_init(&cpg_lock);
+
+	return 0;
+}
Index: renesas/drivers/clk/renesas/rcar-gen2-cpg.h
===================================================================
--- /dev/null
+++ renesas/drivers/clk/renesas/rcar-gen2-cpg.h
@@ -0,0 +1,42 @@
+/*
+ * R-Car Gen2 Clock Pulse Generator
+ *
+ * Copyright (C) 2016 Cogent Embedded Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation; version 2 of the License.
+ */
+
+#ifndef __CLK_RENESAS_RCAR_GEN2_CPG_H__
+#define __CLK_RENESAS_RCAR_GEN2_CPG_H__
+
+enum rcar_gen2_clk_types {
+	CLK_TYPE_GEN2_MAIN = CLK_TYPE_CUSTOM,
+	CLK_TYPE_GEN2_PLL0,
+	CLK_TYPE_GEN2_PLL1,
+	CLK_TYPE_GEN2_PLL3,
+	CLK_TYPE_GEN2_Z,
+	CLK_TYPE_GEN2_LB,
+	CLK_TYPE_GEN2_ADSP,
+	CLK_TYPE_GEN2_SDH,
+	CLK_TYPE_GEN2_SD0,
+	CLK_TYPE_GEN2_SD1,
+	CLK_TYPE_GEN2_QSPI,
+	CLK_TYPE_GEN2_RCAN,
+};
+
+struct rcar_gen2_cpg_pll_config {
+	unsigned int extal_div;
+	unsigned int pll1_mult;
+	unsigned int pll3_mult;
+};
+
+u32 rcar_gen2_read_modemr(void);
+struct clk *rcar_gen2_cpg_clk_register(struct device *dev,
+				       const struct cpg_core_clk *core,
+				       const struct cpg_mssr_info *info,
+				       struct clk **clks, void __iomem *base);
+int rcar_gen2_cpg_init(const struct rcar_gen2_cpg_pll_config *config);
+
+#endif
