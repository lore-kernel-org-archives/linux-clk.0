Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: Add MSM8916 RPM clock driver
Date: Thu,  9 Jul 2015 15:18:30 +0300
Message-Id: <1436444310-15108-3-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1436444310-15108-1-git-send-email-georgi.djakov@linaro.org>
References: <1436444310-15108-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add support for clocks that are controlled by the RPM processor
on Qualcomm msm8916 based platforms.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   20 +++
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-msm8916.c                     |   13 --
 drivers/clk/qcom/rpmcc-msm8916.c                   |  183 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc-msm8916.h     |   44 +++++
 5 files changed, 248 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
 create mode 100644 drivers/clk/qcom/rpmcc-msm8916.c
 create mode 100644 include/dt-bindings/clock/qcom,rpmcc-msm8916.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
new file mode 100644
index 000000000000..74569e006bef
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -0,0 +1,20 @@
+Qualcomm RPM Clock Controller Binding
+------------------------------------------------
+The RPM is a dedicated hardware engine for managing the shared
+SoC resources in order to keep the lowest power profile. It
+communicates with other hardware subsystems via shared memory
+and accepts clock requests, aggregates the requests and turns
+the clocks on/off or scales them on demand.
+
+Required properties :
+- compatible : shall contain only one of the following:
+
+			"qcom,rpmcc-msm8916"
+
+- #clock-cells : shall contain 1
+
+Example:
+	rpmcc: rpmcc {
+		compatible = "qcom,rpmcc-msm8916";
+		#clock-cells = <1>;
+	};
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 4d14a73ee4ed..d2c155bb1035 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
 obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
 obj-$(CONFIG_MSM_GCC_8660) += gcc-msm8660.o
 obj-$(CONFIG_MSM_GCC_8916) += gcc-msm8916.o
+obj-$(CONFIG_MSM_GCC_8916) += rpmcc-msm8916.o
 obj-$(CONFIG_MSM_GCC_8960) += gcc-msm8960.o
 obj-$(CONFIG_MSM_LCC_8960) += lcc-msm8960.o
 obj-$(CONFIG_MSM_GCC_8974) += gcc-msm8974.o
diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 3bf4fb3deef6..28ef2c771157 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -2820,19 +2820,6 @@ MODULE_DEVICE_TABLE(of, gcc_msm8916_match_table);
 
 static int gcc_msm8916_probe(struct platform_device *pdev)
 {
-	struct clk *clk;
-	struct device *dev = &pdev->dev;
-
-	/* Temporary until RPM clocks supported */
-	clk = clk_register_fixed_rate(dev, "xo", NULL, CLK_IS_ROOT, 19200000);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
-	clk = clk_register_fixed_rate(dev, "sleep_clk_src", NULL,
-				      CLK_IS_ROOT, 32768);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
 	return qcom_cc_probe(pdev, &gcc_msm8916_desc);
 }
 
