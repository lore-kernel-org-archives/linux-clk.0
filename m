Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: Add support for RPM Clocks
Date: Thu,  9 Jul 2015 15:18:29 +0300
Message-Id: <1436444310-15108-2-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1436444310-15108-1-git-send-email-georgi.djakov@linaro.org>
References: <1436444310-15108-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patch adds initial support for clocks controlled by the RPM
(Resource Power Manager) processor found on some Qualcomm SoCs.

The RPM is a dedicated hardware engine for managing the shared
SoC resources in order to keep the lowest power profile. It
communicates with other hardware subsystems via shared memory
and accepts clock requests, aggregates the requests and turns
the clocks on/off or scales them on demand.

This work is based on the codeaurora.org driver:
https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/clk/qcom/clock-rpm.c

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/Makefile  |    1 +
 drivers/clk/qcom/clk-rpm.c |  164 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-rpm.h |  137 ++++++++++++++++++++++++++++++++++++
 3 files changed, 302 insertions(+)
 create mode 100644 drivers/clk/qcom/clk-rpm.c
 create mode 100644 drivers/clk/qcom/clk-rpm.h

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 50b337a24a87..4d14a73ee4ed 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -8,6 +8,7 @@ clk-qcom-y += clk-rcg2.o
 clk-qcom-y += clk-branch.o
 clk-qcom-y += clk-regmap-divider.o
 clk-qcom-y += clk-regmap-mux.o
