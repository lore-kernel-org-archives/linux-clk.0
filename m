Return-Path: <ce3a@gmx.de>
From: Sergej Sawazki <ce3a@gmx.de>
To: mturquette@linaro.org,
	sboyd@codeaurora.org,
	jsarha@ti.com
Cc: linux-clk@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>
Subject: [PATCH v2] clk: add gpio controlled clock multiplexer
Date: Sun, 24 May 2015 11:01:22 +0200
Message-Id: <1432458082-18299-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

Add a common clock driver for basic gpio controlled clock multiplexers.
This driver can be used for devices like 5V41068A or 831721I from IDT
or for discrete multiplexer circuits. The 'select' pin selects one of
two parent clocks.

Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
---

Stephen, Jyri,
thanks for your comments.

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
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-gpio-mux.c                         | 227 +++++++++++++++++++++
 include/linux/clk-provider.h                       |  22 ++
 4 files changed, 269 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/gpio-mux-clock.txt
 create mode 100644 drivers/clk/clk-gpio-mux.c

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
index d5fba5b..1732905 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_COMMON_CLK)	+= clk-mux.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-composite.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fractional-divider.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-gpio-gate.o
+obj-$(CONFIG_COMMON_CLK)	+= clk-gpio-mux.o
 ifeq ($(CONFIG_OF), y)
 obj-$(CONFIG_COMMON_CLK)	+= clk-conf.o
 endif
