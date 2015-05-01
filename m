Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH 1/6] clk: s/clk/core/ for struct clk_core
Date: Thu, 30 Apr 2015 17:14:16 -0700
Message-Id: <1430439261-10291-2-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
References: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

While introducing struct clk_core we tried to minimize the diff
by changing the type of 'clk' variables from struct clk to struct
clk_core without changing the names of the variables. Now that
the split is complete, the code is slightly confusing when it
mixes variables called 'clk' and variables called 'core' that are
of the same type struct clk_core. Let's be consistent and use
'core' everywhere we have a struct clk_core pointer and 'clk'
when we have a struct clk pointer.

Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 824 +++++++++++++++++++++++++++---------------------------
 1 file changed, 412 insertions(+), 412 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 459ce9da13e0..0b3c914db1ca 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -37,11 +37,11 @@ static HLIST_HEAD(clk_root_list);
 static HLIST_HEAD(clk_orphan_list);
 static LIST_HEAD(clk_notifier_list);
 
-static long clk_core_get_accuracy(struct clk_core *clk);
-static unsigned long clk_core_get_rate(struct clk_core *clk);
-static int clk_core_get_phase(struct clk_core *clk);
-static bool clk_core_is_prepared(struct clk_core *clk);
-static bool clk_core_is_enabled(struct clk_core *clk);
+static long clk_core_get_accuracy(struct clk_core *core);
+static unsigned long clk_core_get_rate(struct clk_core *core);
+static int clk_core_get_phase(struct clk_core *core);
+static bool clk_core_is_prepared(struct clk_core *core);
+static bool clk_core_is_enabled(struct clk_core *core);
 static struct clk_core *clk_core_lookup(const char *name);
 
 /***    private data structures    ***/
@@ -293,59 +293,59 @@ static const struct file_operations clk_dump_fops = {
 	.release	= single_release,
 };
 
-static int clk_debug_create_one(struct clk_core *clk, struct dentry *pdentry)
+static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 {
 	struct dentry *d;
 	int ret = -ENOMEM;
 
-	if (!clk || !pdentry) {
+	if (!core || !pdentry) {
 		ret = -EINVAL;
 		goto out;
 	}
 
-	d = debugfs_create_dir(clk->name, pdentry);
+	d = debugfs_create_dir(core->name, pdentry);
 	if (!d)
 		goto out;
 
-	clk->dentry = d;
+	core->dentry = d;
 
-	d = debugfs_create_u32("clk_rate", S_IRUGO, clk->dentry,
-			(u32 *)&clk->rate);
+	d = debugfs_create_u32("clk_rate", S_IRUGO, core->dentry,
+			(u32 *)&core->rate);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_accuracy", S_IRUGO, clk->dentry,
-			(u32 *)&clk->accuracy);
+	d = debugfs_create_u32("clk_accuracy", S_IRUGO, core->dentry,
+			(u32 *)&core->accuracy);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_phase", S_IRUGO, clk->dentry,
-			(u32 *)&clk->phase);
+	d = debugfs_create_u32("clk_phase", S_IRUGO, core->dentry,
+			(u32 *)&core->phase);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_x32("clk_flags", S_IRUGO, clk->dentry,
-			(u32 *)&clk->flags);
+	d = debugfs_create_x32("clk_flags", S_IRUGO, core->dentry,
+			(u32 *)&core->flags);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_prepare_count", S_IRUGO, clk->dentry,
-			(u32 *)&clk->prepare_count);
+	d = debugfs_create_u32("clk_prepare_count", S_IRUGO, core->dentry,
+			(u32 *)&core->prepare_count);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_enable_count", S_IRUGO, clk->dentry,
-			(u32 *)&clk->enable_count);
+	d = debugfs_create_u32("clk_enable_count", S_IRUGO, core->dentry,
+			(u32 *)&core->enable_count);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_notifier_count", S_IRUGO, clk->dentry,
-			(u32 *)&clk->notifier_count);
+	d = debugfs_create_u32("clk_notifier_count", S_IRUGO, core->dentry,
+			(u32 *)&core->notifier_count);
 	if (!d)
 		goto err_out;
 
-	if (clk->ops->debug_init) {
-		ret = clk->ops->debug_init(clk->hw, clk->dentry);
+	if (core->ops->debug_init) {
+		ret = core->ops->debug_init(core->hw, core->dentry);
 		if (ret)
 			goto err_out;
 	}
@@ -354,31 +354,31 @@ static int clk_debug_create_one(struct clk_core *clk, struct dentry *pdentry)
 	goto out;
 
 err_out:
-	debugfs_remove_recursive(clk->dentry);
-	clk->dentry = NULL;
+	debugfs_remove_recursive(core->dentry);
+	core->dentry = NULL;
 out:
 	return ret;
 }
 
 /**
  * clk_debug_register - add a clk node to the debugfs clk tree
- * @clk: the clk being added to the debugfs clk tree
+ * @core: the clk being added to the debugfs clk tree
  *
  * Dynamically adds a clk to the debugfs clk tree if debugfs has been
  * initialized.  Otherwise it bails out early since the debugfs clk tree
  * will be created lazily by clk_debug_init as part of a late_initcall.
  */
