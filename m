Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v4 1/3] clk: qcom: Add A53 PLL support
Date: Mon, 14 Dec 2015 15:58:01 +0200
Message-Id: <1450101483-23509-2-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1450101483-23509-1-git-send-email-georgi.djakov@linaro.org>
References: <1450101483-23509-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add support for the PLL, which generates the higher range of CPU
frequencies on MSM8916 platforms.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,a53-pll.txt     |   18 ++++
 drivers/clk/qcom/Kconfig                           |    9 ++
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/a53-pll.c                         |  100 ++++++++++++++++++++
 4 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53-pll.txt
 create mode 100644 drivers/clk/qcom/a53-pll.c

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53-pll.txt b/Documentation/devicetree/bindings/clock/qcom,a53-pll.txt
new file mode 100644
index 000000000000..5cf0af1eecf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,a53-pll.txt
@@ -0,0 +1,18 @@
+A53 PLL Binding
+---------------
+The A53 PLL is the main CPU PLL used for frequencies above 1GHz.
+
+Required properties :
+- compatible : Shall contain only one of the following:
+
+		"qcom,a53-pll"
+
+- reg : shall contain base register location and length
+
+Example:
+
+	a53pll: a53pll@0b016000 {
+		compatible = "qcom,a53-pll";
+		reg = <0x0b016000 0x40>;
+	};
+
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index b552eceec2be..d06cf687be4f 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -123,3 +123,12 @@ config MSM_MMCC_8996
 	  Support for the multimedia clock controller on msm8996 devices.
 	  Say Y if you want to support multimedia devices such as display,
 	  graphics, video encode/decode, camera, etc.
+
+config QCOM_A53PLL
+	bool "A53 PLL"
+	depends on COMMON_CLK_QCOM
+	help
+	  Support for the A53 PLL on some Qualcomm devices. It provides
+	  support for CPU frequencies above 1GHz.
+	  Say Y if you want to support CPU frequency scaling on devices
+	  such as MSM8916.
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index dc4280b85db1..c7c26eeab67c 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -25,3 +25,4 @@ obj-$(CONFIG_MSM_GCC_8996) += gcc-msm8996.o
 obj-$(CONFIG_MSM_MMCC_8960) += mmcc-msm8960.o
 obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
 obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
+obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
new file mode 100644
index 000000000000..01176240f728
--- /dev/null
+++ b/drivers/clk/qcom/a53-pll.c
@@ -0,0 +1,100 @@
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
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "clk-pll.h"
+#include "clk-regmap.h"
+
+static struct pll_freq_tbl a53pll_freq[] = {
+	{  998400000, 52, 0x0, 0x1, 0 },
+	{ 1094400000, 57, 0x0, 0x1, 0 },
+	{ 1152000000, 62, 0x0, 0x1, 0 },
+	{ 1209600000, 65, 0x0, 0x1, 0 },
+	{ 1401600000, 73, 0x0, 0x1, 0 },
+};
+
+static const struct regmap_config a53pll_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x40,
+	.fast_io		= true,
+	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
+};
+
+static const struct of_device_id qcom_a53pll_match_table[] = {
+	{ .compatible = "qcom,a53-pll" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_a53pll_match_table);
+
+static int qcom_a53pll_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk_pll *pll;
+	struct resource *res;
+	void __iomem *base;
+	struct clk *clk;
+	struct regmap *regmap;
+	struct clk_init_data init;
+
+	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, &a53pll_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	pll->l_reg = 0x04,
+	pll->m_reg = 0x08,
+	pll->n_reg = 0x0c,
+	pll->config_reg = 0x14,
+	pll->mode_reg = 0x00,
+	pll->status_reg = 0x1c,
+	pll->status_bit = 16,
+	pll->freq_tbl = a53pll_freq,
+
+	init.name = "a53pll",
+	init.parent_names = (const char *[]){ "xo" },
+	init.num_parents = 1,
+	init.ops = &clk_pll_sr2_ops,
+	pll->clkr.hw.init = &init;
+
+	clk = devm_clk_register_regmap(dev, &pll->clkr);
+
+	return PTR_ERR_OR_ZERO(clk);
+}
+
+static struct platform_driver qcom_a53pll_driver = {
+	.probe = qcom_a53pll_probe,
+	.driver = {
+		.name = "qcom-a53pll",
+		.of_match_table = qcom_a53pll_match_table,
+	},
+};
+
+module_platform_driver(qcom_a53pll_driver);
+MODULE_DESCRIPTION("Qualcomm A53 PLL Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:qcom-a53pll");
