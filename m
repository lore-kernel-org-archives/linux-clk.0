Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 02/10] clk: meson8b: clean up fixed rate clocks
Date: Thu,  9 Jun 2016 17:27:39 -0700
Message-Id: <1465518467-23939-3-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
References: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Remove the fixed_rate registration function and helpers from clkc.[ch].
Replace unnecessary configuration struct with static initialization of
the desired clock type.

While we're here, begin the transition to a proper platform_driver and
call of_clk_add_hw_provider with a shiny new struct clk_hw_onecell_data.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/meson/clkc.c         | 34 --------------------
 drivers/clk/meson/clkc.h         | 26 ---------------
 drivers/clk/meson/meson8b-clkc.c | 69 +++++++++++++++++++++++++++++++---------
 3 files changed, 54 insertions(+), 75 deletions(-)

diff --git a/drivers/clk/meson/clkc.c b/drivers/clk/meson/clkc.c
index d920d41..c6802fd 100644
--- a/drivers/clk/meson/clkc.c
+++ b/drivers/clk/meson/clkc.c
@@ -167,36 +167,6 @@ meson_clk_register_fixed_factor(const struct clk_conf *clk_conf,
 	return clk;
 }
 
-static struct clk * __init
-meson_clk_register_fixed_rate(const struct clk_conf *clk_conf,
-			      void __iomem *clk_base)
-{
-	struct clk *clk;
-	const struct fixed_rate_conf *fixed_rate_conf;
-	const struct parm *r;
-	unsigned long rate;
-	u32 reg;
-
-	fixed_rate_conf = &clk_conf->conf.fixed_rate;
-	rate = fixed_rate_conf->rate;
-
-	if (!rate) {
-		r = &fixed_rate_conf->rate_parm;
-		reg = readl(clk_base + clk_conf->reg_off + r->reg_off);
-		rate = PARM_GET(r->width, r->shift, reg);
-	}
-
-	rate *= 1000000;
-
-	clk = clk_register_fixed_rate(NULL,
-			clk_conf->clk_name,
-			clk_conf->num_parents
-				? clk_conf->clks_parent[0] : NULL,
-			clk_conf->flags, rate);
-
-	return clk;
-}
-
 void __init meson_clk_register_clks(const struct clk_conf *clk_confs,
 				    unsigned int nr_confs,
 				    void __iomem *clk_base)