-static int clk_debug_register(struct clk_core *clk)
+static int clk_debug_register(struct clk_core *core)
 {
 	int ret = 0;
 
 	mutex_lock(&clk_debug_lock);
-	hlist_add_head(&clk->debug_node, &clk_debug_list);
+	hlist_add_head(&core->debug_node, &clk_debug_list);
 
 	if (!inited)
 		goto unlock;
 
-	ret = clk_debug_create_one(clk, rootdir);
+	ret = clk_debug_create_one(core, rootdir);
 unlock:
 	mutex_unlock(&clk_debug_lock);
 
@@ -387,18 +387,18 @@ unlock:
 
  /**
  * clk_debug_unregister - remove a clk node from the debugfs clk tree
- * @clk: the clk being removed from the debugfs clk tree
+ * @core: the clk being removed from the debugfs clk tree
  *
  * Dynamically removes a clk and all it's children clk nodes from the
  * debugfs clk tree if clk->dentry points to debugfs created by
  * clk_debug_register in __clk_init.
  */
-static void clk_debug_unregister(struct clk_core *clk)
+static void clk_debug_unregister(struct clk_core *core)
 {
 	mutex_lock(&clk_debug_lock);
-	hlist_del_init(&clk->debug_node);
-	debugfs_remove_recursive(clk->dentry);
-	clk->dentry = NULL;
+	hlist_del_init(&core->debug_node);
+	debugfs_remove_recursive(core->dentry);
+	core->dentry = NULL;
 	mutex_unlock(&clk_debug_lock);
 }
 
@@ -429,7 +429,7 @@ EXPORT_SYMBOL_GPL(clk_debugfs_add_file);
  */
 static int __init clk_debug_init(void)
 {
-	struct clk_core *clk;
+	struct clk_core *core;
 	struct dentry *d;
 
 	rootdir = debugfs_create_dir("clk", NULL);
@@ -458,8 +458,8 @@ static int __init clk_debug_init(void)
 		return -ENOMEM;
 
 	mutex_lock(&clk_debug_lock);
-	hlist_for_each_entry(clk, &clk_debug_list, debug_node)
-		clk_debug_create_one(clk, rootdir);
+	hlist_for_each_entry(core, &clk_debug_list, debug_node)
+		clk_debug_create_one(core, rootdir);
 
 	inited = 1;
 	mutex_unlock(&clk_debug_lock);
@@ -468,59 +468,59 @@ static int __init clk_debug_init(void)
 }
 late_initcall(clk_debug_init);
 #else
-static inline int clk_debug_register(struct clk_core *clk) { return 0; }
-static inline void clk_debug_reparent(struct clk_core *clk,
+static inline int clk_debug_register(struct clk_core *core) { return 0; }
+static inline void clk_debug_reparent(struct clk_core *core,
 				      struct clk_core *new_parent)
 {
 }
-static inline void clk_debug_unregister(struct clk_core *clk)
+static inline void clk_debug_unregister(struct clk_core *core)
 {
 }
 #endif
 
 /* caller must hold prepare_lock */
-static void clk_unprepare_unused_subtree(struct clk_core *clk)
+static void clk_unprepare_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
 
 	lockdep_assert_held(&prepare_lock);
 
-	hlist_for_each_entry(child, &clk->children, child_node)
+	hlist_for_each_entry(child, &core->children, child_node)
 		clk_unprepare_unused_subtree(child);
 
-	if (clk->prepare_count)
+	if (core->prepare_count)
 		return;
 
-	if (clk->flags & CLK_IGNORE_UNUSED)
+	if (core->flags & CLK_IGNORE_UNUSED)
 		return;
 
-	if (clk_core_is_prepared(clk)) {
-		trace_clk_unprepare(clk);
-		if (clk->ops->unprepare_unused)
-			clk->ops->unprepare_unused(clk->hw);
-		else if (clk->ops->unprepare)
-			clk->ops->unprepare(clk->hw);
-		trace_clk_unprepare_complete(clk);
+	if (clk_core_is_prepared(core)) {
+		trace_clk_unprepare(core);
+		if (core->ops->unprepare_unused)
+			core->ops->unprepare_unused(core->hw);
+		else if (core->ops->unprepare)
+			core->ops->unprepare(core->hw);
+		trace_clk_unprepare_complete(core);
 	}
 }
 
 /* caller must hold prepare_lock */
-static void clk_disable_unused_subtree(struct clk_core *clk)
+static void clk_disable_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
 	unsigned long flags;
 
 	lockdep_assert_held(&prepare_lock);
 
-	hlist_for_each_entry(child, &clk->children, child_node)
+	hlist_for_each_entry(child, &core->children, child_node)
 		clk_disable_unused_subtree(child);
 
 	flags = clk_enable_lock();
 
-	if (clk->enable_count)
+	if (core->enable_count)
 		goto unlock_out;
 
-	if (clk->flags & CLK_IGNORE_UNUSED)
+	if (core->flags & CLK_IGNORE_UNUSED)
 		goto unlock_out;
 
 	/*
@@ -528,13 +528,13 @@ static void clk_disable_unused_subtree(struct clk_core *clk)
 	 * sequence.  call .disable_unused if available, otherwise fall
 	 * back to .disable
 	 */
-	if (clk_core_is_enabled(clk)) {
-		trace_clk_disable(clk);
-		if (clk->ops->disable_unused)
-			clk->ops->disable_unused(clk->hw);
-		else if (clk->ops->disable)
-			clk->ops->disable(clk->hw);
-		trace_clk_disable_complete(clk);
+	if (clk_core_is_enabled(core)) {
+		trace_clk_disable(core);
+		if (core->ops->disable_unused)
+			core->ops->disable_unused(core->hw);
+		else if (core->ops->disable)
+			core->ops->disable(core->hw);
+		trace_clk_disable_complete(core);
 	}
 
 unlock_out:
@@ -551,7 +551,7 @@ __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
 static int clk_disable_unused(void)
 {
-	struct clk_core *clk;
+	struct clk_core *core;
 
 	if (clk_ignore_unused) {
 		pr_warn("clk: Not disabling unused clocks\n");
@@ -560,17 +560,17 @@ static int clk_disable_unused(void)
 
 	clk_prepare_lock();
 
-	hlist_for_each_entry(clk, &clk_root_list, child_node)
-		clk_disable_unused_subtree(clk);
+	hlist_for_each_entry(core, &clk_root_list, child_node)
+		clk_disable_unused_subtree(core);
 
-	hlist_for_each_entry(clk, &clk_orphan_list, child_node)
-		clk_disable_unused_subtree(clk);
+	hlist_for_each_entry(core, &clk_orphan_list, child_node)
+		clk_disable_unused_subtree(core);
 
-	hlist_for_each_entry(clk, &clk_root_list, child_node)
-		clk_unprepare_unused_subtree(clk);
+	hlist_for_each_entry(core, &clk_root_list, child_node)
+		clk_unprepare_unused_subtree(core);
 
-	hlist_for_each_entry(clk, &clk_orphan_list, child_node)
-		clk_unprepare_unused_subtree(clk);
+	hlist_for_each_entry(core, &clk_orphan_list, child_node)
+		clk_unprepare_unused_subtree(core);
 
 	clk_prepare_unlock();
 
@@ -608,18 +608,18 @@ struct clk *__clk_get_parent(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_get_parent);
 
-static struct clk_core *clk_core_get_parent_by_index(struct clk_core *clk,
+static struct clk_core *clk_core_get_parent_by_index(struct clk_core *core,
 							 u8 index)
 {
-	if (!clk || index >= clk->num_parents)
+	if (!core || index >= core->num_parents)
 		return NULL;
-	else if (!clk->parents)
-		return clk_core_lookup(clk->parent_names[index]);
-	else if (!clk->parents[index])
-		return clk->parents[index] =
-			clk_core_lookup(clk->parent_names[index]);
+	else if (!core->parents)
+		return clk_core_lookup(core->parent_names[index]);
+	else if (!core->parents[index])
+		return core->parents[index] =
+			clk_core_lookup(core->parent_names[index]);
 	else
-		return clk->parents[index];
+		return core->parents[index];
 }
 
 struct clk *clk_get_parent_by_index(struct clk *clk, u8 index)
@@ -640,21 +640,21 @@ unsigned int __clk_get_enable_count(struct clk *clk)
 	return !clk ? 0 : clk->core->enable_count;
 }
 
-static unsigned long clk_core_get_rate_nolock(struct clk_core *clk)
+static unsigned long clk_core_get_rate_nolock(struct clk_core *core)
 {
 	unsigned long ret;
 
-	if (!clk) {
+	if (!core) {
 		ret = 0;
 		goto out;
 	}
 
-	ret = clk->rate;
+	ret = core->rate;
 
-	if (clk->flags & CLK_IS_ROOT)
+	if (core->flags & CLK_IS_ROOT)
 		goto out;
 
-	if (!clk->parent)
+	if (!core->parent)
 		ret = 0;
 
 out:
@@ -670,12 +670,12 @@ unsigned long __clk_get_rate(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_get_rate);
 
-static unsigned long __clk_get_accuracy(struct clk_core *clk)
+static unsigned long __clk_get_accuracy(struct clk_core *core)
 {
-	if (!clk)
+	if (!core)
 		return 0;
 
-	return clk->accuracy;
+	return core->accuracy;
 }
 
 unsigned long __clk_get_flags(struct clk *clk)
@@ -684,23 +684,23 @@ unsigned long __clk_get_flags(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_get_flags);
 
-static bool clk_core_is_prepared(struct clk_core *clk)
+static bool clk_core_is_prepared(struct clk_core *core)
 {
 	int ret;
 
-	if (!clk)
+	if (!core)
 		return false;
 
 	/*
 	 * .is_prepared is optional for clocks that can prepare
 	 * fall back to software usage counter if it is missing
 	 */
-	if (!clk->ops->is_prepared) {
-		ret = clk->prepare_count ? 1 : 0;
+	if (!core->ops->is_prepared) {
+		ret = core->prepare_count ? 1 : 0;
 		goto out;
 	}
 
-	ret = clk->ops->is_prepared(clk->hw);
+	ret = core->ops->is_prepared(core->hw);
 out:
 	return !!ret;
 }
@@ -713,23 +713,23 @@ bool __clk_is_prepared(struct clk *clk)
 	return clk_core_is_prepared(clk->core);
 }
 
-static bool clk_core_is_enabled(struct clk_core *clk)
+static bool clk_core_is_enabled(struct clk_core *core)
 {
 	int ret;
 
-	if (!clk)
+	if (!core)
 		return false;
 
 	/*
 	 * .is_enabled is only mandatory for clocks that gate
 	 * fall back to software usage counter if .is_enabled is missing
 	 */
-	if (!clk->ops->is_enabled) {
-		ret = clk->enable_count ? 1 : 0;
+	if (!core->ops->is_enabled) {
+		ret = core->enable_count ? 1 : 0;
 		goto out;
 	}
 
-	ret = clk->ops->is_enabled(clk->hw);
+	ret = core->ops->is_enabled(core->hw);
 out:
 	return !!ret;
 }
@@ -744,15 +744,15 @@ bool __clk_is_enabled(struct clk *clk)
 EXPORT_SYMBOL_GPL(__clk_is_enabled);
 
 static struct clk_core *__clk_lookup_subtree(const char *name,
-					     struct clk_core *clk)
+					     struct clk_core *core)
 {
 	struct clk_core *child;
 	struct clk_core *ret;
 
-	if (!strcmp(clk->name, name))
-		return clk;
+	if (!strcmp(core->name, name))
+		return core;
 
-	hlist_for_each_entry(child, &clk->children, child_node) {
+	hlist_for_each_entry(child, &core->children, child_node) {
 		ret = __clk_lookup_subtree(name, child);
 		if (ret)
 			return ret;
@@ -853,7 +853,7 @@ struct clk *__clk_lookup(const char *name)
 	return !core ? NULL : core->hw->clk;
 }
 
-static void clk_core_get_boundaries(struct clk_core *clk,
+static void clk_core_get_boundaries(struct clk_core *core,
 				    unsigned long *min_rate,
 				    unsigned long *max_rate)
 {
@@ -862,10 +862,10 @@ static void clk_core_get_boundaries(struct clk_core *clk,
 	*min_rate = 0;
 	*max_rate = ULONG_MAX;
 
-	hlist_for_each_entry(clk_user, &clk->clks, clks_node)
+	hlist_for_each_entry(clk_user, &core->clks, clks_node)
 		*min_rate = max(*min_rate, clk_user->min_rate);
 
-	hlist_for_each_entry(clk_user, &clk->clks, clks_node)
+	hlist_for_each_entry(clk_user, &core->clks, clks_node)
 		*max_rate = min(*max_rate, clk_user->max_rate);
 }
 
@@ -901,26 +901,26 @@ EXPORT_SYMBOL_GPL(__clk_mux_determine_rate_closest);
 
 /***        clk api        ***/
 
-static void clk_core_unprepare(struct clk_core *clk)
+static void clk_core_unprepare(struct clk_core *core)
 {
-	if (!clk)
+	if (!core)
 		return;
 
-	if (WARN_ON(clk->prepare_count == 0))
+	if (WARN_ON(core->prepare_count == 0))
 		return;
 
-	if (--clk->prepare_count > 0)
+	if (--core->prepare_count > 0)
 		return;
 
-	WARN_ON(clk->enable_count > 0);
+	WARN_ON(core->enable_count > 0);
 
-	trace_clk_unprepare(clk);
+	trace_clk_unprepare(core);
 
-	if (clk->ops->unprepare)
-		clk->ops->unprepare(clk->hw);
+	if (core->ops->unprepare)
+		core->ops->unprepare(core->hw);
 
-	trace_clk_unprepare_complete(clk);
-	clk_core_unprepare(clk->parent);
+	trace_clk_unprepare_complete(core);
+	clk_core_unprepare(core->parent);
 }
 
 /**
@@ -945,32 +945,32 @@ void clk_unprepare(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_unprepare);
 
-static int clk_core_prepare(struct clk_core *clk)
+static int clk_core_prepare(struct clk_core *core)
 {
 	int ret = 0;
 
-	if (!clk)
+	if (!core)
 		return 0;
 
-	if (clk->prepare_count == 0) {
-		ret = clk_core_prepare(clk->parent);
+	if (core->prepare_count == 0) {
+		ret = clk_core_prepare(core->parent);
 		if (ret)
 			return ret;
 
-		trace_clk_prepare(clk);
+		trace_clk_prepare(core);
 
-		if (clk->ops->prepare)
-			ret = clk->ops->prepare(clk->hw);
+		if (core->ops->prepare)
+			ret = core->ops->prepare(core->hw);
 
-		trace_clk_prepare_complete(clk);
+		trace_clk_prepare_complete(core);
 
 		if (ret) {
-			clk_core_unprepare(clk->parent);
+			clk_core_unprepare(core->parent);
 			return ret;
 		}
 	}
 
-	clk->prepare_count++;
+	core->prepare_count++;
 
 	return 0;
 }
@@ -1002,25 +1002,25 @@ int clk_prepare(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_prepare);
 
-static void clk_core_disable(struct clk_core *clk)
+static void clk_core_disable(struct clk_core *core)
 {
-	if (!clk)
+	if (!core)
 		return;
 
-	if (WARN_ON(clk->enable_count == 0))
+	if (WARN_ON(core->enable_count == 0))
 		return;
 
-	if (--clk->enable_count > 0)
+	if (--core->enable_count > 0)
 		return;
 
-	trace_clk_disable(clk);
+	trace_clk_disable(core);
 
-	if (clk->ops->disable)
-		clk->ops->disable(clk->hw);
+	if (core->ops->disable)
+		core->ops->disable(core->hw);
 
-	trace_clk_disable_complete(clk);
+	trace_clk_disable_complete(core);
 
-	clk_core_disable(clk->parent);
+	clk_core_disable(core->parent);
 }
 
 static void __clk_disable(struct clk *clk)
@@ -1056,36 +1056,36 @@ void clk_disable(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_disable);
 
-static int clk_core_enable(struct clk_core *clk)
+static int clk_core_enable(struct clk_core *core)
 {
 	int ret = 0;
 
-	if (!clk)
+	if (!core)
 		return 0;
 
-	if (WARN_ON(clk->prepare_count == 0))
+	if (WARN_ON(core->prepare_count == 0))
 		return -ESHUTDOWN;
 
-	if (clk->enable_count == 0) {
-		ret = clk_core_enable(clk->parent);
+	if (core->enable_count == 0) {
+		ret = clk_core_enable(core->parent);
 
 		if (ret)
 			return ret;
 
-		trace_clk_enable(clk);
+		trace_clk_enable(core);
 
-		if (clk->ops->enable)
-			ret = clk->ops->enable(clk->hw);
+		if (core->ops->enable)
+			ret = core->ops->enable(core->hw);
 
-		trace_clk_enable_complete(clk);
+		trace_clk_enable_complete(core);
 
 		if (ret) {
-			clk_core_disable(clk->parent);
+			clk_core_disable(core->parent);
 			return ret;
 		}
 	}
 
-	clk->enable_count++;
+	core->enable_count++;
 	return 0;
 }
 
@@ -1123,7 +1123,7 @@ int clk_enable(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_enable);
 
-static unsigned long clk_core_round_rate_nolock(struct clk_core *clk,
+static unsigned long clk_core_round_rate_nolock(struct clk_core *core,
 						unsigned long rate,
 						unsigned long min_rate,
 						unsigned long max_rate)
@@ -1134,25 +1134,25 @@ static unsigned long clk_core_round_rate_nolock(struct clk_core *clk,
 
 	lockdep_assert_held(&prepare_lock);
 
-	if (!clk)
+	if (!core)
 		return 0;
 
-	parent = clk->parent;
+	parent = core->parent;
 	if (parent)
 		parent_rate = parent->rate;
 
-	if (clk->ops->determine_rate) {
+	if (core->ops->determine_rate) {
 		parent_hw = parent ? parent->hw : NULL;
-		return clk->ops->determine_rate(clk->hw, rate,
+		return core->ops->determine_rate(core->hw, rate,
 						min_rate, max_rate,
 						&parent_rate, &parent_hw);
-	} else if (clk->ops->round_rate)
-		return clk->ops->round_rate(clk->hw, rate, &parent_rate);
-	else if (clk->flags & CLK_SET_RATE_PARENT)
-		return clk_core_round_rate_nolock(clk->parent, rate, min_rate,
+	} else if (core->ops->round_rate)
+		return core->ops->round_rate(core->hw, rate, &parent_rate);
+	else if (core->flags & CLK_SET_RATE_PARENT)
+		return clk_core_round_rate_nolock(core->parent, rate, min_rate,
 						  max_rate);
 	else
-		return clk->rate;
+		return core->rate;
 }
 
 /**
@@ -1224,7 +1224,7 @@ EXPORT_SYMBOL_GPL(clk_round_rate);
 
 /**
  * __clk_notify - call clk notifier chain
- * @clk: struct clk * that is changing rate
+ * @core: clk that is changing rate
  * @msg: clk notifier type (see include/linux/clk.h)
  * @old_rate: old clk rate
  * @new_rate: new clk rate
@@ -1236,7 +1236,7 @@ EXPORT_SYMBOL_GPL(clk_round_rate);
  * called if all went well, or NOTIFY_STOP or NOTIFY_BAD immediately if
  * a driver returns that.
  */
-static int __clk_notify(struct clk_core *clk, unsigned long msg,
+static int __clk_notify(struct clk_core *core, unsigned long msg,
 		unsigned long old_rate, unsigned long new_rate)
 {
 	struct clk_notifier *cn;
@@ -1247,7 +1247,7 @@ static int __clk_notify(struct clk_core *clk, unsigned long msg,
 	cnd.new_rate = new_rate;
 
 	list_for_each_entry(cn, &clk_notifier_list, node) {
-		if (cn->clk->core == clk) {
+		if (cn->clk->core == core) {
 			cnd.clk = cn->clk;
 			ret = srcu_notifier_call_chain(&cn->notifier_head, msg,
 					&cnd);
@@ -1259,7 +1259,7 @@ static int __clk_notify(struct clk_core *clk, unsigned long msg,
 
 /**
  * __clk_recalc_accuracies
- * @clk: first clk in the subtree
+ * @core: first clk in the subtree
  *
  * Walks the subtree of clks starting with clk and recalculates accuracies as
  * it goes.  Note that if a clk does not implement the .recalc_accuracy
@@ -1268,35 +1268,35 @@ static int __clk_notify(struct clk_core *clk, unsigned long msg,
  *
  * Caller must hold prepare_lock.
  */
-static void __clk_recalc_accuracies(struct clk_core *clk)
+static void __clk_recalc_accuracies(struct clk_core *core)
 {
 	unsigned long parent_accuracy = 0;
 	struct clk_core *child;
 
 	lockdep_assert_held(&prepare_lock);
 
-	if (clk->parent)
-		parent_accuracy = clk->parent->accuracy;
+	if (core->parent)
+		parent_accuracy = core->parent->accuracy;
 
-	if (clk->ops->recalc_accuracy)
-		clk->accuracy = clk->ops->recalc_accuracy(clk->hw,
+	if (core->ops->recalc_accuracy)
+		core->accuracy = core->ops->recalc_accuracy(core->hw,
 							  parent_accuracy);
 	else
-		clk->accuracy = parent_accuracy;
+		core->accuracy = parent_accuracy;
 
-	hlist_for_each_entry(child, &clk->children, child_node)
+	hlist_for_each_entry(child, &core->children, child_node)
 		__clk_recalc_accuracies(child);
 }
 
-static long clk_core_get_accuracy(struct clk_core *clk)
+static long clk_core_get_accuracy(struct clk_core *core)
 {
 	unsigned long accuracy;
 
 	clk_prepare_lock();
-	if (clk && (clk->flags & CLK_GET_ACCURACY_NOCACHE))
-		__clk_recalc_accuracies(clk);
+	if (core && (core->flags & CLK_GET_ACCURACY_NOCACHE))
+		__clk_recalc_accuracies(core);
 
-	accuracy = __clk_get_accuracy(clk);
+	accuracy = __clk_get_accuracy(core);
 	clk_prepare_unlock();
 
 	return accuracy;
@@ -1320,17 +1320,17 @@ long clk_get_accuracy(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_get_accuracy);
 
-static unsigned long clk_recalc(struct clk_core *clk,
+static unsigned long clk_recalc(struct clk_core *core,
 				unsigned long parent_rate)
 {
-	if (clk->ops->recalc_rate)
-		return clk->ops->recalc_rate(clk->hw, parent_rate);
+	if (core->ops->recalc_rate)
+		return core->ops->recalc_rate(core->hw, parent_rate);
 	return parent_rate;
 }
 
 /**
  * __clk_recalc_rates
- * @clk: first clk in the subtree
+ * @core: first clk in the subtree
  * @msg: notification type (see include/linux/clk.h)
  *
  * Walks the subtree of clks starting with clk and recalculates rates as it
@@ -1342,7 +1342,7 @@ static unsigned long clk_recalc(struct clk_core *clk,
  *
  * Caller must hold prepare_lock.
  */
-static void __clk_recalc_rates(struct clk_core *clk, unsigned long msg)
+static void __clk_recalc_rates(struct clk_core *core, unsigned long msg)
 {
 	unsigned long old_rate;
 	unsigned long parent_rate = 0;
@@ -1350,34 +1350,34 @@ static void __clk_recalc_rates(struct clk_core *clk, unsigned long msg)
 
 	lockdep_assert_held(&prepare_lock);
 
-	old_rate = clk->rate;
+	old_rate = core->rate;
 
-	if (clk->parent)
-		parent_rate = clk->parent->rate;
+	if (core->parent)
+		parent_rate = core->parent->rate;
 
-	clk->rate = clk_recalc(clk, parent_rate);
+	core->rate = clk_recalc(core, parent_rate);
 
 	/*
 	 * ignore NOTIFY_STOP and NOTIFY_BAD return values for POST_RATE_CHANGE
 	 * & ABORT_RATE_CHANGE notifiers
 	 */
-	if (clk->notifier_count && msg)
-		__clk_notify(clk, msg, old_rate, clk->rate);
+	if (core->notifier_count && msg)
+		__clk_notify(core, msg, old_rate, core->rate);
 
-	hlist_for_each_entry(child, &clk->children, child_node)
+	hlist_for_each_entry(child, &core->children, child_node)
 		__clk_recalc_rates(child, msg);
 }
 
-static unsigned long clk_core_get_rate(struct clk_core *clk)
+static unsigned long clk_core_get_rate(struct clk_core *core)
 {
 	unsigned long rate;
 
 	clk_prepare_lock();
 
-	if (clk && (clk->flags & CLK_GET_RATE_NOCACHE))
-		__clk_recalc_rates(clk, 0);
+	if (core && (core->flags & CLK_GET_RATE_NOCACHE))
+		__clk_recalc_rates(core, 0);
 
-	rate = clk_core_get_rate_nolock(clk);
+	rate = clk_core_get_rate_nolock(core);
 	clk_prepare_unlock();
 
 	return rate;
@@ -1400,15 +1400,15 @@ unsigned long clk_get_rate(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_get_rate);
 
-static int clk_fetch_parent_index(struct clk_core *clk,
+static int clk_fetch_parent_index(struct clk_core *core,
 				  struct clk_core *parent)
 {
 	int i;
 
-	if (!clk->parents) {
-		clk->parents = kcalloc(clk->num_parents,
+	if (!core->parents) {
+		core->parents = kcalloc(core->num_parents,
 					sizeof(struct clk *), GFP_KERNEL);
-		if (!clk->parents)
+		if (!core->parents)
 			return -ENOMEM;
 	}
 
@@ -1417,15 +1417,15 @@ static int clk_fetch_parent_index(struct clk_core *clk,
 	 * or if not yet cached, use string name comparison and cache
 	 * them now to avoid future calls to clk_core_lookup.
 	 */
-	for (i = 0; i < clk->num_parents; i++) {
-		if (clk->parents[i] == parent)
+	for (i = 0; i < core->num_parents; i++) {
+		if (core->parents[i] == parent)
 			return i;
 
-		if (clk->parents[i])
+		if (core->parents[i])
 			continue;
 
-		if (!strcmp(clk->parent_names[i], parent->name)) {
-			clk->parents[i] = clk_core_lookup(parent->name);
+		if (!strcmp(core->parent_names[i], parent->name)) {
+			core->parents[i] = clk_core_lookup(parent->name);
 			return i;
 		}
 	}
@@ -1433,28 +1433,28 @@ static int clk_fetch_parent_index(struct clk_core *clk,
 	return -EINVAL;
 }
 
-static void clk_reparent(struct clk_core *clk, struct clk_core *new_parent)
+static void clk_reparent(struct clk_core *core, struct clk_core *new_parent)
 {
-	hlist_del(&clk->child_node);
+	hlist_del(&core->child_node);
 
 	if (new_parent) {
 		/* avoid duplicate POST_RATE_CHANGE notifications */
-		if (new_parent->new_child == clk)
+		if (new_parent->new_child == core)
 			new_parent->new_child = NULL;
 
-		hlist_add_head(&clk->child_node, &new_parent->children);
+		hlist_add_head(&core->child_node, &new_parent->children);
 	} else {
-		hlist_add_head(&clk->child_node, &clk_orphan_list);
+		hlist_add_head(&core->child_node, &clk_orphan_list);
 	}
 
-	clk->parent = new_parent;
+	core->parent = new_parent;
 }
 
-static struct clk_core *__clk_set_parent_before(struct clk_core *clk,
+static struct clk_core *__clk_set_parent_before(struct clk_core *core,
 					   struct clk_core *parent)
 {
 	unsigned long flags;
-	struct clk_core *old_parent = clk->parent;
+	struct clk_core *old_parent = core->parent;
 
 	/*
 	 * Migrate prepare state between parents and prevent race with
@@ -1473,15 +1473,15 @@ static struct clk_core *__clk_set_parent_before(struct clk_core *clk,
 	 *
 	 * See also: Comment for clk_set_parent() below.
 	 */
-	if (clk->prepare_count) {
+	if (core->prepare_count) {
 		clk_core_prepare(parent);
 		clk_core_enable(parent);
-		clk_core_enable(clk);
+		clk_core_enable(core);
 	}
 
 	/* update the clk tree topology */
 	flags = clk_enable_lock();
-	clk_reparent(clk, parent);
+	clk_reparent(core, parent);
 	clk_enable_unlock(flags);
 
 	return old_parent;
@@ -1502,44 +1502,44 @@ static void __clk_set_parent_after(struct clk_core *core,
 	}
 }
 
-static int __clk_set_parent(struct clk_core *clk, struct clk_core *parent,
+static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
 			    u8 p_index)
 {
 	unsigned long flags;
 	int ret = 0;
 	struct clk_core *old_parent;
 
-	old_parent = __clk_set_parent_before(clk, parent);
+	old_parent = __clk_set_parent_before(core, parent);
 
-	trace_clk_set_parent(clk, parent);
+	trace_clk_set_parent(core, parent);
 
 	/* change clock input source */
-	if (parent && clk->ops->set_parent)
-		ret = clk->ops->set_parent(clk->hw, p_index);
+	if (parent && core->ops->set_parent)
+		ret = core->ops->set_parent(core->hw, p_index);
 
-	trace_clk_set_parent_complete(clk, parent);
+	trace_clk_set_parent_complete(core, parent);
 
 	if (ret) {
 		flags = clk_enable_lock();
-		clk_reparent(clk, old_parent);
+		clk_reparent(core, old_parent);
 		clk_enable_unlock(flags);
 
-		if (clk->prepare_count) {
-			clk_core_disable(clk);
+		if (core->prepare_count) {
+			clk_core_disable(core);
 			clk_core_disable(parent);
 			clk_core_unprepare(parent);
 		}
 		return ret;
 	}
 
-	__clk_set_parent_after(clk, parent, old_parent);
+	__clk_set_parent_after(core, parent, old_parent);
 
 	return 0;
 }
 
 /**
  * __clk_speculate_rates
- * @clk: first clk in the subtree
+ * @core: first clk in the subtree
  * @parent_rate: the "future" rate of clk's parent
  *
  * Walks the subtree of clks starting with clk, speculating rates as it
@@ -1553,7 +1553,7 @@ static int __clk_set_parent(struct clk_core *clk, struct clk_core *parent,
  *
  * Caller must hold prepare_lock.
  */
-static int __clk_speculate_rates(struct clk_core *clk,
+static int __clk_speculate_rates(struct clk_core *core,
 				 unsigned long parent_rate)
 {
 	struct clk_core *child;
@@ -1562,19 +1562,19 @@ static int __clk_speculate_rates(struct clk_core *clk,
 
 	lockdep_assert_held(&prepare_lock);
 
-	new_rate = clk_recalc(clk, parent_rate);
+	new_rate = clk_recalc(core, parent_rate);
 
 	/* abort rate change if a driver returns NOTIFY_BAD or NOTIFY_STOP */
-	if (clk->notifier_count)
-		ret = __clk_notify(clk, PRE_RATE_CHANGE, clk->rate, new_rate);
+	if (core->notifier_count)
+		ret = __clk_notify(core, PRE_RATE_CHANGE, core->rate, new_rate);
 
 	if (ret & NOTIFY_STOP_MASK) {
 		pr_debug("%s: clk notifier callback for clock %s aborted with error %d\n",
-				__func__, clk->name, ret);
+				__func__, core->name, ret);
 		goto out;
 	}
 
-	hlist_for_each_entry(child, &clk->children, child_node) {
+	hlist_for_each_entry(child, &core->children, child_node) {
 		ret = __clk_speculate_rates(child, new_rate);
 		if (ret & NOTIFY_STOP_MASK)
 			break;
@@ -1584,20 +1584,20 @@ out:
 	return ret;
 }
 
-static void clk_calc_subtree(struct clk_core *clk, unsigned long new_rate,
+static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
 			     struct clk_core *new_parent, u8 p_index)
 {
 	struct clk_core *child;
 
-	clk->new_rate = new_rate;
-	clk->new_parent = new_parent;
-	clk->new_parent_index = p_index;
+	core->new_rate = new_rate;
+	core->new_parent = new_parent;
+	core->new_parent_index = p_index;
 	/* include clk in new parent's PRE_RATE_CHANGE notifications */
-	clk->new_child = NULL;
-	if (new_parent && new_parent != clk->parent)
-		new_parent->new_child = clk;
+	core->new_child = NULL;
+	if (new_parent && new_parent != core->parent)
+		new_parent->new_child = core;
 
-	hlist_for_each_entry(child, &clk->children, child_node) {
+	hlist_for_each_entry(child, &core->children, child_node) {
 		child->new_rate = clk_recalc(child, new_rate);
 		clk_calc_subtree(child, child->new_rate, NULL, 0);
 	}
@@ -1607,10 +1607,10 @@ static void clk_calc_subtree(struct clk_core *clk, unsigned long new_rate,
  * calculate the new rates returning the topmost clock that has to be
  * changed.
  */
-static struct clk_core *clk_calc_new_rates(struct clk_core *clk,
+static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 					   unsigned long rate)
 {
-	struct clk_core *top = clk;
+	struct clk_core *top = core;
 	struct clk_core *old_parent, *parent;
 	struct clk_hw *parent_hw;
 	unsigned long best_parent_rate = 0;
@@ -1621,20 +1621,20 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *clk,
 	long ret;
 
 	/* sanity */
-	if (IS_ERR_OR_NULL(clk))
+	if (IS_ERR_OR_NULL(core))
 		return NULL;
 
 	/* save parent rate, if it exists */
-	parent = old_parent = clk->parent;
+	parent = old_parent = core->parent;
 	if (parent)
 		best_parent_rate = parent->rate;
 
-	clk_core_get_boundaries(clk, &min_rate, &max_rate);
+	clk_core_get_boundaries(core, &min_rate, &max_rate);
 
 	/* find the closest rate and parent clk/rate */
-	if (clk->ops->determine_rate) {
+	if (core->ops->determine_rate) {
 		parent_hw = parent ? parent->hw : NULL;
-		ret = clk->ops->determine_rate(clk->hw, rate,
+		ret = core->ops->determine_rate(core->hw, rate,
 					       min_rate,
 					       max_rate,
 					       &best_parent_rate,
@@ -1644,8 +1644,8 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *clk,
 
 		new_rate = ret;
 		parent = parent_hw ? parent_hw->core : NULL;
-	} else if (clk->ops->round_rate) {
-		ret = clk->ops->round_rate(clk->hw, rate,
+	} else if (core->ops->round_rate) {
+		ret = core->ops->round_rate(core->hw, rate,
 					   &best_parent_rate);
 		if (ret < 0)
 			return NULL;
@@ -1653,9 +1653,9 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *clk,
 		new_rate = ret;
 		if (new_rate < min_rate || new_rate > max_rate)
 			return NULL;
-	} else if (!parent || !(clk->flags & CLK_SET_RATE_PARENT)) {
+	} else if (!parent || !(core->flags & CLK_SET_RATE_PARENT)) {
 		/* pass-through clock without adjustable parent */
-		clk->new_rate = clk->rate;
+		core->new_rate = core->rate;
 		return NULL;
 	} else {
 		/* pass-through clock with adjustable parent */
@@ -1666,28 +1666,28 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *clk,
 
 	/* some clocks must be gated to change parent */
 	if (parent != old_parent &&
-	    (clk->flags & CLK_SET_PARENT_GATE) && clk->prepare_count) {
+	    (core->flags & CLK_SET_PARENT_GATE) && core->prepare_count) {
 		pr_debug("%s: %s not gated but wants to reparent\n",
-			 __func__, clk->name);
+			 __func__, core->name);
 		return NULL;
 	}
 
 	/* try finding the new parent index */
-	if (parent && clk->num_parents > 1) {
-		p_index = clk_fetch_parent_index(clk, parent);
+	if (parent && core->num_parents > 1) {
+		p_index = clk_fetch_parent_index(core, parent);
 		if (p_index < 0) {
 			pr_debug("%s: clk %s can not be parent of clk %s\n",
-				 __func__, parent->name, clk->name);
+				 __func__, parent->name, core->name);
 			return NULL;
 		}
 	}
 
-	if ((clk->flags & CLK_SET_RATE_PARENT) && parent &&
+	if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
 	    best_parent_rate != parent->rate)
 		top = clk_calc_new_rates(parent, best_parent_rate);
 
 out:
-	clk_calc_subtree(clk, new_rate, parent, p_index);
+	clk_calc_subtree(core, new_rate, parent, p_index);
 
 	return top;
 }
@@ -1697,33 +1697,33 @@ out:
  * so that in case of an error we can walk down the whole tree again and
  * abort the change.
  */
-static struct clk_core *clk_propagate_rate_change(struct clk_core *clk,
+static struct clk_core *clk_propagate_rate_change(struct clk_core *core,
 						  unsigned long event)
 {
 	struct clk_core *child, *tmp_clk, *fail_clk = NULL;
 	int ret = NOTIFY_DONE;
 
-	if (clk->rate == clk->new_rate)
+	if (core->rate == core->new_rate)
 		return NULL;
 
-	if (clk->notifier_count) {
-		ret = __clk_notify(clk, event, clk->rate, clk->new_rate);
+	if (core->notifier_count) {
+		ret = __clk_notify(core, event, core->rate, core->new_rate);
 		if (ret & NOTIFY_STOP_MASK)
-			fail_clk = clk;
+			fail_clk = core;
 	}
 
-	hlist_for_each_entry(child, &clk->children, child_node) {
+	hlist_for_each_entry(child, &core->children, child_node) {
 		/* Skip children who will be reparented to another clock */
-		if (child->new_parent && child->new_parent != clk)
+		if (child->new_parent && child->new_parent != core)
 			continue;
 		tmp_clk = clk_propagate_rate_change(child, event);
 		if (tmp_clk)
 			fail_clk = tmp_clk;
 	}
 
-	/* handle the new child who might not be in clk->children yet */
-	if (clk->new_child) {
-		tmp_clk = clk_propagate_rate_change(clk->new_child, event);
+	/* handle the new child who might not be in core->children yet */
+	if (core->new_child) {
+		tmp_clk = clk_propagate_rate_change(core->new_child, event);
 		if (tmp_clk)
 			fail_clk = tmp_clk;
 	}
@@ -1735,7 +1735,7 @@ static struct clk_core *clk_propagate_rate_change(struct clk_core *clk,
  * walk down a subtree and set the new rates notifying the rate
  * change on the way
  */
-static void clk_change_rate(struct clk_core *clk)
+static void clk_change_rate(struct clk_core *core)
 {
 	struct clk_core *child;
 	struct hlist_node *tmp;
@@ -1744,77 +1744,77 @@ static void clk_change_rate(struct clk_core *clk)
 	bool skip_set_rate = false;
 	struct clk_core *old_parent;
 
-	old_rate = clk->rate;
+	old_rate = core->rate;
 
-	if (clk->new_parent)
-		best_parent_rate = clk->new_parent->rate;
-	else if (clk->parent)
-		best_parent_rate = clk->parent->rate;
+	if (core->new_parent)
+		best_parent_rate = core->new_parent->rate;
+	else if (core->parent)
+		best_parent_rate = core->parent->rate;
 
-	if (clk->new_parent && clk->new_parent != clk->parent) {
-		old_parent = __clk_set_parent_before(clk, clk->new_parent);
-		trace_clk_set_parent(clk, clk->new_parent);
+	if (core->new_parent && core->new_parent != core->parent) {
+		old_parent = __clk_set_parent_before(core, core->new_parent);
+		trace_clk_set_parent(core, core->new_parent);
 
-		if (clk->ops->set_rate_and_parent) {
+		if (core->ops->set_rate_and_parent) {
 			skip_set_rate = true;
-			clk->ops->set_rate_and_parent(clk->hw, clk->new_rate,
+			core->ops->set_rate_and_parent(core->hw, core->new_rate,
 					best_parent_rate,
-					clk->new_parent_index);
-		} else if (clk->ops->set_parent) {
-			clk->ops->set_parent(clk->hw, clk->new_parent_index);
+					core->new_parent_index);
+		} else if (core->ops->set_parent) {
+			core->ops->set_parent(core->hw, core->new_parent_index);
 		}
 
-		trace_clk_set_parent_complete(clk, clk->new_parent);
-		__clk_set_parent_after(clk, clk->new_parent, old_parent);
+		trace_clk_set_parent_complete(core, core->new_parent);
+		__clk_set_parent_after(core, core->new_parent, old_parent);
 	}
 
-	trace_clk_set_rate(clk, clk->new_rate);
+	trace_clk_set_rate(core, core->new_rate);
 
-	if (!skip_set_rate && clk->ops->set_rate)
-		clk->ops->set_rate(clk->hw, clk->new_rate, best_parent_rate);
+	if (!skip_set_rate && core->ops->set_rate)
+		core->ops->set_rate(core->hw, core->new_rate, best_parent_rate);
 
-	trace_clk_set_rate_complete(clk, clk->new_rate);
+	trace_clk_set_rate_complete(core, core->new_rate);
 
-	clk->rate = clk_recalc(clk, best_parent_rate);
+	core->rate = clk_recalc(core, best_parent_rate);
 
-	if (clk->notifier_count && old_rate != clk->rate)
-		__clk_notify(clk, POST_RATE_CHANGE, old_rate, clk->rate);
+	if (core->notifier_count && old_rate != core->rate)
+		__clk_notify(core, POST_RATE_CHANGE, old_rate, core->rate);
 
 	/*
 	 * Use safe iteration, as change_rate can actually swap parents
 	 * for certain clock types.
 	 */
-	hlist_for_each_entry_safe(child, tmp, &clk->children, child_node) {
+	hlist_for_each_entry_safe(child, tmp, &core->children, child_node) {
 		/* Skip children who will be reparented to another clock */
-		if (child->new_parent && child->new_parent != clk)
+		if (child->new_parent && child->new_parent != core)
 			continue;
 		clk_change_rate(child);
 	}
 
-	/* handle the new child who might not be in clk->children yet */
-	if (clk->new_child)
-		clk_change_rate(clk->new_child);
+	/* handle the new child who might not be in core->children yet */
+	if (core->new_child)
+		clk_change_rate(core->new_child);
 }
 
-static int clk_core_set_rate_nolock(struct clk_core *clk,
+static int clk_core_set_rate_nolock(struct clk_core *core,
 				    unsigned long req_rate)
 {
 	struct clk_core *top, *fail_clk;
 	unsigned long rate = req_rate;
 	int ret = 0;
 
-	if (!clk)
+	if (!core)
 		return 0;
 
 	/* bail early if nothing to do */
-	if (rate == clk_core_get_rate_nolock(clk))
+	if (rate == clk_core_get_rate_nolock(core))
 		return 0;
 
-	if ((clk->flags & CLK_SET_RATE_GATE) && clk->prepare_count)
+	if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
 		return -EBUSY;
 
 	/* calculate new rates and get the topmost changed clock */
-	top = clk_calc_new_rates(clk, rate);
+	top = clk_calc_new_rates(core, rate);
 	if (!top)
 		return -EINVAL;
 
@@ -1830,7 +1830,7 @@ static int clk_core_set_rate_nolock(struct clk_core *clk,
 	/* change the rates */
 	clk_change_rate(top);
 
-	clk->req_rate = req_rate;
+	core->req_rate = req_rate;
 
 	return ret;
 }
@@ -1969,55 +1969,55 @@ EXPORT_SYMBOL_GPL(clk_get_parent);
  * .parents array exists, and if so use it to avoid an expensive tree
  * traversal.  If .parents does not exist then walk the tree.
  */
-static struct clk_core *__clk_init_parent(struct clk_core *clk)
+static struct clk_core *__clk_init_parent(struct clk_core *core)
 {
 	struct clk_core *ret = NULL;
 	u8 index;
 
 	/* handle the trivial cases */
 
-	if (!clk->num_parents)
+	if (!core->num_parents)
 		goto out;
 
-	if (clk->num_parents == 1) {
-		if (IS_ERR_OR_NULL(clk->parent))
-			clk->parent = clk_core_lookup(clk->parent_names[0]);
-		ret = clk->parent;
+	if (core->num_parents == 1) {
+		if (IS_ERR_OR_NULL(core->parent))
+			core->parent = clk_core_lookup(core->parent_names[0]);
+		ret = core->parent;
 		goto out;
 	}
 
-	if (!clk->ops->get_parent) {
-		WARN(!clk->ops->get_parent,
+	if (!core->ops->get_parent) {
+		WARN(!core->ops->get_parent,
 			"%s: multi-parent clocks must implement .get_parent\n",
 			__func__);
 		goto out;
 	};
 
 	/*
-	 * Do our best to cache parent clocks in clk->parents.  This prevents
-	 * unnecessary and expensive lookups.  We don't set clk->parent here;
+	 * Do our best to cache parent clocks in core->parents.  This prevents
+	 * unnecessary and expensive lookups.  We don't set core->parent here;
 	 * that is done by the calling function.
 	 */
 
-	index = clk->ops->get_parent(clk->hw);
+	index = core->ops->get_parent(core->hw);
 
-	if (!clk->parents)
-		clk->parents =
-			kcalloc(clk->num_parents, sizeof(struct clk *),
+	if (!core->parents)
+		core->parents =
+			kcalloc(core->num_parents, sizeof(struct clk *),
 					GFP_KERNEL);
 
-	ret = clk_core_get_parent_by_index(clk, index);
+	ret = clk_core_get_parent_by_index(core, index);
 
 out:
 	return ret;
 }
 
-static void clk_core_reparent(struct clk_core *clk,
+static void clk_core_reparent(struct clk_core *core,
 				  struct clk_core *new_parent)
 {
-	clk_reparent(clk, new_parent);
-	__clk_recalc_accuracies(clk);
-	__clk_recalc_rates(clk, POST_RATE_CHANGE);
+	clk_reparent(core, new_parent);
+	__clk_recalc_accuracies(core);
+	__clk_recalc_rates(core, POST_RATE_CHANGE);
 }
 
 /**
@@ -2054,61 +2054,61 @@ bool clk_has_parent(struct clk *clk, struct clk *parent)
 }
 EXPORT_SYMBOL_GPL(clk_has_parent);
 
-static int clk_core_set_parent(struct clk_core *clk, struct clk_core *parent)
+static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
 {
 	int ret = 0;
 	int p_index = 0;
 	unsigned long p_rate = 0;
 
-	if (!clk)
+	if (!core)
 		return 0;
 
 	/* prevent racing with updates to the clock topology */
 	clk_prepare_lock();
 
-	if (clk->parent == parent)
+	if (core->parent == parent)
 		goto out;
 
 	/* verify ops for for multi-parent clks */
-	if ((clk->num_parents > 1) && (!clk->ops->set_parent)) {
+	if ((core->num_parents > 1) && (!core->ops->set_parent)) {
 		ret = -ENOSYS;
 		goto out;
 	}
 
 	/* check that we are allowed to re-parent if the clock is in use */
-	if ((clk->flags & CLK_SET_PARENT_GATE) && clk->prepare_count) {
+	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count) {
 		ret = -EBUSY;
 		goto out;
 	}
 
 	/* try finding the new parent index */
 	if (parent) {
-		p_index = clk_fetch_parent_index(clk, parent);
+		p_index = clk_fetch_parent_index(core, parent);
 		p_rate = parent->rate;
 		if (p_index < 0) {
 			pr_debug("%s: clk %s can not be parent of clk %s\n",
-					__func__, parent->name, clk->name);
+					__func__, parent->name, core->name);
 			ret = p_index;
 			goto out;
 		}
 	}
 
 	/* propagate PRE_RATE_CHANGE notifications */
-	ret = __clk_speculate_rates(clk, p_rate);
+	ret = __clk_speculate_rates(core, p_rate);
 
 	/* abort if a driver objects */
 	if (ret & NOTIFY_STOP_MASK)
 		goto out;
 
 	/* do the re-parent */
-	ret = __clk_set_parent(clk, parent, p_index);
+	ret = __clk_set_parent(core, parent, p_index);
 
 	/* propagate rate an accuracy recalculation accordingly */
 	if (ret) {
-		__clk_recalc_rates(clk, ABORT_RATE_CHANGE);
+		__clk_recalc_rates(core, ABORT_RATE_CHANGE);
 	} else {
-		__clk_recalc_rates(clk, POST_RATE_CHANGE);
-		__clk_recalc_accuracies(clk);
+		__clk_recalc_rates(core, POST_RATE_CHANGE);
+		__clk_recalc_accuracies(core);
 	}
 
 out:
@@ -2193,15 +2193,15 @@ int clk_set_phase(struct clk *clk, int degrees)
 }
 EXPORT_SYMBOL_GPL(clk_set_phase);
 
-static int clk_core_get_phase(struct clk_core *clk)
+static int clk_core_get_phase(struct clk_core *core)
 {
 	int ret = 0;
 
-	if (!clk)
+	if (!core)
 		goto out;
 
 	clk_prepare_lock();
-	ret = clk->phase;
+	ret = core->phase;
 	clk_prepare_unlock();
 
 out:
@@ -2263,67 +2263,67 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 	int i, ret = 0;
 	struct clk_core *orphan;
 	struct hlist_node *tmp2;
-	struct clk_core *clk;
+	struct clk_core *core;
 	unsigned long rate;
 
 	if (!clk_user)
 		return -EINVAL;
 
-	clk = clk_user->core;
+	core = clk_user->core;
 
 	clk_prepare_lock();
 
 	/* check to see if a clock with this name is already registered */
-	if (clk_core_lookup(clk->name)) {
+	if (clk_core_lookup(core->name)) {
 		pr_debug("%s: clk %s already initialized\n",
-				__func__, clk->name);
+				__func__, core->name);
 		ret = -EEXIST;
 		goto out;
 	}
 
 	/* check that clk_ops are sane.  See Documentation/clk.txt */
-	if (clk->ops->set_rate &&
-	    !((clk->ops->round_rate || clk->ops->determine_rate) &&
-	      clk->ops->recalc_rate)) {
+	if (core->ops->set_rate &&
+	    !((core->ops->round_rate || core->ops->determine_rate) &&
+	      core->ops->recalc_rate)) {
 		pr_warning("%s: %s must implement .round_rate or .determine_rate in addition to .recalc_rate\n",
-				__func__, clk->name);
+				__func__, core->name);
 		ret = -EINVAL;
 		goto out;
 	}
 
-	if (clk->ops->set_parent && !clk->ops->get_parent) {
+	if (core->ops->set_parent && !core->ops->get_parent) {
 		pr_warning("%s: %s must implement .get_parent & .set_parent\n",
-				__func__, clk->name);
+				__func__, core->name);
 		ret = -EINVAL;
 		goto out;
 	}
 
-	if (clk->ops->set_rate_and_parent &&
-			!(clk->ops->set_parent && clk->ops->set_rate)) {
+	if (core->ops->set_rate_and_parent &&
+			!(core->ops->set_parent && core->ops->set_rate)) {
 		pr_warn("%s: %s must implement .set_parent & .set_rate\n",
-				__func__, clk->name);
+				__func__, core->name);
 		ret = -EINVAL;
 		goto out;
 	}
 
 	/* throw a WARN if any entries in parent_names are NULL */
-	for (i = 0; i < clk->num_parents; i++)
-		WARN(!clk->parent_names[i],
+	for (i = 0; i < core->num_parents; i++)
+		WARN(!core->parent_names[i],
 				"%s: invalid NULL in %s's .parent_names\n",
-				__func__, clk->name);
+				__func__, core->name);
 
 	/*
 	 * Allocate an array of struct clk *'s to avoid unnecessary string
 	 * look-ups of clk's possible parents.  This can fail for clocks passed
-	 * in to clk_init during early boot; thus any access to clk->parents[]
+	 * in to clk_init during early boot; thus any access to core->parents[]
 	 * must always check for a NULL pointer and try to populate it if
 	 * necessary.
 	 *
-	 * If clk->parents is not NULL we skip this entire block.  This allows
-	 * for clock drivers to statically initialize clk->parents.
+	 * If core->parents is not NULL we skip this entire block.  This allows
+	 * for clock drivers to statically initialize core->parents.
 	 */
-	if (clk->num_parents > 1 && !clk->parents) {
-		clk->parents = kcalloc(clk->num_parents, sizeof(struct clk *),
+	if (core->num_parents > 1 && !core->parents) {
+		core->parents = kcalloc(core->num_parents, sizeof(struct clk *),
 					GFP_KERNEL);
 		/*
 		 * clk_core_lookup returns NULL for parents that have not been
@@ -2331,16 +2331,16 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 		 * for a NULL pointer.  We can always perform lazy lookups for
 		 * missing parents later on.
 		 */
-		if (clk->parents)
-			for (i = 0; i < clk->num_parents; i++)
-				clk->parents[i] =
-					clk_core_lookup(clk->parent_names[i]);
+		if (core->parents)
+			for (i = 0; i < core->num_parents; i++)
+				core->parents[i] =
+					clk_core_lookup(core->parent_names[i]);
 	}
 
-	clk->parent = __clk_init_parent(clk);
+	core->parent = __clk_init_parent(core);
 
 	/*
-	 * Populate clk->parent if parent has already been __clk_init'd.  If
+	 * Populate core->parent if parent has already been __clk_init'd.  If
 	 * parent has not yet been __clk_init'd then place clk in the orphan
 	 * list.  If clk has set the CLK_IS_ROOT flag then place it in the root
 	 * clk list.
@@ -2349,13 +2349,13 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 	 * clocks and re-parent any that are children of the clock currently
 	 * being clk_init'd.
 	 */
-	if (clk->parent)
-		hlist_add_head(&clk->child_node,
-				&clk->parent->children);
-	else if (clk->flags & CLK_IS_ROOT)
-		hlist_add_head(&clk->child_node, &clk_root_list);
+	if (core->parent)
+		hlist_add_head(&core->child_node,
+				&core->parent->children);
+	else if (core->flags & CLK_IS_ROOT)
+		hlist_add_head(&core->child_node, &clk_root_list);
 	else
-		hlist_add_head(&clk->child_node, &clk_orphan_list);
+		hlist_add_head(&core->child_node, &clk_orphan_list);
 
 	/*
 	 * Set clk's accuracy.  The preferred method is to use
@@ -2364,23 +2364,23 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 	 * parent (or is orphaned) then accuracy is set to zero (perfect
 	 * clock).
 	 */
-	if (clk->ops->recalc_accuracy)
-		clk->accuracy = clk->ops->recalc_accuracy(clk->hw,
-					__clk_get_accuracy(clk->parent));
-	else if (clk->parent)
-		clk->accuracy = clk->parent->accuracy;
+	if (core->ops->recalc_accuracy)
+		core->accuracy = core->ops->recalc_accuracy(core->hw,
+					__clk_get_accuracy(core->parent));
+	else if (core->parent)
+		core->accuracy = core->parent->accuracy;
 	else
-		clk->accuracy = 0;
+		core->accuracy = 0;
 
 	/*
 	 * Set clk's phase.
 	 * Since a phase is by definition relative to its parent, just
 	 * query the current clock phase, or just assume it's in phase.
 	 */
-	if (clk->ops->get_phase)
-		clk->phase = clk->ops->get_phase(clk->hw);
+	if (core->ops->get_phase)
+		core->phase = core->ops->get_phase(core->hw);
 	else
-		clk->phase = 0;
+		core->phase = 0;
 
 	/*
 	 * Set clk's rate.  The preferred method is to use .recalc_rate.  For
@@ -2388,14 +2388,14 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 	 * parent's rate.  If a clock doesn't have a parent (or is orphaned)
 	 * then rate is set to zero.
 	 */
-	if (clk->ops->recalc_rate)
-		rate = clk->ops->recalc_rate(clk->hw,
-				clk_core_get_rate_nolock(clk->parent));
-	else if (clk->parent)
-		rate = clk->parent->rate;
+	if (core->ops->recalc_rate)
+		rate = core->ops->recalc_rate(core->hw,
+				clk_core_get_rate_nolock(core->parent));
+	else if (core->parent)
+		rate = core->parent->rate;
 	else
 		rate = 0;
-	clk->rate = clk->req_rate = rate;
+	core->rate = core->req_rate = rate;
 
 	/*
 	 * walk the list of orphan clocks and reparent any that are children of
@@ -2404,14 +2404,14 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 	hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
 		if (orphan->num_parents && orphan->ops->get_parent) {
 			i = orphan->ops->get_parent(orphan->hw);
-			if (!strcmp(clk->name, orphan->parent_names[i]))
-				clk_core_reparent(orphan, clk);
+			if (!strcmp(core->name, orphan->parent_names[i]))
+				clk_core_reparent(orphan, core);
 			continue;
 		}
 
 		for (i = 0; i < orphan->num_parents; i++)
-			if (!strcmp(clk->name, orphan->parent_names[i])) {
-				clk_core_reparent(orphan, clk);
+			if (!strcmp(core->name, orphan->parent_names[i])) {
+				clk_core_reparent(orphan, core);
 				break;
 			}
 	 }
@@ -2424,15 +2424,15 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 	 * Please consider other ways of solving initialization problems before
 	 * using this callback, as its use is discouraged.
 	 */
-	if (clk->ops->init)
-		clk->ops->init(clk->hw);
+	if (core->ops->init)
+		core->ops->init(core->hw);
 
-	kref_init(&clk->ref);
+	kref_init(&core->ref);
 out:
 	clk_prepare_unlock();
 
 	if (!ret)
-		clk_debug_register(clk);
+		clk_debug_register(core);
 
 	return ret;
 }
@@ -2485,34 +2485,34 @@ void __clk_free_clk(struct clk *clk)
 struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 {
 	int i, ret;
-	struct clk_core *clk;
+	struct clk_core *core;
 
-	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
-	if (!clk) {
+	core = kzalloc(sizeof(*core), GFP_KERNEL);
+	if (!core) {
 		pr_err("%s: could not allocate clk\n", __func__);
 		ret = -ENOMEM;
 		goto fail_out;
 	}
 
-	clk->name = kstrdup_const(hw->init->name, GFP_KERNEL);
-	if (!clk->name) {
+	core->name = kstrdup_const(hw->init->name, GFP_KERNEL);
+	if (!core->name) {
 		pr_err("%s: could not allocate clk->name\n", __func__);
 		ret = -ENOMEM;
 		goto fail_name;
 	}
-	clk->ops = hw->init->ops;
+	core->ops = hw->init->ops;
 	if (dev && dev->driver)
-		clk->owner = dev->driver->owner;
-	clk->hw = hw;
-	clk->flags = hw->init->flags;
-	clk->num_parents = hw->init->num_parents;
-	hw->core = clk;
+		core->owner = dev->driver->owner;
+	core->hw = hw;
+	core->flags = hw->init->flags;
+	core->num_parents = hw->init->num_parents;
+	hw->core = core;
 
 	/* allocate local copy in case parent_names is __initdata */
-	clk->parent_names = kcalloc(clk->num_parents, sizeof(char *),
+	core->parent_names = kcalloc(core->num_parents, sizeof(char *),
 					GFP_KERNEL);
 
-	if (!clk->parent_names) {
+	if (!core->parent_names) {
 		pr_err("%s: could not allocate clk->parent_names\n", __func__);
 		ret = -ENOMEM;
 		goto fail_parent_names;
@@ -2520,17 +2520,17 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 
 
 	/* copy each string name in case parent_names is __initdata */
-	for (i = 0; i < clk->num_parents; i++) {
-		clk->parent_names[i] = kstrdup_const(hw->init->parent_names[i],
+	for (i = 0; i < core->num_parents; i++) {
+		core->parent_names[i] = kstrdup_const(hw->init->parent_names[i],
 						GFP_KERNEL);
-		if (!clk->parent_names[i]) {
+		if (!core->parent_names[i]) {
 			pr_err("%s: could not copy parent_names\n", __func__);
 			ret = -ENOMEM;
 			goto fail_parent_names_copy;
 		}
 	}
 
-	INIT_HLIST_HEAD(&clk->clks);
+	INIT_HLIST_HEAD(&core->clks);
 
 	hw->clk = __clk_create_clk(hw, NULL, NULL);
 	if (IS_ERR(hw->clk)) {
@@ -2548,12 +2548,12 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 
 fail_parent_names_copy:
 	while (--i >= 0)
-		kfree_const(clk->parent_names[i]);
-	kfree(clk->parent_names);
+		kfree_const(core->parent_names[i]);
+	kfree(core->parent_names);
 fail_parent_names:
-	kfree_const(clk->name);
+	kfree_const(core->name);
 fail_name:
-	kfree(clk);
+	kfree(core);
 fail_out:
 	return ERR_PTR(ret);
 }
@@ -2565,18 +2565,18 @@ EXPORT_SYMBOL_GPL(clk_register);
  */
 static void __clk_release(struct kref *ref)
 {
-	struct clk_core *clk = container_of(ref, struct clk_core, ref);
-	int i = clk->num_parents;
+	struct clk_core *core = container_of(ref, struct clk_core, ref);
+	int i = core->num_parents;
 
 	lockdep_assert_held(&prepare_lock);
 
-	kfree(clk->parents);
+	kfree(core->parents);
 	while (--i >= 0)
-		kfree_const(clk->parent_names[i]);
+		kfree_const(core->parent_names[i]);
 
-	kfree(clk->parent_names);
-	kfree_const(clk->name);
-	kfree(clk);
+	kfree(core->parent_names);
+	kfree_const(core->name);
+	kfree(core);
 }
 
 /*
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
