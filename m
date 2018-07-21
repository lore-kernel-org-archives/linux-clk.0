Return-Path: <tdas@codeaurora.org>
From: Taniya Das <tdas@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Amit Nischal <anischal@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	grahamr@qti.qualcomm.com,
	Taniya Das <tdas@codeaurora.org>
Subject: [RFC PATCH 1/4] clk: qcom: Add support to request power domain state
Date: Sat, 21 Jul 2018 23:44:59 +0530
Message-Id: <1532196902-28570-2-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1532196902-28570-1-git-send-email-tdas@codeaurora.org>
References: <1532196902-28570-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

There could be single power domain or multiple power domains associated
with a clock controller. Add powerdomain_class support which would help
vote/unvote for any power domain performance state for a clock frequency
to the genpd framework.
A clock frequency request from a consumer would look for the corresponding
performance corner and thus would aggregate and request the desired
performance state to genpd.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Makefile |   1 +
 drivers/clk/qcom/clk-pd.c | 193 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-pd.h |  55 +++++++++++++
 3 files changed, 249 insertions(+)
 create mode 100644 drivers/clk/qcom/clk-pd.c
 create mode 100644 drivers/clk/qcom/clk-pd.h

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 599ab91..336d4da 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -12,6 +12,7 @@ clk-qcom-y += clk-regmap-divider.o
 clk-qcom-y += clk-regmap-mux.o
 clk-qcom-y += clk-regmap-mux-div.o
 clk-qcom-y += reset.o
+clk-qcom-y += clk-pd.o
 clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 
 # Keep alphabetically sorted by config
