Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] clk: Remove recursion in clk_core_{prepare,enable}()
Date: Wed, 26 Jul 2017 00:37:39 -0700
Message-Id: <20170726073739.16823-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Enabling and preparing clocks can be written quite naturally with
recursion. We start at some point in the tree and recurse up the
tree to find the oldest parent clk that needs to be enabled or
prepared. Then we enable/prepare and return to the caller, going
back to the clk we started at and enabling/preparing along the
way.

The problem is recursion isn't great for kernel code where we
have a limited stack size. Furthermore, we may be calling this
code inside clk_set_rate() which also has recursion in it, so
we're really not looking good if we encounter a tall clk tree.

Let's create a stack instead by looping over the parent chain and
collecting clks of interest. Then the enable/prepare becomes as
simple as iterating over that list and calling enable.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

I have some vague fear that this may not work if a clk op is framework 
reentrant and attemps to call consumer clk APIs from within the clk ops.
If the reentrant call tries to add a clk that's already in the list then
we'll corrupt the list. Ugh.

 drivers/clk/clk.c | 91 ++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 59 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c8d83acda006..e6cb8390c518 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -67,6 +67,8 @@ struct clk_core {
 	struct hlist_head	children;
 	struct hlist_node	child_node;
 	struct hlist_head	clks;
+	struct list_head	prepare_list;
+	struct list_head	enable_list;
 	unsigned int		notifier_count;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry		*dentry;
@@ -523,33 +525,43 @@ EXPORT_SYMBOL_GPL(clk_unprepare);
 static int clk_core_prepare(struct clk_core *core)
 {
 	int ret = 0;
+	struct clk_core *tmp, *parent;
+	LIST_HEAD(head);
 
 	lockdep_assert_held(&prepare_lock);
 
-	if (!core)
-		return 0;
+	while (core) {
+		list_add(&core->prepare_list, &head);
+		/* Stop once we see a clk that is already prepared */
+		if (core->prepare_count)
+			break;
+		core = core->parent;
+	}
 
-	if (core->prepare_count == 0) {
-		ret = clk_core_prepare(core->parent);
-		if (ret)
-			return ret;
+	list_for_each_entry_safe(core, tmp, &head, prepare_list) {
+		list_del_init(&core->prepare_list);
 
-		trace_clk_prepare(core);
+		if (core->prepare_count == 0) {
+			trace_clk_prepare(core);
 
-		if (core->ops->prepare)
-			ret = core->ops->prepare(core->hw);
+			if (core->ops->prepare)
+				ret = core->ops->prepare(core->hw);
 
-		trace_clk_prepare_complete(core);
+			trace_clk_prepare_complete(core);
 
-		if (ret) {
-			clk_core_unprepare(core->parent);
-			return ret;
+			if (ret)
+				goto err;
 		}
+		core->prepare_count++;
 	}
 
-	core->prepare_count++;
-
 	return 0;
+err:
+	parent = core->parent;
+	list_for_each_entry_safe_continue(core, tmp, &head, prepare_list)
+		list_del_init(&core->prepare_list);
+	clk_core_unprepare(parent);
+	return ret;
 }
 
 static int clk_core_prepare_lock(struct clk_core *core)
@@ -643,36 +655,49 @@ EXPORT_SYMBOL_GPL(clk_disable);
 static int clk_core_enable(struct clk_core *core)
 {
 	int ret = 0;
+	struct clk_core *tmp, *parent, *prev;
+	LIST_HEAD(head);
 
 	lockdep_assert_held(&enable_lock);
 
-	if (!core)
-		return 0;
-
-	if (WARN_ON(core->prepare_count == 0))
-		return -ESHUTDOWN;
+	while (core) {
+		list_add(&core->enable_list, &head);
+		/* Stop once we see a clk that is already enabled */
+		if (core->enable_count)
+			break;
+		core = core->parent;
+	}
 
-	if (core->enable_count == 0) {
-		ret = clk_core_enable(core->parent);
+	list_for_each_entry_safe(core, tmp, &head, enable_list) {
+		list_del_init(&core->enable_list);
 
-		if (ret)
-			return ret;
+		if (WARN_ON(core->prepare_count == 0)) {
+			ret = -ESHUTDOWN;
+			goto err;
+		}
 
-		trace_clk_enable_rcuidle(core);
+		if (core->enable_count == 0) {
+			trace_clk_enable_rcuidle(core);
 
-		if (core->ops->enable)
-			ret = core->ops->enable(core->hw);
+			if (core->ops->enable)
+				ret = core->ops->enable(core->hw);
 
-		trace_clk_enable_complete_rcuidle(core);
+			trace_clk_enable_complete_rcuidle(core);
 
-		if (ret) {
-			clk_core_disable(core->parent);
-			return ret;
+			if (ret)
+				goto err;
 		}
+
+		core->enable_count++;
 	}
 
-	core->enable_count++;
 	return 0;
+err:
+	parent = core->parent;
+	list_for_each_entry_safe_continue(core, tmp, &head, enable_list)
+		list_del_init(&core->enable_list);
+	clk_core_disable(parent);
+	return ret;
 }
 
 static int clk_core_enable_lock(struct clk_core *core)
@@ -2590,6 +2615,8 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 	core->num_parents = hw->init->num_parents;
 	core->min_rate = 0;
 	core->max_rate = ULONG_MAX;
+	INIT_LIST_HEAD(&core->prepare_list);
+	INIT_LIST_HEAD(&core->enable_list);
 	hw->core = core;
 
 	/* allocate local copy in case parent_names is __initdata */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
