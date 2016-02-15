Return-Path: <akinobu.mita@gmail.com>
Return-Path: <akinobu.mita@gmail.com>
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH] clk: add userspace clock consumer
Date: Mon, 15 Feb 2016 23:40:51 +0900
Message-Id: <1455547251-4944-1-git-send-email-akinobu.mita@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

This adds userspace consumer for common clock.

This driver is inspired from Userspace regulator consumer
(REGULATOR_USERSPACE_CONSUMER) and it is useful for test purposes and
some classes of devices that are controlled entirely from user space.

Example binding and usages:

clksqw_userspace_consumer {
	compatible = "linux,clk-userspace-consumer";
	clocks = <&clksqw>;
};

	# cd /sys/devices/platform/clksqw_userspace_consumer
	# echo 8192 > rate
	# echo enabled > state

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
---
 .../bindings/clock/clk-userspace-consumer.txt      |  17 ++
 drivers/clk/Kconfig                                |   9 ++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-userspace-consumer.c               | 180 +++++++++++++++++++++
 4 files changed, 207 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/clk-userspace-consumer.txt
 create mode 100644 drivers/clk/clk-userspace-consumer.c

diff --git a/Documentation/devicetree/bindings/clock/clk-userspace-consumer.txt b/Documentation/devicetree/bindings/clock/clk-userspace-consumer.txt
new file mode 100644
index 0000000..34b1bd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/clk-userspace-consumer.txt
@@ -0,0 +1,17 @@
+* Userspace consumer for common clock
+
+Required properties:
+- compatible: Should be "linux,clk-userspace-consumer"
+- clocks: clock phandle to control from userspace
+
+Examples:
+
+clk32k_userspace_consumer {
+	compatible = "linux,clk-userspace-consumer";
+	clocks = <&clk32k>;
+};
+
+sqw_userspace_consumer {
+	compatible = "linux,clk-userspace-consumer";
+	clocks = <&sqw>;
+};
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index eca8e01..c8dc228 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -200,6 +200,15 @@ config COMMON_CLK_CDCE706
 	---help---
 	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
 
+config COMMON_CLK_USERSPACE_CONSUMER
+	tristate "Userspace clock consumer support"
+	help
+	  There are some classes of devices that are controlled entirely
+	  from user space. Userspace consumer driver provides ability to
+	  control clock for such devices.
+
+	  If unsure, say no.
+
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/qcom/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index b038e36..f3b51f1 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_COMMON_CLK)	+= clk-gpio.o
 ifeq ($(CONFIG_OF), y)
 obj-$(CONFIG_COMMON_CLK)	+= clk-conf.o
 endif
+obj-$(CONFIG_COMMON_CLK_USERSPACE_CONSUMER)	+= clk-userspace-consumer.o
 
 # hardware specific clock types
 # please keep this section sorted lexicographically by file/directory path name