diff --git a/drivers/clk/qcom/clk-pd.c b/drivers/clk/qcom/clk-pd.c
new file mode 100644
index 0000000..d1f9df3
--- /dev/null
+++ b/drivers/clk/qcom/clk-pd.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include "clk-pd.h"
+#include "clk-regmap.h"
+
+struct clk_powerdomain {
+	struct list_head list;
+	struct clk_powerdomain_class *pd;
+};
+
+static LIST_HEAD(clk_pd_list);
+
+/* Find the corner required for a given clock rate */
+static int find_rate_to_corner(struct clk_regmap *rclk, unsigned long rate)
+{
+	int corner;
+
+	for (corner = 0; corner < rclk->pd->num_corners; corner++)
+		if (rate <= rclk->rate_max[corner])
+			break;
+
+	if (corner == rclk->pd->num_corners) {
+		pr_debug("Rate %lu for %s is > than highest Fmax\n", rate,
+			 rclk->hw.init->name);
+		return -EINVAL;
+	}
+
+	return corner;
+}
+
+static int pd_update_corner_state(struct clk_powerdomain_class *pd)
+{
+	int corner, ret, *state = pd->corner, i;
+	int cur_corner = pd->cur_corner, max_corner = pd->num_corners - 1;
+
+	/* Aggregate the corner */
+	for (corner = max_corner; corner > 0; corner--) {
+		if (pd->corner_votes[corner])
+			break;
+	}
+
+	if (corner == cur_corner)
+		return 0;
+
+	pr_debug("Set performance state to genpd(%s) for state %d, cur_corner %d, num_corner %d\n",
+		 pd->pd_name, state[corner], cur_corner, pd->num_corners);
+
+	for (i = 0; i < pd->num_pd; i++) {
+		ret = dev_pm_genpd_set_performance_state(pd->powerdomain_dev[i],
+							 state[corner]);
+		if (ret)
+			return ret;
+
+		if (cur_corner == 0 || cur_corner == pd->num_corners) {
+			pd->links[i] = device_link_add(pd->dev,
+					pd->powerdomain_dev[i],
+					DL_FLAG_STATELESS |
+					DL_FLAG_PM_RUNTIME |
+					DL_FLAG_RPM_ACTIVE);
+			if (!pd->links[i])
+				pr_err("Links for %d not created\n", i);
+		}
+
+		if (corner == 0)
+			device_link_del(pd->links[i]);
+	}
+
+	pd->cur_corner = corner;
+
+	return 0;
+}
+
+/* call from prepare & set rate */
+int clk_power_domain_vote_rate(struct clk_regmap *rclk,
+				unsigned long rate)
+{
+	int corner;
+
+	if (!rclk->pd)
+		return 0;
+
+	corner = find_rate_to_corner(rclk, rate);
+	if (corner < 0)
+		return corner;
+
+	mutex_lock(&rclk->pd->lock);
+
+	rclk->pd->corner_votes[corner]++;
+
+	/* update the corner to power domain */
+	if (pd_update_corner_state(rclk->pd) < 0)
+		rclk->pd->corner_votes[corner]--;
+
+	pr_debug("pd(%s) prepare corner_votes_count %d, corner %d\n",
+		 rclk->pd->pd_name, rclk->pd->corner_votes[corner],
+		 corner);
+
+	mutex_unlock(&rclk->pd->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(clk_power_domain_vote_rate);
+
+/* call from unprepare & set rate */
+void clk_power_domain_unvote_rate(struct clk_regmap *rclk,
+				   unsigned long rate)
+{
+	int corner;
+
+	if (!rclk->pd)
+		return;
+
+	corner = find_rate_to_corner(rclk, rate);
+	if (corner < 0)
+		return;
+
+	if (WARN(!rclk->pd->corner_votes[corner],
+		 "Reference counts are incorrect for %s corner %d\n",
+		 rclk->pd->pd_name, corner))
+		return;
+
+	mutex_lock(&rclk->pd->lock);
+
+	rclk->pd->corner_votes[corner]--;
+
+	if (pd_update_corner_state(rclk->pd) < 0)
+		rclk->pd->corner_votes[corner]++;
+
+	pr_debug("pd(%s) unprepare corner_votes_count %d, corner %d\n",
+		 rclk->pd->pd_name, rclk->pd->corner_votes[corner],
+		 corner);
+
+	mutex_unlock(&rclk->pd->lock);
+}
+EXPORT_SYMBOL_GPL(clk_power_domain_unvote_rate);
+
+int clk_power_domain_class_init(struct device *dev,
+				struct clk_powerdomain_class *pd)
+{
+	struct clk_powerdomain *pwrd;
+	int i, num_domains;
+
+	if (!pd) {
+		pr_debug("pd not defined\n");
+		return 0;
+	}
+
+	/* Deal only with devices using multiple PM domains. */
+	num_domains = of_count_phandle_with_args(dev->of_node, "power-domains",
+						 "#power-domain-cells");
+
+	list_for_each_entry(pwrd, &clk_pd_list, list) {
+		if (pwrd->pd == pd)
+			return 0;
+	}
+
+	pr_debug("Voting for pd_class %s\n", pd->pd_name);
+
+	if (num_domains == 1) {
+		pd->powerdomain_dev[0] = dev;
+	} else {
+		for (i = 0; i < pd->num_pd; i++) {
+			int index = pd->pd_index[i];
+
+			pd->powerdomain_dev[i] = genpd_dev_pm_attach_by_id(dev,
+									index);
+		}
+	}
+
+	pwrd = kmalloc(sizeof(*pwrd), GFP_KERNEL);
+	if (!pwrd)
+		return -ENOMEM;
+
+	pwrd->pd = pd;
+	list_add_tail(&pwrd->list, &clk_pd_list);
+
+	pd->dev = dev;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(clk_power_domain_class_init);
+
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/clk-pd.h b/drivers/clk/qcom/clk-pd.h
new file mode 100644
index 0000000..addde4f
--- /dev/null
+++ b/drivers/clk/qcom/clk-pd.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
+
+struct clk_regmap;
+
+/**
+ * struct clk_powerdomain_class - Power Domain scaling class
+ * @pd_name:		name of the power domain class
+ * @dev:		clock controller device
+ * @powerdomain_dev:	array of power domain devices
+ * @links:		array of power domain devices linked
+ * @num_pd:		size of power domain devices array
+ * @pd_index:		array of power domain index which would
+ *			be used to attach the power domain using
+ *			genpd_dev_pm_attach_by_id(dev, index)
+ * @corner:		sorted 2D array of legal corner settings,
+			indexed by the corner
+ * @corner_votes:	array of votes for each corner
+ * @num_corner:		specifies the size of corner_votes array
+ * @cur_corner:		current set power domain corner
+ * @lock:		lock to protect this struct
+ */
+struct clk_powerdomain_class {
+	const char *pd_name;
+	struct device *dev;
+	struct device **powerdomain_dev;
+	struct device_link **links;
+	int num_pd;
+	int *pd_index;
+	int *corner;
+	int *corner_votes;
+	int num_corners;
+	unsigned int cur_corner;
+	/* Protect this struct */
+	struct mutex lock;
+};
+
+#define CLK_POWERDOMAIN_INIT(_name, _num_corners, _num_pd, _corner)	\
+	struct clk_powerdomain_class _name = {				\
+		.pd_name = #_name,					\
+		.powerdomain_dev = (struct device *([_num_pd])) {},	\
+		.links = (struct device_link *([_num_pd])) {},		\
+		.num_pd = _num_pd,					\
+		.pd_index = (int [_num_pd]) {},				\
+		.corner_votes = (int [_num_corners]) {},		\
+		.num_corners = _num_corners,				\
+		.corner = _corner,					\
+		.cur_corner = _num_corners,				\
+		.lock = __MUTEX_INITIALIZER(_name.lock)			\
+	}
+
+int clk_power_domain_class_init(struct device *dev,
+				struct clk_powerdomain_class *pd);
+int clk_power_domain_vote_rate(struct clk_regmap *rclk, unsigned long rate);
+void clk_power_domain_unvote_rate(struct clk_regmap *rclk, unsigned long rate);
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