diff --git a/drivers/clk/clk-gpio-mux.c b/drivers/clk/clk-gpio-mux.c
new file mode 100644
index 0000000..8a91d42
--- /dev/null
+++ b/drivers/clk/clk-gpio-mux.c
@@ -0,0 +1,227 @@
+/*
+ * Author: Sergej Sawazki <ce3a@gmx.de>
+ * Based on clk-gpio-gate.c by Jyri Sarha and ti/mux.c by Tero Kristo
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Gpio controlled clock multiplexer implementation
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/of_gpio.h>
+#include <linux/err.h>
+#include <linux/device.h>
+
+/**
+ * DOC: basic clock multiplexer which can be controlled with a gpio output
+ * Traits of this clock:
+ * prepare - clk_prepare only ensures that parents are prepared
+ * rate - rate is only affected by parent switching.  No clk_set_rate support
+ * parent - parent is adjustable through clk_set_parent
+ */
+
+#define to_clk_gpio_mux(_hw) container_of(_hw, struct clk_gpio_mux, hw)
+
+static u8 clk_gpio_mux_get_parent(struct clk_hw *hw)
+{
+	struct clk_gpio_mux *clk = to_clk_gpio_mux(hw);
+
+	return gpiod_get_value(clk->gpiod);
+}
+
+static int clk_gpio_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_gpio_mux *clk = to_clk_gpio_mux(hw);
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
+ * clk_register_gpio_mux - register a gpio clock mux with the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_names: names of this clock's parents
+ * @num_parents: number of parents listed in @parent_names
+ * @gpiod: gpio descriptor to select the parent of this clock multiplexer
+ * @clk_flags: optional flags for basic clock
+ */
+struct clk *clk_register_gpio_mux(struct device *dev, const char *name,
+		const char **parent_names, u8 num_parents,
+		struct gpio_desc *gpiod, unsigned long clk_flags)
+{
+	struct clk_gpio_mux *clk_gpio_mux;
+	struct clk *clk;
+	struct clk_init_data init = { NULL };
+	unsigned long gpio_flags;
+	int err;
+
+	if (dev)
+		clk_gpio_mux = devm_kzalloc(dev, sizeof(struct clk_gpio_mux),
+				GFP_KERNEL);
+	else
+		clk_gpio_mux = kzalloc(sizeof(struct clk_gpio_mux), GFP_KERNEL);
+
+	if (!clk_gpio_mux)
+		return ERR_PTR(-ENOMEM);
+
+	if (gpiod_is_active_low(gpiod))
+		gpio_flags = GPIOF_OUT_INIT_HIGH;
+	else
+		gpio_flags = GPIOF_OUT_INIT_LOW;
+
+	if (dev)
+		err = devm_gpio_request_one(dev, desc_to_gpio(gpiod),
+				gpio_flags, name);
+	else
+		err = gpio_request_one(desc_to_gpio(gpiod),
+				gpio_flags, name);
+
+	if (err) {
+		if (err != -EPROBE_DEFER)
+			pr_err("%s: %s: Error requesting gpio %u\n",
+					name, __func__, desc_to_gpio(gpiod));
+		return ERR_PTR(err);
+	}
+	clk_gpio_mux->gpiod = gpiod;
+
+	if (num_parents != 2)
+		return ERR_PTR(-EINVAL);
+
+	init.name = name;
+	init.ops = &clk_gpio_mux_ops;
+	init.flags = clk_flags | CLK_IS_BASIC;
+	init.parent_names = parent_names;
+	init.num_parents = num_parents;
+
+	clk_gpio_mux->hw.init = &init;
+
+	if (dev)
+		clk = devm_clk_register(dev, &clk_gpio_mux->hw);
+	else
+		clk = clk_register(NULL, &clk_gpio_mux->hw);
+
+	if (!IS_ERR(clk)) {
+		pr_debug("%s: %s: Successful registration\n", name, __func__);
+		return clk;
+	}
+
+	if (!dev) {
+		kfree(clk_gpio_mux);
+		gpiod_put(gpiod);
+	}
+
+	return clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_gpio_mux);
+
+#ifdef CONFIG_OF
+/**
+ * The clk_register_gpio_mux has to be delayed, because the EPROBE_DEFER
+ * can not be handled properly at of_clk_init() call time.
+ */
+
+struct clk_gpio_mux_delayed_register_data {
+	struct device_node *node;
+	struct mutex lock;
+	struct clk *clk;
+};
+
+static struct clk *of_clk_gpio_mux_delayed_register_get(
+		struct of_phandle_args *clkspec,
+		void *_data)
+{
+	struct clk_gpio_mux_delayed_register_data *data = _data;
+	struct clk *clk;
+	const char *clk_name = data->node->name;
+	int i, num_parents;
+	const char **parent_names;
+	struct gpio_desc *gpiod;
+	int gpio;
+
+	mutex_lock(&data->lock);
+
+	if (data->clk) {
+		mutex_unlock(&data->lock);
+		return data->clk;
+	}
+
+	gpio = of_get_named_gpio_flags(data->node, "select-gpios", 0, NULL);
+	if (!gpio_is_valid(gpio))
+		goto err_gpio;
+	gpiod = gpio_to_desc(gpio);
+
+	num_parents = of_clk_get_parent_count(data->node);
+	if (num_parents != 2) {
+		pr_err("mux-clock %s must have 2 parents\n", data->node->name);
+		return ERR_PTR(-EINVAL);
+	}
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
+	clk = clk_register_gpio_mux(NULL, clk_name, parent_names, num_parents,
+			gpiod, 0);
+	if (IS_ERR(clk)) {
+		mutex_unlock(&data->lock);
+		return clk;
+	}
+
+	data->clk = clk;
+	mutex_unlock(&data->lock);
+
+	return clk;
+
+err_gpio:
+	mutex_unlock(&data->lock);
+	if (gpio == -EPROBE_DEFER)
+		pr_debug("%s: %s: GPIOs not yet available, retry later\n",
+				clk_name, __func__);
+	else
+		pr_err("%s: %s: Can't get GPIOs\n",
+				clk_name, __func__);
+
+	return ERR_PTR(gpio);
+}
+
+/**
+ * of_gpio_mux_clk_setup() - Setup function for gpio controlled clock mux
+ */
+void __init of_gpio_mux_clk_setup(struct device_node *node)
+{
+	struct clk_gpio_mux_delayed_register_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return;
+
+	data->node = node;
+	mutex_init(&data->lock);
+
+	of_clk_add_provider(node, of_clk_gpio_mux_delayed_register_get, data);
+}
+EXPORT_SYMBOL_GPL(of_gpio_mux_clk_setup);
+CLK_OF_DECLARE(gpio_mux_clk, "gpio-mux-clock", of_gpio_mux_clk_setup);
+#endif
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2839c63..119b8a9 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -521,6 +521,28 @@ struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
 void of_gpio_clk_gate_setup(struct device_node *node);
 
 /**
+ * struct clk_gpio_mux - gpio controlled clock multiplexer
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @gpiod:	gpio descriptor to select the parent of this clock multiplexer
+ *
+ * Clock with a gpio control for selecting the parent clock.
+ * Implements .get_parent, .set_parent and .determine_rate
+ */
+
+struct clk_gpio_mux {
+	struct clk_hw	hw;
+	struct gpio_desc *gpiod;
+};
+
+extern const struct clk_ops clk_gpio_mux_ops;
+struct clk *clk_register_gpio_mux(struct device *dev, const char *name,
+		const char **parent_names, u8 num_parents,
+		struct gpio_desc *gpiod, unsigned long clk_flags);
+
+void of_gpio_mux_clk_setup(struct device_node *node);
+
+/**
  * clk_register - allocate a new clock, register it and return an opaque cookie
  * @dev: device that is registering this clock
  * @hw: link to hardware-specific clock data
-- 
1.9.1
