Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 05/10] clk: meson8b: clean up cpu clocks
Date: Thu,  9 Jun 2016 17:27:42 -0700
Message-Id: <1465518467-23939-6-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
References: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Remove the cpu clock registration function and helpers. Replace
unnecessary configuration struct with static initialization of the
desired clock type.

Ninja rename a5_clk to cpu_clk to better align with cpufreq convention.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/meson/clk-cpu.c      | 73 +++-------------------------------------
 drivers/clk/meson/clkc.c         |  4 ---
 drivers/clk/meson/clkc.h         | 25 ++++++--------
 drivers/clk/meson/meson8b-clkc.c | 47 ++++++++++++++++++++++++--
 4 files changed, 59 insertions(+), 90 deletions(-)

diff --git a/drivers/clk/meson/clk-cpu.c b/drivers/clk/meson/clk-cpu.c
index f7c30ea..f8b2b7e 100644
--- a/drivers/clk/meson/clk-cpu.c
+++ b/drivers/clk/meson/clk-cpu.c
@@ -51,13 +51,6 @@
 
 #include "clkc.h"
 
-struct meson_clk_cpu {
-	struct notifier_block		clk_nb;
-	const struct clk_div_table	*div_table;
-	struct clk_hw			hw;
-	void __iomem			*base;
-	u16				reg_off;
-};
 #define to_meson_clk_cpu_hw(_hw) container_of(_hw, struct meson_clk_cpu, hw)
 #define to_meson_clk_cpu_nb(_nb) container_of(_nb, struct meson_clk_cpu, clk_nb)
 
@@ -119,6 +112,7 @@ static unsigned long meson_clk_cpu_recalc_rate(struct clk_hw *hw,
 	return parent_rate / div;
 }
 
