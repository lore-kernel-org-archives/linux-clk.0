Return-Path: <ricardo.ribalda@gmail.com>
Return-Path: <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	s.hauer@pengutronix.de,
	jeremy.kerr@canonical.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v2 2/3] clk: fixed-factor: Convert into a module platform driver
Date: Mon, 20 Jun 2016 15:43:37 +0200
Message-Id: <1466430218-6561-3-git-send-email-ricardo.ribalda@gmail.com>
In-Reply-To: <1466430218-6561-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1466430218-6561-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Adds support for fixed-factor clock providers which have not been
enabled via of_clk_init().

This is required by Device trees overlays that introduce clocks
providers.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
v2: Changes proposed by: Stephen Boyd <sboyd@codeaurora.org>
-Add error check
-CodeStyle on of_device_ide
-Use builtin_platform_driver()

 drivers/clk/clk-fixed-factor.c | 75 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 75cd6c792cb8..73e7c1267bb6 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 
 /*
  * DOC: basic fixed multiplier and divider clock that cannot gate
@@ -145,23 +146,24 @@ EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);
 /**
  * of_fixed_factor_clk_setup() - Setup function for simple fixed factor clock
  */
-void __init of_fixed_factor_clk_setup(struct device_node *node)
+struct clk *_of_fixed_factor_clk_setup(struct device_node *node)
 {
 	struct clk *clk;
 	const char *clk_name = node->name;
 	const char *parent_name;
 	u32 div, mult;
+	int ret;
 
 	if (of_property_read_u32(node, "clock-div", &div)) {
 		pr_err("%s Fixed factor clock <%s> must have a clock-div property\n",
 			__func__, node->name);
-		return;
+		return ERR_PTR(-EIO);
 	}
 
 	if (of_property_read_u32(node, "clock-mult", &mult)) {
 		pr_err("%s Fixed factor clock <%s> must have a clock-mult property\n",
 			__func__, node->name);
-		return;
+		return ERR_PTR(-EIO);
 	}
 
 	of_property_read_string(node, "clock-output-names", &clk_name);
@@ -169,10 +171,73 @@ void __init of_fixed_factor_clk_setup(struct device_node *node)
 
 	clk = clk_register_fixed_factor(NULL, clk_name, parent_name, 0,
 					mult, div);
-	if (!IS_ERR(clk))
-		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+	if (IS_ERR(clk))
+		return clk;
+
+	ret = of_clk_add_provider(node, of_clk_src_simple_get, clk);
+	if (ret) {
+		clk_unregister(clk);
+		return ERR_PTR(ret);
+	}
+
+	return clk;
+}
+
+void __init of_fixed_factor_clk_setup(struct device_node *node)
+{
+	_of_fixed_factor_clk_setup(node);
+	return;
 }
 EXPORT_SYMBOL_GPL(of_fixed_factor_clk_setup);
 CLK_OF_DECLARE(fixed_factor_clk, "fixed-factor-clock",
 		of_fixed_factor_clk_setup);
+
+static int of_fixed_factor_clk_remove(struct platform_device *pdev)
+{
+	struct clk *clk = platform_get_drvdata(pdev);
+
+	if (clk)
+		clk_unregister_fixed_factor(clk);
+
+	return 0;
+}
+
+static int of_fixed_factor_clk_probe(struct platform_device *pdev)
+{
+	struct clk *clk;
+
+	/*
+	 * Don't do anything if of_clk_init() has already
+	 * added this clock to the provider list
+	 */
+	if (of_clk_is_provider(pdev->dev.of_node))
+		return 0;
+
+	clk = _of_fixed_factor_clk_setup(pdev->dev.of_node);
+
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	platform_set_drvdata(pdev, clk);
+
+	return 0;
+}
+
+static const struct of_device_id of_fixed_factor_clk_ids[] = {
+	{ .compatible = "fixed-factor-clock" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_fixed_factor_clk_ids);
+
+static struct platform_driver of_fixed_factor_clk_driver = {
+	.driver = {
+		.name = "of_fixed_factor_clk",
+		.of_match_table = of_fixed_factor_clk_ids,
+	},
+	.probe = of_fixed_factor_clk_probe,
+	.remove = of_fixed_factor_clk_remove,
+};
+
+builtin_platform_driver(of_fixed_factor_clk_driver);
+
 #endif
-- 
2.8.1
