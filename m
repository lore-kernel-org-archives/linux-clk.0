Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 03/10] clk: meson8b: clean up pll clocks
Date: Thu,  9 Jun 2016 17:27:40 -0700
Message-Id: <1465518467-23939-4-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
References: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Remove the pll registration function and helpers. Replace unnecessary
configuration struct with static initialization of the desired clock
type.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/meson/clk-pll.c      |  72 ++++--------------------
 drivers/clk/meson/clkc.c         |   6 +-
 drivers/clk/meson/clkc.h         |  52 +++++++++---------
 drivers/clk/meson/meson8b-clkc.c | 115 ++++++++++++++++++++++++++++++++-------
 4 files changed, 131 insertions(+), 114 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 664edf0..60c6b94 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -44,13 +44,6 @@
 #define MESON_PLL_RESET				BIT(29)
 #define MESON_PLL_LOCK				BIT(31)
 
-struct meson_clk_pll {
-	struct clk_hw	hw;
-	void __iomem	*base;
-	struct pll_conf	*conf;
-	unsigned int	rate_count;
-	spinlock_t	*lock;
-};
 #define to_meson_clk_pll(_hw) container_of(_hw, struct meson_clk_pll, hw)
 
 static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
@@ -63,15 +56,15 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	u16 n, m, od;
 	u32 reg;
 
-	p = &pll->conf->n;
+	p = &pll->n;
 	reg = readl(pll->base + p->reg_off);
 	n = PARM_GET(p->width, p->shift, reg);
 
-	p = &pll->conf->m;
+	p = &pll->m;
 	reg = readl(pll->base + p->reg_off);
 	m = PARM_GET(p->width, p->shift, reg);
 
-	p = &pll->conf->od;
+	p = &pll->od;
 	reg = readl(pll->base + p->reg_off);
 	od = PARM_GET(p->width, p->shift, reg);
 
