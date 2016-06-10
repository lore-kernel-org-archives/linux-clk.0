Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 04/10] clk: meson8b: clean up fixed factor clocks
Date: Thu,  9 Jun 2016 17:27:41 -0700
Message-Id: <1465518467-23939-5-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
References: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Remove the fixed factor registration function and helpers. Replace
unnecessary configuration struct with static initialization of the
desired clock type.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/meson/clkc.c         | 46 ----------------------------
 drivers/clk/meson/clkc.h         | 19 ------------
 drivers/clk/meson/meson8b-clkc.c | 66 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 60 insertions(+), 71 deletions(-)

diff --git a/drivers/clk/meson/clkc.c b/drivers/clk/meson/clkc.c
index 2161ea3..275da27 100644
--- a/drivers/clk/meson/clkc.c
+++ b/drivers/clk/meson/clkc.c
@@ -125,48 +125,6 @@ error:
 	return clk;
 }
 
-static struct clk * __init
-meson_clk_register_fixed_factor(const struct clk_conf *clk_conf,
-				void __iomem *clk_base)
-{
-	struct clk *clk;
-	const struct fixed_fact_conf *fixed_fact_conf;
-	const struct parm *p;
-	unsigned int mult, div;
-	u32 reg;
-
-	fixed_fact_conf = &clk_conf->conf.fixed_fact;
-
-	mult = clk_conf->conf.fixed_fact.mult;
-	div = clk_conf->conf.fixed_fact.div;
-
-	if (!mult) {
-		mult = 1;
-		p = &fixed_fact_conf->mult_parm;
-		if (MESON_PARM_APPLICABLE(p)) {
-			reg = readl(clk_base + clk_conf->reg_off + p->reg_off);
-			mult = PARM_GET(p->width, p->shift, reg);
-		}
-	}
-
-	if (!div) {
-		div = 1;
-		p = &fixed_fact_conf->div_parm;
-		if (MESON_PARM_APPLICABLE(p)) {
-			reg = readl(clk_base + clk_conf->reg_off + p->reg_off);
-			mult = PARM_GET(p->width, p->shift, reg);
-		}
-	}
-
-	clk = clk_register_fixed_factor(NULL,
-			clk_conf->clk_name,
-			clk_conf->clks_parent[0],
-			clk_conf->flags,
-			mult, div);
-
-	return clk;
-}
-
 void __init meson_clk_register_clks(const struct clk_conf *clk_confs,
 				    unsigned int nr_confs,
 				    void __iomem *clk_base)
