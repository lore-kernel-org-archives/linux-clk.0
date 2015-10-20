Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org,
	agross@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v3 6/8] clk: qcom: Add RPM clock controller driver
Date: Tue, 20 Oct 2015 19:57:58 +0300
Message-Id: <1445360280-2347-7-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
References: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add support for clocks that are controlled by the RPM processor
on Qualcomm msm8916 based platforms.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   35 ++++
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/rpmcc.c                           |  198 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc-msm8916.h     |   44 +++++
 5 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
 create mode 100644 drivers/clk/qcom/rpmcc.c
 create mode 100644 include/dt-bindings/clock/qcom,rpmcc-msm8916.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
new file mode 100644
index 000000000000..bd0fd0cd50dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -0,0 +1,35 @@
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
+	smd {
+		compatible = "qcom,smd";
+
+		rpm {
+			interrupts = <0 168 1>;
+			qcom,ipc = <&apcs 8 0>;
+			qcom,smd-edge = <15>;
+
+			rpm_requests {
+				compatible = "qcom,rpm-msm8916";
+				qcom,smd-channels = "rpm_requests";
+
+				rpmcc: qcom,rpmcc {
+					compatible = "qcom,rpmcc-msm8916";
+					#clock-cells = <1>;
+				};
+			};
+		};
+	};
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index f06a331e9a24..29aaebcdeffa 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -12,6 +12,14 @@ config COMMON_CLK_QCOM
 	select REGMAP_MMIO
 	select RESET_CONTROLLER
 
+config QCOM_RPMCC
+	tristate "Qualcomm RPM Clock Controller"
+	depends on QCOM_SMD_RPM && COMMON_CLK_QCOM
+	select QCOM_CLK_SMD_RPM
+	help
+	  Support for the clocks exposed by the Resource Power Manager
+	  processor on devices like apq8016, apq8084 and msm8974.
+
 config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	select QCOM_GDSC
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index b0bc0d3d585f..e58a567ddb42 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -11,6 +11,7 @@ clk-qcom-y += clk-regmap-mux.o
 clk-qcom-y += reset.o
 clk-qcom-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
+clk-qcom-$(CONFIG_QCOM_RPMCC) += rpmcc.o
 
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
diff --git a/drivers/clk/qcom/rpmcc.c b/drivers/clk/qcom/rpmcc.c
new file mode 100644
index 000000000000..88283e2c95f7
--- /dev/null
+++ b/drivers/clk/qcom/rpmcc.c
@@ -0,0 +1,198 @@
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
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/soc/qcom/smd-rpm.h>
+
+#include "clk-smd-rpm.h"
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
+#define BB_CLK1_ID		0x1
+#define BB_CLK2_ID		0x2
+#define RF_CLK1_ID		0x4
+#define RF_CLK2_ID		0x5
+
+struct rpm_cc {
+	struct qcom_rpm *rpm;
+	struct clk_onecell_data data;
+	struct clk *clks[];
+};
+
+/* SMD clocks */
+DEFINE_CLK_SMD_RPM(pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, PCNOC_ID, NULL);
+DEFINE_CLK_SMD_RPM(snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, SNOC_ID, NULL);
+DEFINE_CLK_SMD_RPM(bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, BIMC_ID, NULL);
+
+DEFINE_CLK_SMD_RPM_BRANCH(xo, xo_a, QCOM_SMD_RPM_MISC_CLK, CXO_ID, 19200000);
+DEFINE_CLK_SMD_RPM_QDSS(qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, QDSS_ID);
+
+/* SMD_XO_BUFFER */
+DEFINE_CLK_SMD_RPM_XO_BUFFER(bb_clk1, bb_clk1_a, BB_CLK1_ID);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(bb_clk2, bb_clk2_a, BB_CLK2_ID);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(rf_clk1, rf_clk1_a, RF_CLK1_ID);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(rf_clk2, rf_clk2_a, RF_CLK2_ID);
+
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(bb_clk1_pin, bb_clk1_a_pin, BB_CLK1_ID);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(bb_clk2_pin, bb_clk2_a_pin, BB_CLK2_ID);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk1_pin, rf_clk1_a_pin, RF_CLK1_ID);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk2_pin, rf_clk2_a_pin, RF_CLK2_ID);
+
+static struct clk_smd_rpm *rpmcc_msm8916_clks[] = {
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
+struct rpmcc_desc {
+	struct clk_smd_rpm **clks;
+	size_t num_clks;
+};
+
+static const struct rpmcc_desc rpmcc_msm8916 = {
+	.clks = rpmcc_msm8916_clks,
+	.num_clks = ARRAY_SIZE(rpmcc_msm8916_clks),
+};
+
+static const struct of_device_id rpmcc_match_table[] = {
+	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpmcc_msm8916},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rpmcc_match_table);
+
+static int rpmcc_probe(struct platform_device *pdev)
+{
+	struct clk **clks;
+	struct clk *clk;
+	struct clk_smd_rpm **rpm_clks;
+	struct rpm_cc *rcc;
+	const struct rpmcc_desc *desc;
+	struct qcom_smd_rpm *rpm;
+	struct clk_onecell_data *data;
+	int ret, i;
+	size_t num_clks;
+	const struct of_device_id *match;
+
+	rpm = dev_get_drvdata(pdev->dev.parent);
+	if (!rpm) {
+		dev_err(&pdev->dev, "Unable to retrieve handle to RPM\n");
+		return -ENODEV;
+	}
+
+	match = of_match_device(rpmcc_match_table, &pdev->dev);
+	if (!match)
+		return -EINVAL;
+
+	desc = match->data;
+	rpm_clks = desc->clks;
+	num_clks = desc->num_clks;
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
+	for (i = 0; i < num_clks; i++) {
+		if (!rpm_clks[i]) {
+			clks[i] = ERR_PTR(-ENOENT);
+			continue;
+		}
+
+		rpm_clks[i]->rpm = rpm;
+		clk = devm_clk_register(&pdev->dev, &rpm_clks[i]->hw);
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
+	return clk_smd_rpm_enable_scaling(rpm);
+}
+
+static int rpmcc_remove(struct platform_device *pdev)
+{
+	of_clk_del_provider(pdev->dev.of_node);
+	return 0;
+}
+
+static struct platform_driver rpmcc_driver = {
+	.driver = {
+		.name = "qcom-rpmcc",
+		.of_match_table = rpmcc_match_table,
+	},
+	.probe = rpmcc_probe,
+	.remove = rpmcc_remove,
+};
+
+static int __init rpmcc_init(void)
+{
+	return platform_driver_register(&rpmcc_driver);
+}
+core_initcall(rpmcc_init);
+
+static void __exit rpmcc_exit(void)
+{
+	platform_driver_unregister(&rpmcc_driver);
+}
+module_exit(rpmcc_exit);
+
+MODULE_DESCRIPTION("Qualcomm RPM Clock Controller Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:rpmcc");
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
