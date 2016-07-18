Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 2/3] clk: zx: Add clk helper and zx296718 clk method
Date: Mon, 18 Jul 2016 17:41:16 +0800
Message-Id: <1468834877-22534-2-git-send-email-jun.nie@linaro.org>
In-Reply-To: <1468834877-22534-1-git-send-email-jun.nie@linaro.org>
References: <1468834877-22534-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add common clock framework helper functions for ZTE SoC and
ZX296718 clock method for pll/gate/mux clocks.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/clk/zte/clk.c | 183 ++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk.h | 268 +++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 448 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/clk.c b/drivers/clk/zte/clk.c
index 10d532d..26557e8 100644
--- a/drivers/clk/zte/clk.c
+++ b/drivers/clk/zte/clk.c
@@ -24,6 +24,14 @@
 #define LOCK_FLAG 30
 #define POWER_DOWN 31
 
+/* add a clock instance to the clock lookup table used for dt based lookup */
+void zx_clk_add_lookup(struct zx_clk_provider *clkp, struct clk *clk,
+		       unsigned int id)
+{
+	if (clkp->clk_data.clks && id)
+		clkp->clk_data.clks[id] = clk;
+}
+
 static int rate_to_idx(struct clk_zx_pll *zx_pll, unsigned long rate)
 {
 	const struct zx_pll_config *config = zx_pll->lookup_table;
@@ -309,3 +317,178 @@ struct clk *clk_register_zx_audio(const char *name,
 
 	return clk;
 }
+
+struct zx_clk_provider * __init zx_clk_init(struct device_node *np,
+					    void __iomem *base,
+					    unsigned int nr_clks)
+{
+	struct zx_clk_provider *clkp;
+	struct clk **clk_table;
+	int i;
+
+	clkp = kzalloc(sizeof(*clkp), GFP_KERNEL);
+	if (!clkp)
+		panic("could not allocate clock provider context.\n");
+
+	clk_table = kcalloc(nr_clks, sizeof(struct clk *), GFP_KERNEL);
+	if (!clk_table)
+		panic("could not allocate clock lookup table\n");
+
+	for (i = 0; i < nr_clks; i++)
+		clk_table[i] = ERR_PTR(-ENOENT);
+
+	clkp->reg_base = base;
+	clkp->clk_data.clks = clk_table;
+	clkp->clk_data.clk_num = nr_clks;
+	spin_lock_init(&clkp->lock);
+
+	return clkp;
+}
+
+static void __init _zx296718_clk_register_pll(struct zx_clk_provider *clkp,
+					     struct zx_pll_clock *pll_clk,
+					     unsigned int nr_plls,
+					     void __iomem *base)
+{
+	struct clk_zx_pll *pll;
+	struct clk *clk;
+	struct clk_init_data init;
+	unsigned int len;
+
+	if (pll_clk->rate_table) {
+		pr_err("%s: fail to register clk %s as no config table\n",
+			__func__, pll_clk->name);
+		return;
+	}
+
+	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll) {
+		pr_err("%s: could not allocate pll clk %s\n",
+			__func__, pll_clk->name);
+		return;
+	}
+
+	init.name = pll_clk->name;
+	init.flags = pll_clk->flags;
+	init.parent_names = &pll_clk->parent_name;
+	init.num_parents = pll_clk->parent_name ? 1 : 0;
+	init.ops = &zx_pll_ops;
+
+	for (len = 0; pll_clk->rate_table[len].rate != 0; )
+		len++;
+
+	pll->count = len;
+	pll->lookup_table = pll_clk->rate_table;
+	pll->hw.init = &init;
+	pll->reg_base = base + pll_clk->reg_offset;
+	pll->pd_bit = pll_clk->pd_bit;
+	pll->lock_bit = LOCK_FLAG;
+
+	clk = clk_register(NULL, &pll->hw);
+	if (IS_ERR(clk)) {
+		pr_err("%s: failed to register pll clock %s : %ld\n",
+			__func__, pll_clk->name, PTR_ERR(clk));
+		kfree(pll);
+		return;
+	}
+	zx_clk_add_lookup(clkp, clk, pll_clk->id);
+}
+
+void __init zx296718_clk_register_pll(struct zx_clk_provider *clkp,
+				      struct zx_pll_clock *list,
+				      unsigned int nr_plls, void __iomem *base)
+{
+	int i;
+
+	for (i = 0; i < nr_plls; i++, list++)
+		_zx296718_clk_register_pll(clkp, list, nr_plls, base);
+}
+
+/* register mux clocks */
+void __init zx_clk_register_mux(struct zx_clk_provider *clkp,
+				struct zx_mux_clock *list,
+				unsigned int nr_clks)
+{
+	struct clk *clk;
+	unsigned int idx;
+
+	for (idx = 0; idx < nr_clks; idx++, list++) {
+		clk = clk_register_mux(NULL, list->name, list->parent_names,
+			list->num_parents, list->flags,
+			clkp->reg_base + list->offset,
+			list->shift, list->width, list->mux_flags, &clkp->lock);
+		if (IS_ERR(clk)) {
+			pr_err("%s: failed to register clock %s\n", __func__,
+				list->name);
+			continue;
+		}
+		zx_clk_add_lookup(clkp, clk, list->id);
+	}
+}
+
+void __init zx_clk_register_gate(struct zx_clk_provider *clkp,
+				 struct zx_gate_clock *list,
+				 unsigned int nr_clks)
+{
+	struct clk *clk;
+	unsigned int idx;
+
+	for (idx = 0; idx < nr_clks; idx++, list++) {
+		clk = clk_register_gate(NULL, list->name, list->parent_name,
+				list->flags | CLK_IGNORE_UNUSED, clkp->reg_base + list->offset,
+				list->bit_idx, list->gate_flags, &clkp->lock);
+		if (IS_ERR(clk)) {
+			pr_err("%s: failed to register clock %s\n", __func__,
+				list->name);
+			continue;
+		}
+		zx_clk_add_lookup(clkp, clk, list->id);
+	}
+}
+
+void __init zx_clk_register_div(struct zx_clk_provider *clkp,
+				struct zx_div_clock *list,
+				unsigned int nr_clks)
+{
+	struct clk *clk;
+	unsigned int idx;
+
+	for (idx = 0; idx < nr_clks; idx++, list++) {
+		if (list->table)
+			clk = clk_register_divider_table(NULL, list->name,
+				list->parent_name, list->flags,
+				clkp->reg_base + list->offset,
+				list->shift, list->width, list->div_flags,
+				list->table, &clkp->lock);
+		else
+			clk = clk_register_divider(NULL, list->name,
+				list->parent_name, list->flags,
+				clkp->reg_base + list->offset, list->shift,
+				list->width, list->div_flags, &clkp->lock);
+		if (IS_ERR(clk)) {
+			pr_err("%s: failed to register clock %s\n", __func__,
+				list->name);
+			continue;
+		}
+		zx_clk_add_lookup(clkp, clk, list->id);
+	}
+}
+
+void __init zx_clk_register_fixed_factor(struct zx_clk_provider *clkp,
+					 struct zx_fixed_factor_clock *list,
+					 unsigned int nr_clks)
+{
+	struct clk *clk;
+	unsigned int idx;
+
+	for (idx = 0; idx < nr_clks; idx++, list++) {
+		clk = clk_register_fixed_factor(NULL, list->name,
+			list->parent_name, list->flags, list->mult, list->div);
+		if (IS_ERR(clk)) {
+			pr_err("%s: failed to register clock %s\n", __func__,
+				list->name);
+			continue;
+		}
+		zx_clk_add_lookup(clkp, clk, list->id);
+	}
+}
diff --git a/drivers/clk/zte/clk.h b/drivers/clk/zte/clk.h
index 8277a0a..59993c1 100644
--- a/drivers/clk/zte/clk.h
+++ b/drivers/clk/zte/clk.h
@@ -12,12 +12,192 @@
 #include <linux/clk-provider.h>
 #include <linux/spinlock.h>
 
