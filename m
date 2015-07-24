Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 24 Jul 2015 16:20:45 -0700
From: Kees Cook <keescook@chromium.org>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk_register_clkdev: handle callers needing format string
Message-ID: <20150724232045.GA14059@www.outflux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Many callers either use NULL or const strings for the third argument of
clk_register_clkdev. For those that do not, this is a risk for format
strings being accidentally processed (for example in device names). This
adds the missing "%s" arguments to make sure format strings will not leak
into the clkdev.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/arm/mach-vexpress/spc.c                  | 2 +-
 arch/powerpc/platforms/512x/clock-commonclk.c | 4 ++--
 drivers/acpi/acpi_apd.c                       | 3 ++-
 drivers/acpi/acpi_lpss.c                      | 2 +-
 drivers/clk/clk-mb86s7x.c                     | 2 +-
 drivers/clk/clk-moxart.c                      | 4 ++--
 drivers/clk/samsung/clk-pll.c                 | 2 +-
 drivers/clk/samsung/clk.c                     | 9 +++++----
 drivers/clk/tegra/clk-tegra-pmc.c             | 2 +-
 drivers/clk/tegra/clk.c                       | 2 +-
 10 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-vexpress/spc.c b/arch/arm/mach-vexpress/spc.c
index 5766ce2be32b..b9e953824775 100644
--- a/arch/arm/mach-vexpress/spc.c
+++ b/arch/arm/mach-vexpress/spc.c
@@ -577,7 +577,7 @@ static int __init ve_spc_clk_init(void)
 			pr_warn("failed to register cpu%d clock\n", cpu);
 			continue;
 		}
-		if (clk_register_clkdev(clk, NULL, dev_name(cpu_dev))) {
+		if (clk_register_clkdev(clk, NULL, "%s", dev_name(cpu_dev))) {
 			pr_warn("failed to register cpu%d clock lookup\n", cpu);
 			continue;
 		}
diff --git a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
index f691bcabd710..8f35949e3365 100644
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -992,9 +992,9 @@ static void mpc5121_clk_provide_migration_support(void)
 	clk = of_clk_get_by_name(np, clkname); \
 	if (IS_ERR(clk)) { \
 		clk = clkitem; \
-		clk_register_clkdev(clk, clkname, devname); \
+		clk_register_clkdev(clk, clkname, "%s", devname); \
 		if (regnode) \
-			clk_register_clkdev(clk, clkname, np->name); \
+			clk_register_clkdev(clk, clkname, "%s", np->name); \
 		did_register |= DID_REG_ ## regflag; \
 		pr_debug("clock alias name '%s' for dev '%s' pointer %p\n", \
 			 clkname, devname, clk); \
diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index 3984ea96e5f7..c6af5d0da99f 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -65,7 +65,8 @@ static int acpi_apd_setup(struct apd_private_data *pdata)
 					dev_name(&pdata->adev->dev),
 					NULL, CLK_IS_ROOT,
 					dev_desc->fixed_clk_rate);
-		clk_register_clkdev(clk, NULL, dev_name(&pdata->adev->dev));
+		clk_register_clkdev(clk, NULL, "%s",
+				    dev_name(&pdata->adev->dev));
 		pdata->clk = clk;
 	}
 
diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
index 46b58abb08c5..abea2b14cf90 100644
--- a/drivers/acpi/acpi_lpss.c
+++ b/drivers/acpi/acpi_lpss.c
@@ -316,7 +316,7 @@ out:
 		return PTR_ERR(clk);
 
 	pdata->clk = clk;
-	clk_register_clkdev(clk, dev_desc->clk_con_id, devname);
+	clk_register_clkdev(clk, dev_desc->clk_con_id, "%s", devname);
 	return 0;
 }
 
diff --git a/drivers/clk/clk-mb86s7x.c b/drivers/clk/clk-mb86s7x.c
index f39c25a22f43..1e2d8fca3daf 100644
--- a/drivers/clk/clk-mb86s7x.c
+++ b/drivers/clk/clk-mb86s7x.c
@@ -370,7 +370,7 @@ static int mb86s7x_clclk_of_init(void)
 			pr_err("failed to register cpu%d clock\n", cpu);
 			continue;
 		}