@@ -208,10 +178,6 @@ void __init meson_clk_register_clks(const struct clk_conf *clk_confs,
 		const struct clk_conf *clk_conf = &clk_confs[i];
 
 		switch (clk_conf->clk_type) {
-		case CLK_FIXED_RATE:
-			clk = meson_clk_register_fixed_rate(clk_conf,
-							    clk_base);
-			break;
 		case CLK_FIXED_FACTOR:
 			clk = meson_clk_register_fixed_factor(clk_conf,
 							      clk_base);
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 609ae92..b23b057 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -69,11 +69,6 @@ struct fixed_fact_conf {
 	struct parm	mult_parm;
 };
 
-struct fixed_rate_conf {
-	unsigned long	rate;
-	struct parm	rate_parm;
-};
-
 struct composite_conf {
 	struct parm		mux_parm;
 	struct parm		div_parm;
@@ -89,7 +84,6 @@ struct composite_conf {
 
 enum clk_type {
 	CLK_FIXED_FACTOR,
-	CLK_FIXED_RATE,
 	CLK_COMPOSITE,
 	CLK_CPU,
 	CLK_PLL,
@@ -105,32 +99,12 @@ struct clk_conf {
 	unsigned long			flags;
 	union {
 		struct fixed_fact_conf		fixed_fact;
-		struct fixed_rate_conf		fixed_rate;
 		const struct composite_conf		*composite;
 		struct pll_conf			*pll;
 		const struct clk_div_table	*div_table;
 	} conf;
 };
 
-#define FIXED_RATE_P(_ro, _ci, _cn, _f, _c)				\
-	{								\
-		.reg_off			= (_ro),		\
-		.clk_type			= CLK_FIXED_RATE,	\
-		.clk_id				= (_ci),		\
-		.clk_name			= (_cn),		\
-		.flags				= (_f),			\
-		.conf.fixed_rate.rate_parm	= _c,			\
-	}								\
-
-#define FIXED_RATE(_ci, _cn, _f, _r)					\
-	{								\
-		.clk_type			= CLK_FIXED_RATE,	\
-		.clk_id				= (_ci),		\
-		.clk_name			= (_cn),		\
-		.flags				= (_f),			\
-		.conf.fixed_rate.rate		= (_r),			\
-	}								\
-
 #define PLL(_ro, _ci, _cn, _cp, _f, _c)					\
 	{								\
 		.reg_off			= (_ro),		\
diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b-clkc.c
index 444ef94..9afd480 100644
--- a/drivers/clk/meson/meson8b-clkc.c
+++ b/drivers/clk/meson/meson8b-clkc.c
@@ -33,7 +33,6 @@
  *
  * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
  */
-#define MESON8B_REG_CTL0_ADDR		0x0000
 #define MESON8B_REG_SYS_CPU_CNTL1	0x015c /* 0x57 offset in data sheet */
 #define MESON8B_REG_HHI_MPEG		0x0174 /* 0x5d offset in data sheet */
 #define MESON8B_REG_MALI		0x01b0 /* 0x6c offset in data sheet */
@@ -149,12 +148,25 @@ static const struct composite_conf mali_conf __initconst = {
 	.gate_parm		= PARM(0x00, 8, 1),
 };
 
-static const struct clk_conf meson8b_xtal_conf __initconst =
-	FIXED_RATE_P(MESON8B_REG_CTL0_ADDR, CLKID_XTAL, "xtal", 0,
-			PARM(0x00, 4, 7));
+static struct clk_fixed_rate meson8b_xtal = {
+	.fixed_rate = 24000000,
+	.hw.init = &(struct clk_init_data){
+		.name = "xtal",
+		.num_parents = 0,
+		.ops = &clk_fixed_rate_ops,
+	},
+};
+
+static struct clk_fixed_rate meson8b_zero = {
+	.fixed_rate = 0,
+	.hw.init = &(struct clk_init_data){
+		.name = "zero",
+		.num_parents = 0,
+		.ops = &clk_fixed_rate_ops,
+	},
+};
 
 static const struct clk_conf meson8b_clk_confs[] __initconst = {
-	FIXED_RATE(CLKID_ZERO, "zero", 0, 0),
 	PLL(MESON8B_REG_PLL_FIXED, CLKID_PLL_FIXED, "fixed_pll",
 	    p_xtal, 0, &pll_confs),
 	PLL(MESON8B_REG_PLL_VID, CLKID_PLL_VID, "vid_pll",
@@ -174,23 +186,29 @@ static const struct clk_conf meson8b_clk_confs[] __initconst = {
 		  CLK_IGNORE_UNUSED, &mali_conf),
 };
 
+/*
+ * FIXME we cannot register two providers w/o breaking things. Luckily only
+ * clk81 is actually used by any drivers. Convert clk81 to use
+ * clk_hw_onecell_data last and flip the switch to call of_clk_add_hw_provider
+ * instead of of_clk_add_provider in the clk81 conversion patch to keep from
+ * breaking bisect. Then delete this comment ;-)
+ */
+static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
+	.hws = {
+		[CLKID_XTAL] = &meson8b_xtal.hw,
+		[CLKID_ZERO] = &meson8b_zero.hw,
+	},
+	.num = CLK_NR_CLKS,
+};
+
 static void __init meson8b_clkc_init(struct device_node *np)
 {
 	void __iomem *clk_base;
+	int ret, clkid;
 
 	if (!meson_clk_init(np, CLK_NR_CLKS))
 		return;
 
-	/* XTAL */
-	clk_base = of_iomap(np, 0);
-	if (!clk_base) {
-		pr_err("%s: Unable to map xtal base\n", __func__);
-		return;
-	}
-
-	meson_clk_register_clks(&meson8b_xtal_conf, 1, clk_base);
-	iounmap(clk_base);
-
 	/*  Generic clocks and PLLs */
 	clk_base = of_iomap(np, 1);
 	if (!clk_base) {
@@ -198,8 +216,29 @@ static void __init meson8b_clkc_init(struct device_node *np)
 		return;
 	}
 
+	/*
+	 * register all clks
+	 * CLKID_UNUSED = 0, so skip it and start with CLKID_XTAL = 1
+	 */
+	for (clkid = CLKID_XTAL; clkid < CLK_NR_CLKS; clkid++) {
+		/* array might be sparse */
+		if (!meson8b_hw_onecell_data.hws[clkid])
+			continue;
+
+		/* FIXME convert to devm_clk_register */
+		ret = clk_hw_register(NULL, meson8b_hw_onecell_data.hws[clkid]);
+		if (ret)
+			goto unregister;
+	}
+
 	meson_clk_register_clks(meson8b_clk_confs,
 				ARRAY_SIZE(meson8b_clk_confs),
 				clk_base);
+	return;
+
+/* FIXME remove after converting to platform_driver/devm_clk_register */
+unregister:
+	for (clkid = CLK_NR_CLKS - 1; clkid >= 0; clkid--)
+		clk_hw_unregister(meson8b_hw_onecell_data.hws[clkid]);
 }
 CLK_OF_DECLARE(meson8b_clock, "amlogic,meson8b-clkc", meson8b_clkc_init);
-- 
2.1.4
