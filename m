Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 07/13 v2] clk: versatile-icst: refactor to allocate regmap separately
Date: Mon, 26 Oct 2015 14:33:39 +0100
Message-Id: <1445866419-13955-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Break out the registration function so it creates a regmap and
pass to the setup function, so the latter can be shared with
a device tree probe function that already has a regmap.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Use ERR_CAST() instead of unnecessary intermediate ret variable
- Pass struct device * pointer to regmap_init_mmio()

I'm looking for an ACK from the CLK maintainers to take this
through the ARM SoC tree once the series stabilize.
---
 drivers/clk/versatile/clk-icst.c | 47 ++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index 5fc22922718a..87bd4667b126 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -20,6 +20,7 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 
 #include "clk-icst.h"
 
@@ -140,21 +141,16 @@ static const struct clk_ops icst_ops = {
 	.set_rate = icst_set_rate,
 };
 
-struct clk *icst_clk_register(struct device *dev,
-			const struct clk_icst_desc *desc,
-			const char *name,
-			const char *parent_name,
-			void __iomem *base)
+static struct clk *icst_clk_setup(struct device *dev,
+				  const struct clk_icst_desc *desc,
+				  const char *name,
+				  const char *parent_name,
+				  struct regmap *map)
 {
 	struct clk *clk;
 	struct clk_icst *icst;
 	struct clk_init_data init;
 	struct icst_params *pclone;
-	struct regmap_config icst_regmap_conf = {
-		.reg_bits = 32,
-		.val_bits = 32,
-		.reg_stride = 4,
-	};
 
 	icst = kzalloc(sizeof(struct clk_icst), GFP_KERNEL);
 	if (!icst) {
@@ -174,15 +170,7 @@ struct clk *icst_clk_register(struct device *dev,
 	init.flags = CLK_IS_ROOT;
 	init.parent_names = (parent_name ? &parent_name : NULL);
 	init.num_parents = (parent_name ? 1 : 0);
-	icst->map = regmap_init_mmio(dev, base, &icst_regmap_conf);
-	if (IS_ERR(icst->map)) {
-		int ret;
-
-		pr_err("could not initialize ICST regmap\n");
-		kfree(icst);
-		ret = PTR_ERR(icst->map);
-		return ERR_PTR(ret);
-	}
+	icst->map = map;
 	icst->hw.init = &init;
 	icst->params = pclone;
 	icst->vcoreg_off = desc->vco_offset;
@@ -196,4 +184,25 @@ struct clk *icst_clk_register(struct device *dev,
 
 	return clk;
 }
+
+struct clk *icst_clk_register(struct device *dev,
+			const struct clk_icst_desc *desc,
+			const char *name,
+			const char *parent_name,
+			void __iomem *base)
+{
+	struct regmap_config icst_regmap_conf = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+	};
+	struct regmap *map;
+
+	map = regmap_init_mmio(dev, base, &icst_regmap_conf);
+	if (IS_ERR(map)) {
+		pr_err("could not initialize ICST regmap\n");
+		return ERR_CAST(map);
+	}
+	return icst_clk_setup(dev, desc, name, parent_name, map);
+}
 EXPORT_SYMBOL_GPL(icst_clk_register);
-- 
2.4.3
