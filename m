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
Subject: [PATCH v5 1/6] clk: qcom: Add support for SMD-RPM Clocks
Date: Thu,  3 Dec 2015 16:02:51 +0200
Message-Id: <1449151376-25930-2-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1449151376-25930-1-git-send-email-georgi.djakov@linaro.org>
References: <1449151376-25930-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This adds initial support for clocks controlled by the Resource
Power Manager (RPM) processor on some Qualcomm SoCs, which use
the qcom_smd_rpm driver to communicate with RPM.
Such platforms are msm8916, apq8084 and msm8974.

The RPM is a dedicated hardware engine for managing the shared
SoC resources in order to keep the lowest power profile. It
communicates with other hardware subsystems via shared memory
and accepts clock requests, aggregates the requests and turns
the clocks on/off or scales them on demand.

This driver is based on the codeaurora.org driver:
https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/clk/qcom/clock-rpm.c

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   36 ++
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |  433 ++++++++++++++++++++
 drivers/clk/qcom/clk-smd-rpm.h                     |  142 +++++++
 include/dt-bindings/clock/qcom,rpmcc.h             |   45 ++
 6 files changed, 668 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.c
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.h
 create mode 100644 include/dt-bindings/clock/qcom,rpmcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
new file mode 100644
index 000000000000..91be034ea75b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -0,0 +1,36 @@
+Qualcomm RPM Clock Controller Binding
+------------------------------------------------
+The RPM is a dedicated hardware engine for managing the shared
+SoC resources in order to keep the lowest power profile. It
+communicates with other hardware subsystems via shared memory
+and accepts clock requests, aggregates the requests and turns
+the clocks on/off or scales them on demand.
+
+Required properties :
+- compatible : shall contain only one of the following. The generic
+               compatible "qcom,rpmcc" should be also included.
+
+			"qcom,rpmcc-msm8916", "qcom,rpmcc"
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
+					compatible = "qcom,rpmcc-msm8916", "qcom,rpmcc";
+					#clock-cells = <1>;
+				};
+			};
+		};
+	};
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index b552eceec2be..fa1d4cb69d00 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -2,6 +2,9 @@ config QCOM_GDSC
 	bool
 	select PM_GENERIC_DOMAINS if PM
 
+config QCOM_RPMCC
+	bool
+
 config COMMON_CLK_QCOM
 	tristate "Support for Qualcomm's clock controllers"
 	depends on OF
@@ -9,6 +12,14 @@ config COMMON_CLK_QCOM
 	select REGMAP_MMIO
 	select RESET_CONTROLLER
 
+config QCOM_CLK_SMD_RPM
+	tristate "RPM over SMD based Clock Controller"
+	depends on COMMON_CLK_QCOM
+	select QCOM_RPMCC
+	help
+	  Support for the clocks exposed by the Resource Power Manager
+	  processor on devices like apq8016, apq8084 and msm8974.
+
 config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	select QCOM_GDSC
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index dc4280b85db1..d5a08b1d946e 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -10,6 +10,7 @@ clk-qcom-y += clk-branch.o
 clk-qcom-y += clk-regmap-divider.o
 clk-qcom-y += clk-regmap-mux.o
 clk-qcom-y += reset.o
