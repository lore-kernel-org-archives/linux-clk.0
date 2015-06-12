Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org,
	agross@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/5] clk: Add safe switch hook
Date: Fri, 12 Jun 2015 11:41:56 +0300
Message-Id: <1434098519-26406-3-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1434098519-26406-1-git-send-email-georgi.djakov@linaro.org>
References: <1434098519-26406-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

From: Stephen Boyd <sboyd@codeaurora.org>

Sometimes clocks can't accept their parent source turning off
while the source is reprogrammed to a different rate. Most
notably CPU clocks require a way to switch away from the current
PLL they're running on, reprogram that PLL to a new rate, and
then switch back to the PLL with the new rate once they're done.
Add a hook that drivers can implement allowing them to return a
'safe parent' and 'safe frequency' that they can switch their
parent to while the upstream source is reprogrammed to support
this.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
[georgi: updated patch to support safe frequency]
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/clk.c            |   76 +++++++++++++++++++++++++++++++++++++-----
 include/linux/clk-provider.h |    2 ++
 2 files changed, 70 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 1cf479b9f3b4..7ec74833612a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -50,9 +50,13 @@ struct clk_core {
 	struct clk_core		**parents;
 	u8			num_parents;
 	u8			new_parent_index;
+	u8			safe_parent_index;
 	unsigned long		rate;
 	unsigned long		req_rate;
+	unsigned long		old_rate;
 	unsigned long		new_rate;
+	unsigned long		safe_freq;
+	struct clk_core		*safe_parent;
 	struct clk_core		*new_parent;
 	struct clk_core		*new_child;
 	unsigned long		flags;
@@ -1224,7 +1228,9 @@ out:
 static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
 			     struct clk_core *new_parent, u8 p_index)
 {
-	struct clk_core *child;
+	struct clk_core *child, *parent;
+	struct clk_hw *parent_hw;
+	unsigned long safe_freq;
 
 	core->new_rate = new_rate;
 	core->new_parent = new_parent;
@@ -1234,6 +1240,23 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
 	if (new_parent && new_parent != core->parent)
 		new_parent->new_child = core;
 
+	if (core->ops->get_safe_parent) {
+		parent_hw = core->ops->get_safe_parent(core->hw, &safe_freq);
+		if (parent_hw) {
+			parent = parent_hw->core;
+			p_index = clk_fetch_parent_index(core, parent);
+			core->safe_parent_index = p_index;
+			core->safe_parent = parent;
+			if (safe_freq)
+				core->safe_freq = safe_freq;
+			else
+				core->safe_freq = 0;
+		}
+	} else {
+		core->safe_parent = NULL;
+		core->safe_freq = 0;
+	}
+
 	hlist_for_each_entry(child, &core->children, child_node) {
 		child->new_rate = clk_recalc(child, new_rate);
 		clk_calc_subtree(child, child->new_rate, NULL, 0);
@@ -1338,14 +1361,51 @@ static struct clk_core *clk_propagate_rate_change(struct clk_core *core,
 						  unsigned long event)
 {
 	struct clk_core *child, *tmp_clk, *fail_clk = NULL;
+	struct clk_core *old_parent;
 	int ret = NOTIFY_DONE;
 
-	if (core->rate == core->new_rate)
+	if (core->rate == core->new_rate && event != POST_RATE_CHANGE)
 		return NULL;
 
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		if (core->safe_parent) {
+			if (core->safe_freq)
+				core->ops->set_rate_and_parent(core->hw,
+						core->safe_freq,
+						core->safe_parent->rate,
+						core->safe_parent_index);
+			else
+				core->ops->set_parent(core->hw,
+						core->safe_parent_index);
+		}
+		core->old_rate = core->rate;
+		break;
+	case POST_RATE_CHANGE:
+		if (core->safe_parent) {
+			old_parent = __clk_set_parent_before(core,
+							     core->new_parent);
+			if (core->ops->set_rate_and_parent) {
+				core->ops->set_rate_and_parent(core->hw,
+						core->new_rate,
+						core->new_parent ?
+						core->new_parent->rate : 0,
+						core->new_parent_index);
+			} else if (core->ops->set_parent) {
+				core->ops->set_parent(core->hw,
+						core->new_parent_index);
+			}
+			__clk_set_parent_after(core, core->new_parent,
+					       old_parent);
+		}
+		break;
+	}
+
 	if (core->notifier_count) {
-		ret = __clk_notify(core, event, core->rate, core->new_rate);
-		if (ret & NOTIFY_STOP_MASK)
+		if (event != POST_RATE_CHANGE || core->old_rate != core->rate)
+			ret = __clk_notify(core, event, core->old_rate,
+					   core->new_rate);
+		if (ret & NOTIFY_STOP_MASK && event != POST_RATE_CHANGE)
 			fail_clk = core;
 	}
 
@@ -1388,7 +1448,8 @@ static void clk_change_rate(struct clk_core *core)
 	else if (core->parent)
 		best_parent_rate = core->parent->rate;
 
-	if (core->new_parent && core->new_parent != core->parent) {
+	if (core->new_parent && core->new_parent != core->parent &&
+	    !core->safe_parent) {
 		old_parent = __clk_set_parent_before(core, core->new_parent);
 		trace_clk_set_parent(core, core->new_parent);
 
@@ -1414,9 +1475,6 @@ static void clk_change_rate(struct clk_core *core)
 
 	core->rate = clk_recalc(core, best_parent_rate);
 
-	if (core->notifier_count && old_rate != core->rate)
-		__clk_notify(core, POST_RATE_CHANGE, old_rate, core->rate);
-
 	/*
 	 * Use safe iteration, as change_rate can actually swap parents
 	 * for certain clock types.
@@ -1469,6 +1527,8 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 
 	core->req_rate = req_rate;
 
+	clk_propagate_rate_change(top, POST_RATE_CHANGE);
+
 	return ret;
 }
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 4a943d13625b..a1b1c1c74056 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -183,6 +183,8 @@ struct clk_ops {
 					  struct clk_hw **best_parent_hw);
 	int		(*set_parent)(struct clk_hw *hw, u8 index);
 	u8		(*get_parent)(struct clk_hw *hw);
+	struct clk_hw	*(*get_safe_parent)(struct clk_hw *hw,
+					    unsigned long *safe_freq);
 	int		(*set_rate)(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate);
 	int		(*set_rate_and_parent)(struct clk_hw *hw,
