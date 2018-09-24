Return-Path: <chris.brandt@renesas.com>
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 1/3] clk: renesas: cpg-mssr: Add early clock support
Date: Mon, 24 Sep 2018 11:49:35 -0500
Message-Id: <20180924164937.36536-2-chris.brandt@renesas.com>
In-Reply-To: <20180924164937.36536-1-chris.brandt@renesas.com>
References: <20180924164937.36536-1-chris.brandt@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Add support for SoCs that need to register core and module clocks early in
order to use OF drivers that exclusively use macros such as
TIMER_OF_DECLARE.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * List early clocks first
 * Renamed early_priv to cpg_mssr_priv and make it static
 * Always set cpg_mssr_priv(early_priv) because it is used for early and
   non-early cases.
 * of_iomap returns NULL on error, not negative number
 * Removed various unnecessary comments
 * Add __init to cpg_mssr_common_init
 * fixed dev_set_drvdata was not being called for early drivers
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 95 +++++++++++++++++++++++++++-------
 drivers/clk/renesas/renesas-cpg-mssr.h | 13 +++++
 2 files changed, 88 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 3df764d3ab20..a6ce3d825bfc 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -127,6 +127,7 @@ struct cpg_mssr_priv {
 	struct device *dev;
 	void __iomem *base;
 	spinlock_t rmw_lock;
+	struct device_node *np;
 
 	struct clk **clks;
 	unsigned int num_core_clks;
@@ -141,6 +142,7 @@ struct cpg_mssr_priv {
 	} smstpcr_saved[ARRAY_SIZE(smstpcr)];
 };
 
+static struct cpg_mssr_priv *cpg_mssr_priv;
 
 /**
  * struct mstp_clock - MSTP gating clock
@@ -316,7 +318,7 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 
 	switch (core->type) {
 	case CLK_TYPE_IN:
-		clk = of_clk_get_by_name(priv->dev->of_node, core->name);
+		clk = of_clk_get_by_name(priv->np, core->name);
 		break;
 
 	case CLK_TYPE_FF:
@@ -877,42 +879,43 @@ static const struct dev_pm_ops cpg_mssr_pm = {
 #define DEV_PM_OPS	NULL
 #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
 
-static int __init cpg_mssr_probe(struct platform_device *pdev)
+static int __init cpg_mssr_common_init(struct device *dev,
+				       struct device_node *np,
+				       const struct cpg_mssr_info *info)
 {
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	const struct cpg_mssr_info *info;
 	struct cpg_mssr_priv *priv;
 	unsigned int nclks, i;
-	struct resource *res;
 	struct clk **clks;
 	int error;
 
-	info = of_device_get_match_data(dev);
 	if (info->init) {
 		error = info->init(dev);
 		if (error)
 			return error;
 	}
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	priv->np = np;
 	priv->dev = dev;
 	spin_lock_init(&priv->rmw_lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(priv->base))
-		return PTR_ERR(priv->base);
+	priv->base = of_iomap(np, 0);
+	if (!priv->base) {
+		error = -ENOMEM;
+		goto out_err;
+	}
 
 	nclks = info->num_total_core_clks + info->num_hw_mod_clks;
-	clks = devm_kmalloc_array(dev, nclks, sizeof(*clks), GFP_KERNEL);
-	if (!clks)
-		return -ENOMEM;
+	clks = kmalloc_array(nclks, sizeof(*clks), GFP_KERNEL);
+	if (!clks) {
+		error = -ENOMEM;
+		goto out_err;
+	}
 
-	dev_set_drvdata(dev, priv);
+	cpg_mssr_priv = priv;
 	priv->clks = clks;
 	priv->num_core_clks = info->num_total_core_clks;
 	priv->num_mod_clks = info->num_hw_mod_clks;
@@ -923,16 +926,68 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 	for (i = 0; i < nclks; i++)
 		clks[i] = ERR_PTR(-ENOENT);
 
+	error = of_clk_add_provider(np, cpg_mssr_clk_src_twocell_get, priv);
+	if (error)
+		goto out_err;
+
+	return 0;
+
+out_err:
+	kfree(clks);
+	if (priv->base)
+		iounmap(priv->base);
+	kfree(priv);
+
+	return error;
+}
+
+void __init cpg_mssr_early_init(struct device_node *np,
+				const struct cpg_mssr_info *info)
+{
+	int error;
+	int i;
+
+	error = cpg_mssr_common_init(NULL, np, info);
+	if (error)
+		return;
+
+	for (i = 0; i < info->num_early_core_clks; i++)
+		cpg_mssr_register_core_clk(&info->early_core_clks[i], info,
+					   cpg_mssr_priv);
+
+	for (i = 0; i < info->num_early_mod_clks; i++)
+		cpg_mssr_register_mod_clk(&info->early_mod_clks[i], info,
+					  cpg_mssr_priv);
+
+}
+
+static int __init cpg_mssr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct cpg_mssr_info *info;
+	struct cpg_mssr_priv *priv;
+	unsigned int i;
+	int error;
+
+	info = of_device_get_match_data(dev);
+
+	if (!cpg_mssr_priv) {
+		error = cpg_mssr_common_init(dev, dev->of_node, info);
+		if (error)
+			return error;
+	}
+
+	priv = cpg_mssr_priv;
+	priv->dev = dev;
+	dev_set_drvdata(dev, priv);
+
 	for (i = 0; i < info->num_core_clks; i++)
 		cpg_mssr_register_core_clk(&info->core_clks[i], info, priv);
 
 	for (i = 0; i < info->num_mod_clks; i++)
 		cpg_mssr_register_mod_clk(&info->mod_clks[i], info, priv);
 
-	error = of_clk_add_provider(np, cpg_mssr_clk_src_twocell_get, priv);
-	if (error)
-		return error;
-
 	error = devm_add_action_or_reset(dev,
 					 cpg_mssr_del_clk_provider,
 					 np);
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index ae0ab0f164f3..630ad6c6960f 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -88,6 +88,11 @@ struct device_node;
     /**
      * SoC-specific CPG/MSSR Description
      *
+     * @early_core_clks: Array of Early Core Clock definitions
+     * @num_early_core_clks: Number of entries in early_core_clks[]
+     * @early_mod_clks: Array of Early Module Clock definitions
+     * @num_early_mod_clks: Number of entries in early_mod_clks[]
+     *
      * @core_clks: Array of Core Clock definitions
      * @num_core_clks: Number of entries in core_clks[]
      * @last_dt_core_clk: ID of the last Core Clock exported to DT
@@ -114,6 +119,12 @@ struct device_node;
      */
 
 struct cpg_mssr_info {
+	/* Early Clocks */
+	const struct cpg_core_clk *early_core_clks;
+	unsigned int num_early_core_clks;
+	const struct mssr_mod_clk *early_mod_clks;
+	unsigned int num_early_mod_clks;
+
 	/* Core Clocks */
 	const struct cpg_core_clk *core_clks;
 	unsigned int num_core_clks;
@@ -160,6 +171,8 @@ extern const struct cpg_mssr_info r8a77980_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77990_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a77995_cpg_mssr_info;
 
+void __init cpg_mssr_early_init(struct device_node *np,
+				const struct cpg_mssr_info *info);
 
     /*
      * Helpers for fixing up clock tables depending on SoC revision
-- 
2.16.1
