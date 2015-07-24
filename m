Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:33098 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754414AbbGXQ6w (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jul 2015 12:58:52 -0400
Received: by wicmv11 with SMTP id mv11so72181537wic.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2015 09:58:50 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org, agross@codeaurora.org
Cc: mturquette@linaro.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v2 4/5] clk: qcom: Add A53 clock driver
Date: Fri, 24 Jul 2015 19:58:38 +0300
Message-Id: <1437757119-6910-5-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1437757119-6910-1-git-send-email-georgi.djakov@linaro.org>
References: <1437757119-6910-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add a driver for the A53 subsystem PLL, so that we can provide higher
frequency clocks for use by the system.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,a53cc |   25 +++
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-a53.c                         |  202 ++++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53cc
 create mode 100644 drivers/clk/qcom/clk-a53.c

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53cc b/Documentation/devicetree/bindings/clock/qcom,a53cc
new file mode 100644
index 000000000000..34f6cf8dd6ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,a53cc
@@ -0,0 +1,25 @@
+Qualcomm A53 Clock Controller Binding
+------------------------------------------------
+The A53 Clock Controller provides higher frequency clocks
+and allows CPU frequency scaling on msm8916 based platforms.
+
+Required properties :
+- compatible : shall contain:
+			"qcom,a53cc"
+- reg : shall contain base register location and length
+	of the A53 PLL
+- #clock-cells : shall contain 1
+- qcom,apcs : phandle of apcs syscon node
+
+Example:
+	apcs: syscon@b011000 {
+		compatible = "syscon";
+		reg = <0x0b011000 0x1000>;
+	};
+
+	a53cc: clock-controller@0b016000 {
+		compatible = "qcom,clock-a53-msm8916";
+		reg = <0x0b016000 0x40>;
+		#clock-cells = <1>;
+		qcom,apcs = <&apcs>;
+	};
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 450ddc010939..34ec7883cd48 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -101,3 +101,11 @@ config MSM_MMCC_8974
 	  Support for the multimedia clock controller on msm8974 devices.
 	  Say Y if you want to support multimedia devices such as display,
 	  graphics, video encode/decode, camera, etc.
+
+config QCOM_A53
+	tristate "A53 Clock Controller"
+	depends on COMMON_CLK_QCOM
+	help
+	  Support for the A53 clock controller on Qualcomm devices.
+	  Say Y if you want to support CPU frequency scaling on devices
+	  such as MSM8916.
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 56068d2e75a5..7085ed81eeb4 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -24,3 +24,4 @@ obj-$(CONFIG_MSM_LCC_8960) += lcc-msm8960.o
 obj-$(CONFIG_MSM_GCC_8974) += gcc-msm8974.o
 obj-$(CONFIG_MSM_MMCC_8960) += mmcc-msm8960.o
 obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
