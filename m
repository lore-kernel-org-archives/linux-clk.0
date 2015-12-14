Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v4 3/3] clk: qcom: Add A53 clock driver
Date: Mon, 14 Dec 2015 15:58:03 +0200
Message-Id: <1450101483-23509-4-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1450101483-23509-1-git-send-email-georgi.djakov@linaro.org>
References: <1450101483-23509-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add a driver for the A53 Clock Controller. It is a hardware block that
implements a combined mux and half integer divider functionality. It can
choose between a fixed-rate clock or the dedicated A53 PLL. The source
and the divider can be set both at the same time.

This is required for enabling CPU frequency scaling on platforms like
MSM8916.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,a53cc.txt       |   23 +++
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/a53cc.c                           |  166 ++++++++++++++++++++
 4 files changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc.txt
 create mode 100644 drivers/clk/qcom/a53cc.c

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53cc.txt b/Documentation/devicetree/bindings/clock/qcom,a53cc.txt
new file mode 100644
index 000000000000..3a1e8e6675ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,a53cc.txt
@@ -0,0 +1,23 @@
+Qualcomm A53 CPU Clock Controller Binding
+------------------------------------------------
+The A53 CPU Clock Controller is hardware, which provides a combined
+mux and divider functionality for the CPU clocks. It can choose between
+a fixed rate clock and the dedicated A53 PLL.
+
+Required properties :
+- compatible : shall contain:
+
+			"qcom,a53cc"
+
+- reg : shall contain base register location and length
+	of the APCS region
+- #clock-cells : shall contain 1
+
+Example:
+
+	apcs: syscon@b011000 {
+		compatible = "qcom,a53cc", "syscon";
+		reg = <0x0b011000 0x1000>;
+		#clock-cells = <1>;
+	};
+
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d06cf687be4f..27a1622ca891 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -132,3 +132,11 @@ config QCOM_A53PLL
 	  support for CPU frequencies above 1GHz.
 	  Say Y if you want to support CPU frequency scaling on devices
 	  such as MSM8916.
+
+config QCOM_A53CC
+	bool "A53 Clock Controller"
+	depends on COMMON_CLK_QCOM && QCOM_A53PLL
+	help
+	  Support for the A53 clock controller on some Qualcomm devices.
+	  Say Y if you want to support CPU frequency scaling on devices
+	  such as MSM8916.
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index bc7637516a6e..9a67697b9540 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -26,4 +26,5 @@ obj-$(CONFIG_MSM_GCC_8996) += gcc-msm8996.o
 obj-$(CONFIG_MSM_MMCC_8960) += mmcc-msm8960.o
 obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
 obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
+obj-$(CONFIG_QCOM_A53CC) += a53cc.o
 obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
diff --git a/drivers/clk/qcom/a53cc.c b/drivers/clk/qcom/a53cc.c
new file mode 100644
index 000000000000..8958464ee7fb
--- /dev/null
+++ b/drivers/clk/qcom/a53cc.c
@@ -0,0 +1,166 @@
+/*
+ * Copyright (c) 2015, Linaro Limited
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/cpu.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "clk-regmap.h"
+#include "clk-regmap-mux-div.h"
+
+enum {
+	P_GPLL0,
+	P_A53PLL,
+};
+
+static const struct parent_map gpll0_a53cc_map[] = {
+	{ P_GPLL0, 4 },
+	{ P_A53PLL, 5 },
+};
+
+static const char * const gpll0_a53cc[] = {
+	"gpll0_vote",
+	"a53pll",
+};
+
+static const struct regmap_config a53cc_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x1000,
+	.fast_io		= true,
+	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
+};
+
+static const struct of_device_id qcom_a53cc_match_table[] = {
+	{ .compatible = "qcom,a53cc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_a53cc_match_table);
+
+/*
+ * We use the notifier function for switching to a temporary safe configuration
+ * (mux and divider), while the a53 pll is reconfigured.
+ */
+static int a53cc_notifier_cb(struct notifier_block *nb, unsigned long event,
+			     void *data)
+{
+	int ret = 0;
+	struct clk_regmap_mux_div *md = container_of(nb,
+						     struct clk_regmap_mux_div,
+						     clk_nb);
+
+	if (event == PRE_RATE_CHANGE)
+		ret = __mux_div_set_src_div(md, md->safe_src, md->safe_div);
+
+	return notifier_from_errno(ret);
+}
+
+static int qcom_a53cc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk_regmap_mux_div *a53cc;
+	struct resource *res;
+	void __iomem *base;
+	struct clk *clk, *pclk;
+	struct regmap *regmap;
+	struct clk_init_data init;
+	int ret;
+
+	a53cc = devm_kzalloc(dev, sizeof(*a53cc), GFP_KERNEL);
+	if (!a53cc)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	a53cc->reg_offset = 0x50,
+	a53cc->hid_width = 5,
+	a53cc->hid_shift = 0,
+	a53cc->src_width = 3,
+	a53cc->src_shift = 8,
+	a53cc->safe_src = 4,
+	a53cc->safe_div = 3,
+	a53cc->parent_map = gpll0_a53cc_map,
+
+	init.name = "a53mux",
+	init.parent_names = gpll0_a53cc,
+	init.num_parents = 2,
+	init.ops = &clk_regmap_mux_div_ops,
+	init.flags = CLK_SET_RATE_PARENT;
+	a53cc->clkr.hw.init = &init;
+
+	pclk = __clk_lookup(gpll0_a53cc[1]);
+	if (!pclk)
+		return -EPROBE_DEFER;
+
+	ret = clk_prepare_enable(pclk);
+	if (ret) {
+		dev_err(dev, "failed to enable %s: %d\n", gpll0_a53cc[1], ret);
+		return ret;
+	}
+
+	a53cc->clk_nb.notifier_call = a53cc_notifier_cb;
+	ret = clk_notifier_register(pclk, &a53cc->clk_nb);
+	if (ret) {
+		dev_err(dev, "failed to register clock notifier: %d\n", ret);
+		return ret;
+	}
+
+	regmap = devm_regmap_init_mmio(dev, base, &a53cc_regmap_config);
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		dev_err(dev, "failed to init regmap mmio: %d\n", ret);
+		goto err;
+	}
+
+	a53cc->clkr.regmap = regmap;
+
+	clk = devm_clk_register_regmap(dev, &a53cc->clkr);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
+		dev_err(dev, "failed to register regmap clock: %d\n", ret);
+		goto err;
+	}
+
+	ret = of_clk_add_provider(dev->of_node, of_clk_src_simple_get, clk);
+	if (ret) {
+		dev_err(dev, "failed to add clock provider: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+err:
+	clk_notifier_unregister(pclk, &a53cc->clk_nb);
+	return ret;
+}
+
+static struct platform_driver qcom_a53cc_driver = {
+	.probe = qcom_a53cc_probe,
+	.driver = {
+		.name = "qcom-a53cc",
+		.of_match_table = qcom_a53cc_match_table,
+	},
+};
+
+module_platform_driver(qcom_a53cc_driver);
+MODULE_DESCRIPTION("Qualcomm A53 Clock Controller Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:qcom-a53cc");
