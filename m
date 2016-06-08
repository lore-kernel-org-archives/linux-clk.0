Return-Path: <ricardo.ribalda@gmail.com>
Return-Path: <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	s.hauer@pengutronix.de,
	jeremy.kerr@canonical.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 3/3] clk: fixed-rate: Convert into a module platform driver
Date: Wed,  8 Jun 2016 12:20:01 +0200
Message-Id: <1465381201-11537-4-git-send-email-ricardo.ribalda@gmail.com>
In-Reply-To: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Adds support for fixed-rate clock providers which have not been
enabled via of_clk_init().

This is required by Device trees overlays that introduce clocks
providers.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/clk/clk-fixed-rate.c | 62 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index 8e4453eb54e8..190b1e8ea9ac 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 
 /*
  * DOC: basic fixed-rate clock that cannot gate
@@ -149,7 +150,7 @@ EXPORT_SYMBOL_GPL(clk_unregister_fixed_rate);
 /**
  * of_fixed_clk_setup() - Setup function for simple fixed rate clock
  */
-void of_fixed_clk_setup(struct device_node *node)
+struct clk *_of_fixed_clk_setup(struct device_node *node)
 {
 	struct clk *clk;
 	const char *clk_name = node->name;
@@ -157,7 +158,7 @@ void of_fixed_clk_setup(struct device_node *node)
 	u32 accuracy = 0;
 
 	if (of_property_read_u32(node, "clock-frequency", &rate))
-		return;
+		return ERR_PTR(-EIO);
 
 	of_property_read_u32(node, "clock-accuracy", &accuracy);
 
@@ -167,7 +168,64 @@ void of_fixed_clk_setup(struct device_node *node)
 						    0, rate, accuracy);
 	if (!IS_ERR(clk))
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+
+	return clk;
+}
+
+void of_fixed_clk_setup(struct device_node *node)
+{
+	_of_fixed_clk_setup(node);
 }
 EXPORT_SYMBOL_GPL(of_fixed_clk_setup);
 CLK_OF_DECLARE(fixed_clk, "fixed-clock", of_fixed_clk_setup);
+
+static int of_fixed_clk_remove(struct platform_device *pdev)
+{
+	struct clk *clk = platform_get_drvdata(pdev);
+
+	if (clk)
+		clk_unregister_fixed_rate(clk);
+
+	return 0;
+}
+
+static int of_fixed_clk_probe(struct platform_device *pdev)
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
+	clk = _of_fixed_clk_setup(pdev->dev.of_node);
+
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	platform_set_drvdata(pdev, clk);
+
+	return 0;
+}
+
+static const struct of_device_id of_fixed_clk_ids[] = {
+	{
+		.compatible = "fixed-clock",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_fixed_clk_ids);
+
+static struct platform_driver of_fixed_clk_driver = {
+	.driver = {
+		.name = "of_fixed_clk",
+		.of_match_table = of_fixed_clk_ids,
+	},
+	.probe = of_fixed_clk_probe,
+	.remove = of_fixed_clk_remove,
+};
+
+module_platform_driver(of_fixed_clk_driver);
 #endif
-- 
2.8.1
