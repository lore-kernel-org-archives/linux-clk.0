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
Subject: [PATCH v4 3/5] clk: qcom: Add support for RPM Clocks
Date: Thu, 19 Nov 2015 15:57:58 +0200
Message-Id: <1447941480-27487-4-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1447941480-27487-1-git-send-email-georgi.djakov@linaro.org>
References: <1447941480-27487-1-git-send-email-georgi.djakov@linaro.org>
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
 drivers/clk/qcom/clk-smd-rpm.c |  263 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-smd-rpm.h |  142 ++++++++++++++++++++++
 4 files changed, 409 insertions(+)
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.c
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.h

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index ee4c83aab4f4..f06a331e9a24 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1,3 +1,6 @@
+config QCOM_CLK_SMD_RPM
+	bool
+
 config QCOM_GDSC
 	bool
 	select PM_GENERIC_DOMAINS if PM
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index fe6252349e55..b0bc0d3d585f 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -9,6 +9,7 @@ clk-qcom-y += clk-branch.o
 clk-qcom-y += clk-regmap-divider.o
 clk-qcom-y += clk-regmap-mux.o
 clk-qcom-y += reset.o
+clk-qcom-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
new file mode 100644
index 000000000000..44c59bbad1ce
--- /dev/null
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -0,0 +1,263 @@
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
+#include <linux/mutex.h>
+#include <linux/soc/qcom/smd-rpm.h>
+
+#include "clk-smd-rpm.h"
+
+#define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
+
+static DEFINE_MUTEX(rpm_clk_lock);
+
+static int clk_smd_rpm_set_rate_active(struct clk_smd_rpm *r,
+				       unsigned long value)
+{
+	struct clk_smd_rpm_req req = {
+		.key = cpu_to_le32(r->rpm_key),
+		.nbytes = cpu_to_le32(sizeof(u32)),
+		.value = cpu_to_le32(DIV_ROUND_UP(value, 1000)), /* to kHz */
+	};
+
+	return qcom_rpm_smd_write(r->rpm, QCOM_SMD_RPM_ACTIVE_STATE,
+				  r->rpm_res_type, r->rpm_clk_id, &req,
+				  sizeof(req));
+}
+
+static int clk_smd_rpm_set_rate_sleep(struct clk_smd_rpm *r,
+				      unsigned long value)
+{
+	struct clk_smd_rpm_req req = {
+		.key = cpu_to_le32(r->rpm_key),
+		.nbytes = cpu_to_le32(sizeof(u32)),
+		.value = cpu_to_le32(DIV_ROUND_UP(value, 1000)), /* to kHz */
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
+	mutex_lock(&rpm_clk_lock);
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
+	mutex_unlock(&rpm_clk_lock);
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
+	mutex_lock(&rpm_clk_lock);
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
+	mutex_unlock(&rpm_clk_lock);
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
+	mutex_lock(&rpm_clk_lock);
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
+	mutex_unlock(&rpm_clk_lock);
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
+int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
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
index 000000000000..5cdefc30beb7
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
+int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm);
+
+#define __DEFINE_CLK_SMD_RPM(_name, active, type, r_id, stat_id, dep, key)   \
+	static struct clk_smd_rpm active;				     \
+	static struct clk_smd_rpm _name = {				     \
+		.rpm_res_type = (type),					     \
+		.rpm_clk_id = (r_id),					     \
+		.rpm_status_id = (stat_id),				     \
+		.rpm_key = (key),					     \
+		.peer = &active,					     \
+		.rate = INT_MAX,					     \
+		.hw.init = &(struct clk_init_data){			     \
+			.ops = &clk_smd_rpm_ops,			     \
+			.name = #_name,					     \
+			.parent_names = (const char *[]){ "xo_board" },      \
+			.num_parents = 1,				     \
+		},							     \
+	};								     \
+	static struct clk_smd_rpm active = {				     \
+		.rpm_res_type = (type),					     \
+		.rpm_clk_id = (r_id),					     \
+		.rpm_status_id = (stat_id),				     \
+		.rpm_key = (key),					     \
+		.peer = &_name,						     \
+		.active_only = true,					     \
+		.rate = INT_MAX,					     \
+		.hw.init = &(struct clk_init_data){			     \
+			.ops = &clk_smd_rpm_ops,			     \
+			.name = #active,				     \
+			.parent_names = (const char *[]){ "xo_board" },	     \
+			.num_parents = 1,				     \
+		},							     \
+	};
+
+#define __DEFINE_CLK_SMD_RPM_BRANCH(_name, active, type, r_id, stat_id, r,   \
+				    key)				     \
+	static struct clk_smd_rpm active;				     \
+	static struct clk_smd_rpm _name = {				     \
+		.rpm_res_type = (type),					     \
+		.rpm_clk_id = (r_id),					     \
+		.rpm_status_id = (stat_id),				     \
+		.rpm_key = (key),					     \
+		.peer = &active,					     \
+		.branch = true,						     \
+		.rate = (r),						     \
+		.hw.init = &(struct clk_init_data){			     \
+			.ops = &clk_smd_rpm_branch_ops,			     \
+			.name = #_name,					     \
+			.parent_names = (const char *[]){ "xo_board" },	     \
+			.num_parents = 1,				     \
+		},							     \
+	};								     \
+	static struct clk_smd_rpm active = {				     \
+		.rpm_res_type = (type),					     \
+		.rpm_clk_id = (r_id),					     \
+		.rpm_status_id = (stat_id),				     \
+		.rpm_key = (key),					     \
+		.peer = &_name,						     \
+		.active_only = true,					     \
+		.branch = true,						     \
+		.rate = (r),						     \
+		.hw.init = &(struct clk_init_data){			     \
+			.ops = &clk_smd_rpm_branch_ops,			     \
+			.name = #active,				     \
+			.parent_names = (const char *[]){ "xo_board" },	     \
+			.num_parents = 1,				     \
+		},							     \
+	};
+
+#define DEFINE_CLK_SMD_RPM(_name, active, type, r_id, dep)		     \
+		__DEFINE_CLK_SMD_RPM(_name, active, type, r_id, 0, dep,	     \
+		QCOM_RPM_SMD_KEY_RATE)
+
+#define DEFINE_CLK_SMD_RPM_BRANCH(_name, active, type, r_id, r)		     \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_name, active, type, r_id, 0, r, \
+		QCOM_RPM_SMD_KEY_ENABLE)
+
+#define DEFINE_CLK_SMD_RPM_QDSS(_name, active, type, r_id)		     \
+		__DEFINE_CLK_SMD_RPM(_name, active, type, r_id,		     \
+		0, 0, QCOM_RPM_SMD_KEY_STATE)
+
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_name, active, r_id)		     \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_name, active,		     \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			     \
+		QCOM_RPM_KEY_SOFTWARE_ENABLE)
+
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_name, active, r_id)	     \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_name, active,		     \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			     \
+		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
+
+#endif
