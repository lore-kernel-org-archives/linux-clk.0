Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 07/10] clk: meson8b: clean up composite clocks
Date: Thu,  9 Jun 2016 17:27:44 -0700
Message-Id: <1465518467-23939-8-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
References: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Remove the composite clock registration function and helpers. Replace
unnecessary configuration struct with static initialization of the
desired clock type.

To preserve git bisect this patch also flips the switch and starts using
of_clk_add_hw_provider instead of the deprecated meson_clk_register_clks
method. As a byproduct clk.c can be deleted.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/meson/Makefile               |   2 +-
 drivers/clk/meson/clkc.c                 | 161 -------------------------------
 drivers/clk/meson/clkc.h                 |  56 -----------
 drivers/clk/meson/meson8b-clkc.c         |  93 ++++++++++++------
 include/dt-bindings/clock/meson8b-clkc.h |   4 +-
 5 files changed, 69 insertions(+), 247 deletions(-)
 delete mode 100644 drivers/clk/meson/clkc.c

diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 6d45531..901b5d4 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -2,5 +2,5 @@
 # Makefile for Meson specific clk
 #
 
-obj-y += clkc.o clk-pll.o clk-cpu.o
+obj-y += clk-pll.o clk-cpu.o
 obj-y += meson8b-clkc.o
