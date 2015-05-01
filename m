Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 5/6] clk: Remove forward declared function prototypes
Date: Thu, 30 Apr 2015 17:14:20 -0700
Message-Id: <1430439261-10291-6-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
References: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Move the code around so that we don't need to declare function
prototypes at the start of the file. Simplify
clk_core_is_prepared() and clk_core_is_enabled() too to make the
diff easier to read.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 811 ++++++++++++++++++++++++++----------------------------
 1 file changed, 393 insertions(+), 418 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3e58b7453076..0001b91f2b6e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -37,13 +37,6 @@ static HLIST_HEAD(clk_root_list);
 static HLIST_HEAD(clk_orphan_list);
 static LIST_HEAD(clk_notifier_list);
 
-static long clk_core_get_accuracy(struct clk_core *core);
-static unsigned long clk_core_get_rate(struct clk_core *core);
-static int clk_core_get_phase(struct clk_core *core);
-static bool clk_core_is_prepared(struct clk_core *core);
-static bool clk_core_is_enabled(struct clk_core *core);
-static struct clk_core *clk_core_lookup(const char *name);
-
 /***    private data structures    ***/
 
 struct clk_core {
@@ -145,338 +138,29 @@ static void clk_enable_unlock(unsigned long flags)
 	spin_unlock_irqrestore(&enable_lock, flags);
 }
 
