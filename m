Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Sergej Sawazki <ce3a@gmx.de>,
	Jyri Sarha <jsarha@ti.com>
Subject: [PATCH 1/2] clk: clk-gpio: Make GPIO clock provider use descriptors only
Date: Sun, 24 Sep 2017 18:19:18 +0200
Message-Id: <20170924161919.24832-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

After som grep:ing it turns out nothing in the kernel is really calling
clk_[hw_]_register_gpio_[gate|mux](). All existing instances are just
created directly from the device tree probe functions at the bottom of
the clk-gpio.c clock provider file.

This means we can change the signature of the function without any
consequences! Everyone should be using GPIO descriptors now, so let's
just go in and enforce that.

This saves a bit of code since GPIO descriptors know inherently if they
are active low so no need for the code keeping track of that.

We leave it to the caller to come up with the GPIO descriptor. It is
nowadays possible to do that even without a corresponding device, so
no excuse not to pass them around. The one in-kernel user lifecycles
it using devm_gpiod_get() in gpio_clk_driver_probe().

Cc: Sergej Sawazki <ce3a@gmx.de>
Cc: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I don't have GPIO clocks in my setups so this will obviously
need some testing.

I guess the public APIs in clk-provider.h could actually be
removed, but I'm not certain if that is proper. Maybe there
are plans for this driver to be used by other providers than the
device tree.
---
 drivers/clk/clk-gpio.c       | 90 +++++++++++++++++---------------------------
 include/linux/clk-provider.h | 12 +++---
 2 files changed, 41 insertions(+), 61 deletions(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 86b245746a6b..9d057073e110 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -15,9 +15,7 @@
 #include <linux/clk-provider.h>
 #include <linux/export.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_gpio.h>
 #include <linux/err.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
@@ -95,14 +93,12 @@ const struct clk_ops clk_gpio_mux_ops = {
 EXPORT_SYMBOL_GPL(clk_gpio_mux_ops);
 
 static struct clk_hw *clk_register_gpio(struct device *dev, const char *name,
-		const char * const *parent_names, u8 num_parents, unsigned gpio,
-		bool active_low, unsigned long flags,
-		const struct clk_ops *clk_gpio_ops)
+		const char * const *parent_names, u8 num_parents, struct gpio_desc *gpiod,
+		unsigned long flags, const struct clk_ops *clk_gpio_ops)
 {
 	struct clk_gpio *clk_gpio;
 	struct clk_hw *hw;
 	struct clk_init_data init = {};
-	unsigned long gpio_flags;
 	int err;
 
 	if (dev)
@@ -113,24 +109,13 @@ static struct clk_hw *clk_register_gpio(struct device *dev, const char *name,
 	if (!clk_gpio)
 		return ERR_PTR(-ENOMEM);
 
-	if (active_low)
-		gpio_flags = GPIOF_ACTIVE_LOW | GPIOF_OUT_INIT_HIGH;
-	else
-		gpio_flags = GPIOF_OUT_INIT_LOW;
-
-	if (dev)
-		err = devm_gpio_request_one(dev, gpio, gpio_flags, name);
-	else
-		err = gpio_request_one(gpio, gpio_flags, name);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			pr_err("%s: %s: Error requesting clock control gpio %u\n",
-					__func__, name, gpio);
-		if (!dev)
-			kfree(clk_gpio);
-
-		return ERR_PTR(err);
-	}
+	/*
+	 * Set to disabled no matter what: NOTE if the GPIO line is active low
+	 * the GPIO descriptor knows this and will set it high to deassert the
+	 * line. This assumes the GPIO descriptor has been requested using
+	 * GPIOD_ASIS by the callers so we need to initialize it as disabled here.
+	 */
+	gpiod_set_value(gpiod, 0);
 
 	init.name = name;
 	init.ops = clk_gpio_ops;
@@ -138,7 +123,7 @@ static struct clk_hw *clk_register_gpio(struct device *dev, const char *name,
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
 
-	clk_gpio->gpiod = gpio_to_desc(gpio);
+	clk_gpio->gpiod = gpiod;
 	clk_gpio->hw.init = &init;
 
 	hw = &clk_gpio->hw;
@@ -151,7 +136,6 @@ static struct clk_hw *clk_register_gpio(struct device *dev, const char *name,
 		return hw;
 
 	if (!dev) {
-		gpiod_put(clk_gpio->gpiod);
 		kfree(clk_gpio);
 	}
 
@@ -164,29 +148,27 @@ static struct clk_hw *clk_register_gpio(struct device *dev, const char *name,
  * @dev: device that is registering this clock
  * @name: name of this clock
  * @parent_name: name of this clock's parent
- * @gpio: gpio number to gate this clock
- * @active_low: true if gpio should be set to 0 to enable clock
+ * @gpiod: gpio descriptor to gate this clock
  * @flags: clock flags
  */
 struct clk_hw *clk_hw_register_gpio_gate(struct device *dev, const char *name,
-		const char *parent_name, unsigned gpio, bool active_low,
+		const char *parent_name, struct gpio_desc *gpiod,
 		unsigned long flags)
 {
 	return clk_register_gpio(dev, name,
 			(parent_name ? &parent_name : NULL),
-			(parent_name ? 1 : 0), gpio, active_low, flags,
+			(parent_name ? 1 : 0), gpiod, flags,
 			&clk_gpio_gate_ops);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_gpio_gate);
 
 struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
-		const char *parent_name, unsigned gpio, bool active_low,
+		const char *parent_name, struct gpio_desc *gpiod,
 		unsigned long flags)
 {
 	struct clk_hw *hw;
 
-	hw = clk_hw_register_gpio_gate(dev, name, parent_name, gpio, active_low,
-				       flags);
+	hw = clk_hw_register_gpio_gate(dev, name, parent_name, gpiod, flags);
 	if (IS_ERR(hw))
 		return ERR_CAST(hw);
 	return hw->clk;
@@ -199,13 +181,12 @@ EXPORT_SYMBOL_GPL(clk_register_gpio_gate);
  * @name: name of this clock
  * @parent_names: names of this clock's parents
  * @num_parents: number of parents listed in @parent_names
- * @gpio: gpio number to gate this clock
- * @active_low: true if gpio should be set to 0 to enable clock
+ * @gpiod: gpio descriptor to gate this clock
  * @flags: clock flags
  */
 struct clk_hw *clk_hw_register_gpio_mux(struct device *dev, const char *name,
-		const char * const *parent_names, u8 num_parents, unsigned gpio,
-		bool active_low, unsigned long flags)
+		const char * const *parent_names, u8 num_parents, struct gpio_desc *gpiod,
+		unsigned long flags)
 {
 	if (num_parents != 2) {
 		pr_err("mux-clock %s must have 2 parents\n", name);
@@ -213,18 +194,18 @@ struct clk_hw *clk_hw_register_gpio_mux(struct device *dev, const char *name,
 	}
 
 	return clk_register_gpio(dev, name, parent_names, num_parents,
-			gpio, active_low, flags, &clk_gpio_mux_ops);
+			gpiod, flags, &clk_gpio_mux_ops);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_gpio_mux);
 
 struct clk *clk_register_gpio_mux(struct device *dev, const char *name,
-		const char * const *parent_names, u8 num_parents, unsigned gpio,
-		bool active_low, unsigned long flags)
+		const char * const *parent_names, u8 num_parents, struct gpio_desc *gpiod,
+		unsigned long flags)
 {
 	struct clk_hw *hw;
 
 	hw = clk_hw_register_gpio_mux(dev, name, parent_names, num_parents,
-			gpio, active_low, flags);
+			gpiod, flags);
 	if (IS_ERR(hw))
 		return ERR_CAST(hw);
 	return hw->clk;
@@ -236,10 +217,10 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	const char **parent_names, *gpio_name;
 	unsigned int num_parents;
-	int gpio;
-	enum of_gpio_flags of_flags;
+	struct gpio_desc *gpiod;
 	struct clk *clk;
-	bool active_low, is_mux;
+	bool is_mux;
+	int ret;
 
 	num_parents = of_clk_get_parent_count(node);
 	if (num_parents) {
@@ -255,28 +236,27 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
 
 	is_mux = of_device_is_compatible(node, "gpio-mux-clock");
 
-	gpio_name = is_mux ? "select-gpios" : "enable-gpios";
-	gpio = of_get_named_gpio_flags(node, gpio_name, 0, &of_flags);
-	if (gpio < 0) {
-		if (gpio == -EPROBE_DEFER)
+	gpio_name = is_mux ? "select" : "enable";
+	gpiod = devm_gpiod_get(&pdev->dev, gpio_name, GPIOD_ASIS);
+	if (IS_ERR(gpiod)) {
+		ret = PTR_ERR(gpiod);
+		if (ret == -EPROBE_DEFER)
 			pr_debug("%s: %s: GPIOs not yet available, retry later\n",
 					node->name, __func__);
 		else
-			pr_err("%s: %s: Can't get '%s' DT property\n",
+			pr_err("%s: %s: Can't get '%s' named GPIO property\n",
 					node->name, __func__,
 					gpio_name);
-		return gpio;
+		return ret;
 	}
 
-	active_low = of_flags & OF_GPIO_ACTIVE_LOW;
-
 	if (is_mux)
 		clk = clk_register_gpio_mux(&pdev->dev, node->name,
-				parent_names, num_parents, gpio, active_low, 0);
+				parent_names, num_parents, gpiod, 0);
 	else
 		clk = clk_register_gpio_gate(&pdev->dev, node->name,
-				parent_names ?  parent_names[0] : NULL, gpio,
-				active_low, 0);
+				parent_names ?  parent_names[0] : NULL, gpiod,
+				0);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 5100ec1b5d55..063d8cb9926f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -682,10 +682,10 @@ struct clk_gpio {
 
 extern const struct clk_ops clk_gpio_gate_ops;
 struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
-		const char *parent_name, unsigned gpio, bool active_low,
+		const char *parent_name, struct gpio_desc *gpiod,
 		unsigned long flags);
 struct clk_hw *clk_hw_register_gpio_gate(struct device *dev, const char *name,
-		const char *parent_name, unsigned gpio, bool active_low,
+		const char *parent_name, struct gpio_desc *gpiod,
 		unsigned long flags);
 void clk_hw_unregister_gpio_gate(struct clk_hw *hw);
 
@@ -701,11 +701,11 @@ void clk_hw_unregister_gpio_gate(struct clk_hw *hw);
 
 extern const struct clk_ops clk_gpio_mux_ops;
 struct clk *clk_register_gpio_mux(struct device *dev, const char *name,
-		const char * const *parent_names, u8 num_parents, unsigned gpio,
-		bool active_low, unsigned long flags);
+		const char * const *parent_names, u8 num_parents, struct gpio_desc *gpiod,
+		unsigned long flags);
 struct clk_hw *clk_hw_register_gpio_mux(struct device *dev, const char *name,
-		const char * const *parent_names, u8 num_parents, unsigned gpio,
-		bool active_low, unsigned long flags);
+		const char * const *parent_names, u8 num_parents, struct gpio_desc *gpiod,
+		unsigned long flags);
 void clk_hw_unregister_gpio_mux(struct clk_hw *hw);
 
 /**
-- 
2.13.5
