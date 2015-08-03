Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v2 1/2] clk: qcom: Add support for RPM Clocks
Date: Mon,  3 Aug 2015 19:48:08 +0300
Message-Id: <1438620489-32515-2-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1438620489-32515-1-git-send-email-georgi.djakov@linaro.org>
References: <1438620489-32515-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This adds initial support for clocks controlled by the Resource
Power Manager (RPM) processor found on some Qualcomm SoCs.

The RPM is a dedicated hardware engine for managing the shared
SoC resources in order to keep the lowest power profile. It
communicates with other hardware subsystems via shared memory
and accepts clock requests, aggregates the requests and turns
the clocks on/off or scales them on demand.

This driver is based on the codeaurora.org driver:
https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/clk/qcom/clock-rpm.c

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/Kconfig       |    3 +
 drivers/clk/qcom/Makefile      |    1 +
 drivers/clk/qcom/clk-smd-rpm.c |  165 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-smd-rpm.h |  139 +++++++++++++++++++++++++++++++++
 4 files changed, 308 insertions(+)
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.c
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.h

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 59d16668bdf5..e347b97aa9c7 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -5,6 +5,9 @@ config COMMON_CLK_QCOM
 	select REGMAP_MMIO
 	select RESET_CONTROLLER
 
+config QCOM_CLK_SMD_RPM
+	bool
+
 config APQ_GCC_8084
 	tristate "APQ8084 Global Clock Controller"
 	depends on COMMON_CLK_QCOM
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 50b337a24a87..33adf1d97da3 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -9,6 +9,7 @@ clk-qcom-y += clk-branch.o
 clk-qcom-y += clk-regmap-divider.o
 clk-qcom-y += clk-regmap-mux.o
 clk-qcom-y += reset.o