+clk-qcom-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
new file mode 100644
index 000000000000..a9ff7020ed15
--- /dev/null
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -0,0 +1,433 @@
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
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/soc/qcom/smd-rpm.h>
+
+#include "clk-smd-rpm.h"
+#include <dt-bindings/clock/qcom,rpmcc.h>
+
+#define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
+
+static DEFINE_MUTEX(rpm_smd_clk_lock);
+
+static int clk_smd_rpm_set_rate_active(struct clk_smd_rpm *r,
+				       unsigned long rate)
+{
+	struct clk_smd_rpm_req req = {
+		.key = cpu_to_le32(r->rpm_key),
+		.nbytes = cpu_to_le32(sizeof(u32)),
+		.value = cpu_to_le32(DIV_ROUND_UP(rate, 1000)), /* to kHz */
+	};
+
+	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_ACTIVE_STATE,
+				  r->rpm_res_type, r->rpm_clk_id, &req,
+				  sizeof(req));
+}
+
+static int clk_smd_rpm_set_rate_sleep(struct clk_smd_rpm *r,
+				      unsigned long rate)
+{
+	struct clk_smd_rpm_req req = {
+		.key = cpu_to_le32(r->rpm_key),
+		.nbytes = cpu_to_le32(sizeof(u32)),
+		.value = cpu_to_le32(DIV_ROUND_UP(rate, 1000)), /* to kHz */
+	};
+
+	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_SLEEP_STATE,
+				  r->rpm_res_type, r->rpm_clk_id, &req,
+				  sizeof(req));
+}
+
+static void to_active_sleep(struct clk_smd_rpm *r, unsigned long rate,
+			    unsigned long *active, unsigned long *sleep)
+{
+	*active = rate;
+
+	/*
+	 * Active-only clocks don't care what the rate is during sleep. So,
+	 * they vote for zero.
+	 */
+	if (r->active_only)
+		*sleep = 0;
+	else
+		*sleep = *active;
+}
+
+static int clk_smd_rpm_prepare(struct clk_hw *hw)
+{
+	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
+	struct clk_smd_rpm *peer = r->peer;
+	unsigned long this_rate = 0, this_sleep_rate = 0;
+	unsigned long peer_rate = 0, peer_sleep_rate = 0;
+	unsigned long active_rate, sleep_rate;
+	int ret = 0;
+
+	mutex_lock(&rpm_smd_clk_lock);
+
+	/* Don't send requests to the RPM if the rate has not been set. */
+	if (!r->rate)
+		goto out;
+
+	to_active_sleep(r, r->rate, &this_rate, &this_sleep_rate);
+
+	/* Take peer clock's rate into account only if it's enabled. */
+	if (peer->enabled)
+		to_active_sleep(peer, peer->rate,
+				&peer_rate, &peer_sleep_rate);
+
+	active_rate = max(this_rate, peer_rate);
+
+	if (r->branch)
+		active_rate = !!active_rate;
+
+	ret = clk_smd_rpm_set_rate_active(r, active_rate);
+	if (ret)
+		goto out;
+
+	sleep_rate = max(this_sleep_rate, peer_sleep_rate);
+	if (r->branch)
+		sleep_rate = !!sleep_rate;
+
+	ret = clk_smd_rpm_set_rate_sleep(r, sleep_rate);
+	if (ret)
+		/* Undo the active set vote and restore it */
+		ret = clk_smd_rpm_set_rate_active(r, peer_rate);
+
+out:
+	if (!ret)
+		r->enabled = true;
+
+	mutex_unlock(&rpm_smd_clk_lock);
+
+	return ret;
+}
+
+static void clk_smd_rpm_unprepare(struct clk_hw *hw)
+{
+	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
+	struct clk_smd_rpm *peer = r->peer;
+	unsigned long peer_rate = 0, peer_sleep_rate = 0;
+	unsigned long active_rate, sleep_rate;
+	int ret;
+
+	mutex_lock(&rpm_smd_clk_lock);
+
+	if (!r->rate)
+		goto out;
+
+	/* Take peer clock's rate into account only if it's enabled. */
+	if (peer->enabled)
+		to_active_sleep(peer, peer->rate, &peer_rate,
+				&peer_sleep_rate);
+
+	active_rate = r->branch ? !!peer_rate : peer_rate;
+	ret = clk_smd_rpm_set_rate_active(r, active_rate);
+	if (ret)
+		goto out;
+
+	sleep_rate = r->branch ? !!peer_sleep_rate : peer_sleep_rate;
+	ret = clk_smd_rpm_set_rate_sleep(r, sleep_rate);
+	if (ret)
+		goto out;
+
+	r->enabled = false;
+
+out:
+	mutex_unlock(&rpm_smd_clk_lock);
+}
+
+static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
+	struct clk_smd_rpm *peer = r->peer;
+	unsigned long active_rate, sleep_rate;
+	unsigned long this_rate = 0, this_sleep_rate = 0;
+	unsigned long peer_rate = 0, peer_sleep_rate = 0;
+	int ret = 0;
+
+	mutex_lock(&rpm_smd_clk_lock);
+
+	if (!r->enabled)
+		goto out;
+
+	to_active_sleep(r, rate, &this_rate, &this_sleep_rate);
+
+	/* Take peer clock's rate into account only if it's enabled. */
+	if (peer->enabled)
+		to_active_sleep(peer, peer->rate,
+				&peer_rate, &peer_sleep_rate);
+
+	active_rate = max(this_rate, peer_rate);
+	ret = clk_smd_rpm_set_rate_active(r, active_rate);
+	if (ret)
+		goto out;
+
+	sleep_rate = max(this_sleep_rate, peer_sleep_rate);
+	ret = clk_smd_rpm_set_rate_sleep(r, sleep_rate);
+	if (ret)
+		goto out;
+
+	r->rate = rate;
+
+out:
+	mutex_unlock(&rpm_smd_clk_lock);
+
+	return ret;
+}
+
+static long clk_smd_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long *parent_rate)
+{
+	/*
+	 * RPM handles rate rounding and we don't have a way to
+	 * know what the rate will be, so just return whatever
+	 * rate is requested.
+	 */
+	return rate;
+}
+
+static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
+
+	/*
+	 * RPM handles rate rounding and we don't have a way to
+	 * know what the rate will be, so just return whatever
+	 * rate was set.
+	 */
+	return r->rate;
+}
+
+static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
+{
+	int ret;
+	struct clk_smd_rpm_req req = {
+		.key = cpu_to_le32(QCOM_RPM_SMD_KEY_ENABLE),
+		.nbytes = cpu_to_le32(sizeof(u32)),
+		.value = cpu_to_le32(1),
+	};
+
+	ret = qcom_rpm_smd_write(rpm, QCOM_SMD_RPM_SLEEP_STATE,
+				 QCOM_SMD_RPM_MISC_CLK,
+				 QCOM_RPM_SCALING_ENABLE_ID, &req, sizeof(req));
+	if (ret) {
+		pr_err("RPM clock scaling (sleep set) not enabled!\n");
+		return ret;
+	}
+
+	ret = qcom_rpm_smd_write(rpm, QCOM_SMD_RPM_ACTIVE_STATE,
+				 QCOM_SMD_RPM_MISC_CLK,
+				 QCOM_RPM_SCALING_ENABLE_ID, &req, sizeof(req));
+	if (ret) {
+		pr_err("RPM clock scaling (active set) not enabled!\n");
+		return ret;
+	}
+
+	pr_debug("%s: RPM clock scaling is enabled\n", __func__);
+	return 0;
+}
+
+const struct clk_ops clk_smd_rpm_ops = {
+	.prepare	= clk_smd_rpm_prepare,
+	.unprepare	= clk_smd_rpm_unprepare,
+	.set_rate	= clk_smd_rpm_set_rate,
+	.round_rate	= clk_smd_rpm_round_rate,
+	.recalc_rate	= clk_smd_rpm_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_smd_rpm_ops);
+
+const struct clk_ops clk_smd_rpm_branch_ops = {
+	.prepare	= clk_smd_rpm_prepare,
+	.unprepare	= clk_smd_rpm_unprepare,
+	.round_rate	= clk_smd_rpm_round_rate,
+	.recalc_rate	= clk_smd_rpm_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_smd_rpm_branch_ops);
+
+struct rpm_cc {
+	struct qcom_rpm *rpm;
+	struct clk_onecell_data data;
+	struct clk *clks[];
+};
+
+struct rpm_smd_clk_desc {
+	struct clk_smd_rpm **clks;
+	size_t num_clks;
+};
+
+/* msm8916 */
+DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(msm8916, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(msm8916, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM_BRANCH(msm8916, xo, xo_a, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
+DEFINE_CLK_SMD_RPM_QDSS(msm8916, qdss_clk, qdss_a_clk, QCOM_SMD_RPM_MISC_CLK, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk1, bb_clk1_a, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, bb_clk2, bb_clk2_a, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, rf_clk1, rf_clk1_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8916, rf_clk2, rf_clk2_a, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1_pin, bb_clk1_a_pin, 1);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2_pin, bb_clk2_a_pin, 2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1_pin, rf_clk1_a_pin, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2_pin, rf_clk2_a_pin, 5);
+
+static struct clk_smd_rpm *msm8916_clks[] = {
+	[RPM_XO_CLK_SRC]	= &msm8916_xo,
+	[RPM_XO_A_CLK_SRC]	= &msm8916_xo_a,
+	[RPM_PCNOC_CLK]		= &msm8916_pcnoc_clk,
+	[RPM_PCNOC_A_CLK]	= &msm8916_pcnoc_a_clk,
+	[RPM_SNOC_CLK]		= &msm8916_snoc_clk,
+	[RPM_SNOC_A_CLK]	= &msm8916_snoc_a_clk,
+	[RPM_BIMC_CLK]		= &msm8916_bimc_clk,
+	[RPM_BIMC_A_CLK]	= &msm8916_bimc_a_clk,
+	[RPM_QDSS_CLK]		= &msm8916_qdss_clk,
+	[RPM_QDSS_A_CLK]	= &msm8916_qdss_a_clk,
+	[RPM_BB_CLK1]		= &msm8916_bb_clk1,
+	[RPM_BB_CLK1_A]		= &msm8916_bb_clk1_a,
+	[RPM_BB_CLK2]		= &msm8916_bb_clk2,
+	[RPM_BB_CLK2_A]		= &msm8916_bb_clk2_a,
+	[RPM_RF_CLK1]		= &msm8916_rf_clk1,
+	[RPM_RF_CLK1_A]		= &msm8916_rf_clk1_a,
+	[RPM_RF_CLK2]		= &msm8916_rf_clk2,
+	[RPM_RF_CLK2_A]		= &msm8916_rf_clk2_a,
+	[RPM_BB_CLK1_PIN]	= &msm8916_bb_clk1_pin,
+	[RPM_BB_CLK1_A_PIN]	= &msm8916_bb_clk1_a_pin,
+	[RPM_BB_CLK2_PIN]	= &msm8916_bb_clk2_pin,
+	[RPM_BB_CLK2_A_PIN]	= &msm8916_bb_clk2_a_pin,
+	[RPM_RF_CLK1_PIN]	= &msm8916_rf_clk1_pin,
+	[RPM_RF_CLK1_A_PIN]	= &msm8916_rf_clk1_a_pin,
+	[RPM_RF_CLK2_PIN]	= &msm8916_rf_clk2_pin,
+	[RPM_RF_CLK2_A_PIN]	= &msm8916_rf_clk2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8916 = {
+	.clks = msm8916_clks,
+	.num_clks = ARRAY_SIZE(msm8916_clks),
+};
+
+static const struct of_device_id rpm_smd_clk_match_table[] = {
+	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
+
+static int rpm_smd_clk_probe(struct platform_device *pdev)
+{
+	struct clk **clks;
+	struct clk *clk;
+	struct rpm_cc *rcc;
+	struct clk_onecell_data *data;
+	int ret, i;
+	size_t num_clks;
+	struct qcom_smd_rpm *rpm;
+	struct clk_smd_rpm **rpm_smd_clks;
+	const struct rpm_smd_clk_desc *desc;
+
+	rpm = dev_get_drvdata(pdev->dev.parent);
+	if (!rpm) {
+		dev_err(&pdev->dev, "Unable to retrieve handle to RPM\n");
+		return -ENODEV;
+	}
+
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	rpm_smd_clks = desc->clks;
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
+		if (!rpm_smd_clks[i]) {
+			clks[i] = ERR_PTR(-ENOENT);
+			continue;
+		}
+
+		rpm_smd_clks[i]->rpm = rpm;
+		clk = devm_clk_register(&pdev->dev, &rpm_smd_clks[i]->hw);
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			goto err;
+		}
+
+		clks[i] = clk;
+	}
+
+	ret = of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
+				  data);
+	if (ret)
+		goto err;
+
+	ret = clk_smd_rpm_enable_scaling(rpm);
+	if (ret) {
+		of_clk_del_provider(pdev->dev.of_node);
+		goto err;
+	}
+
+	return 0;
+err:
+	dev_err(&pdev->dev, "Error registering SMD clock driver (%d)\n", ret);
+	return ret;
+}
+
+static int rpm_smd_clk_remove(struct platform_device *pdev)
+{
+	of_clk_del_provider(pdev->dev.of_node);
+	return 0;
+}
+
+static struct platform_driver rpm_smd_clk_driver = {
+	.driver = {
+		.name = "qcom-clk-smd-rpm",
+		.of_match_table = rpm_smd_clk_match_table,
+	},
+	.probe = rpm_smd_clk_probe,
+	.remove = rpm_smd_clk_remove,
+};
+
+static int __init rpm_smd_clk_init(void)
+{
+	return platform_driver_register(&rpm_smd_clk_driver);
+}
+core_initcall(rpm_smd_clk_init);
+
+static void __exit rpm_smd_clk_exit(void)
+{
+	platform_driver_unregister(&rpm_smd_clk_driver);
+}
+module_exit(rpm_smd_clk_exit);
+
+MODULE_DESCRIPTION("Qualcomm RPM over SMD Clock Controller Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:qcom-clk-smd-rpm");
diff --git a/drivers/clk/qcom/clk-smd-rpm.h b/drivers/clk/qcom/clk-smd-rpm.h
new file mode 100644
index 000000000000..7ac58294d368
--- /dev/null
+++ b/drivers/clk/qcom/clk-smd-rpm.h
@@ -0,0 +1,142 @@
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
+#ifndef __QCOM_CLK_SMD_RPM_H__
+#define __QCOM_CLK_SMD_RPM_H__
+
+#include <linux/clk-provider.h>
+
+#define QCOM_RPM_KEY_SOFTWARE_ENABLE			0x6e657773
+#define QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY	0x62636370
+#define QCOM_RPM_SMD_KEY_RATE				0x007a484b
+#define QCOM_RPM_SMD_KEY_ENABLE				0x62616e45
+#define QCOM_RPM_SMD_KEY_STATE				0x54415453
+#define QCOM_RPM_SCALING_ENABLE_ID			0x2
+
+struct qcom_smd_rpm;
+
+struct clk_smd_rpm {
+	const int rpm_res_type;
+	const int rpm_key;
+	const int rpm_clk_id;
+	const int rpm_status_id;
+	const bool active_only;
+	bool enabled;
+	bool branch;
+	struct clk_smd_rpm *peer;
+	struct clk_hw hw;
+	unsigned long rate;
+	struct qcom_smd_rpm *rpm;
+};
+
+struct clk_smd_rpm_req {
+	__le32 key;
+	__le32 nbytes;
+	__le32 value;
+};
+
+extern const struct clk_ops clk_smd_rpm_ops;
+extern const struct clk_ops clk_smd_rpm_branch_ops;
+
+#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, stat_id,  \
+			     key)					      \
+	static struct clk_smd_rpm _platform##_##_active;		      \
+	static struct clk_smd_rpm _platform##_##_name = {		      \
+		.rpm_res_type = (type),					      \
+		.rpm_clk_id = (r_id),					      \
+		.rpm_status_id = (stat_id),				      \
+		.rpm_key = (key),					      \
+		.peer = &_platform##_##_active,				      \
+		.rate = INT_MAX,					      \
+		.hw.init = &(struct clk_init_data){			      \
+			.ops = &clk_smd_rpm_ops,			      \
+			.name = #_name,					      \
+			.parent_names = (const char *[]){ "xo_board" },       \
+			.num_parents = 1,				      \
+		},							      \
+	};								      \
+	static struct clk_smd_rpm _platform##_##_active = {		      \
+		.rpm_res_type = (type),					      \
+		.rpm_clk_id = (r_id),					      \
+		.rpm_status_id = (stat_id),				      \
+		.rpm_key = (key),					      \
+		.peer = &_platform##_##_name,				      \
+		.active_only = true,					      \
+		.rate = INT_MAX,					      \
+		.hw.init = &(struct clk_init_data){			      \
+			.ops = &clk_smd_rpm_ops,			      \
+			.name = #_active,				      \
+			.parent_names = (const char *[]){ "xo_board" },	      \
+			.num_parents = 1,				      \
+		},							      \
+	}
+
+#define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
+				    stat_id, r, key)			      \
+	static struct clk_smd_rpm _platform##_##_active;		      \
+	static struct clk_smd_rpm _platform##_##_name = {		      \
+		.rpm_res_type = (type),					      \
+		.rpm_clk_id = (r_id),					      \
+		.rpm_status_id = (stat_id),				      \
+		.rpm_key = (key),					      \
+		.peer = &_platform##_##_active,				      \
+		.branch = true,						      \
+		.rate = (r),						      \
+		.hw.init = &(struct clk_init_data){			      \
+			.ops = &clk_smd_rpm_branch_ops,			      \
+			.name = #_name,					      \
+			.parent_names = (const char *[]){ "xo_board" },	      \
+			.num_parents = 1,				      \
+		},							      \
+	};								      \
+	static struct clk_smd_rpm _platform##_##_active = {		      \
+		.rpm_res_type = (type),					      \
+		.rpm_clk_id = (r_id),					      \
+		.rpm_status_id = (stat_id),				      \
+		.rpm_key = (key),					      \
+		.peer = &_platform##_##_name,				      \
+		.active_only = true,					      \
+		.branch = true,						      \
+		.rate = (r),						      \
+		.hw.init = &(struct clk_init_data){			      \
+			.ops = &clk_smd_rpm_branch_ops,			      \
+			.name = #_active,				      \
+			.parent_names = (const char *[]){ "xo_board" },	      \
+			.num_parents = 1,				      \
+		},							      \
+	}
+
+#define DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id)	      \
+		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
+		0, QCOM_RPM_SMD_KEY_RATE)
+
+#define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
+		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE)
+
+#define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
+		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
+		0, QCOM_RPM_SMD_KEY_STATE)
+
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id)	      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
+		QCOM_RPM_KEY_SOFTWARE_ENABLE)
+
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active, r_id) \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
+		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
+
+#endif
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
new file mode 100644
index 000000000000..7800ab465d48
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -0,0 +1,45 @@
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
+#ifndef _DT_BINDINGS_CLK_MSM_RPMCC_H
+#define _DT_BINDINGS_CLK_MSM_RPMCC_H
+
+/* msm8916 */
+#define RPM_XO_CLK_SRC				0
+#define RPM_XO_A_CLK_SRC			1
+#define RPM_PCNOC_CLK				2
+#define RPM_PCNOC_A_CLK				3
+#define RPM_SNOC_CLK				4
+#define RPM_SNOC_A_CLK				5
+#define RPM_BIMC_CLK				6
+#define RPM_BIMC_A_CLK				7
+#define RPM_QDSS_CLK				8
+#define RPM_QDSS_A_CLK				9
+#define RPM_BB_CLK1				10
+#define RPM_BB_CLK1_A				11
+#define RPM_BB_CLK2				12
+#define RPM_BB_CLK2_A				13
+#define RPM_RF_CLK1				14
+#define RPM_RF_CLK1_A				15
+#define RPM_RF_CLK2				16
+#define RPM_RF_CLK2_A				17
+#define RPM_BB_CLK1_PIN				18
+#define RPM_BB_CLK1_A_PIN			19
+#define RPM_BB_CLK2_PIN				20
+#define RPM_BB_CLK2_A_PIN			21
+#define RPM_RF_CLK1_PIN				22
+#define RPM_RF_CLK1_A_PIN			23
+#define RPM_RF_CLK2_PIN				24
+#define RPM_RF_CLK2_A_PIN			25
+
+#endif