+/*
+ * struct zx_fixed_factor_clock: information about fixed-factor clock
+ * @id: platform specific id of the clock.
+ * @name: name of this fixed-factor clock.
+ * @parent_name: parent clock name.
+ * @mult: fixed multiplication factor.
+ * @div: fixed division factor.
+ * @flags: optional fixed-factor clock flags.
+ */
+struct zx_fixed_factor_clock {
+	unsigned int		id;
+	char			*name;
+	const char		*parent_name;
+	unsigned long		mult;
+	unsigned long		div;
+	unsigned long		flags;
+};
+
+#define FFACTOR(_id, cname, pname, m, d, f)		\
+	{						\
+		.id		= _id,			\
+		.name		= cname,		\
+		.parent_name	= pname,		\
+		.mult		= m,			\
+		.div		= d,			\
+		.flags		= f,			\
+	}
+/**
+ * struct zx_mux_clock: information about mux clock
+ * @id: platform specific id of the clock.
+ * @dev_name: name of the device to which this clock belongs.
+ * @name: name of this mux clock.
+ * @parent_names: array of pointer to parent clock names.
+ * @num_parents: number of parents listed in @parent_names.
+ * @flags: optional flags for basic clock.
+ * @offset: offset of the register for configuring the mux.
+ * @shift: starting bit location of the mux control bit-field in @reg.
+ * @width: width of the mux control bit-field in @reg.
+ * @mux_flags: flags for mux-type clock.
+ */
+struct zx_mux_clock {
+	unsigned int		id;
+	const char		*dev_name;
+	const char		*name;
+	const char		**parent_names;
+	u8			num_parents;
+	unsigned long		flags;
+	unsigned long		offset;
+	u8			shift;
+	u8			width;
+	u8			mux_flags;
+	const char		*alias;
+};
+
+#define __MUX(_id, dname, cname, pnames, o, s, w, f, mf, a)	\
+	{							\
+		.id		= _id,				\
+		.dev_name	= dname,			\
+		.name		= cname,			\
+		.parent_names	= pnames,			\
+		.num_parents	= ARRAY_SIZE(pnames),		\
+		.flags		= f,				\
+		.offset		= o,				\
+		.shift		= s,				\
+		.width		= w,				\
+		.mux_flags	= mf,				\
+		.alias		= a,				\
+	}
+
+#define MUX(_id, cname, pnames, o, s, w)			\
+	__MUX(_id, NULL, cname, pnames, o, s, w, 0, 0, NULL)
+
+#define MUX_A(_id, cname, pnames, o, s, w, a)			\
+	__MUX(_id, NULL, cname, pnames, o, s, w, 0, 0, a)
+
+#define MUX_F(_id, cname, pnames, o, s, w, f, mf)		\
+	__MUX(_id, NULL, cname, pnames, o, s, w, f, mf, NULL)
+
+#define MUX_FA(_id, cname, pnames, o, s, w, f, mf, a)		\
+	__MUX(_id, NULL, cname, pnames, o, s, w, f, mf, a)
+
+/**
+ * @id: platform specific id of the clock.
+ * struct zx_div_clock: information about div clock
+ * @dev_name: name of the device to which this clock belongs.
+ * @name: name of this div clock.
+ * @parent_name: name of the parent clock.
+ * @flags: optional flags for basic clock.
+ * @offset: offset of the register for configuring the div.
+ * @shift: starting bit location of the div control bit-field in @reg.
+ * @div_flags: flags for div-type clock.
+ * @alias: optional clock alias name to be assigned to this clock.
+ */
+struct zx_div_clock {
+	unsigned int		id;
+	const char		*dev_name;
+	const char		*name;
+	const char		*parent_name;
+	unsigned long		flags;
+	unsigned long		offset;
+	u8			shift;
+	u8			width;
+	u8			div_flags;
+	const char		*alias;
+	struct clk_div_table	*table;
+};
+
+#define __DIV(_id, dname, cname, pname, o, s, w, f, df, a, t)	\
+	{							\
+		.id		= _id,				\
+		.dev_name	= dname,			\
+		.name		= cname,			\
+		.parent_name	= pname,			\
+		.flags		= f,				\
+		.offset		= o,				\
+		.shift		= s,				\
+		.width		= w,				\
+		.div_flags	= df,				\
+		.alias		= a,				\
+		.table		= t,				\
+	}
+
+#define DIV(_id, cname, pname, o, s, w)				\
+	__DIV(_id, NULL, cname, pname, o, s, w, 0, 0, NULL, NULL)
+
+#define DIV_A(_id, cname, pname, o, s, w, a)			\
+	__DIV(_id, NULL, cname, pname, o, s, w, 0, 0, a, NULL)
+
+#define DIV_F(_id, cname, pname, o, s, w, f, df)		\
+	__DIV(_id, NULL, cname, pname, o, s, w, f, df, NULL, NULL)
+
+#define DIV_T(_id, cname, pname, o, s, w, f, t)			\
+	__DIV(_id, NULL, cname, pname, o, s, w, f, 0, NULL, t)
+
 struct zx_pll_config {
 	unsigned long rate;
 	u32 cfg0;
 	u32 cfg1;
 };
 