-/***        debugfs support        ***/
-
-#ifdef CONFIG_DEBUG_FS
-#include <linux/debugfs.h>
-
-static struct dentry *rootdir;
-static int inited = 0;
-static DEFINE_MUTEX(clk_debug_lock);
-static HLIST_HEAD(clk_debug_list);
-
-static struct hlist_head *all_lists[] = {
-	&clk_root_list,
-	&clk_orphan_list,
-	NULL,
-};
-
-static struct hlist_head *orphan_list[] = {
-	&clk_orphan_list,
-	NULL,
-};
-
-static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
-				 int level)
-{
-	if (!c)
-		return;
-
-	seq_printf(s, "%*s%-*s %11d %12d %11lu %10lu %-3d\n",
-		   level * 3 + 1, "",
-		   30 - level * 3, c->name,
-		   c->enable_count, c->prepare_count, clk_core_get_rate(c),
-		   clk_core_get_accuracy(c), clk_core_get_phase(c));
-}
-
-static void clk_summary_show_subtree(struct seq_file *s, struct clk_core *c,
-				     int level)
-{
-	struct clk_core *child;
-
-	if (!c)
-		return;
-
-	clk_summary_show_one(s, c, level);
-
-	hlist_for_each_entry(child, &c->children, child_node)
-		clk_summary_show_subtree(s, child, level + 1);
-}
-
-static int clk_summary_show(struct seq_file *s, void *data)
-{
-	struct clk_core *c;
-	struct hlist_head **lists = (struct hlist_head **)s->private;
-
-	seq_puts(s, "   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase\n");
-	seq_puts(s, "----------------------------------------------------------------------------------------\n");
-
-	clk_prepare_lock();
-
-	for (; *lists; lists++)
-		hlist_for_each_entry(c, *lists, child_node)
-			clk_summary_show_subtree(s, c, 0);
-
-	clk_prepare_unlock();
-
-	return 0;
-}
-
-
-static int clk_summary_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, clk_summary_show, inode->i_private);
-}
-
-static const struct file_operations clk_summary_fops = {
-	.open		= clk_summary_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
-static void clk_dump_one(struct seq_file *s, struct clk_core *c, int level)
-{
-	if (!c)
-		return;
-
-	seq_printf(s, "\"%s\": { ", c->name);
-	seq_printf(s, "\"enable_count\": %d,", c->enable_count);
-	seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
-	seq_printf(s, "\"rate\": %lu", clk_core_get_rate(c));
-	seq_printf(s, "\"accuracy\": %lu", clk_core_get_accuracy(c));
-	seq_printf(s, "\"phase\": %d", clk_core_get_phase(c));
-}
-
-static void clk_dump_subtree(struct seq_file *s, struct clk_core *c, int level)
+static bool clk_core_is_prepared(struct clk_core *core)
 {
-	struct clk_core *child;
-
-	if (!c)
-		return;
-
-	clk_dump_one(s, c, level);
-
-	hlist_for_each_entry(child, &c->children, child_node) {
-		seq_printf(s, ",");
-		clk_dump_subtree(s, child, level + 1);
-	}
+	/*
+	 * .is_prepared is optional for clocks that can prepare
+	 * fall back to software usage counter if it is missing
+	 */
+	if (!core->ops->is_prepared)
+		return core->prepare_count;
 
-	seq_printf(s, "}");
+	return core->ops->is_prepared(core->hw);
 }
 
-static int clk_dump(struct seq_file *s, void *data)
+static bool clk_core_is_enabled(struct clk_core *core)
 {
-	struct clk_core *c;
-	bool first_node = true;
-	struct hlist_head **lists = (struct hlist_head **)s->private;
-
-	seq_printf(s, "{");
-
-	clk_prepare_lock();
-
-	for (; *lists; lists++) {
-		hlist_for_each_entry(c, *lists, child_node) {
-			if (!first_node)
-				seq_puts(s, ",");
-			first_node = false;
-			clk_dump_subtree(s, c, 0);
-		}
-	}
-
-	clk_prepare_unlock();
-
-	seq_printf(s, "}");
-	return 0;
-}
-
-
-static int clk_dump_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, clk_dump, inode->i_private);
-}
-
-static const struct file_operations clk_dump_fops = {
-	.open		= clk_dump_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+	/*
+	 * .is_enabled is only mandatory for clocks that gate
+	 * fall back to software usage counter if .is_enabled is missing
+	 */
+	if (!core->ops->is_enabled)
+		return core->enable_count;
 
-static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
-{
-	struct dentry *d;
-	int ret = -ENOMEM;
-
-	if (!core || !pdentry) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	d = debugfs_create_dir(core->name, pdentry);
-	if (!d)
-		goto out;
-
-	core->dentry = d;
-
-	d = debugfs_create_u32("clk_rate", S_IRUGO, core->dentry,
-			(u32 *)&core->rate);
-	if (!d)
-		goto err_out;
-
-	d = debugfs_create_u32("clk_accuracy", S_IRUGO, core->dentry,
-			(u32 *)&core->accuracy);
-	if (!d)
-		goto err_out;
-
-	d = debugfs_create_u32("clk_phase", S_IRUGO, core->dentry,
-			(u32 *)&core->phase);
-	if (!d)
-		goto err_out;
-
-	d = debugfs_create_x32("clk_flags", S_IRUGO, core->dentry,
-			(u32 *)&core->flags);
-	if (!d)
-		goto err_out;
-
-	d = debugfs_create_u32("clk_prepare_count", S_IRUGO, core->dentry,
-			(u32 *)&core->prepare_count);
-	if (!d)
-		goto err_out;
-
-	d = debugfs_create_u32("clk_enable_count", S_IRUGO, core->dentry,
-			(u32 *)&core->enable_count);
-	if (!d)
-		goto err_out;
-
-	d = debugfs_create_u32("clk_notifier_count", S_IRUGO, core->dentry,
-			(u32 *)&core->notifier_count);
-	if (!d)
-		goto err_out;
-
-	if (core->ops->debug_init) {
-		ret = core->ops->debug_init(core->hw, core->dentry);
-		if (ret)
-			goto err_out;
-	}
-
-	ret = 0;
-	goto out;
-
-err_out:
-	debugfs_remove_recursive(core->dentry);
-	core->dentry = NULL;
-out:
-	return ret;
-}
-
-/**
- * clk_debug_register - add a clk node to the debugfs clk tree
- * @core: the clk being added to the debugfs clk tree
- *
- * Dynamically adds a clk to the debugfs clk tree if debugfs has been
- * initialized.  Otherwise it bails out early since the debugfs clk tree
- * will be created lazily by clk_debug_init as part of a late_initcall.
- */
-static int clk_debug_register(struct clk_core *core)
-{
-	int ret = 0;
-
-	mutex_lock(&clk_debug_lock);
-	hlist_add_head(&core->debug_node, &clk_debug_list);
-
-	if (!inited)
-		goto unlock;
-
-	ret = clk_debug_create_one(core, rootdir);
-unlock:
-	mutex_unlock(&clk_debug_lock);
-
-	return ret;
-}
-
- /**
- * clk_debug_unregister - remove a clk node from the debugfs clk tree
- * @core: the clk being removed from the debugfs clk tree
- *
- * Dynamically removes a clk and all it's children clk nodes from the
- * debugfs clk tree if clk->dentry points to debugfs created by
- * clk_debug_register in __clk_init.
- */
-static void clk_debug_unregister(struct clk_core *core)
-{
-	mutex_lock(&clk_debug_lock);
-	hlist_del_init(&core->debug_node);
-	debugfs_remove_recursive(core->dentry);
-	core->dentry = NULL;
-	mutex_unlock(&clk_debug_lock);
-}
-
-struct dentry *clk_debugfs_add_file(struct clk_hw *hw, char *name, umode_t mode,
-				void *data, const struct file_operations *fops)
-{
-	struct dentry *d = NULL;
-
-	if (hw->core->dentry)
-		d = debugfs_create_file(name, mode, hw->core->dentry, data,
-					fops);
-
-	return d;
-}
-EXPORT_SYMBOL_GPL(clk_debugfs_add_file);
-
-/**
- * clk_debug_init - lazily create the debugfs clk tree visualization
- *
- * clks are often initialized very early during boot before memory can
- * be dynamically allocated and well before debugfs is setup.
- * clk_debug_init walks the clk tree hierarchy while holding
- * prepare_lock and creates the topology as part of a late_initcall,
- * thus insuring that clks initialized very early will still be
- * represented in the debugfs clk tree.  This function should only be
- * called once at boot-time, and all other clks added dynamically will
- * be done so with clk_debug_register.
- */
-static int __init clk_debug_init(void)
-{
-	struct clk_core *core;
-	struct dentry *d;
-
-	rootdir = debugfs_create_dir("clk", NULL);
-
-	if (!rootdir)
-		return -ENOMEM;
-
-	d = debugfs_create_file("clk_summary", S_IRUGO, rootdir, &all_lists,
-				&clk_summary_fops);
-	if (!d)
-		return -ENOMEM;
-
-	d = debugfs_create_file("clk_dump", S_IRUGO, rootdir, &all_lists,
-				&clk_dump_fops);
-	if (!d)
-		return -ENOMEM;
-
-	d = debugfs_create_file("clk_orphan_summary", S_IRUGO, rootdir,
-				&orphan_list, &clk_summary_fops);
-	if (!d)
-		return -ENOMEM;
-
-	d = debugfs_create_file("clk_orphan_dump", S_IRUGO, rootdir,
-				&orphan_list, &clk_dump_fops);
-	if (!d)
-		return -ENOMEM;
-
-	mutex_lock(&clk_debug_lock);
-	hlist_for_each_entry(core, &clk_debug_list, debug_node)
-		clk_debug_create_one(core, rootdir);
-
-	inited = 1;
-	mutex_unlock(&clk_debug_lock);
-
-	return 0;
-}
-late_initcall(clk_debug_init);
-#else
-static inline int clk_debug_register(struct clk_core *core) { return 0; }
-static inline void clk_debug_reparent(struct clk_core *core,
-				      struct clk_core *new_parent)
-{
-}
-static inline void clk_debug_unregister(struct clk_core *core)
-{
+	return core->ops->is_enabled(core->hw);
 }
-#endif
 
 /* caller must hold prepare_lock */
 static void clk_unprepare_unused_subtree(struct clk_core *core)
@@ -608,6 +292,49 @@ struct clk *__clk_get_parent(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_get_parent);
 
+static struct clk_core *__clk_lookup_subtree(const char *name,
+					     struct clk_core *core)
+{
+	struct clk_core *child;
+	struct clk_core *ret;
+
+	if (!strcmp(core->name, name))
+		return core;
+
+	hlist_for_each_entry(child, &core->children, child_node) {
+		ret = __clk_lookup_subtree(name, child);
+		if (ret)
+			return ret;
+	}
+
+	return NULL;
+}
+
+static struct clk_core *clk_core_lookup(const char *name)
+{
+	struct clk_core *root_clk;
+	struct clk_core *ret;
+
+	if (!name)
+		return NULL;
+
+	/* search the 'proper' clk tree first */
+	hlist_for_each_entry(root_clk, &clk_root_list, child_node) {
+		ret = __clk_lookup_subtree(name, root_clk);
+		if (ret)
+			return ret;
+	}
+
+	/* if not found, then search the orphan tree */
+	hlist_for_each_entry(root_clk, &clk_orphan_list, child_node) {
+		ret = __clk_lookup_subtree(name, root_clk);
+		if (ret)
+			return ret;
+	}
+
+	return NULL;
+}
+
 static struct clk_core *clk_core_get_parent_by_index(struct clk_core *core,
 							 u8 index)
 {
@@ -684,27 +411,6 @@ unsigned long __clk_get_flags(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_get_flags);
 
-static bool clk_core_is_prepared(struct clk_core *core)
-{
-	int ret;
-
-	if (!core)
-		return false;
-
-	/*
-	 * .is_prepared is optional for clocks that can prepare
-	 * fall back to software usage counter if it is missing
-	 */
-	if (!core->ops->is_prepared) {
-		ret = core->prepare_count ? 1 : 0;
-		goto out;
-	}
-
-	ret = core->ops->is_prepared(core->hw);
-out:
-	return !!ret;
-}
-
 bool __clk_is_prepared(struct clk *clk)
 {
 	if (!clk)
@@ -713,27 +419,6 @@ bool __clk_is_prepared(struct clk *clk)
 	return clk_core_is_prepared(clk->core);
 }
 
-static bool clk_core_is_enabled(struct clk_core *core)
-{
-	int ret;
-
-	if (!core)
-		return false;
-
-	/*
-	 * .is_enabled is only mandatory for clocks that gate
-	 * fall back to software usage counter if .is_enabled is missing
-	 */
-	if (!core->ops->is_enabled) {
-		ret = core->enable_count ? 1 : 0;
-		goto out;
-	}
-
-	ret = core->ops->is_enabled(core->hw);
-out:
-	return !!ret;
-}
-
 bool __clk_is_enabled(struct clk *clk)
 {
 	if (!clk)
@@ -743,49 +428,6 @@ bool __clk_is_enabled(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_is_enabled);
 
-static struct clk_core *__clk_lookup_subtree(const char *name,
-					     struct clk_core *core)
-{
-	struct clk_core *child;
-	struct clk_core *ret;
-
-	if (!strcmp(core->name, name))
-		return core;
-
-	hlist_for_each_entry(child, &core->children, child_node) {
-		ret = __clk_lookup_subtree(name, child);
-		if (ret)
-			return ret;
-	}
-
-	return NULL;
-}
-
-static struct clk_core *clk_core_lookup(const char *name)
-{
-	struct clk_core *root_clk;
-	struct clk_core *ret;
-
-	if (!name)
-		return NULL;
-
-	/* search the 'proper' clk tree first */
-	hlist_for_each_entry(root_clk, &clk_root_list, child_node) {
-		ret = __clk_lookup_subtree(name, root_clk);
-		if (ret)
-			return ret;
-	}
-
-	/* if not found, then search the orphan tree */
-	hlist_for_each_entry(root_clk, &clk_orphan_list, child_node) {
-		ret = __clk_lookup_subtree(name, root_clk);
-		if (ret)
-			return ret;
-	}
-
-	return NULL;
-}
-
 static bool mux_is_better_rate(unsigned long rate, unsigned long now,
 			   unsigned long best, unsigned long flags)
 {
@@ -2190,7 +1832,6 @@ static int clk_core_get_phase(struct clk_core *core)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(clk_get_phase);
 
 /**
  * clk_get_phase - return the phase shift of a clock signal
@@ -2206,6 +1847,7 @@ int clk_get_phase(struct clk *clk)
 
 	return clk_core_get_phase(clk->core);
 }
+EXPORT_SYMBOL_GPL(clk_get_phase);
 
 /**
  * clk_is_match - check if two clk's point to the same hardware clock
@@ -2233,6 +1875,339 @@ bool clk_is_match(const struct clk *p, const struct clk *q)
 }
 EXPORT_SYMBOL_GPL(clk_is_match);
 
+/***        debugfs support        ***/
+
+#ifdef CONFIG_DEBUG_FS
+#include <linux/debugfs.h>
+
+static struct dentry *rootdir;
+static int inited = 0;
+static DEFINE_MUTEX(clk_debug_lock);
+static HLIST_HEAD(clk_debug_list);
+
+static struct hlist_head *all_lists[] = {
+	&clk_root_list,
+	&clk_orphan_list,
+	NULL,
+};
+
+static struct hlist_head *orphan_list[] = {
+	&clk_orphan_list,
+	NULL,
+};
+
+static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
+				 int level)
+{
+	if (!c)
+		return;
+
+	seq_printf(s, "%*s%-*s %11d %12d %11lu %10lu %-3d\n",
+		   level * 3 + 1, "",
+		   30 - level * 3, c->name,
+		   c->enable_count, c->prepare_count, clk_core_get_rate(c),
+		   clk_core_get_accuracy(c), clk_core_get_phase(c));
+}
+
+static void clk_summary_show_subtree(struct seq_file *s, struct clk_core *c,
+				     int level)
+{
+	struct clk_core *child;
+
+	if (!c)
+		return;
+
+	clk_summary_show_one(s, c, level);
+
+	hlist_for_each_entry(child, &c->children, child_node)
+		clk_summary_show_subtree(s, child, level + 1);
+}
+
+static int clk_summary_show(struct seq_file *s, void *data)
+{
+	struct clk_core *c;
+	struct hlist_head **lists = (struct hlist_head **)s->private;
+
+	seq_puts(s, "   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase\n");
+	seq_puts(s, "----------------------------------------------------------------------------------------\n");
+
+	clk_prepare_lock();
+
+	for (; *lists; lists++)
+		hlist_for_each_entry(c, *lists, child_node)
+			clk_summary_show_subtree(s, c, 0);
+
+	clk_prepare_unlock();
+
+	return 0;
+}
+
+
+static int clk_summary_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, clk_summary_show, inode->i_private);
+}
+
+static const struct file_operations clk_summary_fops = {
+	.open		= clk_summary_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static void clk_dump_one(struct seq_file *s, struct clk_core *c, int level)
+{
+	if (!c)
+		return;
+
+	seq_printf(s, "\"%s\": { ", c->name);
+	seq_printf(s, "\"enable_count\": %d,", c->enable_count);
+	seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
+	seq_printf(s, "\"rate\": %lu", clk_core_get_rate(c));
+	seq_printf(s, "\"accuracy\": %lu", clk_core_get_accuracy(c));
+	seq_printf(s, "\"phase\": %d", clk_core_get_phase(c));
+}
+
+static void clk_dump_subtree(struct seq_file *s, struct clk_core *c, int level)
+{
+	struct clk_core *child;
+
+	if (!c)
+		return;
+
+	clk_dump_one(s, c, level);
+
+	hlist_for_each_entry(child, &c->children, child_node) {
+		seq_printf(s, ",");
+		clk_dump_subtree(s, child, level + 1);
+	}
+
+	seq_printf(s, "}");
+}
+
+static int clk_dump(struct seq_file *s, void *data)
+{
+	struct clk_core *c;
+	bool first_node = true;
+	struct hlist_head **lists = (struct hlist_head **)s->private;
+
+	seq_printf(s, "{");
+
+	clk_prepare_lock();
+
+	for (; *lists; lists++) {
+		hlist_for_each_entry(c, *lists, child_node) {
+			if (!first_node)
+				seq_puts(s, ",");
+			first_node = false;
+			clk_dump_subtree(s, c, 0);
+		}
+	}
+
+	clk_prepare_unlock();
+
+	seq_printf(s, "}");
+	return 0;
+}
+
+
+static int clk_dump_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, clk_dump, inode->i_private);
+}
+
+static const struct file_operations clk_dump_fops = {
+	.open		= clk_dump_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
+{
+	struct dentry *d;
+	int ret = -ENOMEM;
+
+	if (!core || !pdentry) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	d = debugfs_create_dir(core->name, pdentry);
+	if (!d)
+		goto out;
+
+	core->dentry = d;
+
+	d = debugfs_create_u32("clk_rate", S_IRUGO, core->dentry,
+			(u32 *)&core->rate);
+	if (!d)
+		goto err_out;
+
+	d = debugfs_create_u32("clk_accuracy", S_IRUGO, core->dentry,
+			(u32 *)&core->accuracy);
+	if (!d)
+		goto err_out;
+
+	d = debugfs_create_u32("clk_phase", S_IRUGO, core->dentry,
+			(u32 *)&core->phase);
+	if (!d)
+		goto err_out;
+
+	d = debugfs_create_x32("clk_flags", S_IRUGO, core->dentry,
+			(u32 *)&core->flags);
+	if (!d)
+		goto err_out;
+
+	d = debugfs_create_u32("clk_prepare_count", S_IRUGO, core->dentry,
+			(u32 *)&core->prepare_count);
+	if (!d)
+		goto err_out;
+
+	d = debugfs_create_u32("clk_enable_count", S_IRUGO, core->dentry,
+			(u32 *)&core->enable_count);
+	if (!d)
+		goto err_out;
+
+	d = debugfs_create_u32("clk_notifier_count", S_IRUGO, core->dentry,
+			(u32 *)&core->notifier_count);
+	if (!d)
+		goto err_out;
+
+	if (core->ops->debug_init) {
+		ret = core->ops->debug_init(core->hw, core->dentry);
+		if (ret)
+			goto err_out;
+	}
+
+	ret = 0;
+	goto out;
+
+err_out:
+	debugfs_remove_recursive(core->dentry);
+	core->dentry = NULL;
+out:
+	return ret;
+}
+
+/**
+ * clk_debug_register - add a clk node to the debugfs clk tree
+ * @core: the clk being added to the debugfs clk tree
+ *
+ * Dynamically adds a clk to the debugfs clk tree if debugfs has been
+ * initialized.  Otherwise it bails out early since the debugfs clk tree
+ * will be created lazily by clk_debug_init as part of a late_initcall.
+ */
+static int clk_debug_register(struct clk_core *core)
+{
+	int ret = 0;
+
+	mutex_lock(&clk_debug_lock);
+	hlist_add_head(&core->debug_node, &clk_debug_list);
+
+	if (!inited)
+		goto unlock;
+
+	ret = clk_debug_create_one(core, rootdir);
+unlock:
+	mutex_unlock(&clk_debug_lock);
+
+	return ret;
+}
+
+ /**
+ * clk_debug_unregister - remove a clk node from the debugfs clk tree
+ * @core: the clk being removed from the debugfs clk tree
+ *
+ * Dynamically removes a clk and all it's children clk nodes from the
+ * debugfs clk tree if clk->dentry points to debugfs created by
+ * clk_debug_register in __clk_init.
+ */
+static void clk_debug_unregister(struct clk_core *core)
+{
+	mutex_lock(&clk_debug_lock);
+	hlist_del_init(&core->debug_node);
+	debugfs_remove_recursive(core->dentry);
+	core->dentry = NULL;
+	mutex_unlock(&clk_debug_lock);
+}
+
+struct dentry *clk_debugfs_add_file(struct clk_hw *hw, char *name, umode_t mode,
+				void *data, const struct file_operations *fops)
+{
+	struct dentry *d = NULL;
+
+	if (hw->core->dentry)
+		d = debugfs_create_file(name, mode, hw->core->dentry, data,
+					fops);
+
+	return d;
+}
+EXPORT_SYMBOL_GPL(clk_debugfs_add_file);
+
+/**
+ * clk_debug_init - lazily create the debugfs clk tree visualization
+ *
+ * clks are often initialized very early during boot before memory can
+ * be dynamically allocated and well before debugfs is setup.
+ * clk_debug_init walks the clk tree hierarchy while holding
+ * prepare_lock and creates the topology as part of a late_initcall,
+ * thus insuring that clks initialized very early will still be
+ * represented in the debugfs clk tree.  This function should only be
+ * called once at boot-time, and all other clks added dynamically will
+ * be done so with clk_debug_register.
+ */
+static int __init clk_debug_init(void)
+{
+	struct clk_core *core;
+	struct dentry *d;
+
+	rootdir = debugfs_create_dir("clk", NULL);
+
+	if (!rootdir)
+		return -ENOMEM;
+
+	d = debugfs_create_file("clk_summary", S_IRUGO, rootdir, &all_lists,
+				&clk_summary_fops);
+	if (!d)
+		return -ENOMEM;
+
+	d = debugfs_create_file("clk_dump", S_IRUGO, rootdir, &all_lists,
+				&clk_dump_fops);
+	if (!d)
+		return -ENOMEM;
+
+	d = debugfs_create_file("clk_orphan_summary", S_IRUGO, rootdir,
+				&orphan_list, &clk_summary_fops);
+	if (!d)
+		return -ENOMEM;
+
+	d = debugfs_create_file("clk_orphan_dump", S_IRUGO, rootdir,
+				&orphan_list, &clk_dump_fops);
+	if (!d)
+		return -ENOMEM;
+
+	mutex_lock(&clk_debug_lock);
+	hlist_for_each_entry(core, &clk_debug_list, debug_node)
+		clk_debug_create_one(core, rootdir);
+
+	inited = 1;
+	mutex_unlock(&clk_debug_lock);
+
+	return 0;
+}
+late_initcall(clk_debug_init);
+#else
+static inline int clk_debug_register(struct clk_core *core) { return 0; }
+static inline void clk_debug_reparent(struct clk_core *core,
+				      struct clk_core *new_parent)
+{
+}
+static inline void clk_debug_unregister(struct clk_core *core)
+{
+}
+#endif
+
 /**
  * __clk_init - initialize the data structures in a struct clk
  * @dev:	device initializing this clk, placeholder for now
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