+clk-qcom-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
new file mode 100644
index 000000000000..e564673ec3a5
--- /dev/null
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -0,0 +1,165 @@
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
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+
+#include "clk-smd-rpm.h"
+
+static int clk_smd_rpm_set_rate_active(struct clk_smd_rpm *r,
+				       unsigned long value)
+{
+	struct clk_smd_rpm_req req = {
+		.key = QCOM_RPM_SMD_KEY_RATE,
+		.nbytes = sizeof(u32),
+		.value = DIV_ROUND_UP(value, 1000), /* RPM expects KHz */
+	};
+
+	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_ACTIVE_STATE,
+				  r->rpm_res_type, r->rpm_clk_id, &req,
+				  sizeof(req));
+}
+
+static int clk_smd_rpm_prepare(struct clk_hw *hw)
+{
+	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
+	struct clk_smd_rpm *peer = r->peer;
+	u32 value;
+	int ret = 0;
+
+	/* Don't send requests to the RPM if the rate has not been set. */
+	if (!r->rate)
+		goto out;
+
+	/* Take peer clock's rate into account only if it's enabled. */
+	if (peer->enabled)
+		value = max(r->rate, peer->rate);
+	else
+		value = r->rate;
+
+	if (r->branch)
+		value = !!value;
+
+	ret = clk_smd_rpm_set_rate_active(r, value);
+	if (ret)
+		goto out;
+
+out:
+	if (!ret)
+		r->enabled = true;
+
+	return ret;
+}
+
+static void clk_smd_rpm_unprepare(struct clk_hw *hw)
+{
+	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
+
+	if (r->rate) {
+		struct clk_smd_rpm *peer = r->peer;
+		unsigned long peer_rate;
+		u32 value;
+		int ret;
+
+		/* Take peer clock's rate into account only if it's enabled. */
+		peer_rate = peer->enabled ? peer->rate : 0;
+		value = r->branch ? !!peer_rate : peer_rate;
+		ret = clk_smd_rpm_set_rate_active(r, value);
+		if (ret)
+			return;
+	}
+	r->enabled = false;
+}
+
+static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
+	int ret = 0;
+
+	if (r->enabled) {
+		u32 value;
+		struct clk_smd_rpm *peer = r->peer;
+
+		/* Take peer clock's rate into account only if it's enabled. */
+		if (peer->enabled)
+			value = max(rate, peer->rate);
+		else
+			value = rate;
+
+		ret = clk_smd_rpm_set_rate_active(r, value);
+		if (ret)
+			goto out;
+	}
+	r->rate = rate;
+out:
+	return ret;
+}
+
+static long clk_smd_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long *parent_rate)
+{
+	return rate;
+}
+
+static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
+					     unsigned long parent_rate)
+{
+	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
+
+	return r->rate;
+}
+
+int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
+{
+	int ret;
+	struct clk_smd_rpm_req req = {
+		.key = QCOM_RPM_SMD_KEY_ENABLE,
+		.nbytes = sizeof(u32),
+		.value = 1,
+	};
+
+	ret = qcom_rpm_smd_write(rpm, QCOM_SMD_RPM_ACTIVE_STATE,
+				 QCOM_SMD_RPM_MISC_CLK,
+				 QCOM_RPM_SCALING_ENABLE_ID, &req, sizeof(req));
+	if (ret < 0) {
+		if (ret != -EPROBE_DEFER)
+			pr_err("RPM clock scaling (active set) not enabled!\n");
+		return ret;
+	}
+
+	pr_debug("%s: RPM clock scaling is enabled\n", __func__);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(clk_smd_rpm_enable_scaling);
+
+const struct clk_ops clk_smd_rpm_ops = {
+	.prepare = clk_smd_rpm_prepare,
+	.unprepare = clk_smd_rpm_unprepare,
+	.set_rate = clk_smd_rpm_set_rate,
+	.round_rate = clk_smd_rpm_round_rate,
+	.recalc_rate = clk_smd_rpm_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_smd_rpm_ops);
+
+const struct clk_ops clk_smd_rpm_branch_ops = {
+	.prepare = clk_smd_rpm_prepare,
+	.unprepare = clk_smd_rpm_unprepare,
+	.round_rate = clk_smd_rpm_round_rate,
+	.recalc_rate = clk_smd_rpm_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_smd_rpm_branch_ops);
diff --git a/drivers/clk/qcom/clk-smd-rpm.h b/drivers/clk/qcom/clk-smd-rpm.h
new file mode 100644
index 000000000000..7fd67c0e31b5
--- /dev/null
+++ b/drivers/clk/qcom/clk-smd-rpm.h
@@ -0,0 +1,139 @@
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
+#include <linux/soc/qcom/smd-rpm.h>
+
+#define QCOM_RPM_KEY_SOFTWARE_ENABLE			0x6e657773
+#define QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY	0x62636370
+#define QCOM_RPM_SMD_KEY_RATE				0x007a484b
+#define QCOM_RPM_SMD_KEY_ENABLE				0x62616e45
+#define QCOM_RPM_SMD_KEY_STATE				0x54415453
+#define QCOM_RPM_SCALING_ENABLE_ID			0x2
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
+	u32 key;
+	u32 nbytes;
+	u32 value;
+};
+
+extern const struct clk_ops clk_smd_rpm_ops;
+extern const struct clk_ops clk_smd_rpm_branch_ops;
+int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm);
+
+#define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
+
+#define __DEFINE_CLK_SMD_RPM(_name, active, type, r_id, stat_id, dep, key) \
+	static struct clk_smd_rpm active; \
+	static struct clk_smd_rpm _name = { \
+		.rpm_res_type = (type), \
+		.rpm_clk_id = (r_id), \
+		.rpm_status_id = (stat_id), \
+		.rpm_key = (key), \
+		.peer = &active, \
+		.rate = INT_MAX, \
+		.hw.init = &(struct clk_init_data){ \
+			.ops = &clk_smd_rpm_ops, \
+			.name = #_name, \
+			.flags = CLK_IS_ROOT, \
+		}, \
+	}; \
+	static struct clk_smd_rpm active = { \
+		.rpm_res_type = (type), \
+		.rpm_clk_id = (r_id), \
+		.rpm_status_id = (stat_id), \
+		.rpm_key = (key), \
+		.peer = &_name, \
+		.active_only = true, \
+		.rate = INT_MAX, \
+		.hw.init = &(struct clk_init_data){ \
+			.ops = &clk_smd_rpm_ops, \
+			.name = #active, \
+			.flags = CLK_IS_ROOT, \
+		}, \
+	};
+
+#define __DEFINE_CLK_SMD_RPM_BRANCH(_name, active, type, r_id, stat_id, r, \
+				key) \
+	static struct clk_smd_rpm active; \
+	static struct clk_smd_rpm _name = { \
+		.rpm_res_type = (type), \
+		.rpm_clk_id = (r_id), \
+		.rpm_status_id = (stat_id), \
+		.rpm_key = (key), \
+		.peer = &active, \
+		.branch = true, \
+		.rate = (r), \
+		.hw.init = &(struct clk_init_data){ \
+			.ops = &clk_smd_rpm_branch_ops, \
+			.name = #_name, \
+			.flags = CLK_IS_ROOT, \
+		}, \
+	}; \
+	static struct clk_smd_rpm active = { \
+		.rpm_res_type = (type), \
+		.rpm_clk_id = (r_id), \
+		.rpm_status_id = (stat_id), \
+		.rpm_key = (key), \
+		.peer = &_name, \
+		.active_only = true, \
+		.branch = true, \
+		.rate = (r), \
+		.hw.init = &(struct clk_init_data){ \
+			.ops = &clk_smd_rpm_branch_ops, \
+			.name = #active, \
+			.flags = CLK_IS_ROOT, \
+		}, \
+	};
+
+#define DEFINE_CLK_SMD_RPM(_name, active, type, r_id, dep) \
+		__DEFINE_CLK_SMD_RPM(_name, active, type, r_id, 0, dep, \
+		QCOM_RPM_SMD_KEY_RATE)
+
+#define DEFINE_CLK_SMD_RPM_BRANCH(_name, active, type, r_id, r) \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_name, active, type, r_id, 0, r, \
+		QCOM_RPM_SMD_KEY_ENABLE)
+
+#define DEFINE_CLK_SMD_RPM_QDSS(_name, active, type, r_id) \
+		__DEFINE_CLK_SMD_RPM(_name, active, type, r_id, \
+		0, 0, QCOM_RPM_SMD_KEY_STATE)
+
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_name, active, r_id) \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_name, active, \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000, \
+		QCOM_RPM_KEY_SOFTWARE_ENABLE)
+
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_name, active, r_id) \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_name, active, \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000, \
+		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
+
+#endif