diff --git a/drivers/clk/meson/clkc.c b/drivers/clk/meson/clkc.c
deleted file mode 100644
index 0f96553..0000000
--- a/drivers/clk/meson/clkc.c
+++ /dev/null
@@ -1,161 +0,0 @@
-/*
- * Copyright (c) 2015 Endless Mobile, Inc.
- * Author: Carlo Caione <carlo@endlessm.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include <linux/clk-provider.h>
-#include <linux/mfd/syscon.h>
-#include <linux/slab.h>
-
-#include "clkc.h"
-
-DEFINE_SPINLOCK(clk_lock);
-
-static struct clk **clks;
-static struct clk_onecell_data clk_data;
-
-struct clk ** __init meson_clk_init(struct device_node *np,
-				   unsigned long nr_clks)
-{
-	clks = kcalloc(nr_clks, sizeof(*clks), GFP_KERNEL);
-	if (!clks)
-		return ERR_PTR(-ENOMEM);
-
-	clk_data.clks = clks;
-	clk_data.clk_num = nr_clks;
-	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
-
-	return clks;
-}
-
-static void meson_clk_add_lookup(struct clk *clk, unsigned int id)
-{
-	if (clks && id)
-		clks[id] = clk;
-}
-
-static struct clk * __init
-meson_clk_register_composite(const struct clk_conf *clk_conf,
-			     void __iomem *clk_base)
-{
-	struct clk *clk;
-	struct clk_mux *mux = NULL;
-	struct clk_divider *div = NULL;
-	struct clk_gate *gate = NULL;
-	const struct clk_ops *mux_ops = NULL;
-	const struct composite_conf *composite_conf;
-
-	composite_conf = clk_conf->conf.composite;
-
-	if (clk_conf->num_parents > 1) {
-		mux = kzalloc(sizeof(*mux), GFP_KERNEL);
-		if (!mux)
-			return ERR_PTR(-ENOMEM);
-
-		mux->reg = clk_base + clk_conf->reg_off
-				+ composite_conf->mux_parm.reg_off;
-		mux->shift = composite_conf->mux_parm.shift;
-		mux->mask = BIT(composite_conf->mux_parm.width) - 1;
-		mux->flags = composite_conf->mux_flags;
-		mux->lock = &clk_lock;
-		mux->table = composite_conf->mux_table;
-		mux_ops = (composite_conf->mux_flags & CLK_MUX_READ_ONLY) ?
-			  &clk_mux_ro_ops : &clk_mux_ops;
-	}
-
-	if (MESON_PARM_APPLICABLE(&composite_conf->div_parm)) {
-		div = kzalloc(sizeof(*div), GFP_KERNEL);
-		if (!div) {
-			clk = ERR_PTR(-ENOMEM);
-			goto error;
-		}
-
-		div->reg = clk_base + clk_conf->reg_off
-				+ composite_conf->div_parm.reg_off;
-		div->shift = composite_conf->div_parm.shift;
-		div->width = composite_conf->div_parm.width;
-		div->lock = &clk_lock;
-		div->flags = composite_conf->div_flags;
-		div->table = composite_conf->div_table;
-	}
-
-	if (MESON_PARM_APPLICABLE(&composite_conf->gate_parm)) {
-		gate = kzalloc(sizeof(*gate), GFP_KERNEL);
-		if (!gate) {
-			clk = ERR_PTR(-ENOMEM);
-			goto error;
-		}
-
-		gate->reg = clk_base + clk_conf->reg_off
-				+ composite_conf->div_parm.reg_off;
-		gate->bit_idx = composite_conf->gate_parm.shift;
-		gate->flags = composite_conf->gate_flags;
-		gate->lock = &clk_lock;
-	}
-
-	clk = clk_register_composite(NULL, clk_conf->clk_name,
-				    clk_conf->clks_parent,
-				    clk_conf->num_parents,
-				    mux ? &mux->hw : NULL, mux_ops,
-				    div ? &div->hw : NULL, &clk_divider_ops,
-				    gate ? &gate->hw : NULL, &clk_gate_ops,
-				    clk_conf->flags);
-	if (IS_ERR(clk))
-		goto error;
-
-	return clk;
-
-error:
-	kfree(gate);
-	kfree(div);
-	kfree(mux);
-
-	return clk;
-}
-
-void __init meson_clk_register_clks(const struct clk_conf *clk_confs,
-				    unsigned int nr_confs,
-				    void __iomem *clk_base)
-{
-	unsigned int i;
-	struct clk *clk = NULL;
-
-	for (i = 0; i < nr_confs; i++) {
-		const struct clk_conf *clk_conf = &clk_confs[i];
-
-		switch (clk_conf->clk_type) {
-		case CLK_COMPOSITE:
-			clk = meson_clk_register_composite(clk_conf,
-							   clk_base);
-			break;
-		default:
-			clk = NULL;
-		}
-
-		if (!clk) {
-			pr_err("%s: unknown clock type %d\n", __func__,
-			       clk_conf->clk_type);
-			continue;
-		}
-
-		if (IS_ERR(clk)) {
-			pr_warn("%s: Unable to create %s clock\n", __func__,
-				clk_conf->clk_name);
-			continue;
-		}
-
-		meson_clk_add_lookup(clk, clk_conf->clk_id);
-	}
-}
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index bfa5ae2..f3f3961 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -35,13 +35,6 @@ struct parm {
 	u8	width;
 };
 
-#define PARM(_r, _s, _w)                                               \
-{                                                                      \
-	.reg_off        = (_r),                                        \
-	.shift          = (_s),                                        \
-	.width          = (_w),                                        \
-}                                                                      \
-
 struct pll_rate_table {
 	unsigned long	rate;
 	u16		m;
@@ -77,58 +70,9 @@ struct meson_clk_cpu {
 	const struct clk_div_table *div_table;
 };
 
-struct composite_conf {
-	struct parm		mux_parm;
-	struct parm		div_parm;
-	struct parm		gate_parm;
-	struct clk_div_table	*div_table;
-	u32			*mux_table;
-	u8			mux_flags;
-	u8			div_flags;
-	u8			gate_flags;
-};
-
-#define PNAME(x) static const char *x[]
-
-enum clk_type {
-	CLK_COMPOSITE,
-};
-
-struct clk_conf {
-	u16				reg_off;
-	enum clk_type			clk_type;
-	unsigned int			clk_id;
-	const char			*clk_name;
-	const char			**clks_parent;
-	int				num_parents;
-	unsigned long			flags;
-	union {
-		const struct composite_conf		*composite;
-		const struct clk_div_table	*div_table;
-	} conf;
-};
-
-#define COMPOSITE(_ro, _ci, _cn, _cp, _f, _c)				\
-	{								\
-		.reg_off			= (_ro),		\
-		.clk_type			= CLK_COMPOSITE,	\
-		.clk_id				= (_ci),		\
-		.clk_name			= (_cn),		\
-		.clks_parent			= (_cp),		\
-		.num_parents			= ARRAY_SIZE(_cp),	\
-		.flags				= (_f),			\
-		.conf.composite			= (_c),			\
-	}								\
-
-struct clk **meson_clk_init(struct device_node *np, unsigned long nr_clks);
-void meson_clk_register_clks(const struct clk_conf *clk_confs,
-			     unsigned int nr_confs, void __iomem *clk_base);
 int meson_clk_cpu_notifier_cb(struct notifier_block *nb, unsigned long event,
 		void *data);
 
-/* shared data */
-extern spinlock_t clk_lock;
-
 /* clk_ops */
 extern const struct clk_ops meson_clk_pll_ro_ops;
 extern const struct clk_ops meson_clk_pll_ops;
diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b-clkc.c
index dcd8f03..57dea03 100644
--- a/drivers/clk/meson/meson8b-clkc.c
+++ b/drivers/clk/meson/meson8b-clkc.c
@@ -41,6 +41,8 @@
 #define MESON8B_REG_PLL_SYS		0x0300
 #define MESON8B_REG_PLL_VID		0x0320
 
+static DEFINE_SPINLOCK(clk_lock);
+
 static const struct pll_rate_table sys_pll_rate_table[] = {
 	PLL_RATE(312000000, 52, 1, 2),
 	PLL_RATE(336000000, 56, 1, 2),
@@ -111,18 +113,6 @@ static const struct clk_div_table cpu_div_table[] = {
 	{ /* sentinel */ },
 };
 
-PNAME(p_clk81)		= { "fclk_div3", "fclk_div4", "fclk_div5" };
-
-static u32 mux_table_clk81[]	= { 6, 5, 7 };
-
-static const struct composite_conf clk81_conf __initconst = {
-	.mux_table		= mux_table_clk81,
-	.mux_flags		= CLK_MUX_READ_ONLY,
-	.mux_parm		= PARM(0x00, 12, 3),
-	.div_parm		= PARM(0x00, 0, 7),
-	.gate_parm		= PARM(0x00, 7, 1),
-};
-
 static struct clk_fixed_rate meson8b_xtal = {
 	.fixed_rate = 24000000,
 	.hw.init = &(struct clk_init_data){
@@ -267,6 +257,11 @@ static struct clk_fixed_factor meson8b_fclk_div7 = {
 	},
 };
 
+/*
+ * FIXME cpu clocks and the legacy composite clocks (e.g. clk81) are both PLL
+ * post-dividers and should be modeled with their respective PLLs via the
+ * forthcoming coordinated clock rates feature
+ */
 static struct meson_clk_cpu meson8b_cpu_clk = {
 	.reg_off = MESON8B_REG_SYS_CPU_CNTL1,
 	.div_table = cpu_div_table,
@@ -279,18 +274,57 @@ static struct meson_clk_cpu meson8b_cpu_clk = {
 	},
 };
 
-static const struct clk_conf meson8b_clk_confs[] __initconst = {
-	COMPOSITE(MESON8B_REG_HHI_MPEG, CLKID_CLK81, "clk81", p_clk81,
-		  CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED, &clk81_conf),
+static u32 mux_table_clk81[]	= { 6, 5, 7 };
+
+struct clk_mux meson8b_mpeg_clk_sel = {
+	.reg = (void *)MESON8B_REG_HHI_MPEG,
+	.mask = 0x7,
+	.shift = 12,
+	.flags = CLK_MUX_READ_ONLY,
+	.table = mux_table_clk81,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "mpeg_clk_sel",
+		.ops = &clk_mux_ro_ops,
+		/*
+		 * FIXME bits 14:12 selects from 8 possible parents:
+		 * xtal, 1'b0 (wtf), fclk_div7, mpll_clkout1, mpll_clkout2,
+		 * fclk_div4, fclk_div3, fclk_div5
+		 */
+		.parent_names = (const char *[]){ "fclk_div3", "fclk_div4",
+			"fclk_div5" },
+		.num_parents = 3,
+		.flags = (CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+struct clk_divider meson8b_mpeg_clk_div = {
+	.reg = (void *)MESON8B_REG_HHI_MPEG,
+	.shift = 0,
+	.width = 7,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "mpeg_clk_div",
+		.ops = &clk_divider_ops,
+		.parent_names = (const char *[]){ "mpeg_clk_sel" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
+};
+
+struct clk_gate meson8b_clk81 = {
+	.reg = (void *)MESON8B_REG_HHI_MPEG,
+	.bit_idx = 7,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "clk81",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "mpeg_clk_div" },
+		.num_parents = 1,
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
+	},
 };
 
-/*
- * FIXME we cannot register two providers w/o breaking things. Luckily only
- * clk81 is actually used by any drivers. Convert clk81 to use
- * clk_hw_onecell_data last and flip the switch to call of_clk_add_hw_provider
- * instead of of_clk_add_provider in the clk81 conversion patch to keep from
- * breaking bisect. Then delete this comment ;-)
- */
 static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 	.hws = {
 		[CLKID_XTAL] = &meson8b_xtal.hw,
@@ -303,6 +337,9 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_FCLK_DIV5] = &meson8b_fclk_div5.hw,
 		[CLKID_FCLK_DIV7] = &meson8b_fclk_div7.hw,
 		[CLKID_CPUCLK] = &meson8b_cpu_clk.hw,
+		[CLKID_MPEG_SEL] = &meson8b_mpeg_clk_sel.hw,
+		[CLKID_MPEG_DIV] = &meson8b_mpeg_clk_div.hw,
+		[CLKID_CLK81] = &meson8b_clk81.hw,
 	},
 	.num = CLK_NR_CLKS,
 };
@@ -320,9 +357,6 @@ static void __init meson8b_clkc_init(struct device_node *np)
 	struct clk_hw *parent_hw;
 	struct clk *parent_clk;
 
-	if (!meson_clk_init(np, CLK_NR_CLKS))
-		return;
-
 	/*  Generic clocks and PLLs */
 	clk_base = of_iomap(np, 1);
 	if (!clk_base) {
@@ -337,6 +371,11 @@ static void __init meson8b_clkc_init(struct device_node *np)
 	/* Populate the base address for CPU clk */
 	meson8b_cpu_clk.base = clk_base;
 
+	/* Populate the base address for the MPEG clks */
+	meson8b_mpeg_clk_sel.reg = clk_base + (u32)meson8b_mpeg_clk_sel.reg;
+	meson8b_mpeg_clk_div.reg = clk_base + (u32)meson8b_mpeg_clk_div.reg;
+	meson8b_clk81.reg = clk_base + (u32)meson8b_clk81.reg;
+
 	/*
 	 * register all clks
 	 * CLKID_UNUSED = 0, so skip it and start with CLKID_XTAL = 1
@@ -375,9 +414,7 @@ static void __init meson8b_clkc_init(struct device_node *np)
 		goto unregister_clk_nb;
 	}
 
-	meson_clk_register_clks(meson8b_clk_confs,
-				ARRAY_SIZE(meson8b_clk_confs),
-				clk_base);
+	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &meson8b_hw_onecell_data);
 	return;
 
 /* FIXME remove after converting to platform_driver/devm_clk_register */
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index bd2720d..595a58d 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -19,7 +19,9 @@
 #define CLKID_MALI		11
 #define CLKID_CPUCLK		12
 #define CLKID_ZERO		13
+#define CLKID_MPEG_SEL		14
+#define CLKID_MPEG_DIV		15
 
-#define CLK_NR_CLKS		(CLKID_ZERO + 1)
+#define CLK_NR_CLKS		(CLKID_MPEG_DIV + 1)
 
 #endif /* __MESON8B_CLKC_H */
-- 
2.1.4
