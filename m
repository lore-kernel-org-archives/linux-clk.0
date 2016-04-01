Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-clk@vger.kernel.org,
	mturquette@baylibre.com,
	sjan@baylibre.com,
	ahaslam@baylibre.com,
	abailon@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/5] clk: Introduce clk-schrodinger as Quantum clock implementation
Date: Fri,  1 Apr 2016 13:37:12 +0200
Message-Id: <1459510635-8204-3-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
References: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

For handling the new quantum physics, add a Quantum clock
or Schrodingers clock in reference of the great experiment,
organize a new implementation that describes a simple but
Logical quantum clock.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/clk-schrodinger.c | 110 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h  |  17 +++++++
 2 files changed, 127 insertions(+)
 create mode 100644 drivers/clk/clk-schrodinger.c

diff --git a/drivers/clk/clk-schrodinger.c b/drivers/clk/clk-schrodinger.c
new file mode 100644
index 0000000..14dd329
--- /dev/null
+++ b/drivers/clk/clk-schrodinger.c
@@ -0,0 +1,110 @@
+/*
+ * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (C) 2010-2011 Canonical Ltd <jeremy.kerr@canonical.com>
+ * Copyright (C) 2011-2012 Mike Turquette, Linaro Ltd <mturquette@linaro.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Schrodinger's clock implementation
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/of.h>
+
+/*
+ * basic unknown-rate clock that cannot gate
+ *
+ * Traits of this clock:
+ * parent - fixed parent.  No clk_set_parent support
+ */
+
+const struct clk_ops clk_schrodinger_ops = {
+	/* This is the point, since this clock is is in a quantum state,
+	 * any action could lead to a physical degradation of the clock */
+};
+EXPORT_SYMBOL_GPL(clk_schrodinger_ops);
+
+/**
+ * clk_register_schrodinger - register schrodinger clock with the
+ *							   clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_name: name of clock's parent
+ * @flags: framework-specific flags
+ * @fixed_accuracy: non-adjustable clock rate
+ */
+struct clk *clk_register_schrodinger_with_accuracy(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags)
+{
+	struct clk_schrodinger *schrodinger;
+	struct clk *clk;
+	struct clk_init_data init;
+
+	/* allocate schrodinger clock */
+	fixed = kzalloc(sizeof(*fixed), GFP_KERNEL);
+	if (!fixed)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &clk_schrodinger_ops;
+	init.flags = flags | CLK_STATE_IS_QUANTUM;
+	init.parent_names = (parent_name ? &parent_name : NULL);
+	init.num_parents = (parent_name ? 1 : 0);
+
+	/* struct clk_schrodinger assignments */
+	fixed->hw.init = &init;
+
+	/* register the clock */
+	clk = clk_register(dev, &fixed->hw);
+	if (IS_ERR(clk))
+		kfree(schrodinger);
+
+	return clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_schrodinger);
+
+void clk_unregister_schrodinger(struct clk *clk)
+{
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	clk_unregister(clk);
+	kfree(to_clk_schrodinger(hw));
+}
+EXPORT_SYMBOL_GPL(clk_unregister_schrodinger);
+
+#ifdef CONFIG_OF
+/**
+ * of_schrodinger_clk_setup() - Setup function for schrodinger clock
+ */
+void of_schrodinger_clk_setup(struct device_node *node)
+{
+	struct clk *clk;
+	const char *clk_name = node->name;
+	u32 rate;
+	u32 accuracy = 0;
+
+	if (of_property_read_u32(node, "clock-frequency", &rate))
+		return;
+
+	of_property_read_u32(node, "clock-accuracy", &accuracy);
+
+	of_property_read_string(node, "clock-output-names", &clk_name);
+
+	clk = clk_register_schrodinger_with_accuracy(NULL, clk_name, NULL,
+						    0, rate, accuracy);
+	if (!IS_ERR(clk))
+		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+}
+EXPORT_SYMBOL_GPL(of_schrodinger_clk_setup);
+CLK_OF_DECLARE(schrodinger_clk, "schrodinger-clock", of_schrodinger_clk_setup);
+#endif
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 03f96db..4414476 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -269,6 +269,23 @@ struct clk_hw {
  */
 
 /**
+ * struct clk_schrodinger - schrodinger unknown rate clock
+ * @hw:		handle between common and hardware-specific interfaces
+ */
+struct clk_schrodinger {
+	struct		clk_hw hw;
+	u8		flags;
+};
+
+#define to_clk_schrodinger(_hw) container_of(_hw, struct clk_schrodinger, hw)
+
+extern const struct clk_ops clk_schrodinger_ops;
+struct clk *clk_register_schrodingere(struct device *dev, const char *name,
+		const char *parent_name, unsigned long flags);
+void clk_unregister_schrodinger(struct clk *clk);
+void of_schrodinger_clk_setup(struct device_node *np);
+
+/**
  * struct clk_fixed_rate - fixed-rate clock
  * @hw:		handle between common and hardware-specific interfaces
  * @fixed_rate:	constant frequency of clock
-- 
1.9.1
