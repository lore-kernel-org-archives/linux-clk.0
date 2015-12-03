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
Subject: [PATCH v5 4/6] clk: qcom: Add support for RPM Clocks
Date: Thu,  3 Dec 2015 16:02:54 +0200
Message-Id: <1449151376-25930-5-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1449151376-25930-1-git-send-email-georgi.djakov@linaro.org>
References: <1449151376-25930-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This adds initial support for clocks controlled by the Resource
Power Manager (RPM) processor on some Qualcomm SoCs, which use
the qcom_rpm driver to communicate with RPM.
Such platforms are apq8064 and msm8960.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,rpmcc.txt       |    1 +
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpm.c                         |  290 ++++++++++++++++++++
 drivers/clk/qcom/clk-rpm.h                         |   71 +++++
 5 files changed, 371 insertions(+)
 create mode 100644 drivers/clk/qcom/clk-rpm.c
 create mode 100644 drivers/clk/qcom/clk-rpm.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 91be034ea75b..7f7ce1f042fd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -11,6 +11,7 @@ Required properties :
                compatible "qcom,rpmcc" should be also included.
 
 			"qcom,rpmcc-msm8916", "qcom,rpmcc"
+			"qcom,rpmcc-apq8064", "qcom,rpmcc"
 
 - #clock-cells : shall contain 1
 
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index fa1d4cb69d00..c7fee6bdebe3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -20,6 +20,14 @@ config QCOM_CLK_SMD_RPM
 	  Support for the clocks exposed by the Resource Power Manager
 	  processor on devices like apq8016, apq8084 and msm8974.
 
+config QCOM_CLK_RPM
+	tristate "RPM based Clock Controller"
+	depends on COMMON_CLK_QCOM
+	select QCOM_RPMCC
+	help
+	  Support for the clocks exposed by the Resource Power Manager
+	  processor on devices like apq8064.
+
 config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	select QCOM_GDSC
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index d5a08b1d946e..660e332fbdb0 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -10,6 +10,7 @@ clk-qcom-y += clk-branch.o
 clk-qcom-y += clk-regmap-divider.o
 clk-qcom-y += clk-regmap-mux.o
 clk-qcom-y += reset.o
+clk-qcom-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
 clk-qcom-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 
diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
new file mode 100644
index 000000000000..66f204f7120f
--- /dev/null
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -0,0 +1,290 @@
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
+#include <linux/mfd/qcom_rpm.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-rpm.h"
+#include <dt-bindings/mfd/qcom-rpm.h>
+
+#define to_clk_rpm(_hw) container_of(_hw, struct clk_rpm, hw)
+
+static DEFINE_MUTEX(rpm_clk_lock);
+
+static int clk_rpm_set_rate_active(struct clk_rpm *r, unsigned long rate)
+{
+	u32 value = DIV_ROUND_UP(rate, 1000); /* to kHz */
+
+	return qcom_rpm_write(r->rpm, QCOM_RPM_ACTIVE_STATE,
+			      r->rpm_clk_id, &value, 1);
+}
+
+static int clk_rpm_prepare(struct clk_hw *hw)
+{
+	struct clk_rpm *r = to_clk_rpm(hw);
+	unsigned long rate = r->rate;
+	int ret = 0;
+
+	mutex_lock(&rpm_clk_lock);
+
+	if (!rate)
+		goto out;
+
+	if (r->branch)
+		rate = !!rate;
+
+	ret = clk_rpm_set_rate_active(r, rate);
+
+	if (ret)
+		goto out;
+
+out:
+	if (!ret)
+		r->enabled = true;
+
+	mutex_unlock(&rpm_clk_lock);
+
+	return ret;
+}
+
+static void clk_rpm_unprepare(struct clk_hw *hw)
+{
+	struct clk_rpm *r = to_clk_rpm(hw);
+	int ret;
+
+	mutex_lock(&rpm_clk_lock);
+
+	if (!r->rate)
+		goto out;
+
+	ret = clk_rpm_set_rate_active(r, r->rate);
+	if (ret)
+		goto out;
+
+	r->enabled = false;
+
+out:
+	mutex_unlock(&rpm_clk_lock);
+}
+
+static int clk_rpm_set_rate(struct clk_hw *hw,
+		     unsigned long rate, unsigned long parent_rate)
+{
+	struct clk_rpm *r = to_clk_rpm(hw);
+	int ret = 0;
+
+	mutex_lock(&rpm_clk_lock);
+
+	if (r->enabled)
+		ret = clk_rpm_set_rate_active(r, rate);
+
+	if (!ret)
+		r->rate = rate;
+
+	mutex_unlock(&rpm_clk_lock);
+
+	return ret;
+}
+static long clk_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *parent_rate)
+{
+	/*
+	 * RPM handles rate rounding and we don't have a way to
+	 * know what the rate will be, so just return whatever
+	 * rate is requested.
+	 */
+	return rate;
+}
+
+static unsigned long clk_rpm_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct clk_rpm *r = to_clk_rpm(hw);
+
+	/*
+	 * RPM handles rate rounding and we don't have a way to
+	 * know what the rate will be, so just return whatever
+	 * rate was set.
+	 */
+	return r->rate;
+}
+
+const struct clk_ops clk_rpm_ops = {
+	.prepare	= clk_rpm_prepare,
+	.unprepare	= clk_rpm_unprepare,
+	.set_rate	= clk_rpm_set_rate,
+	.round_rate	= clk_rpm_round_rate,
+	.recalc_rate	= clk_rpm_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_rpm_ops);
+
+const struct clk_ops clk_rpm_branch_ops = {
+	.prepare	= clk_rpm_prepare,
+	.unprepare	= clk_rpm_unprepare,
+	.round_rate	= clk_rpm_round_rate,
+	.recalc_rate	= clk_rpm_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_rpm_branch_ops);
+
+struct rpm_cc {
+	struct qcom_rpm *rpm;
+	struct clk_onecell_data data;
+	struct clk *clks[];
+};
+
+struct rpm_clk_desc {
+	struct clk_rpm **clks;
+	size_t num_clks;
+};
+
+/* apq8064 */
+DEFINE_CLK_RPM_PXO_BRANCH(apq8064, pxo, QCOM_RPM_PXO_CLK, 27000000);
+DEFINE_CLK_RPM_CXO_BRANCH(apq8064, cxo, QCOM_RPM_CXO_CLK, 19200000);
+DEFINE_CLK_RPM(apq8064, afab_clk, QCOM_RPM_APPS_FABRIC_CLK);
+DEFINE_CLK_RPM(apq8064, cfpb_clk, QCOM_RPM_CFPB_CLK);
+DEFINE_CLK_RPM(apq8064, daytona_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
+DEFINE_CLK_RPM(apq8064, ebi1_clk, QCOM_RPM_EBI1_CLK);
+DEFINE_CLK_RPM(apq8064, mmfab_clk, QCOM_RPM_MM_FABRIC_CLK);
+DEFINE_CLK_RPM(apq8064, mmfpb_clk, QCOM_RPM_MMFPB_CLK);
+DEFINE_CLK_RPM(apq8064, sfab_clk, QCOM_RPM_SYS_FABRIC_CLK);
+DEFINE_CLK_RPM(apq8064, sfpb_clk, QCOM_RPM_SFPB_CLK);
+DEFINE_CLK_RPM(apq8064, qdss_clk, QCOM_RPM_QDSS_CLK);
+
+static struct clk_rpm *apq8064_clks[] = {
+	[QCOM_RPM_PXO_CLK] = &apq8064_pxo,
+	[QCOM_RPM_CXO_CLK] = &apq8064_cxo,
+	[QCOM_RPM_APPS_FABRIC_CLK] = &apq8064_afab_clk,
+	[QCOM_RPM_CFPB_CLK] = &apq8064_cfpb_clk,
+	[QCOM_RPM_DAYTONA_FABRIC_CLK] = &apq8064_daytona_clk,
+	[QCOM_RPM_EBI1_CLK] = &apq8064_ebi1_clk,
+	[QCOM_RPM_MM_FABRIC_CLK] = &apq8064_mmfab_clk,
+	[QCOM_RPM_MMFPB_CLK] = &apq8064_mmfpb_clk,
+	[QCOM_RPM_SYS_FABRIC_CLK] = &apq8064_sfab_clk,
+	[QCOM_RPM_SFPB_CLK] = &apq8064_sfpb_clk,
+	[QCOM_RPM_QDSS_CLK] = &apq8064_qdss_clk,
+};
+
+static const struct rpm_clk_desc rpm_clk_apq8064 = {
+	.clks = apq8064_clks,
+	.num_clks = ARRAY_SIZE(apq8064_clks),
+};
+
+static const struct of_device_id rpm_clk_match_table[] = {
+	{ .compatible = "qcom,rpmcc-apq8064", .data = &rpm_clk_apq8064},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rpm_clk_match_table);
+
+static int rpm_clk_probe(struct platform_device *pdev)
+{
+	struct clk **clks;
+	struct clk *clk;
+	struct rpm_cc *rcc;
+	struct clk_onecell_data *data;
+	int ret, i;
+	size_t num_clks;
+	struct qcom_rpm *rpm;
+	struct clk_rpm  **rpm_clks;
+	const struct rpm_clk_desc *desc;
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
+	return 0;
+
+err:
+	dev_err(&pdev->dev, "Error registering RPM Clock driver (%d)\n", ret);
+	return ret;
+}
+
+static int rpm_clk_remove(struct platform_device *pdev)
+{
+	of_clk_del_provider(pdev->dev.of_node);
+	return 0;
+}
+
+static struct platform_driver rpm_clk_driver = {
+	.driver = {
+		.name = "qcom-clk-rpm",
+		.of_match_table = rpm_clk_match_table,
+	},
+	.probe = rpm_clk_probe,
+	.remove = rpm_clk_remove,
+};
+
+static int __init rpm_clk_init(void)
+{
+	return platform_driver_register(&rpm_clk_driver);
+}
+core_initcall(rpm_clk_init);
+
+static void __exit rpm_clk_exit(void)
+{
+	platform_driver_unregister(&rpm_clk_driver);
+}
+module_exit(rpm_clk_exit);
+
+MODULE_DESCRIPTION("Qualcomm RPM Clock Controller Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:qcom-clk-rpm");
diff --git a/drivers/clk/qcom/clk-rpm.h b/drivers/clk/qcom/clk-rpm.h
new file mode 100644
index 000000000000..c0ac30f806b5
--- /dev/null
+++ b/drivers/clk/qcom/clk-rpm.h
@@ -0,0 +1,71 @@
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
+#ifndef __QCOM_CLK_RPM_H__
+#define __QCOM_CLK_RPM_H__
+
+#include <linux/clk-provider.h>
+
+struct qcom_rpm;
+
+struct clk_rpm {
+	const int rpm_clk_id;
+	unsigned long rate;
+	bool enabled;
+	bool branch;
+	struct clk_hw hw;
+	struct qcom_rpm *rpm;
+};
+
+extern const struct clk_ops clk_rpm_ops;
+extern const struct clk_ops clk_rpm_branch_ops;
+
+#define DEFINE_CLK_RPM(_platform, _name, r_id)				     \
+	static struct clk_rpm _platform##_##_name = {			     \
+		.rpm_clk_id = (r_id),					     \
+		.rate = INT_MAX,					     \
+		.hw.init = &(struct clk_init_data){			     \
+			.name = #_name,					     \
+			.parent_names = (const char *[]){ "pxo_board" },     \
+			.num_parents = 1,				     \
+			.ops = &clk_rpm_ops,				     \
+		},							     \
+	}
+
+#define DEFINE_CLK_RPM_PXO_BRANCH(_platform, _name, r_id, r)		     \
+	static struct clk_rpm _platform##_##_name = {			     \
+		.rpm_clk_id = (r_id),					     \
+		.branch = true,						     \
+		.rate = (r),						     \
+		.hw.init = &(struct clk_init_data){			     \
+			.name = #_name,					     \
+			.parent_names = (const char *[]){ "pxo_board" },     \
+			.num_parents = 1,				     \
+			.ops = &clk_rpm_branch_ops,			     \
+		},							     \
+	}
+
+#define DEFINE_CLK_RPM_CXO_BRANCH(_platform, _name, r_id, r)		     \
+	static struct clk_rpm _platform##_##_name = {			     \
+		.rpm_clk_id = (r_id),					     \
+		.branch = true,						     \
+		.rate = (r),						     \
+		.hw.init = &(struct clk_init_data){			     \
+			.name = #_name,					     \
+			.parent_names = (const char *[]){ "cxo_board" },     \
+			.num_parents = 1,				     \
+			.ops = &clk_rpm_branch_ops,			     \
+		},							     \
+	}
+#endif
