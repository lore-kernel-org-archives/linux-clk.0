Return-Path: <newchief@king.net.pl>
From: Paul Osmialowski <newchief@king.net.pl>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Russell King <linux@arm.linux.org.uk>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Paul Osmialowski <pawelo@king.net.pl>
Subject: [PATCH v3] clk: add devm_of_clk_get() and devm_of_clk_get_by_name() functions
Date: Thu,  1 Oct 2015 10:03:46 +0200
Message-Id: <1443686626-26450-1-git-send-email-newchief@king.net.pl>
List-ID: <linux-clk.vger.kernel.org>

From: Paul Osmialowski <pawelo@king.net.pl>

These two functions are added to ease management of clocks obtained
from OF device nodes.

They are particulary useful while iterating over DT subnodes using e.g.
for_each_child_of_node(dev->of_node, child) in order do get resources
(i.e. clocks) for subdevices defined by these DT subnodes.

For example:

some_device {
    compatible = "something"
    #address-cells = <1>;
    #size-cells = <1>;
    ranges;

    subdevice1: some_subdevice@some_address1 {
        reg = <0xsome_address1 0xsome_size>
        clocks = <&some_clock1>
    }

    subdevice2: some_subdevice@some_address2 {
        reg = <0xsome_address2 0xsome_size>
        clocks = <&some_clock2>
    }
}

Normally, I'd have to use of_clk_get() on each subdevice node and then
worry about proper resource release myself.

IMHO using devres infrastructure for this is far better. This patch adds
missing functions needed to do it a better way.

Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>
---
 Documentation/driver-model/devres.txt |  2 ++
 drivers/clk/clk-devres.c              | 46 +++++++++++++++++++++++++++++++++++
 include/linux/clk.h                   | 46 +++++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
index 831a536..f3ad67a 100644
--- a/Documentation/driver-model/devres.txt
+++ b/Documentation/driver-model/devres.txt
@@ -235,6 +235,8 @@ certainly invest a bit more effort into libata core layer).
 
 CLOCK
   devm_clk_get()
+  devm_of_clk_get()
+  devm_of_clk_get_by_name()
   devm_clk_put()
 
 DMA
diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 8f57154..71fcebc 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -34,6 +34,52 @@ struct clk *devm_clk_get(struct device *dev, const char *id)
 }
 EXPORT_SYMBOL(devm_clk_get);
 
+#if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
+
+struct clk *devm_of_clk_get(struct device *dev, struct device_node *np,
+			    int index)
+{
+	struct clk **ptr, *clk;
+
+	ptr = devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	clk = of_clk_get(np, index);
+	if (!IS_ERR(clk)) {
+		*ptr = clk;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return clk;
+}
+EXPORT_SYMBOL(devm_of_clk_get);
+
+struct clk *devm_of_clk_get_by_name(struct device *dev, struct device_node *np,
+				    const char *name)
+{
+	struct clk **ptr, *clk;
+
+	ptr = devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	clk = of_clk_get_by_name(np, name);
+	if (!IS_ERR(clk)) {
+		*ptr = clk;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return clk;
+}
+EXPORT_SYMBOL(devm_of_clk_get_by_name);
+
+#endif /* defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK) */
+
 static int devm_clk_match(struct device *dev, void *res, void *data)
 {
 	struct clk **c = res;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 0df4a51..8f31f9a 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -504,4 +504,50 @@ static inline struct clk *of_clk_get_by_name(struct device_node *np,
 }
 #endif
 
+#if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
+/**
+ * devm_of_clk_get - obtain a managed reference to a clock producer
+ *                   from device tree node (by index).
+ * @dev: device for clock "consumer"
+ * @np: device tree node
+ * @index: clock consumer index (within the node)
+ *
+ * devm_of_clk_get should not be called from within interrupt context.
+ *
+ * The clock will automatically be freed when the device is unbound
+ * from the bus.
+ */
+struct clk *devm_of_clk_get(struct device *dev, struct device_node *np,
+			    int index);
+
+/**
+ * devm_of_clk_get_by_name - obtain a managed reference to a clock producer
+ *                           from device tree node (by name).
+ * @dev: device for clock "consumer"
+ * @np: device tree node
+ * @name: clock consumer name (within the node)
+ *
+ * devm_of_clk_get_by_name should not be called from within interrupt context.
+ *
+ * The clock will automatically be freed when the device is unbound
+ * from the bus.
+ */
+struct clk *devm_of_clk_get_by_name(struct device *dev, struct device_node *np,
+				    const char *name);
+
+#else
+static inline struct clk *devm_of_clk_get(struct device *dev,
+					  struct device_node *np,
+					  int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+static inline struct clk *devm_of_clk_get_by_name(struct device *dev,
+						  struct device_node *np,
+						  const char *name)
+{
+	return ERR_PTR(-ENOENT);
+}
+#endif
+
 #endif
-- 
2.4.9
