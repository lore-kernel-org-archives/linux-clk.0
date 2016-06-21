Return-Path: <ricardo.ribalda@gmail.com>
Return-Path: <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	s.hauer@pengutronix.de,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v3 2/2] clk: fixed-rate: Convert into a module platform driver
Date: Tue, 21 Jun 2016 11:01:28 +0200
Message-Id: <1466499688-28625-2-git-send-email-ricardo.ribalda@gmail.com>
In-Reply-To: <1466499688-28625-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1466499688-28625-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Adds support for fixed-rate clock providers which have not been
enabled via of_clk_init().

This is required by Device trees overlays that introduce clocks
providers.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
v3: Changes proposed by: Stephen Boyd <sboyd@codeaurora.org>
-Use OF_POPULATED flag

v2: Changes proposed by: Stephen Boyd <sboyd@codeaurora.org>
-Add error check
-CodeStyle on of_device_ide
-Use builtin_platform_driver()
 drivers/clk/clk-fixed-rate.c | 70 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index 8e4453eb54e8..d5f9aa086acc 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 
 /*
  * DOC: basic fixed-rate clock that cannot gate
@@ -149,15 +150,16 @@ EXPORT_SYMBOL_GPL(clk_unregister_fixed_rate);
 /**
  * of_fixed_clk_setup() - Setup function for simple fixed rate clock
  */
-void of_fixed_clk_setup(struct device_node *node)
+struct clk *_of_fixed_clk_setup(struct device_node *node)
 {
 	struct clk *clk;
 	const char *clk_name = node->name;
 	u32 rate;
 	u32 accuracy = 0;
+	int ret;
 
 	if (of_property_read_u32(node, "clock-frequency", &rate))
-		return;
+		return ERR_PTR(-EIO);
 
 	of_property_read_u32(node, "clock-accuracy", &accuracy);
 
@@ -165,9 +167,69 @@ void of_fixed_clk_setup(struct device_node *node)
 
 	clk = clk_register_fixed_rate_with_accuracy(NULL, clk_name, NULL,
 						    0, rate, accuracy);
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
+void of_fixed_clk_setup(struct device_node *node)
+{
+	if (!_of_fixed_clk_setup(node))
+		of_node_set_flag(node, OF_POPULATED);
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
+	 * This function is not executed when of_fixed_clk_setup
+	 * succeeded.
+	 */
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
+	{ .compatible = "fixed-clock" },
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
+builtin_platform_driver(of_fixed_clk_driver);
 #endif
-- 
2.8.1