diff --git a/drivers/clk/qcom/rpmcc-msm8916.c b/drivers/clk/qcom/rpmcc-msm8916.c
new file mode 100644
index 000000000000..930e85637338
--- /dev/null
+++ b/drivers/clk/qcom/rpmcc-msm8916.c
@@ -0,0 +1,183 @@
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
+#include <linux/platform_device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include "clk-rpm.h"
+#include <dt-bindings/clock/qcom,rpmcc-msm8916.h>
+
+#define CXO_ID			0x0
+#define QDSS_ID			0x1
+#define BUS_SCALING		0x2
+
+#define PCNOC_ID		0x0
+#define SNOC_ID			0x1
+#define BIMC_ID			0x0
+
+#define BB_CLK1_ID		1
+#define BB_CLK2_ID		2
+#define RF_CLK1_ID		4
+#define RF_CLK2_ID		5
+
+struct rpm_cc {
+	struct clk_onecell_data data;
+	struct clk *clks[];
+};
+
+/* SMD clocks */
+DEFINE_CLK_RPM_SMD(pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, PCNOC_ID, NULL);
+DEFINE_CLK_RPM_SMD(snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, SNOC_ID, NULL);
+DEFINE_CLK_RPM_SMD(bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, BIMC_ID, NULL);
+
+DEFINE_CLK_RPM_SMD_BRANCH(xo, xo_a, QCOM_SMD_RPM_MISC_CLK, CXO_ID, 19200000);
+DEFINE_CLK_RPM_SMD_QDSS(qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, QDSS_ID);
+
+/* SMD_XO_BUFFER */
+DEFINE_CLK_RPM_SMD_XO_BUFFER(bb_clk1, bb_clk1_a, BB_CLK1_ID);
+DEFINE_CLK_RPM_SMD_XO_BUFFER(bb_clk2, bb_clk2_a, BB_CLK2_ID);
+DEFINE_CLK_RPM_SMD_XO_BUFFER(rf_clk1, rf_clk1_a, RF_CLK1_ID);
+DEFINE_CLK_RPM_SMD_XO_BUFFER(rf_clk2, rf_clk2_a, RF_CLK2_ID);
+
+DEFINE_CLK_RPM_SMD_XO_BUFFER_PINCTRL(bb_clk1_pin, bb_clk1_a_pin, BB_CLK1_ID);
+DEFINE_CLK_RPM_SMD_XO_BUFFER_PINCTRL(bb_clk2_pin, bb_clk2_a_pin, BB_CLK2_ID);
+DEFINE_CLK_RPM_SMD_XO_BUFFER_PINCTRL(rf_clk1_pin, rf_clk1_a_pin, RF_CLK1_ID);
+DEFINE_CLK_RPM_SMD_XO_BUFFER_PINCTRL(rf_clk2_pin, rf_clk2_a_pin, RF_CLK2_ID);
+
+static struct clk_rpm *rpmcc_msm8916_clks[] = {
+	[RPM_XO_CLK_SRC] = &xo,
+	[RPM_XO_A_CLK_SRC] = &xo_a,
+	[RPM_PCNOC_CLK] = &pcnoc_clk,
+	[RPM_PCNOC_A_CLK] = &pcnoc_a_clk,
+	[RPM_SNOC_CLK] = &snoc_clk,
+	[RPM_SNOC_A_CLK] = &snoc_a_clk,
+	[RPM_BIMC_CLK] = &bimc_clk,
+	[RPM_BIMC_A_CLK] = &bimc_a_clk,
+	[RPM_QDSS_CLK] = &qdss_clk,
+	[RPM_QDSS_A_CLK] = &qdss_a_clk,
+	[RPM_BB_CLK1] = &bb_clk1,
+	[RPM_BB_CLK1_A] = &bb_clk1_a,
+	[RPM_BB_CLK2] = &bb_clk2,
+	[RPM_BB_CLK2_A] = &bb_clk2_a,
+	[RPM_RF_CLK1] = &rf_clk1,
+	[RPM_RF_CLK1_A] = &rf_clk1_a,
+	[RPM_RF_CLK2] = &rf_clk2,
+	[RPM_RF_CLK2_A] = &rf_clk2_a,
+	[RPM_BB_CLK1_PIN] = &bb_clk1_pin,
+	[RPM_BB_CLK1_A_PIN] = &bb_clk1_a_pin,
+	[RPM_BB_CLK2_PIN] = &bb_clk2_pin,
+	[RPM_BB_CLK2_A_PIN] = &bb_clk2_a_pin,
+	[RPM_RF_CLK1_PIN] = &rf_clk1_pin,
+	[RPM_RF_CLK1_A_PIN] = &rf_clk1_a_pin,
+	[RPM_RF_CLK2_PIN] = &rf_clk2_pin,
+	[RPM_RF_CLK2_A_PIN] = &rf_clk2_a_pin,
+};
+
+static int rpmcc_msm8916_probe(struct platform_device *pdev)
+{
+	struct clk **clks;
+	struct clk *clk;
+	struct rpm_cc *rcc;
+	struct qcom_smd_rpm *rpm;
+	struct clk_onecell_data *data;
+	int num_clks = ARRAY_SIZE(rpmcc_msm8916_clks);
+	int ret, i;
+
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	rpm = dev_get_drvdata(pdev->dev.parent);
+	if (!rpm) {
+		dev_err(&pdev->dev, "Unable to retrieve handle to RPM\n");
+		return -ENODEV;
+	}
+
+	ret = clk_rpm_enable_scaling(rpm);
+	if (ret)
+		return ret;
+
+	rcc = devm_kzalloc(&pdev->dev, sizeof(*rcc) + sizeof(*clks) * num_clks,
+			   GFP_KERNEL);
+	if (!rcc)
+		return -ENOMEM;
+
+	clks = rcc->clks;
+	data = &rcc->data;
+	data->clks = clks;
+	data->clk_num = num_clks;
+
+	clk = clk_register_fixed_rate(&pdev->dev, "sleep_clk_src", NULL,
+				      CLK_IS_ROOT, 32768);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	for (i = 0; i < num_clks; i++) {
+		if (!rpmcc_msm8916_clks[i]) {
+			clks[i] = ERR_PTR(-ENOENT);
+			continue;
+		}
+
+		rpmcc_msm8916_clks[i]->rpm = rpm;
+		clk = devm_clk_register(&pdev->dev, &rpmcc_msm8916_clks[i]->hw);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+
+		clks[i] = clk;
+	}
+
+	ret = of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
+				  data);
+	if (ret)
+		return ret;
+
+	/* Hold a vote for max rates */
+	clk_set_rate(bimc_a_clk.hw.clk, INT_MAX);
+	clk_prepare_enable(bimc_a_clk.hw.clk);
+	clk_set_rate(bimc_clk.hw.clk, INT_MAX);
+	clk_prepare_enable(bimc_clk.hw.clk);
+	clk_set_rate(snoc_clk.hw.clk, INT_MAX);
+	clk_prepare_enable(snoc_clk.hw.clk);
+	clk_prepare_enable(xo.hw.clk);
+
+	return 0;
+}
+
+static int rpmcc_msm8916_remove(struct platform_device *pdev)
+{
+	of_clk_del_provider(pdev->dev.of_node);
+	return 0;
+}
+
+static const struct of_device_id rpmcc_msm8916_of_match[] = {
+	{ .compatible = "qcom,rpmcc-msm8916" },
+	{ },
+};
+
+static struct platform_driver rpmcc_msm8916_driver = {
+	.driver = {
+		.name = "qcom-rpmcc-msm8916",
+		.of_match_table = rpmcc_msm8916_of_match,
+	},
+	.probe = rpmcc_msm8916_probe,
+	.remove = rpmcc_msm8916_remove,
+};
+
+module_platform_driver(rpmcc_msm8916_driver);
+core_initcall(rpmcc_msm8916_driver_init);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Qualcomm MSM8916 RPM Clock Controller Driver");
diff --git a/include/dt-bindings/clock/qcom,rpmcc-msm8916.h b/include/dt-bindings/clock/qcom,rpmcc-msm8916.h
new file mode 100644
index 000000000000..62d63940896a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,rpmcc-msm8916.h
@@ -0,0 +1,44 @@
+/*
+ * Copyright 2015 Linaro Limited
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
+#ifndef _DT_BINDINGS_CLK_MSM_RPMCC_8916_H
+#define _DT_BINDINGS_CLK_MSM_RPMCC_8916_H
+
+#define RPM_XO_CLK_SRC				0
+#define RPM_XO_A_CLK_SRC			1
+#define RPM_PCNOC_CLK				2
+#define RPM_PCNOC_A_CLK				3
+#define RPM_SNOC_CLK				4
+#define RPM_SNOC_A_CLK				6
+#define RPM_BIMC_CLK				7
+#define RPM_BIMC_A_CLK				8
+#define RPM_QDSS_CLK				9
+#define RPM_QDSS_A_CLK				10
+#define RPM_BB_CLK1				11
+#define RPM_BB_CLK1_A				12
+#define RPM_BB_CLK2				13
+#define RPM_BB_CLK2_A				14
+#define RPM_RF_CLK1				15
+#define RPM_RF_CLK1_A				16
+#define RPM_RF_CLK2				17
+#define RPM_RF_CLK2_A				18
+#define RPM_BB_CLK1_PIN				19
+#define RPM_BB_CLK1_A_PIN			20
+#define RPM_BB_CLK2_PIN				21
+#define RPM_BB_CLK2_A_PIN			22
+#define RPM_RF_CLK1_PIN				23
+#define RPM_RF_CLK1_A_PIN			24
+#define RPM_RF_CLK2_PIN				25
+#define RPM_RF_CLK2_A_PIN			26
+
+#endif