+obj-$(CONFIG_QCOM_A53) += clk-a53.o
diff --git a/drivers/clk/qcom/clk-a53.c b/drivers/clk/qcom/clk-a53.c
new file mode 100644
index 000000000000..762ed81a72c4
--- /dev/null
+++ b/drivers/clk/qcom/clk-a53.c
@@ -0,0 +1,202 @@
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
+#include <linux/cpu.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "clk-pll.h"
+#include "clk-regmap.h"
+#include "clk-regmap-mux-div.h"
+
+#define F_APCS_PLL(f, l, m, n) { (f), (l), (m), (n), 0 }
+
+static struct pll_freq_tbl apcs_pll_freq[] = {
+	F_APCS_PLL(998400000, 52, 0x0, 0x1),
+	F_APCS_PLL(1094400000, 57, 0x0, 0x1),
+	F_APCS_PLL(1152000000, 62, 0x0, 0x1),
+	F_APCS_PLL(1209600000, 65, 0x0, 0x1),
+	F_APCS_PLL(1401600000, 73, 0x0, 0x1),
+};
+
+static struct clk_pll a53sspll = {
+	.l_reg = 0x04,
+	.m_reg = 0x08,
+	.n_reg = 0x0c,
+	.config_reg = 0x14,
+	.mode_reg = 0x00,
+	.status_reg = 0x1c,
+	.status_bit = 16,
+	.freq_tbl = apcs_pll_freq,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "a53sspll",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_sr2_ops,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static const struct regmap_config a53sspll_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0x40,
+	.fast_io	= true,
+};
+
+static struct clk *a53ss_add_pll(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *base;
+	struct regmap *regmap;
+	struct clk_pll *pll;
+
+	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return base;
+
+	pll = &a53sspll;
+
+	regmap = devm_regmap_init_mmio(dev, base, &a53sspll_regmap_config);
+	if (IS_ERR(regmap))
+		return ERR_CAST(regmap);
+
+	return devm_clk_register_regmap(dev, &pll->clkr);
+}
+
+enum {
+	P_GPLL0,
+	P_A53SSPLL,
+};
+
+static const struct parent_map gpll0_a53sspll_map[] = {
+	{ P_GPLL0, 4 },
+	{ P_A53SSPLL, 5 },
+};
+
+static const char * const gpll0_a53sspll[] = {
+	"gpll0_vote",
+	"a53sspll",
+};
+
+static struct clk_regmap_mux_div a53ssmux = {
+	.reg_offset = 0x50,
+	.hid_width = 5,
+	.hid_shift = 0,
+	.src_width = 3,
+	.src_shift = 8,
+	.safe_src = 4,
+	.safe_freq = 400000000,
+	.parent_map = gpll0_a53sspll_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "a53ssmux",
+		.parent_names = gpll0_a53sspll,
+		.num_parents = 2,
+		.ops = &clk_regmap_mux_div_ops,
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk *a53ss_add_mux(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct regmap *regmap;
+	struct clk_regmap_mux_div *mux;
+
+	mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return ERR_PTR(-ENOMEM);
+
+	mux = &a53ssmux;
+
+	regmap = syscon_regmap_lookup_by_phandle(np, "qcom,apcs");
+	if (IS_ERR(regmap))
+		return ERR_CAST(regmap);
+
+	mux->clkr.regmap = regmap;
+	return devm_clk_register(dev, &mux->clkr.hw);
+}
+
+static const struct of_device_id qcom_a53_match_table[] = {
+	{ .compatible = "qcom,clock-a53-msm8916" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_a53_match_table);
+
+static int qcom_a53_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk *clk_pll, *clk_mux;
+	struct clk_onecell_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->clks = devm_kcalloc(dev, 2, sizeof(struct clk *), GFP_KERNEL);
+	if (!data->clks)
+		return -ENOMEM;
+
+	clk_pll = a53ss_add_pll(pdev);
+	if (IS_ERR(clk_pll))
+		return PTR_ERR(clk_pll);
+
+	clk_mux = a53ss_add_mux(pdev);
+	if (IS_ERR(clk_mux))
+		return PTR_ERR(clk_mux);
+
+	data->clks[0] = clk_pll;
+	data->clks[1] = clk_mux;
+	data->clk_num = 2;
+
+	clk_prepare_enable(clk_pll);
+
+	return of_clk_add_provider(dev->of_node, of_clk_src_onecell_get, data);
+}
+
+static struct platform_driver qcom_a53_driver = {
+	.probe = qcom_a53_probe,
+	.driver = {
+		.name = "qcom-a53",
+		.of_match_table = qcom_a53_match_table,
+	},
+};
+
+static int __init qcom_a53_init(void)
+{
+	return platform_driver_register(&qcom_a53_driver);
+}
+arch_initcall(qcom_a53_init);
+
+static void __exit qcom_a53_exit(void)
+{
+	platform_driver_unregister(&qcom_a53_driver);
+}
+module_exit(qcom_a53_exit);
+
+MODULE_DESCRIPTION("Qualcomm A53 Clock Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:qcom-a53");
