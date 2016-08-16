Return-Path: <stephen.boyd@linaro.org>
Return-Path: <stephen.boyd@linaro.org>
From: Stephen Boyd <stephen.boyd@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2] clk: max77686: Migrate to clk_hw based OF and registration APIs
Date: Tue, 16 Aug 2016 15:38:56 -0700
Message-Id: <20160816223856.1282-1-stephen.boyd@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Now that we have clk_hw based provider APIs to register clks, we
can get rid of struct clk pointers while registering clks in
these drivers, allowing us to move closer to a clear split of
consumer and provider clk APIs.

Cc: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
---
 drivers/clk/clk-max77686.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index 19f620856571..b637f5979023 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -62,9 +62,8 @@ struct max77686_clk_init_data {
 
 struct max77686_clk_driver_data {
 	enum max77686_chip_name chip;
-	struct clk **clks;
 	struct max77686_clk_init_data *max_clk_data;
-	struct clk_onecell_data of_data;
+	size_t num_clks;
 };
 
 static const struct
@@ -160,6 +159,20 @@ static struct clk_ops max77686_clk_ops = {
 	.recalc_rate	= max77686_recalc_rate,
 };
 
+static struct clk_hw *
+of_clk_max77686_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct max77686_clk_driver_data *drv_data = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= drv_data->num_clks) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &drv_data->max_clk_data[idx].hw;
+}
+
 static int max77686_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -209,14 +222,8 @@ static int max77686_clk_probe(struct platform_device *pdev)
 	if (!drv_data->max_clk_data)
 		return -ENOMEM;
 
-	drv_data->clks = devm_kcalloc(dev, num_clks,
-				      sizeof(*drv_data->clks), GFP_KERNEL);
-	if (!drv_data->clks)
-		return -ENOMEM;
-
 	for (i = 0; i < num_clks; i++) {
 		struct max77686_clk_init_data *max_clk_data;
-		struct clk *clk;
 		const char *clk_name;
 
 		max_clk_data = &drv_data->max_clk_data[i];
@@ -236,30 +243,23 @@ static int max77686_clk_probe(struct platform_device *pdev)
 
 		max_clk_data->hw.init = &max_clk_data->clk_idata;
 
-		clk = devm_clk_register(dev, &max_clk_data->hw);
-		if (IS_ERR(clk)) {
-			ret = PTR_ERR(clk);
+		ret = devm_clk_hw_register(dev, &max_clk_data->hw);
+		if (ret) {
 			dev_err(dev, "Failed to clock register: %d\n", ret);
 			return ret;
 		}
 
-		ret = clk_register_clkdev(clk, max_clk_data->clk_idata.name,
-					  NULL);
+		ret = clk_hw_register_clkdev(&max_clk_data->hw,
+					     max_clk_data->clk_idata.name, NULL);
 		if (ret < 0) {
 			dev_err(dev, "Failed to clkdev register: %d\n", ret);
 			return ret;
 		}
-		drv_data->clks[i] = clk;
 	}
 
-	platform_set_drvdata(pdev, drv_data);
-
 	if (parent->of_node) {
-		drv_data->of_data.clks = drv_data->clks;
-		drv_data->of_data.clk_num = num_clks;
-		ret = of_clk_add_provider(parent->of_node,
-					  of_clk_src_onecell_get,
-					  &drv_data->of_data);
+		ret = of_clk_add_hw_provider(parent->of_node, of_clk_max77686_get,
+					     drv_data);
 
 		if (ret < 0) {
 			dev_err(dev, "Failed to register OF clock provider: %d\n",
-- 
2.9.0.rc2.8.ga28705d