diff --git a/drivers/clk/clk-userspace-consumer.c b/drivers/clk/clk-userspace-consumer.c
new file mode 100644
index 0000000..d7f36c1
--- /dev/null
+++ b/drivers/clk/clk-userspace-consumer.c
@@ -0,0 +1,180 @@
+/*
+ * Copyright (c) 2016 Akinobu Mita <akinobu.mita@gmail.com>
+ *
+ * This file is subject to the terms and conditions of version 2 of
+ * the GNU General Public License.  See the file COPYING in the main
+ * directory of this archive for more details.
+ *
+ * Inspired from reg-userspace-consumer
+ */
+
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+
+struct clk_userspace_consumer {
+	struct mutex lock;
+	bool enabled;
+	struct clk *clk;
+};
+
+static ssize_t clk_show_state(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct clk_userspace_consumer *consumer = dev_get_drvdata(dev);
+
+	if (consumer->enabled)
+		return sprintf(buf, "enabled\n");
+
+	return sprintf(buf, "disabled\n");
+}
+
+static ssize_t clk_store_state(struct device *dev,
+			struct device_attribute *attr, const char *buf,
+			size_t count)
+{
+	struct clk_userspace_consumer *consumer = dev_get_drvdata(dev);
+	bool enabled;
+
+	/*
+	 * sysfs_streq() doesn't need the \n's, but we add them so the strings
+	 * will be shared with show_state(), above.
+	 */
+	if (sysfs_streq(buf, "enabled\n") || sysfs_streq(buf, "1"))
+		enabled = true;
+	else if (sysfs_streq(buf, "disabled\n") || sysfs_streq(buf, "0"))
+		enabled = false;
+	else {
+		dev_err(dev, "Configuring invalid mode\n");
+		return count;
+	}
+
+	mutex_lock(&consumer->lock);
+
+	if (enabled != consumer->enabled) {
+		int ret = 0;
+
+		if (enabled) {
+			ret = clk_prepare_enable(consumer->clk);
+			if (ret) {
+				dev_err(dev, "Failed to configure state: %d\n",
+					ret);
+			}
+		} else {
+			clk_disable_unprepare(consumer->clk);
+		}
+
+		if (!ret)
+			consumer->enabled = enabled;
+	}
+
+	mutex_unlock(&consumer->lock);
+
+	return count;
+}
+static DEVICE_ATTR(state, 0644, clk_show_state, clk_store_state);
+
+static ssize_t clk_show_rate(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct clk_userspace_consumer *consumer = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%ld\n", clk_get_rate(consumer->clk));
+}
+
+static ssize_t clk_store_rate(struct device *dev, struct device_attribute *attr,
+			const char *buf, size_t count)
+{
+	struct clk_userspace_consumer *consumer = dev_get_drvdata(dev);
+	unsigned long rate;
+	int err;
+
+	err = kstrtoul(buf, 0, &rate);
+	if (err)
+		return err;
+
+	err = clk_set_rate(consumer->clk, rate);
+	if (err)
+		return err;
+
+	return count;
+}
+static DEVICE_ATTR(rate, 0644, clk_show_rate, clk_store_rate);
+
+static struct attribute *attributes[] = {
+	&dev_attr_state.attr,
+	&dev_attr_rate.attr,
+	NULL,
+};
+
+static const struct attribute_group attr_group = {
+	.attrs	= attributes,
+};
+
+static int clk_userspace_consumer_probe(struct platform_device *pdev)
+{
+	struct clk_userspace_consumer *consumer;
+	int ret;
+
+	consumer = devm_kzalloc(&pdev->dev, sizeof(*consumer), GFP_KERNEL);
+	if (!consumer)
+		return -ENOMEM;
+
+	mutex_init(&consumer->lock);
+
+	consumer->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(consumer->clk)) {
+		ret = PTR_ERR(consumer->clk);
+		dev_err(&pdev->dev, "Failed to get clock: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, consumer);
+
+	ret = sysfs_create_group(&pdev->dev.kobj, &attr_group);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int clk_userspace_consumer_remove(struct platform_device *pdev)
+{
+	struct clk_userspace_consumer *consumer = platform_get_drvdata(pdev);
+
+	sysfs_remove_group(&pdev->dev.kobj, &attr_group);
+
+	mutex_lock(&consumer->lock);
+	if (consumer->enabled)
+		clk_disable_unprepare(consumer->clk);
+	mutex_unlock(&consumer->lock);
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+
+static const struct of_device_id userspace_consumer_id[] = {
+	{ .compatible = "linux,clk-userspace-consumer" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, userspace_consumer_id);
+
+#endif
+
+static struct platform_driver clk_userspace_consumer_driver = {
+	.probe = clk_userspace_consumer_probe,
+	.remove = clk_userspace_consumer_remove,
+	.driver = {
+		.name = "clk-userspace-consumer",
+		.of_match_table = of_match_ptr(userspace_consumer_id),
+	},
+};
+module_platform_driver(clk_userspace_consumer_driver);
+
+MODULE_AUTHOR("Akinobu Mita <akinobu.mita@gmail.com>");
+MODULE_DESCRIPTION("Userspace consumer for common clock");
+MODULE_LICENSE("GPL");
-- 
2.5.0
