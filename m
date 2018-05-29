Return-Path: <SRS0=7qdu=IQ=linuxfoundation.org=gregkh@kernel.org>
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/5] clk: no need to check return value of debugfs_create functions
Date: Tue, 29 May 2018 18:08:00 +0200
Message-Id: <20180529160804.1982-1-gregkh@linuxfoundation.org>
List-ID: <linux-clk.vger.kernel.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

This cleans up the init code a lot, and there's no need to return an
error value based on the debugfs calls, especially as it turns out no
one was even looking at that return value.  So it obviously wasn't that
important :)

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/clk/clk.c | 129 +++++++++++-----------------------------------
 1 file changed, 30 insertions(+), 99 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ea67ac81c6f9..ef701ce44439 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2608,81 +2608,31 @@ static int possible_parents_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(possible_parents);
 
-static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
+static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 {
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
-	d = debugfs_create_ulong("clk_rate", 0444, core->dentry, &core->rate);
-	if (!d)
-		goto err_out;
-
-	d = debugfs_create_ulong("clk_accuracy", 0444, core->dentry,
-				 &core->accuracy);
-	if (!d)
-		goto err_out;
+	struct dentry *root;
 
-	d = debugfs_create_u32("clk_phase", 0444, core->dentry, &core->phase);
-	if (!d)
-		goto err_out;
-
-	d = debugfs_create_file("clk_flags", 0444, core->dentry, core,
-				&clk_flags_fops);
-	if (!d)
-		goto err_out;
-
-	d = debugfs_create_u32("clk_prepare_count", 0444, core->dentry,
-			       &core->prepare_count);
-	if (!d)
-		goto err_out;
-
-	d = debugfs_create_u32("clk_enable_count", 0444, core->dentry,
-			       &core->enable_count);
-	if (!d)
-		goto err_out;
-
-	d = debugfs_create_u32("clk_protect_count", 0444, core->dentry,
-			       &core->protect_count);
-	if (!d)
-		goto err_out;
-
-	d = debugfs_create_u32("clk_notifier_count", 0444, core->dentry,
-			       &core->notifier_count);
-	if (!d)
-		goto err_out;
+	if (!core || !pdentry)
+		return;
 
-	if (core->num_parents > 1) {
-		d = debugfs_create_file("clk_possible_parents", 0444,
-				core->dentry, core, &possible_parents_fops);
-		if (!d)
-			goto err_out;
-	}
+	root = debugfs_create_dir(core->name, pdentry);
+	core->dentry = root;
 
-	if (core->ops->debug_init) {
-		ret = core->ops->debug_init(core->hw, core->dentry);
-		if (ret)
-			goto err_out;
-	}
+	debugfs_create_ulong("clk_rate", 0444, root, &core->rate);
+	debugfs_create_ulong("clk_accuracy", 0444, root, &core->accuracy);
+	debugfs_create_u32("clk_phase", 0444, root, &core->phase);
+	debugfs_create_file("clk_flags", 0444, root, core, &clk_flags_fops);
+	debugfs_create_u32("clk_prepare_count", 0444, root, &core->prepare_count);
+	debugfs_create_u32("clk_enable_count", 0444, root, &core->enable_count);
+	debugfs_create_u32("clk_protect_count", 0444, root, &core->protect_count);
+	debugfs_create_u32("clk_notifier_count", 0444, root, &core->notifier_count);
 
-	ret = 0;
-	goto out;
+	if (core->num_parents > 1)
+		debugfs_create_file("clk_possible_parents", 0444, root, core,
+				    &possible_parents_fops);
 
-err_out:
-	debugfs_remove_recursive(core->dentry);
-	core->dentry = NULL;
-out:
-	return ret;
+	if (core->ops->debug_init)
+		core->ops->debug_init(core->hw, core->dentry);
 }
 
 /**
@@ -2693,17 +2643,13 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
  * initialized.  Otherwise it bails out early since the debugfs clk directory
  * will be created lazily by clk_debug_init as part of a late_initcall.
  */
-static int clk_debug_register(struct clk_core *core)
+static void clk_debug_register(struct clk_core *core)
 {
-	int ret = 0;
-
 	mutex_lock(&clk_debug_lock);
 	hlist_add_head(&core->debug_node, &clk_debug_list);
 	if (inited)
-		ret = clk_debug_create_one(core, rootdir);
+		clk_debug_create_one(core, rootdir);
 	mutex_unlock(&clk_debug_lock);
-
-	return ret;
 }
 
  /**
@@ -2748,32 +2694,17 @@ EXPORT_SYMBOL_GPL(clk_debugfs_add_file);
 static int __init clk_debug_init(void)
 {
 	struct clk_core *core;
-	struct dentry *d;
 
 	rootdir = debugfs_create_dir("clk", NULL);
 
-	if (!rootdir)
-		return -ENOMEM;
-
-	d = debugfs_create_file("clk_summary", 0444, rootdir, &all_lists,
-				&clk_summary_fops);
-	if (!d)
-		return -ENOMEM;
-
-	d = debugfs_create_file("clk_dump", 0444, rootdir, &all_lists,
-				&clk_dump_fops);
-	if (!d)
-		return -ENOMEM;
-
-	d = debugfs_create_file("clk_orphan_summary", 0444, rootdir,
-				&orphan_list, &clk_summary_fops);
-	if (!d)
-		return -ENOMEM;
-
-	d = debugfs_create_file("clk_orphan_dump", 0444, rootdir,
-				&orphan_list, &clk_dump_fops);
-	if (!d)
-		return -ENOMEM;
+	debugfs_create_file("clk_summary", 0444, rootdir, &all_lists,
+			    &clk_summary_fops);
+	debugfs_create_file("clk_dump", 0444, rootdir, &all_lists,
+			    &clk_dump_fops);
+	debugfs_create_file("clk_orphan_summary", 0444, rootdir, &orphan_list,
+			    &clk_summary_fops);
+	debugfs_create_file("clk_orphan_dump", 0444, rootdir, &orphan_list,
+			    &clk_dump_fops);
 
 	mutex_lock(&clk_debug_lock);
 	hlist_for_each_entry(core, &clk_debug_list, debug_node)
@@ -2786,7 +2717,7 @@ static int __init clk_debug_init(void)
 }
 late_initcall(clk_debug_init);
 #else
-static inline int clk_debug_register(struct clk_core *core) { return 0; }
+static inline void clk_debug_register(struct clk_core *core) { }
 static inline void clk_debug_reparent(struct clk_core *core,
 				      struct clk_core *new_parent)
 {
-- 
2.17.0
