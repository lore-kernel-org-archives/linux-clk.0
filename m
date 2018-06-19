Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:42454 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966649AbeFSQA7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jun 2018 12:00:59 -0400
Received: by mail-wr0-f196.google.com with SMTP id w10-v6so193499wrk.9
        for <linux-clk@vger.kernel.org>; Tue, 19 Jun 2018 09:00:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: remove obsolete register access
Date: Tue, 19 Jun 2018 18:00:50 +0200
Message-Id: <20180619160050.26958-1-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The legacy method to access the hhi register space is not longer used.
We can safely drop it now.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c  | 37 ++-----------------------------------
 drivers/clk/meson/gxbb.c | 36 ++----------------------------------
 2 files changed, 4 insertions(+), 69 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index bd4dbc696b88..3fb884db1b10 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -12,7 +12,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
-#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
@@ -995,49 +994,17 @@ static const struct of_device_id clkc_match_table[] = {
 	{}
 };
 
-static const struct regmap_config clkc_regmap_config = {
-	.reg_bits       = 32,
-	.val_bits       = 32,
-	.reg_stride     = 4,
-};
-
 static int axg_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
-	void __iomem *clk_base = NULL;
 	struct regmap *map;
 	int ret, i;
 
 	/* Get the hhi system controller node if available */
 	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
 	if (IS_ERR(map)) {
-		dev_err(dev,
-			"failed to get HHI regmap - Trying obsolete regs\n");
-
-		/*
-		 * FIXME: HHI registers should be accessed through
-		 * the appropriate system controller. This is required because
-		 * there is more than just clocks in this register space
-		 *
-		 * This fallback method is only provided temporarily until
-		 * all the platform DTs are properly using the syscon node
-		 */
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (!res)
-			return -EINVAL;
-
-
-		clk_base = devm_ioremap(dev, res->start, resource_size(res));
-		if (!clk_base) {
-			dev_err(dev, "Unable to map clk base\n");
-			return -ENXIO;
-		}
-
-		map = devm_regmap_init_mmio(dev, clk_base,
-					    &clkc_regmap_config);
-		if (IS_ERR(map))
-			return PTR_ERR(map);
+		dev_err(dev, "failed to get HHI regmap\n");
+		return PTR_ERR(map);
 	}
 
 	/* Populate regmap for the regmap backed clocks */
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 177fffb9ebef..297ebc391475 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -7,7 +7,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
-#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
@@ -2228,17 +2227,9 @@ static const struct of_device_id clkc_match_table[] = {
 	{},
 };
 
-static const struct regmap_config clkc_regmap_config = {
-	.reg_bits       = 32,
-	.val_bits       = 32,
-	.reg_stride     = 4,
-};
-
 static int gxbb_clkc_probe(struct platform_device *pdev)
 {
 	const struct clkc_data *clkc_data;
-	struct resource *res;
-	void __iomem *clk_base;
 	struct regmap *map;
 	int ret, i;
 	struct device *dev = &pdev->dev;
@@ -2250,31 +2241,8 @@ static int gxbb_clkc_probe(struct platform_device *pdev)
 	/* Get the hhi system controller node if available */
 	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
 	if (IS_ERR(map)) {
-		dev_err(dev,
-			"failed to get HHI regmap - Trying obsolete regs\n");
-
-		/*
-		 * FIXME: HHI registers should be accessed through
-		 * the appropriate system controller. This is required because
-		 * there is more than just clocks in this register space
-		 *
-		 * This fallback method is only provided temporarily until
-		 * all the platform DTs are properly using the syscon node
-		 */
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (!res)
-			return -EINVAL;
-
-		clk_base = devm_ioremap(dev, res->start, resource_size(res));
-		if (!clk_base) {
-			dev_err(dev, "Unable to map clk base\n");
-			return -ENXIO;
-		}
-
-		map = devm_regmap_init_mmio(dev, clk_base,
-					    &clkc_regmap_config);
-		if (IS_ERR(map))
-			return PTR_ERR(map);
+		dev_err(dev, "failed to get HHI regmap\n");
+		return PTR_ERR(map);
 	}
 
 	/* Populate regmap for the common regmap backed clocks */
-- 
2.14.3