@@ -178,10 +136,6 @@ void __init meson_clk_register_clks(const struct clk_conf *clk_confs,
 		const struct clk_conf *clk_conf = &clk_confs[i];
 
 		switch (clk_conf->clk_type) {
-		case CLK_FIXED_FACTOR:
-			clk = meson_clk_register_fixed_factor(clk_conf,
-							      clk_base);
-			break;
 		case CLK_COMPOSITE:
 			clk = meson_clk_register_composite(clk_conf,
 							   clk_base);
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 0bb4fb8..97dd4d7 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -69,13 +69,6 @@ struct meson_clk_pll {
 
 #define to_meson_clk_pll(_hw) container_of(_hw, struct meson_clk_pll, hw)
 
-struct fixed_fact_conf {
-	unsigned int	div;
-	unsigned int	mult;
-	struct parm	div_parm;
-	struct parm	mult_parm;
-};
-
 struct composite_conf {
 	struct parm		mux_parm;
 	struct parm		div_parm;
@@ -90,7 +83,6 @@ struct composite_conf {
 #define PNAME(x) static const char *x[]
 
 enum clk_type {
-	CLK_FIXED_FACTOR,
 	CLK_COMPOSITE,
 	CLK_CPU,
 };
@@ -104,22 +96,11 @@ struct clk_conf {
 	int				num_parents;
 	unsigned long			flags;
 	union {
-		struct fixed_fact_conf		fixed_fact;
 		const struct composite_conf		*composite;
 		const struct clk_div_table	*div_table;
 	} conf;
 };
 
-#define FIXED_FACTOR_DIV(_ci, _cn, _cp, _f, _d)				\
-	{								\
-		.clk_type			= CLK_FIXED_FACTOR,	\
-		.clk_id				= (_ci),		\
-		.clk_name			= (_cn),		\
-		.clks_parent			= (_cp),		\
-		.num_parents			= ARRAY_SIZE(_cp),	\
-		.conf.fixed_fact.div		= (_d),			\
-	}								\
-
 #define CPU(_ro, _ci, _cn, _cp, _dt)					\
 	{								\
 		.reg_off			= (_ro),		\
diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b-clkc.c
index a3d8e66..6571e66 100644
--- a/drivers/clk/meson/meson8b-clkc.c
+++ b/drivers/clk/meson/meson8b-clkc.c
@@ -110,7 +110,6 @@ static const struct clk_div_table cpu_div_table[] = {
 	{ /* sentinel */ },
 };
 
-PNAME(p_fclk_div)	= { "fixed_pll" };
 PNAME(p_cpu_clk)	= { "sys_pll" };
 PNAME(p_clk81)		= { "fclk_div3", "fclk_div4", "fclk_div5" };
 PNAME(p_mali)		= { "fclk_div3", "fclk_div4", "fclk_div5",
@@ -232,12 +231,62 @@ static struct meson_clk_pll meson8b_sys_pll = {
 	},
 };
 
+static struct clk_fixed_factor meson8b_fclk_div2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div2",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor meson8b_fclk_div3 = {
+	.mult = 1,
+	.div = 3,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div3",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor meson8b_fclk_div4 = {
+	.mult = 1,
+	.div = 4,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div4",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor meson8b_fclk_div5 = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_fixed_factor meson8b_fclk_div7 = {
+	.mult = 1,
+	.div = 7,
+	.hw.init = &(struct clk_init_data){
+		.name = "fclk_div7",
+		.ops = &clk_fixed_factor_ops,
+		.parent_names = (const char *[]){ "fixed_pll" },
+		.num_parents = 1,
+	},
+};
+
 static const struct clk_conf meson8b_clk_confs[] __initconst = {
-	FIXED_FACTOR_DIV(CLKID_FCLK_DIV2, "fclk_div2", p_fclk_div, 0, 2),
-	FIXED_FACTOR_DIV(CLKID_FCLK_DIV3, "fclk_div3", p_fclk_div, 0, 3),
-	FIXED_FACTOR_DIV(CLKID_FCLK_DIV4, "fclk_div4", p_fclk_div, 0, 4),
-	FIXED_FACTOR_DIV(CLKID_FCLK_DIV5, "fclk_div5", p_fclk_div, 0, 5),
-	FIXED_FACTOR_DIV(CLKID_FCLK_DIV7, "fclk_div7", p_fclk_div, 0, 7),
 	CPU(MESON8B_REG_SYS_CPU_CNTL1, CLKID_CPUCLK, "a5_clk", p_cpu_clk,
 	    cpu_div_table),
 	COMPOSITE(MESON8B_REG_HHI_MPEG, CLKID_CLK81, "clk81", p_clk81,
@@ -260,6 +309,11 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_PLL_FIXED] = &meson8b_fixed_pll.hw,
 		[CLKID_PLL_VID] = &meson8b_vid_pll.hw,
 		[CLKID_PLL_SYS] = &meson8b_sys_pll.hw,
+		[CLKID_FCLK_DIV2] = &meson8b_fclk_div2.hw,
+		[CLKID_FCLK_DIV3] = &meson8b_fclk_div3.hw,
+		[CLKID_FCLK_DIV4] = &meson8b_fclk_div4.hw,
+		[CLKID_FCLK_DIV5] = &meson8b_fclk_div5.hw,
+		[CLKID_FCLK_DIV7] = &meson8b_fclk_div7.hw,
 	},
 	.num = CLK_NR_CLKS,
 };
-- 
2.1.4