+/* FIXME MUX1 & MUX2 should be struct clk_hw objects */
 static int meson_clk_cpu_pre_rate_change(struct meson_clk_cpu *clk_cpu,
 					 struct clk_notifier_data *ndata)
 {
@@ -140,6 +134,7 @@ static int meson_clk_cpu_pre_rate_change(struct meson_clk_cpu *clk_cpu,
 	return 0;
 }
 
+/* FIXME MUX1 & MUX2 should be struct clk_hw objects */
 static int meson_clk_cpu_post_rate_change(struct meson_clk_cpu *clk_cpu,
 					  struct clk_notifier_data *ndata)
 {
@@ -161,7 +156,7 @@ static int meson_clk_cpu_post_rate_change(struct meson_clk_cpu *clk_cpu,
  * PLL clock is to be changed. We use the xtal input as temporary parent
  * while the PLL frequency is stabilized.
  */
-static int meson_clk_cpu_notifier_cb(struct notifier_block *nb,
+int meson_clk_cpu_notifier_cb(struct notifier_block *nb,
 				     unsigned long event, void *data)
 {
 	struct clk_notifier_data *ndata = data;
@@ -176,68 +171,8 @@ static int meson_clk_cpu_notifier_cb(struct notifier_block *nb,
 	return notifier_from_errno(ret);
 }
 
-static const struct clk_ops meson_clk_cpu_ops = {
+const struct clk_ops meson_clk_cpu_ops = {
 	.recalc_rate	= meson_clk_cpu_recalc_rate,
 	.round_rate	= meson_clk_cpu_round_rate,
 	.set_rate	= meson_clk_cpu_set_rate,
 };
-
-struct clk *meson_clk_register_cpu(const struct clk_conf *clk_conf,
-				   void __iomem *reg_base,
-				   spinlock_t *lock)
-{
-	struct clk *clk;
-	struct clk *pclk;
-	struct meson_clk_cpu *clk_cpu;
-	struct clk_init_data init;
-	int ret;
-
-	clk_cpu = kzalloc(sizeof(*clk_cpu), GFP_KERNEL);
-	if (!clk_cpu)
-		return ERR_PTR(-ENOMEM);
-
-	clk_cpu->base = reg_base;
-	clk_cpu->reg_off = clk_conf->reg_off;
-	clk_cpu->div_table = clk_conf->conf.div_table;
-	clk_cpu->clk_nb.notifier_call = meson_clk_cpu_notifier_cb;
-
-	init.name = clk_conf->clk_name;
-	init.ops = &meson_clk_cpu_ops;
-	init.flags = clk_conf->flags | CLK_GET_RATE_NOCACHE;
-	init.flags |= CLK_SET_RATE_PARENT;
-	init.parent_names = clk_conf->clks_parent;
-	init.num_parents = 1;
-
-	clk_cpu->hw.init = &init;
-
-	pclk = __clk_lookup(clk_conf->clks_parent[0]);
-	if (!pclk) {
-		pr_err("%s: could not lookup parent clock %s\n",
-				__func__, clk_conf->clks_parent[0]);
-		ret = -EINVAL;
-		goto free_clk;
-	}
-
-	ret = clk_notifier_register(pclk, &clk_cpu->clk_nb);
-	if (ret) {
-		pr_err("%s: failed to register clock notifier for %s\n",
-				__func__, clk_conf->clk_name);
-		goto free_clk;
-	}
-
-	clk = clk_register(NULL, &clk_cpu->hw);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		goto unregister_clk_nb;
-	}
-
-	return clk;
-
-unregister_clk_nb:
-	clk_notifier_unregister(pclk, &clk_cpu->clk_nb);
-free_clk:
-	kfree(clk_cpu);
-
-	return ERR_PTR(ret);
-}
-
diff --git a/drivers/clk/meson/clkc.c b/drivers/clk/meson/clkc.c
index 275da27..0f96553 100644
--- a/drivers/clk/meson/clkc.c
+++ b/drivers/clk/meson/clkc.c
@@ -140,10 +140,6 @@ void __init meson_clk_register_clks(const struct clk_conf *clk_confs,
 			clk = meson_clk_register_composite(clk_conf,
 							   clk_base);
 			break;
-		case CLK_CPU:
-			clk = meson_clk_register_cpu(clk_conf, clk_base,
-						     &clk_lock);
-			break;
 		default:
 			clk = NULL;
 		}
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 97dd4d7..bfa5ae2 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -69,6 +69,14 @@ struct meson_clk_pll {
 
 #define to_meson_clk_pll(_hw) container_of(_hw, struct meson_clk_pll, hw)
 
+struct meson_clk_cpu {
+	struct clk_hw hw;
+	void __iomem *base;
+	u16 reg_off;
+	struct notifier_block clk_nb;
+	const struct clk_div_table *div_table;
+};
+
 struct composite_conf {
 	struct parm		mux_parm;
 	struct parm		div_parm;
@@ -84,7 +92,6 @@ struct composite_conf {
 
 enum clk_type {
 	CLK_COMPOSITE,
-	CLK_CPU,
 };
 
 struct clk_conf {
@@ -101,17 +108,6 @@ struct clk_conf {
 	} conf;
 };
 
-#define CPU(_ro, _ci, _cn, _cp, _dt)					\
-	{								\
-		.reg_off			= (_ro),		\
-		.clk_type			= CLK_CPU,		\
-		.clk_id				= (_ci),		\
-		.clk_name			= (_cn),		\
-		.clks_parent			= (_cp),		\
-		.num_parents			= ARRAY_SIZE(_cp),	\
-		.conf.div_table			= (_dt),		\
-	}								\
-
 #define COMPOSITE(_ro, _ci, _cn, _cp, _f, _c)				\
 	{								\
 		.reg_off			= (_ro),		\
@@ -127,8 +123,8 @@ struct clk_conf {
 struct clk **meson_clk_init(struct device_node *np, unsigned long nr_clks);
 void meson_clk_register_clks(const struct clk_conf *clk_confs,
 			     unsigned int nr_confs, void __iomem *clk_base);
-struct clk *meson_clk_register_cpu(const struct clk_conf *clk_conf,
-				   void __iomem *reg_base, spinlock_t *lock);
+int meson_clk_cpu_notifier_cb(struct notifier_block *nb, unsigned long event,
+		void *data);
 
 /* shared data */
 extern spinlock_t clk_lock;
@@ -136,5 +132,6 @@ extern spinlock_t clk_lock;
 /* clk_ops */
 extern const struct clk_ops meson_clk_pll_ro_ops;
 extern const struct clk_ops meson_clk_pll_ops;
+extern const struct clk_ops meson_clk_cpu_ops;
 
 #endif /* __CLKC_H */
diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b-clkc.c
index 6571e66..94512b6 100644
--- a/drivers/clk/meson/meson8b-clkc.c
+++ b/drivers/clk/meson/meson8b-clkc.c
@@ -15,6 +15,7 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
@@ -110,7 +111,6 @@ static const struct clk_div_table cpu_div_table[] = {
 	{ /* sentinel */ },
 };
 
-PNAME(p_cpu_clk)	= { "sys_pll" };
 PNAME(p_clk81)		= { "fclk_div3", "fclk_div4", "fclk_div5" };
 PNAME(p_mali)		= { "fclk_div3", "fclk_div4", "fclk_div5",
 			    "fclk_div7", "zero" };
@@ -286,9 +286,19 @@ static struct clk_fixed_factor meson8b_fclk_div7 = {
 	},
 };
 
+static struct meson_clk_cpu meson8b_cpu_clk = {
+	.reg_off = MESON8B_REG_SYS_CPU_CNTL1,
+	.div_table = cpu_div_table,
+	.clk_nb.notifier_call = meson_clk_cpu_notifier_cb,
+	.hw.init = &(struct clk_init_data){
+		.name = "cpu_clk",
+		.ops = &meson_clk_cpu_ops,
+		.parent_names = (const char *[]){ "sys_pll" },
+		.num_parents = 1,
+	},
+};
+
 static const struct clk_conf meson8b_clk_confs[] __initconst = {
-	CPU(MESON8B_REG_SYS_CPU_CNTL1, CLKID_CPUCLK, "a5_clk", p_cpu_clk,
-	    cpu_div_table),
 	COMPOSITE(MESON8B_REG_HHI_MPEG, CLKID_CLK81, "clk81", p_clk81,
 		  CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED, &clk81_conf),
 	COMPOSITE(MESON8B_REG_MALI, CLKID_MALI, "mali", p_mali,
@@ -314,6 +324,7 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_FCLK_DIV4] = &meson8b_fclk_div4.hw,
 		[CLKID_FCLK_DIV5] = &meson8b_fclk_div5.hw,
 		[CLKID_FCLK_DIV7] = &meson8b_fclk_div7.hw,
+		[CLKID_CPUCLK] = &meson8b_cpu_clk.hw,
 	},
 	.num = CLK_NR_CLKS,
 };
@@ -328,6 +339,8 @@ static void __init meson8b_clkc_init(struct device_node *np)
 {
 	void __iomem *clk_base;
 	int ret, clkid, i;
+	struct clk_hw *parent_hw;
+	struct clk *parent_clk;
 
 	if (!meson_clk_init(np, CLK_NR_CLKS))
 		return;
@@ -343,6 +356,9 @@ static void __init meson8b_clkc_init(struct device_node *np)
 	for (i = 0; i < ARRAY_SIZE(meson8b_clk_plls); i++)
 		meson8b_clk_plls[i]->base = clk_base;
 
+	/* Populate the base address for CPU clk */
+	meson8b_cpu_clk.base = clk_base;
+
 	/*
 	 * register all clks
 	 * CLKID_UNUSED = 0, so skip it and start with CLKID_XTAL = 1
@@ -358,12 +374,37 @@ static void __init meson8b_clkc_init(struct device_node *np)
 			goto unregister;
 	}
 
+	/*
+	 * Register CPU clk notifier
+	 *
+	 * FIXME this is wrong for a lot of reasons. First, the muxes should be
+	 * struct clk_hw objects. Second, we shouldn't program the muxes in
+	 * notifier handlers. The tricky programming sequence will be handled
+	 * by the forthcoming coordinated clock rates mechanism once that
+	 * feature is released.
+	 *
+	 * Furthermore, looking up the parent this way is terrible. At some
+	 * point we will stop allocating a default struct clk when registering
+	 * a new clk_hw, and this hack will no longer work. Releasing the ccr
+	 * feature before that time solves the problem :-)
+	 */
+	parent_hw = clk_hw_get_parent(&meson8b_cpu_clk.hw);
+	parent_clk = parent_hw->clk;
+	ret = clk_notifier_register(parent_clk, &meson8b_cpu_clk.clk_nb);
+	if (ret) {
+		pr_err("%s: failed to register clock notifier for cpu_clk\n",
+				__func__);
+		goto unregister_clk_nb;
+	}
+
 	meson_clk_register_clks(meson8b_clk_confs,
 				ARRAY_SIZE(meson8b_clk_confs),
 				clk_base);
 	return;
 
 /* FIXME remove after converting to platform_driver/devm_clk_register */
+unregister_clk_nb:
+	clk_notifier_unregister(parent_clk, &meson8b_a5_clk.clk_nb);
 unregister:
 	for (clkid = CLK_NR_CLKS - 1; clkid >= 0; clkid--)
 		clk_hw_unregister(meson8b_hw_onecell_data.hws[clkid]);
-- 
2.1.4