+clk-qcom-y += clk-rpm.o
 clk-qcom-y += reset.o
 
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
new file mode 100644
index 000000000000..58d858f760ea
--- /dev/null
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -0,0 +1,164 @@
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
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include "clk-rpm.h"
+
+static int clk_rpm_set_rate_active(struct clk_rpm *r, unsigned long value)
+{
+	struct rpm_clk_req req = {
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
+static int clk_rpm_prepare(struct clk_hw *hw)
+{
+	struct clk_rpm *r = to_clk_rpm(hw);
+	struct clk_rpm *peer = r->peer;
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
+	ret = clk_rpm_set_rate_active(r, value);
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
+static void clk_rpm_unprepare(struct clk_hw *hw)
+{
+	struct clk_rpm *r = to_clk_rpm(hw);
+
+	if (r->rate) {
+		struct clk_rpm *peer = r->peer;
+		unsigned long peer_rate;
+		u32 value;
+		int ret;
+
+		/* Take peer clock's rate into account only if it's enabled. */
+		peer_rate = peer->enabled ? peer->rate : 0;
+		value = r->branch ? !!peer_rate : peer_rate;
+		ret = clk_rpm_set_rate_active(r, value);
+		if (ret)
+			return;
+	}
+	r->enabled = false;
+}
+
+static int clk_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct clk_rpm *r = to_clk_rpm(hw);
+	int ret = 0;
+
+	if (r->enabled) {
+		u32 value;
+		struct clk_rpm *peer = r->peer;
+
+		/* Take peer clock's rate into account only if it's enabled. */
+		if (peer->enabled)
+			value = max(rate, peer->rate);
+		else
+			value = rate;
+
+		ret = clk_rpm_set_rate_active(r, value);
+		if (ret)
+			goto out;
+	}
+	r->rate = rate;
+out:
+	return ret;
+}
+
+static long clk_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *parent_rate)
+{
+	return rate;
+}
+
+static unsigned long clk_rpm_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct clk_rpm *r = to_clk_rpm(hw);
+
+	return r->rate;
+}
+
+int clk_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
+{
+	int ret;
+	struct rpm_clk_req req = {
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
+
+const struct clk_ops clk_rpm_ops = {
+	.prepare = clk_rpm_prepare,
+	.unprepare = clk_rpm_unprepare,
+	.set_rate = clk_rpm_set_rate,
+	.round_rate = clk_rpm_round_rate,
+	.recalc_rate = clk_rpm_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_rpm_ops);
+
+const struct clk_ops clk_rpm_branch_ops = {
+	.prepare = clk_rpm_prepare,
+	.unprepare = clk_rpm_unprepare,
+	.round_rate = clk_rpm_round_rate,
+	.recalc_rate = clk_rpm_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_rpm_branch_ops);
diff --git a/drivers/clk/qcom/clk-rpm.h b/drivers/clk/qcom/clk-rpm.h
new file mode 100644
index 000000000000..51bedf787775
--- /dev/null
+++ b/drivers/clk/qcom/clk-rpm.h
@@ -0,0 +1,137 @@
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
+#include <linux/mfd/qcom-smd-rpm.h>
+
+#define QCOM_RPM_KEY_SOFTWARE_ENABLE			0x6e657773
+#define QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY	0x62636370
+#define QCOM_RPM_SMD_KEY_RATE				0x007a484b
+#define QCOM_RPM_SMD_KEY_ENABLE				0x62616e45
+#define QCOM_RPM_SMD_KEY_STATE				0x54415453
+#define QCOM_RPM_SCALING_ENABLE_ID			0x2
+
+struct clk_rpm {
+	const int rpm_res_type;
+	const int rpm_key;
+	const int rpm_clk_id;
+	const int rpm_status_id;
+	const bool active_only;
+	bool enabled;
+	bool branch;
+	struct clk_rpm *peer;
+	struct clk_hw hw;
+	unsigned long rate;
+	struct qcom_smd_rpm *rpm;
+};
+
+struct rpm_clk_req {
+	u32 key;
+	u32 nbytes;
+	u32 value;
+};
+
+extern const struct clk_ops clk_rpm_ops;
+extern const struct clk_ops clk_rpm_branch_ops;
+int clk_rpm_enable_scaling(struct qcom_smd_rpm *rpm);
+
+#define to_clk_rpm(_hw) container_of(_hw, struct clk_rpm, hw)
+
+#define __DEFINE_CLK_RPM(_name, active, type, r_id, stat_id, dep, key) \
+	static struct clk_rpm active; \
+	static struct clk_rpm _name = { \
+		.rpm_res_type = (type), \
+		.rpm_clk_id = (r_id), \
+		.rpm_status_id = (stat_id), \
+		.rpm_key = (key), \
+		.peer = &active, \
+		.rate = INT_MAX, \
+		.hw.init = &(struct clk_init_data){ \
+			.ops = &clk_rpm_ops, \
+			.name = #_name, \
+			.flags = CLK_IS_ROOT, \
+		}, \
+	}; \
+	static struct clk_rpm active = { \
+		.rpm_res_type = (type), \
+		.rpm_clk_id = (r_id), \
+		.rpm_status_id = (stat_id), \
+		.rpm_key = (key), \
+		.peer = &_name, \
+		.active_only = true, \
+		.rate = INT_MAX, \
+		.hw.init = &(struct clk_init_data){ \
+			.ops = &clk_rpm_ops, \
+			.name = #active, \
+			.flags = CLK_IS_ROOT, \
+		}, \
+	};
+
+#define __DEFINE_CLK_RPM_BRANCH(_name, active, type, r_id, stat_id, r, \
+				key) \
+	static struct clk_rpm active; \
+	static struct clk_rpm _name = { \
+		.rpm_res_type = (type), \
+		.rpm_clk_id = (r_id), \
+		.rpm_status_id = (stat_id), \
+		.rpm_key = (key), \
+		.peer = &active, \
+		.branch = true, \
+		.rate = (r), \
+		.hw.init = &(struct clk_init_data){ \
+			.ops = &clk_rpm_branch_ops, \
+			.name = #_name, \
+			.flags = CLK_IS_ROOT, \
+		}, \
+	}; \
+	static struct clk_rpm active = { \
+		.rpm_res_type = (type), \
+		.rpm_clk_id = (r_id), \
+		.rpm_status_id = (stat_id), \
+		.rpm_key = (key), \
+		.peer = &_name, \
+		.active_only = true, \
+		.branch = true, \
+		.rate = (r), \
+		.hw.init = &(struct clk_init_data){ \
+			.ops = &clk_rpm_branch_ops, \
+			.name = #active, \
+			.flags = CLK_IS_ROOT, \
+		}, \
+	};
+
+#define DEFINE_CLK_RPM_SMD(_name, active, type, r_id, dep) \
+		__DEFINE_CLK_RPM(_name, active, type, r_id, 0, dep, \
+		QCOM_RPM_SMD_KEY_RATE)
+
+#define DEFINE_CLK_RPM_SMD_BRANCH(_name, active, type, r_id, r) \
+		__DEFINE_CLK_RPM_BRANCH(_name, active, type, r_id, 0, r, \
+		QCOM_RPM_SMD_KEY_ENABLE)
+
+#define DEFINE_CLK_RPM_SMD_QDSS(_name, active, type, r_id) \
+		__DEFINE_CLK_RPM(_name, active, type, r_id, \
+		0, 0, QCOM_RPM_SMD_KEY_STATE)
+
+#define DEFINE_CLK_RPM_SMD_XO_BUFFER(_name, active, r_id) \
+		__DEFINE_CLK_RPM_BRANCH(_name, active, QCOM_SMD_RPM_CLK_BUF_A, \
+		r_id, 0, 1000, QCOM_RPM_KEY_SOFTWARE_ENABLE)
+
+#define DEFINE_CLK_RPM_SMD_XO_BUFFER_PINCTRL(_name, active, r_id) \
+		__DEFINE_CLK_RPM_BRANCH(_name, active, QCOM_SMD_RPM_CLK_BUF_A, \
+		r_id, 0, 1000, QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
+
+#endif