@@ -84,7 +77,7 @@ static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 				     unsigned long *parent_rate)
 {
 	struct meson_clk_pll *pll = to_meson_clk_pll(hw);
-	const struct pll_rate_table *rate_table = pll->conf->rate_table;
+	const struct pll_rate_table *rate_table = pll->rate_table;
 	int i;
 
 	for (i = 0; i < pll->rate_count; i++) {
@@ -99,7 +92,7 @@ static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 static const struct pll_rate_table *meson_clk_get_pll_settings(struct meson_clk_pll *pll,
 							       unsigned long rate)
 {
-	const struct pll_rate_table *rate_table = pll->conf->rate_table;
+	const struct pll_rate_table *rate_table = pll->rate_table;
 	int i;
 
 	for (i = 0; i < pll->rate_count; i++) {
@@ -145,24 +138,24 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 
 	/* PLL reset */
-	p = &pll->conf->n;
+	p = &pll->n;
 	reg = readl(pll->base + p->reg_off);
 	writel(reg | MESON_PLL_RESET, pll->base + p->reg_off);
 
 	reg = PARM_SET(p->width, p->shift, reg, rate_set->n);
 	writel(reg, pll->base + p->reg_off);
 
-	p = &pll->conf->m;
+	p = &pll->m;
 	reg = readl(pll->base + p->reg_off);
 	reg = PARM_SET(p->width, p->shift, reg, rate_set->m);
 	writel(reg, pll->base + p->reg_off);
 
-	p = &pll->conf->od;
+	p = &pll->od;
 	reg = readl(pll->base + p->reg_off);
 	reg = PARM_SET(p->width, p->shift, reg, rate_set->od);
 	writel(reg, pll->base + p->reg_off);
 
-	p = &pll->conf->n;
+	p = &pll->n;
 	ret = meson_clk_pll_wait_lock(pll, p);
 	if (ret) {
 		pr_warn("%s: pll did not lock, trying to restore old rate %lu\n",
@@ -173,55 +166,12 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-static const struct clk_ops meson_clk_pll_ops = {
+const struct clk_ops meson_clk_pll_ops = {
 	.recalc_rate	= meson_clk_pll_recalc_rate,
 	.round_rate	= meson_clk_pll_round_rate,
 	.set_rate	= meson_clk_pll_set_rate,
 };
 
-static const struct clk_ops meson_clk_pll_ro_ops = {
+const struct clk_ops meson_clk_pll_ro_ops = {
 	.recalc_rate	= meson_clk_pll_recalc_rate,
 };
-
-struct clk *meson_clk_register_pll(const struct clk_conf *clk_conf,
-				   void __iomem *reg_base,
-				   spinlock_t *lock)
-{
-	struct clk *clk;
-	struct meson_clk_pll *clk_pll;
-	struct clk_init_data init;
-
-	clk_pll = kzalloc(sizeof(*clk_pll), GFP_KERNEL);
-	if (!clk_pll)
-		return ERR_PTR(-ENOMEM);
-
-	clk_pll->base = reg_base + clk_conf->reg_off;
-	clk_pll->lock = lock;
-	clk_pll->conf = clk_conf->conf.pll;
-
-	init.name = clk_conf->clk_name;
-	init.flags = clk_conf->flags | CLK_GET_RATE_NOCACHE;
-
-	init.parent_names = &clk_conf->clks_parent[0];
-	init.num_parents = 1;
-	init.ops = &meson_clk_pll_ro_ops;
-
-	/* If no rate_table is specified we assume the PLL is read-only */
-	if (clk_pll->conf->rate_table) {
-		int len;
-
-		for (len = 0; clk_pll->conf->rate_table[len].rate != 0; )
-			len++;
-
-		 clk_pll->rate_count = len;
-		 init.ops = &meson_clk_pll_ops;
-	}
-
-	clk_pll->hw.init = &init;
-
-	clk = clk_register(NULL, &clk_pll->hw);
-	if (IS_ERR(clk))
-		kfree(clk_pll);
-
-	return clk;
-}
diff --git a/drivers/clk/meson/clkc.c b/drivers/clk/meson/clkc.c
index c6802fd..2161ea3 100644
--- a/drivers/clk/meson/clkc.c
+++ b/drivers/clk/meson/clkc.c
@@ -21,7 +21,7 @@
 
 #include "clkc.h"
 
-static DEFINE_SPINLOCK(clk_lock);
+DEFINE_SPINLOCK(clk_lock);
 
 static struct clk **clks;
 static struct clk_onecell_data clk_data;
@@ -190,10 +190,6 @@ void __init meson_clk_register_clks(const struct clk_conf *clk_confs,
 			clk = meson_clk_register_cpu(clk_conf, clk_base,
 						     &clk_lock);
 			break;
-		case CLK_PLL:
-			clk = meson_clk_register_pll(clk_conf, clk_base,
-						     &clk_lock);
-			break;
 		default:
 			clk = NULL;
 		}
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index b23b057..0bb4fb8 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -34,12 +34,13 @@ struct parm {
 	u8	shift;
 	u8	width;
 };
-#define PARM(_r, _s, _w)						\
-	{								\
-		.reg_off	= (_r),					\
-		.shift		= (_s),					\
-		.width		= (_w),					\
-	}								\
+
+#define PARM(_r, _s, _w)                                               \
+{                                                                      \
+	.reg_off        = (_r),                                        \
+	.shift          = (_s),                                        \
+	.width          = (_w),                                        \
+}                                                                      \
 
 struct pll_rate_table {
 	unsigned long	rate;
@@ -55,13 +56,19 @@ struct pll_rate_table {
 		.od		= (_od),				\
 	}								\
 
-struct pll_conf {
-	const struct pll_rate_table	*rate_table;
-	struct parm			m;
-	struct parm			n;
-	struct parm			od;
+struct meson_clk_pll {
+	struct clk_hw hw;
+	void __iomem *base;
+	struct parm m;
+	struct parm n;
+	struct parm od;
+	const struct pll_rate_table *rate_table;
+	unsigned int rate_count;
+	spinlock_t *lock;
 };
 
+#define to_meson_clk_pll(_hw) container_of(_hw, struct meson_clk_pll, hw)
+
 struct fixed_fact_conf {
 	unsigned int	div;
 	unsigned int	mult;
@@ -86,7 +93,6 @@ enum clk_type {
 	CLK_FIXED_FACTOR,
 	CLK_COMPOSITE,
 	CLK_CPU,
-	CLK_PLL,
 };
 
 struct clk_conf {
@@ -100,23 +106,10 @@ struct clk_conf {
 	union {
 		struct fixed_fact_conf		fixed_fact;
 		const struct composite_conf		*composite;
-		struct pll_conf			*pll;
 		const struct clk_div_table	*div_table;
 	} conf;
 };
 
-#define PLL(_ro, _ci, _cn, _cp, _f, _c)					\
-	{								\
-		.reg_off			= (_ro),		\
-		.clk_type			= CLK_PLL,		\
-		.clk_id				= (_ci),		\
-		.clk_name			= (_cn),		\
-		.clks_parent			= (_cp),		\
-		.num_parents			= ARRAY_SIZE(_cp),	\
-		.flags				= (_f),			\
-		.conf.pll			= (_c),			\
-	}								\
-
 #define FIXED_FACTOR_DIV(_ci, _cn, _cp, _f, _d)				\
 	{								\
 		.clk_type			= CLK_FIXED_FACTOR,	\
@@ -155,7 +148,12 @@ void meson_clk_register_clks(const struct clk_conf *clk_confs,
 			     unsigned int nr_confs, void __iomem *clk_base);
 struct clk *meson_clk_register_cpu(const struct clk_conf *clk_conf,
 				   void __iomem *reg_base, spinlock_t *lock);
-struct clk *meson_clk_register_pll(const struct clk_conf *clk_conf,
-				   void __iomem *reg_base, spinlock_t *lock);
+
+/* shared data */
+extern spinlock_t clk_lock;
+
+/* clk_ops */
+extern const struct clk_ops meson_clk_pll_ro_ops;
+extern const struct clk_ops meson_clk_pll_ops;
 
 #endif /* __CLKC_H */
diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b-clkc.c
index 9afd480..a3d8e66 100644
--- a/drivers/clk/meson/meson8b-clkc.c
+++ b/drivers/clk/meson/meson8b-clkc.c
@@ -110,7 +110,6 @@ static const struct clk_div_table cpu_div_table[] = {
 	{ /* sentinel */ },
 };
 
-PNAME(p_xtal)		= { "xtal" };
 PNAME(p_fclk_div)	= { "fixed_pll" };
 PNAME(p_cpu_clk)	= { "sys_pll" };
 PNAME(p_clk81)		= { "fclk_div3", "fclk_div4", "fclk_div5" };
@@ -120,19 +119,6 @@ PNAME(p_mali)		= { "fclk_div3", "fclk_div4", "fclk_div5",
 static u32 mux_table_clk81[]	= { 6, 5, 7 };
 static u32 mux_table_mali[]	= { 6, 5, 7, 4, 0 };
 
-static struct pll_conf pll_confs = {
-	.m		= PARM(0x00, 0,  9),
-	.n		= PARM(0x00, 9,  5),
-	.od		= PARM(0x00, 16, 2),
-};
-
-static struct pll_conf sys_pll_conf = {
-	.m		= PARM(0x00, 0,  9),
-	.n		= PARM(0x00, 9,  5),
-	.od		= PARM(0x00, 16, 2),
-	.rate_table	= sys_pll_rate_table,
-};
-
 static const struct composite_conf clk81_conf __initconst = {
 	.mux_table		= mux_table_clk81,
 	.mux_flags		= CLK_MUX_READ_ONLY,
@@ -166,13 +152,87 @@ static struct clk_fixed_rate meson8b_zero = {
 	},
 };
 
+static struct meson_clk_pll meson8b_fixed_pll = {
+	.m = {
+		.reg_off = MESON8B_REG_PLL_FIXED,
+		.shift   = 0,
+		.width   = 9,
+	},
+	.n = {
+		.reg_off = MESON8B_REG_PLL_FIXED,
+		.shift   = 9,
+		.width   = 5,
+	},
+	.od = {
+		.reg_off = MESON8B_REG_PLL_FIXED,
+		.shift   = 16,
+		.width   = 2,
+	},
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "fixed_pll",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct meson_clk_pll meson8b_vid_pll = {
+	.m = {
+		.reg_off = MESON8B_REG_PLL_VID,
+		.shift   = 0,
+		.width   = 9,
+	},
+	.n = {
+		.reg_off = MESON8B_REG_PLL_VID,
+		.shift   = 9,
+		.width   = 5,
+	},
+	.od = {
+		.reg_off = MESON8B_REG_PLL_VID,
+		.shift   = 16,
+		.width   = 2,
+	},
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "vid_pll",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct meson_clk_pll meson8b_sys_pll = {
+	.m = {
+		.reg_off = MESON8B_REG_PLL_SYS,
+		.shift   = 0,
+		.width   = 9,
+	},
+	.n = {
+		.reg_off = MESON8B_REG_PLL_SYS,
+		.shift   = 9,
+		.width   = 5,
+	},
+	.od = {
+		.reg_off = MESON8B_REG_PLL_SYS,
+		.shift   = 16,
+		.width   = 2,
+	},
+	.rate_table = sys_pll_rate_table,
+	.rate_count = ARRAY_SIZE(sys_pll_rate_table),
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "sys_pll",
+		.ops = &meson_clk_pll_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
 static const struct clk_conf meson8b_clk_confs[] __initconst = {
-	PLL(MESON8B_REG_PLL_FIXED, CLKID_PLL_FIXED, "fixed_pll",
-	    p_xtal, 0, &pll_confs),
-	PLL(MESON8B_REG_PLL_VID, CLKID_PLL_VID, "vid_pll",
-	    p_xtal, 0, &pll_confs),
-	PLL(MESON8B_REG_PLL_SYS, CLKID_PLL_SYS, "sys_pll",
-	    p_xtal, 0, &sys_pll_conf),
 	FIXED_FACTOR_DIV(CLKID_FCLK_DIV2, "fclk_div2", p_fclk_div, 0, 2),
 	FIXED_FACTOR_DIV(CLKID_FCLK_DIV3, "fclk_div3", p_fclk_div, 0, 3),
 	FIXED_FACTOR_DIV(CLKID_FCLK_DIV4, "fclk_div4", p_fclk_div, 0, 4),
@@ -197,14 +257,23 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 	.hws = {
 		[CLKID_XTAL] = &meson8b_xtal.hw,
 		[CLKID_ZERO] = &meson8b_zero.hw,
+		[CLKID_PLL_FIXED] = &meson8b_fixed_pll.hw,
+		[CLKID_PLL_VID] = &meson8b_vid_pll.hw,
+		[CLKID_PLL_SYS] = &meson8b_sys_pll.hw,
 	},
 	.num = CLK_NR_CLKS,
 };
 
+static struct meson_clk_pll *const meson8b_clk_plls[] = {
+	&meson8b_fixed_pll,
+	&meson8b_vid_pll,
+	&meson8b_sys_pll,
+};
+
 static void __init meson8b_clkc_init(struct device_node *np)
 {
 	void __iomem *clk_base;
-	int ret, clkid;
+	int ret, clkid, i;
 
 	if (!meson_clk_init(np, CLK_NR_CLKS))
 		return;
@@ -216,6 +285,10 @@ static void __init meson8b_clkc_init(struct device_node *np)
 		return;
 	}
 
+	/* Populate base address for PLLs */
+	for (i = 0; i < ARRAY_SIZE(meson8b_clk_plls); i++)
+		meson8b_clk_plls[i]->base = clk_base;
+
 	/*
 	 * register all clks
 	 * CLKID_UNUSED = 0, so skip it and start with CLKID_XTAL = 1
-- 
2.1.4