-		if (clk_register_clkdev(clk, NULL, dev_name(cpu_dev))) {
+		if (clk_register_clkdev(clk, NULL, "%s", dev_name(cpu_dev))) {
 			pr_err("failed to register cpu%d clock lookup\n", cpu);
 			continue;
 		}
diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
index 5181b89c3cb2..1928c9e2f005 100644
--- a/drivers/clk/clk-moxart.c
+++ b/drivers/clk/clk-moxart.c
@@ -47,7 +47,7 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
 		return;
 	}
 
-	clk_register_clkdev(clk, NULL, name);
+	clk_register_clkdev(clk, NULL, "%s", name);
 	of_clk_add_provider(node, of_clk_src_simple_get, clk);
 }
 CLK_OF_DECLARE(moxart_pll_clock, "moxa,moxart-pll-clock",
@@ -90,7 +90,7 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
 		return;
 	}
 
-	clk_register_clkdev(clk, NULL, name);
+	clk_register_clkdev(clk, NULL, "%s", name);
 	of_clk_add_provider(node, of_clk_src_simple_get, clk);
 }
 CLK_OF_DECLARE(moxart_apb_clock, "moxa,moxart-apb-clock",
diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index bebc61b5fce1..765153ea7a9d 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1296,7 +1296,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	if (!pll_clk->alias)
 		return;
 
-	ret = clk_register_clkdev(clk, pll_clk->alias, pll_clk->dev_name);
+	ret = clk_register_clkdev(clk, pll_clk->alias, "%s", pll_clk->dev_name);
 	if (ret)
 		pr_err("%s: failed to register lookup for %s : %d",
 			__func__, pll_clk->name, ret);
diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 0117238391d6..6997f988c850 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -123,7 +123,8 @@ void __init samsung_clk_register_alias(struct samsung_clk_provider *ctx,
 			continue;
 		}
 
-		ret = clk_register_clkdev(clk, list->alias, list->dev_name);
+		ret = clk_register_clkdev(clk, list->alias, "%s",
+					  list->dev_name);
 		if (ret)
 			pr_err("%s: failed to register lookup %s\n",
 					__func__, list->alias);
@@ -203,7 +204,7 @@ void __init samsung_clk_register_mux(struct samsung_clk_provider *ctx,
 
 		/* register a clock lookup only if a clock alias is specified */
 		if (list->alias) {
-			ret = clk_register_clkdev(clk, list->alias,
+			ret = clk_register_clkdev(clk, list->alias, "%s",
 						list->dev_name);
 			if (ret)
 				pr_err("%s: failed to register lookup %s\n",
@@ -242,7 +243,7 @@ void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
 
 		/* register a clock lookup only if a clock alias is specified */
 		if (list->alias) {
-			ret = clk_register_clkdev(clk, list->alias,
+			ret = clk_register_clkdev(clk, list->alias, "%s",
 						list->dev_name);
 			if (ret)
 				pr_err("%s: failed to register lookup %s\n",
@@ -271,7 +272,7 @@ void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
 
 		/* register a clock lookup only if a clock alias is specified */
 		if (list->alias) {
-			ret = clk_register_clkdev(clk, list->alias,
+			ret = clk_register_clkdev(clk, list->alias, "%s",
 							list->dev_name);
 			if (ret)
 				pr_err("%s: failed to register lookup %s\n",
diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
index 08b21c1ee867..d36effd97935 100644
--- a/drivers/clk/tegra/clk-tegra-pmc.c
+++ b/drivers/clk/tegra/clk-tegra-pmc.c
@@ -110,7 +110,7 @@ void __init tegra_pmc_clk_init(void __iomem *pmc_base,
 					0, pmc_base + PMC_CLK_OUT_CNTRL,
 					data->gate_shift, 0, &clk_out_lock);
 		*dt_clk = clk;
-		clk_register_clkdev(clk, data->dev_name, data->gate_name);
+		clk_register_clkdev(clk, data->dev_name, "%s", data->gate_name);
 	}
 
 	/* blink */
diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index 41cd87c67be6..97d9fb7e89ad 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -296,7 +296,7 @@ void __init tegra_register_devclks(struct tegra_devclk *dev_clks, int num)
 
 	for (i = 0; i < num; i++, dev_clks++)
 		clk_register_clkdev(clks[dev_clks->dt_id], dev_clks->con_id,
-				dev_clks->dev_id);
+				"%s", dev_clks->dev_id);
 
 	for (i = 0; i < clk_num; i++) {
 		if (!IS_ERR_OR_NULL(clks[i]))
-- 
1.9.1


-- 
Kees Cook
Chrome OS Security
