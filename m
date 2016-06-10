Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 08/10] clk: meson8b: convert to platform_driver
Date: Thu,  9 Jun 2016 17:27:45 -0700
Message-Id: <1465518467-23939-9-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
References: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This patch creates a proper platform_driver for the meson8b clock
controller. Use of CLK_OF_DECLARE is removed, and can be added back in
later if very early registration of some clocks is required.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/meson/meson8b-clkc.c | 67 +++++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b-clkc.c
index 57dea03..b1902e9 100644
--- a/drivers/clk/meson/meson8b-clkc.c
+++ b/drivers/clk/meson/meson8b-clkc.c
@@ -2,6 +2,9 @@
  * Copyright (c) 2015 Endless Mobile, Inc.
  * Author: Carlo Caione <carlo@endlessm.com>
  *
+ * Copyright (c) 2016 BayLibre, Inc.
+ * Michael Turquette <mturquette@baylibre.com>
+ *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
  * version 2, as published by the Free Software Foundation.
@@ -17,11 +20,10 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/kernel.h>
-#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/slab.h>
 #include <dt-bindings/clock/meson8b-clkc.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
 
 #include "clkc.h"
 
@@ -350,18 +352,19 @@ static struct meson_clk_pll *const meson8b_clk_plls[] = {
 	&meson8b_sys_pll,
 };
 
-static void __init meson8b_clkc_init(struct device_node *np)
+static int meson8b_clkc_probe(struct platform_device *pdev)
 {
 	void __iomem *clk_base;
 	int ret, clkid, i;
 	struct clk_hw *parent_hw;
 	struct clk *parent_clk;
+	struct device *dev = &pdev->dev;
 
 	/*  Generic clocks and PLLs */
-	clk_base = of_iomap(np, 1);
+	clk_base = of_iomap(dev->of_node, 1);
 	if (!clk_base) {
 		pr_err("%s: Unable to map clk base\n", __func__);
-		return;
+		return -ENXIO;
 	}
 
 	/* Populate base address for PLLs */
@@ -386,9 +389,9 @@ static void __init meson8b_clkc_init(struct device_node *np)
 			continue;
 
 		/* FIXME convert to devm_clk_register */
-		ret = clk_hw_register(NULL, meson8b_hw_onecell_data.hws[clkid]);
+		ret = devm_clk_hw_register(dev, meson8b_hw_onecell_data.hws[clkid]);
 		if (ret)
-			goto unregister;
+			goto iounmap;
 	}
 
 	/*
@@ -411,17 +414,45 @@ static void __init meson8b_clkc_init(struct device_node *np)
 	if (ret) {
 		pr_err("%s: failed to register clock notifier for cpu_clk\n",
 				__func__);
-		goto unregister_clk_nb;
+		goto iounmap;
 	}
 
-	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &meson8b_hw_onecell_data);
-	return;
+	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+			&meson8b_hw_onecell_data);
 
-/* FIXME remove after converting to platform_driver/devm_clk_register */
-unregister_clk_nb:
-	clk_notifier_unregister(parent_clk, &meson8b_a5_clk.clk_nb);
-unregister:
-	for (clkid = CLK_NR_CLKS - 1; clkid >= 0; clkid--)
-		clk_hw_unregister(meson8b_hw_onecell_data.hws[clkid]);
+iounmap:
+	iounmap(clk_base);
+	return ret;
 }
-CLK_OF_DECLARE(meson8b_clock, "amlogic,meson8b-clkc", meson8b_clkc_init);
+
+static const struct of_device_id meson8b_clkc_match_table[] = {
+	{ .compatible = "amlogic,meson8b-clkc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, meson8b_match_table);
+
+static struct platform_driver meson8b_driver = {
+	.probe		= meson8b_clkc_probe,
+	.driver		= {
+		.name	= "meson8b-clkc",
+		.of_match_table = meson8b_clkc_match_table,
+	},
+};
+
+static int __init meson8b_clkc_init(void)
+{
+	return platform_driver_register(&meson8b_driver);
+}
+module_init(meson8b_clkc_init);
+
+static void __exit meson8b_clkc_exit(void)
+{
+	platform_driver_unregister(&meson8b_driver);
+}
+module_exit(meson8b_clkc_exit);
+
+MODULE_DESCRIPTION("AmLogic S805 / Meson8b Clock Controller Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:meson8b-clkc");
+MODULE_AUTHOR("Michael Turquette <mturquette@baylibre.com>");
+MODULE_AUTHOR("Carlo Caione <carlo@endlessm.com>");
-- 
2.1.4
