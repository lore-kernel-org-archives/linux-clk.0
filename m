Return-Path: <ce3a@gmx.de>
From: Sergej Sawazki <ce3a@gmx.de>
To: sboyd@codeaurora.org,
	mturquette@linaro.org,
	jsarha@ti.com
Cc: linux-clk@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>
Subject: [PATCH v3] clk: add gpio controlled clock multiplexer
Date: Sun,  7 Jun 2015 21:44:24 +0200
Message-Id: <1433706264-30008-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

Add a common clock driver for basic gpio controlled clock multiplexers.
This driver can be used for devices like 5V41068A or 831721I from IDT
or for discrete multiplexer circuits. The 'select' pin selects one of
two parent clocks.

Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
---

Stephen, Jyri,
thanks for your comments.

Based on clk-next.

Changes since v2:
 * Suggested by Stephen Boyd:
   - Delete unneeded includes.
   - Fix some style issues.
   - Put gpio-gate-clock and gpio-mux-clock into a new file (clk-gpio.c) and
     refactor the code to minimize code duplication.

Changes since v1:
 * Suggested by Stephen Boyd and Jyri Sarha:
   - Remove the optional enable/disable support. If enable/disable is
     required, the gpio-mux-clock can be used in combination with the
     gpio-gate-clock.

 * Suggested by Stephen Boyd:
   - Remove the (index > 1)-check from clk_gpio_mux_set_parent().
   - Stay silent if gpio_request_one() fails with -EPROBE_DEFER.
   - Make sure num_parents is 2 in clk_register_gpio_mux().
   - Use devm_clk_register() if a device is provided.
   - Remove the flags variable from of_clk_gpio_mux_delayed_register_get().
   - Fix num_parents check in of_clk_gpio_mux_delayed_register_get().
   - Use kcalloc() for parent_names array allocation.
   - Use pr_debug() instead of pr_warn() for the EPROBE_DEFER message.
   - Use kzalloc(sizeof(*data)... ) instead of kzalloc(sizeof(struct 
     clk_gpio_mux_delayed_register_data)... ) in of_gpio_mux_clk_setup().

Many thanks for your time and effort,
Sergej

 .../devicetree/bindings/clock/gpio-mux-clock.txt   |  19 ++
 drivers/clk/Makefile                               |   2 +-
 drivers/clk/clk-gpio-gate.c                        | 207 -------------
 drivers/clk/clk-gpio.c                             | 332 +++++++++++++++++++++
 include/linux/clk-provider.h                       |  17 ++
 5 files changed, 369 insertions(+), 208 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/gpio-mux-clock.txt
 delete mode 100644 drivers/clk/clk-gpio-gate.c
 create mode 100644 drivers/clk/clk-gpio.c

diff --git a/Documentation/devicetree/bindings/clock/gpio-mux-clock.txt b/Documentation/devicetree/bindings/clock/gpio-mux-clock.txt
new file mode 100644
index 0000000..2be1e03
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/gpio-mux-clock.txt
@@ -0,0 +1,19 @@
+Binding for simple gpio clock multiplexer.
+
+This binding uses the common clock binding[1].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible : shall be "gpio-mux-clock".
+- clocks: list of two references to parent clocks.
+- #clock-cells : from common clock binding; shall be set to 0.
+- select-gpios : GPIO reference for selecting the parent clock.
+
+Example:
+	clock {
+		compatible = "gpio-mux-clock";
+		clocks = <&parentclk1>, <&parentclk2>;
+		#clock-cells = <0>;
+		select-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+	};
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index d965b3f..c2e1e4c 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -9,7 +9,7 @@ obj-$(CONFIG_COMMON_CLK)	+= clk-gate.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-mux.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-composite.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fractional-divider.o
-obj-$(CONFIG_COMMON_CLK)	+= clk-gpio-gate.o
+obj-$(CONFIG_COMMON_CLK)	+= clk-gpio.o
 ifeq ($(CONFIG_OF), y)
 obj-$(CONFIG_COMMON_CLK)	+= clk-conf.o
 endif