+#define PLL_RATE(_rate, _cfg0, _cfg1)		\
+	{					\
+		.rate = _rate,			\
+		.cfg0 = _cfg0,			\
+		.cfg1 = _cfg1,			\
+	}
+
+struct zx_pll_clock {
+	unsigned int			id;
+	const char			*dev_name;
+	const char			*name;
+	const char			*parent_name;
+	unsigned long			flags;
+	unsigned int			pd_bit;
+	unsigned int			reg_offset;
+	const struct zx_pll_config	*rate_table;
+	unsigned int			rate_count;
+	const char			*alias;
+};
+
+#define __PLL(_id, _dname, _name, _pname, _flags, _pflags,	\
+		_cfg, _rtable, _alias)				\
+	{							\
+		.id		= _id,				\
+		.dev_name	= _dname,			\
+		.name		= _name,			\
+		.parent_name	= _pname,			\
+		.flags		= _flags,			\
+		.pd_bit		= _pflags,			\
+		.reg_offset	= _cfg,				\
+		.rate_table	= _rtable,			\
+		.alias		= _alias,			\
+	}
+
+#define PLL(_id, _name, _pname, _cfg, _rtable)			\
+	__PLL(_id, NULL, _name, _pname, CLK_GET_RATE_NOCACHE,	\
+		0, _cfg, _rtable, _name)
+
+#define PLL_F(_id, _name, _pname, _flags, _pflags, _cfg, _rtable)	\
+	__PLL(_id, NULL, _name, _pname, _flags, _pflags,		\
+		_cfg, _rtable, _name)
+
+#define PLL_A(_id, _name, _pname, _cfg, _alias, _rtable)	\
+	__PLL(_id, NULL, _name, _pname, CLK_GET_RATE_NOCACHE,	\
+		0, __cfg, _rtable, _alias)
+
 struct clk_zx_pll {
 	struct clk_hw hw;
 	void __iomem *reg_base;
@@ -28,15 +208,97 @@ struct clk_zx_pll {
 	u8 lock_bit;		/* pll lock flag bit */
 };
 
-struct clk *clk_register_zx_pll(const char *name, const char *parent_name,
-	unsigned long flags, void __iomem *reg_base,
-	const struct zx_pll_config *lookup_table, int count, spinlock_t *lock);
+/**
+ * struct samsung_gate_clock: information about gate clock
+ * @id: platform specific id of the clock.
+ * @dev_name: name of the device to which this clock belongs.
+ * @name: name of this gate clock.
+ * @parent_name: name of the parent clock.
+ * @flags: optional flags for basic clock.
+ * @offset: offset of the register for configuring the gate.
+ * @bit_idx: bit index of the gate control bit-field in @reg.
+ * @gate_flags: flags for gate-type clock.
+ * @alias: optional clock alias name to be assigned to this clock.
+ */
+struct zx_gate_clock {
+	unsigned int		id;
+	const char		*dev_name;
+	const char		*name;
+	const char		*parent_name;
+	unsigned long		flags;
+	unsigned long		offset;
+	u8			bit_idx;
+	u8			gate_flags;
+	const char		*alias;
+};
+
+#define __GATE(_id, dname, cname, pname, o, b, f, gf, a)	\
+	{							\
+		.id		= _id,				\
+		.dev_name	= dname,			\
+		.name		= cname,			\
+		.parent_name	= pname,			\
+		.flags		= f,				\
+		.offset		= o,				\
+		.bit_idx	= b,				\
+		.gate_flags	= gf,				\
+		.alias		= a,				\
+	}
+
+#define GATE(_id, cname, pname, o, b, f, gf)			\
+	__GATE(_id, NULL, cname, pname, o, b, f, gf, NULL)
+
+#define GATE_A(_id, cname, pname, o, b, f, gf, a)		\
+	__GATE(_id, NULL, cname, pname, o, b, f, gf, a)
+
+#define GATE_D(_id, dname, cname, pname, o, b, f, gf)		\
+	__GATE(_id, dname, cname, pname, o, b, f, gf, NULL)
+
+#define GATE_DA(_id, dname, cname, pname, o, b, f, gf, a)	\
+	__GATE(_id, dname, cname, pname, o, b, f, gf, a)
+
+#define PNAME(x) static const char *x[] __initconst
+
+/**
+ * struct samsung_clk_provider: information about clock provider
+ * @reg_base: virtual address for the register base.
+ * @clk_data: holds clock related data like clk* and number of clocks.
+ * @lock: maintains exclusion between callbacks for a given clock-provider.
+ */
+struct zx_clk_provider {
+	void __iomem *reg_base;
+	struct clk_onecell_data clk_data;
+	spinlock_t lock;
+};
 
 struct clk_zx_audio {
 	struct clk_hw hw;
 	void __iomem *reg_base;
 };
 
+struct clk *clk_register_zx_pll(const char *name, const char *parent_name,
+				unsigned long flags, void __iomem *reg_base,
+				const struct zx_pll_config *lookup_table,
+				int count, spinlock_t *lock);
+extern struct zx_clk_provider * __init zx_clk_init(struct device_node *np,
+						   void __iomem *base,
+						   unsigned int nr_clks);
+extern void __init zx296718_clk_register_pll(struct zx_clk_provider *clkp,
+					     struct zx_pll_clock *pll_list,
+					     unsigned int nr_plls,
+					     void __iomem *base);
+extern void __init zx_clk_register_mux(struct zx_clk_provider *clkp,
+				       struct zx_mux_clock *list,
+				       unsigned int nr_clks);
+extern void __init zx_clk_register_gate(struct zx_clk_provider *clkp,
+					struct zx_gate_clock *list,
+					unsigned int nr_clks);
+extern void __init zx_clk_register_div(struct zx_clk_provider *clkp,
+				       struct zx_div_clock *list,
+				       unsigned int nr_clks);
+extern void __init zx_clk_register_fixed_factor(struct zx_clk_provider *clkp,
+				       struct zx_fixed_factor_clock *list,
+				       unsigned int nr_clks);
 struct clk *clk_register_zx_audio(const char *name,
 				  const char * const parent_name,
 				  unsigned long flags, void __iomem *reg_base);
-- 
1.9.1