diff --git a/drivers/clk/clk-gpio-gate.c b/drivers/clk/clk-gpio-gate.c
deleted file mode 100644
index f564e62..0000000
--- a/drivers/clk/clk-gpio-gate.c
+++ /dev/null
@@ -1,207 +0,0 @@
-/*
- * Copyright (C) 2013 - 2014 Texas Instruments Incorporated - http://www.ti.com
- * Author: Jyri Sarha <jsarha@ti.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * Gpio gated clock implementation
- */
-
-#include <linux/clk-provider.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/gpio/consumer.h>
-#include <linux/of_gpio.h>
-#include <linux/err.h>
-#include <linux/device.h>
-
-/**
- * DOC: basic gpio gated clock which can be enabled and disabled
- *      with gpio output
- * Traits of this clock:
- * prepare - clk_(un)prepare only ensures parent is (un)prepared
- * enable - clk_enable and clk_disable are functional & control gpio
- * rate - inherits rate from parent.  No clk_set_rate support
- * parent - fixed parent.  No clk_set_parent support
- */
-
-#define to_clk_gpio(_hw) container_of(_hw, struct clk_gpio, hw)
-
-static int clk_gpio_gate_enable(struct clk_hw *hw)
-{
-	struct clk_gpio *clk = to_clk_gpio(hw);
-
-	gpiod_set_value(clk->gpiod, 1);
-
-	return 0;
-}
-
-static void clk_gpio_gate_disable(struct clk_hw *hw)
-{
-	struct clk_gpio *clk = to_clk_gpio(hw);
-
-	gpiod_set_value(clk->gpiod, 0);
-}
-
-static int clk_gpio_gate_is_enabled(struct clk_hw *hw)
-{
-	struct clk_gpio *clk = to_clk_gpio(hw);
-
-	return gpiod_get_value(clk->gpiod);
-}
-
-const struct clk_ops clk_gpio_gate_ops = {
-	.enable = clk_gpio_gate_enable,
-	.disable = clk_gpio_gate_disable,
-	.is_enabled = clk_gpio_gate_is_enabled,
-};
-EXPORT_SYMBOL_GPL(clk_gpio_gate_ops);
-
-/**
- * clk_register_gpio - register a gpip clock with the clock framework
- * @dev: device that is registering this clock
- * @name: name of this clock
- * @parent_name: name of this clock's parent
- * @gpio: gpio number to gate this clock
- * @active_low: true if gpio should be set to 0 to enable clock
- * @flags: clock flags
- */
-struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
-		const char *parent_name, unsigned gpio, bool active_low,
-		unsigned long flags)
-{
-	struct clk_gpio *clk_gpio = NULL;
-	struct clk *clk = ERR_PTR(-EINVAL);
-	struct clk_init_data init = { NULL };
-	unsigned long gpio_flags;
-	int err;
-
-	if (active_low)
-		gpio_flags = GPIOF_ACTIVE_LOW | GPIOF_OUT_INIT_HIGH;
-	else
-		gpio_flags = GPIOF_OUT_INIT_LOW;
-
-	if (dev)
-		err = devm_gpio_request_one(dev, gpio, gpio_flags, name);
-	else
-		err = gpio_request_one(gpio, gpio_flags, name);
-
-	if (err) {
-		pr_err("%s: %s: Error requesting clock control gpio %u\n",
-		       __func__, name, gpio);
-		return ERR_PTR(err);
-	}
-
-	if (dev)
-		clk_gpio = devm_kzalloc(dev, sizeof(struct clk_gpio),
-					GFP_KERNEL);
-	else
-		clk_gpio = kzalloc(sizeof(struct clk_gpio), GFP_KERNEL);
-
-	if (!clk_gpio) {
-		clk = ERR_PTR(-ENOMEM);
-		goto clk_register_gpio_gate_err;
-	}
-
-	init.name = name;
-	init.ops = &clk_gpio_gate_ops;
-	init.flags = flags | CLK_IS_BASIC;
-	init.parent_names = (parent_name ? &parent_name : NULL);
-	init.num_parents = (parent_name ? 1 : 0);
-
-	clk_gpio->gpiod = gpio_to_desc(gpio);
-	clk_gpio->hw.init = &init;
-
-	clk = clk_register(dev, &clk_gpio->hw);
-
-	if (!IS_ERR(clk))
-		return clk;
-
-	if (!dev)
-		kfree(clk_gpio);
-
-clk_register_gpio_gate_err:
-	if (!dev)
-		gpio_free(gpio);
-
-	return clk;
-}
-EXPORT_SYMBOL_GPL(clk_register_gpio_gate);
-
-#ifdef CONFIG_OF
-/**
- * The clk_register_gpio_gate has to be delayed, because the EPROBE_DEFER
- * can not be handled properly at of_clk_init() call time.
- */
-
-struct clk_gpio_gate_delayed_register_data {
-	struct device_node *node;
-	struct mutex lock;
-	struct clk *clk;
-};
-
-static struct clk *of_clk_gpio_gate_delayed_register_get(
-		struct of_phandle_args *clkspec,
-		void *_data)
-{
-	struct clk_gpio_gate_delayed_register_data *data = _data;
-	struct clk *clk;
-	const char *clk_name = data->node->name;
-	const char *parent_name;
-	int gpio;
-	enum of_gpio_flags of_flags;
-
-	mutex_lock(&data->lock);
-
-	if (data->clk) {
-		mutex_unlock(&data->lock);
-		return data->clk;
-	}
-
-	gpio = of_get_named_gpio_flags(data->node, "enable-gpios", 0,
-						&of_flags);
-	if (gpio < 0) {
-		mutex_unlock(&data->lock);
-		if (gpio != -EPROBE_DEFER)
-			pr_err("%s: %s: Can't get 'enable-gpios' DT property\n",
-			       __func__, clk_name);
-		return ERR_PTR(gpio);
-	}
-
-	parent_name = of_clk_get_parent_name(data->node, 0);
-
-	clk = clk_register_gpio_gate(NULL, clk_name, parent_name, gpio,
-					of_flags & OF_GPIO_ACTIVE_LOW, 0);
-	if (IS_ERR(clk)) {
-		mutex_unlock(&data->lock);
-		return clk;
-	}
-
-	data->clk = clk;
-	mutex_unlock(&data->lock);
-
-	return clk;
-}
-
-/**
- * of_gpio_gate_clk_setup() - Setup function for gpio controlled clock
- */
-static void __init of_gpio_gate_clk_setup(struct device_node *node)
-{
-	struct clk_gpio_gate_delayed_register_data *data;
-
-	data = kzalloc(sizeof(struct clk_gpio_gate_delayed_register_data),
-		       GFP_KERNEL);
-	if (!data)
-		return;
-
-	data->node = node;
-	mutex_init(&data->lock);
-
-	of_clk_add_provider(node, of_clk_gpio_gate_delayed_register_get, data);
-}
-CLK_OF_DECLARE(gpio_gate_clk, "gpio-gate-clock", of_gpio_gate_clk_setup);
-#endif
diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
new file mode 100644
index 0000000..f2bd610
--- /dev/null
+++ b/drivers/clk/clk-gpio.c
@@ -0,0 +1,332 @@
+/*
+ * Copyright (C) 2013 - 2014 Texas Instruments Incorporated - http://www.ti.com
+ *
+ * Authors:
+ *    Jyri Sarha <jsarha@ti.com>
+ *    Sergej Sawazki <ce3a@gmx.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Gpio controlled clock implementation
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/export.h>
+#include <linux/slab.h>
+#include <linux/of_gpio.h>
+#include <linux/err.h>
+#include <linux/device.h>
+
+/**
+ * DOC: basic gpio gated clock which can be enabled and disabled
+ *      with gpio output
+ * Traits of this clock:
+ * prepare - clk_(un)prepare only ensures parent is (un)prepared
+ * enable - clk_enable and clk_disable are functional & control gpio
+ * rate - inherits rate from parent.  No clk_set_rate support
+ * parent - fixed parent.  No clk_set_parent support
+ */
+
+#define to_clk_gpio(_hw) container_of(_hw, struct clk_gpio, hw)
+
+static int clk_gpio_gate_enable(struct clk_hw *hw)
+{
+	struct clk_gpio *clk = to_clk_gpio(hw);
+
+	gpiod_set_value(clk->gpiod, 1);
+	pr_debug("%s: %s\n", __clk_get_name(hw->clk), __func__);
+
+	return 0;
+}
+
+static void clk_gpio_gate_disable(struct clk_hw *hw)
+{
+	struct clk_gpio *clk = to_clk_gpio(hw);
+
+	gpiod_set_value(clk->gpiod, 0);
+	pr_debug("%s: %s\n", __clk_get_name(hw->clk), __func__);
+}
+
+static int clk_gpio_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_gpio *clk = to_clk_gpio(hw);
+
+	return gpiod_get_value(clk->gpiod);
+}
+
+const struct clk_ops clk_gpio_gate_ops = {
+	.enable = clk_gpio_gate_enable,
+	.disable = clk_gpio_gate_disable,
+	.is_enabled = clk_gpio_gate_is_enabled,
+};
+EXPORT_SYMBOL_GPL(clk_gpio_gate_ops);
+
+/**
+ * DOC: basic clock multiplexer which can be controlled with a gpio output
+ * Traits of this clock:
+ * prepare - clk_prepare only ensures that parents are prepared
+ * rate - rate is only affected by parent switching.  No clk_set_rate support
+ * parent - parent is adjustable through clk_set_parent
+ */
+
+static u8 clk_gpio_mux_get_parent(struct clk_hw *hw)
+{
+	struct clk_gpio *clk = to_clk_gpio(hw);
+
+	return gpiod_get_value(clk->gpiod);
+}
+
+static int clk_gpio_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_gpio *clk = to_clk_gpio(hw);
+
+	gpiod_set_value(clk->gpiod, index);
+	pr_debug("%s: %s: index = %d\n",
+			__clk_get_name(hw->clk), __func__, index);
+
+	return 0;
+}
+
+const struct clk_ops clk_gpio_mux_ops = {
+	.get_parent = clk_gpio_mux_get_parent,
+	.set_parent = clk_gpio_mux_set_parent,
+	.determine_rate = __clk_mux_determine_rate,
+};
+EXPORT_SYMBOL_GPL(clk_gpio_mux_ops);
+
+/**
+ * Register functions for gpio controlled clocks
+ */
+
+static struct clk *clk_register_gpio(struct device *dev, const char *name,
+		const char **parent_names, u8 num_parents, unsigned gpio,
+		bool active_low, unsigned long flags,
+		const struct clk_ops *clk_gpio_ops)
+{
+	struct clk_gpio *clk_gpio;
+	struct clk *clk;
+	struct clk_init_data init = {};
+	unsigned long gpio_flags;
+	int err;
+
+	if (dev)
+		clk_gpio = devm_kzalloc(dev, sizeof(*clk_gpio),	GFP_KERNEL);
+	else
+		clk_gpio = kzalloc(sizeof(*clk_gpio), GFP_KERNEL);
+
+	if (!clk_gpio)
+		return ERR_PTR(-ENOMEM);
+
+	if (active_low)
+		gpio_flags = GPIOF_ACTIVE_LOW | GPIOF_OUT_INIT_HIGH;
+	else
+		gpio_flags = GPIOF_OUT_INIT_LOW;
+
+	if (dev)
+		err = devm_gpio_request_one(dev, gpio, gpio_flags, name);
+	else
+		err = gpio_request_one(gpio, gpio_flags, name);
+	if (err) {
+		if (err != -EPROBE_DEFER)
+			pr_err("%s: %s: Error requesting GPIO %u\n",
+					name, __func__, gpio);
+		return ERR_PTR(err);
+	}
+
+	init.name = name;
+	init.ops = clk_gpio_ops;
+	init.flags = flags | CLK_IS_BASIC;
+	init.parent_names = parent_names;
+	init.num_parents = num_parents;
+
+	clk_gpio->gpiod = gpio_to_desc(gpio);
+	clk_gpio->hw.init = &init;
+
+	if (dev)
+		clk = devm_clk_register(dev, &clk_gpio->hw);
+	else
+		clk = clk_register(NULL, &clk_gpio->hw);
+
+	if (!IS_ERR(clk)) {
+		pr_debug("%s: %s: Successful registration\n", name, __func__);
+		return clk;
+	}
+
+	if (!dev) {
+		kfree(clk_gpio);
+		gpiod_put(clk_gpio->gpiod);
+	}
+
+	return clk;
+}
+
+/**
+ * clk_register_gpio - register a gpip clock with the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_name: name of this clock's parent
+ * @gpio: gpio number to gate this clock
+ * @active_low: true if gpio should be set to 0 to enable clock
+ * @flags: clock flags
+ */
+struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
+		const char *parent_name, unsigned gpio, bool active_low,
+		unsigned long flags)
+{
+	return clk_register_gpio(dev, name,
+			(parent_name ? &parent_name : NULL),
+			(parent_name ? 1 : 0), gpio, active_low, flags,
+			&clk_gpio_gate_ops);
+}
+EXPORT_SYMBOL_GPL(clk_register_gpio_gate);
+
+/**
+ * clk_register_gpio_mux - register a gpio clock mux with the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_names: names of this clock's parents
+ * @num_parents: number of parents listed in @parent_names
+ * @gpio: gpio number to gate this clock
+ * @active_low: true if gpio should be set to 0 to enable clock
+ * @flags: clock flags
+ */
+struct clk *clk_register_gpio_mux(struct device *dev, const char *name,
+		const char **parent_names, u8 num_parents, unsigned gpio,
+		bool active_low, unsigned long flags)
+{
+	if (num_parents != 2) {
+		pr_err("mux-clock %s must have 2 parents\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return clk_register_gpio(dev, name, parent_names, num_parents,
+			gpio, active_low, flags, &clk_gpio_mux_ops);
+}
+EXPORT_SYMBOL_GPL(clk_register_gpio_mux);
+
+#ifdef CONFIG_OF
+/**
+ * clk_register_get has to be delayed, because -EPROBE_DEFER
+ * can not be handled properly at of_clk_init() call time.
+ */
+
+struct clk_gpio_delayed_register_data {
+	const char *gpio_name;
+	struct device_node *node;
+	struct mutex lock;
+	struct clk *clk;
+	struct clk *(*clk_register_get)(const char *name,
+			const char **parent_names, u8 num_parents,
+			unsigned gpio, bool active_low);
+};
+
+static struct clk *of_clk_gpio_delayed_register_get(
+		struct of_phandle_args *clkspec, void *_data)
+{
+	struct clk_gpio_delayed_register_data *data = _data;
+	struct clk *clk;
+	const char **parent_names;
+	int i, num_parents;
+	int gpio;
+	enum of_gpio_flags of_flags;
+
+	mutex_lock(&data->lock);
+
+	if (data->clk) {
+		mutex_unlock(&data->lock);
+		return data->clk;
+	}
+
+	gpio = of_get_named_gpio_flags(data->node, data->gpio_name, 0,
+			&of_flags);
+	if (gpio < 0) {
+		mutex_unlock(&data->lock);
+		if (gpio == -EPROBE_DEFER)
+			pr_debug("%s: %s: GPIOs not yet available, retry later\n",
+					data->node->name, __func__);
+		else
+			pr_err("%s: %s: Can't get '%s' DT property\n",
+					data->node->name, __func__,
+					data->gpio_name);
+		return ERR_PTR(gpio);
+	}
+
+	num_parents = of_clk_get_parent_count(data->node);
+
+	parent_names = kcalloc(num_parents, sizeof(char *), GFP_KERNEL);
+	if (!parent_names) {
+		kfree(parent_names);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	for (i = 0; i < num_parents; i++)
+		parent_names[i] = of_clk_get_parent_name(data->node, i);
+
+	clk = data->clk_register_get(data->node->name, parent_names,
+			num_parents, gpio, of_flags & OF_GPIO_ACTIVE_LOW);
+	if (IS_ERR(clk)) {
+		mutex_unlock(&data->lock);
+		return clk;
+	}
+
+	data->clk = clk;
+	mutex_unlock(&data->lock);
+
+	return clk;
+}
+
+static struct clk *of_clk_gpio_gate_delayed_register_get(const char *name,
+		const char **parent_names, u8 num_parents,
+		unsigned gpio, bool active_low)
+{
+	return clk_register_gpio_gate(NULL, name, parent_names[0],
+			gpio, active_low, 0);
+}
+
+static struct clk *of_clk_gpio_mux_delayed_register_get(const char *name,
+		const char **parent_names, u8 num_parents, unsigned gpio,
+		bool active_low)
+{
+	return clk_register_gpio_mux(NULL, name, parent_names, num_parents,
+			gpio, active_low, 0);
+}
+
+/**
+ * Setup functions for gpio controlled clocks
+ */
+static void __init of_gpio_clk_setup(struct device_node *node,
+		const char *gpio_name,
+		struct clk *(*clk_register_get)(const char *name,
+				const char **parent_names, u8 num_parents,
+				unsigned gpio, bool active_low))
+{
+	struct clk_gpio_delayed_register_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return;
+
+	data->node = node;
+	data->gpio_name = gpio_name;
+	data->clk_register_get = clk_register_get;
+	mutex_init(&data->lock);
+
+	of_clk_add_provider(node, of_clk_gpio_delayed_register_get, data);
+}
+
+static void __init of_gpio_gate_clk_setup(struct device_node *node)
+{
+	of_gpio_clk_setup(node, "enable-gpios",
+		of_clk_gpio_gate_delayed_register_get);
+}
+CLK_OF_DECLARE(gpio_gate_clk, "gpio-gate-clock", of_gpio_gate_clk_setup);
+
+void __init of_gpio_mux_clk_setup(struct device_node *node)
+{
+	of_gpio_clk_setup(node, "select-gpios",
+		of_clk_gpio_mux_delayed_register_get);
+}
+CLK_OF_DECLARE(gpio_mux_clk, "gpio-mux-clock", of_gpio_mux_clk_setup);
+#endif
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 5378c2a..934a8cd 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -549,6 +549,23 @@ struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
 void of_gpio_clk_gate_setup(struct device_node *node);
 
 /**
+ * struct clk_gpio_mux - gpio controlled clock multiplexer
+ *
+ * @hw:		see struct clk_gpio
+ * @gpiod:	gpio descriptor to select the parent of this clock multiplexer
+ *
+ * Clock with a gpio control for selecting the parent clock.
+ * Implements .get_parent, .set_parent and .determine_rate
+ */
+
+extern const struct clk_ops clk_gpio_mux_ops;
+struct clk *clk_register_gpio_mux(struct device *dev, const char *name,
+		const char **parent_names, u8 num_parents, unsigned gpio,
+		bool active_low, unsigned long flags);
+
+void of_gpio_mux_clk_setup(struct device_node *node);
+
+/**
  * clk_register - allocate a new clock, register it and return an opaque cookie
  * @dev: device that is registering this clock
  * @hw: link to hardware-specific clock data
-- 
1.9.1
