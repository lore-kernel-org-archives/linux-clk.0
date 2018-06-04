Return-Path: <raman.k2@samsung.com>
From: Raman Banka <raman.k2@samsung.com>
To: linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	linux-kernel@vger.kernel.org
Cc: alim.akhtar@samsung.com, shaik.ameer@samsung.com,
	m.szyprowski@samsung.com, krzk@kernel.org, s.nawrocki@samsung.com
Subject: [RFC PATCH] Add more debugfs features in CCF.
Date: Mon, 04 Jun 2018 15:10:45 +0530
Message-id: <1528105245-26623-1-git-send-email-raman.k2@samsung.com>
References: <CGME20180604095335epcas2p4131d5a7ea0c6091c3e2f17bd98847efa@epcas2p4.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Currently there is a directory hierarchy in debugfs for visualizing the
clk tree structure. Each clock has a directory in debugfs which contains
read-only members that export information specific to that clk node:
clk_rate,clk_flags, clk_prepare_count, clk_enable_count &
clk_notifier_count.

Change the member clk_rate from read-only to read-write,
writing some other rate to clk_rate calls clk_core_set_rate()
of the corresponding clock.

Change the member clk_prepare_count from read_only to read_write,
writing to which calls clk_core_prepare() or clk_core_unprepare()
of the corresponding clock depending on the value written.

Change the member clk_enable_count from read_only to read_write,
writing to which calls clk_core_enable() or clk_core_disable()
of the corresponding clock depending on the value written.

Add a new read-write member named clk_parent reading which exports
the name of the parent clock and writing a different name for parent
clock searches for that clock and calls clk_core_set_parent_nolock().

Signed-off-by: Raman Banka <raman.k2@samsung.com>
---
 drivers/clk/clk.c | 169 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 164 insertions(+), 5 deletions(-)

I was working on some internal project where there was a requirement to provide
debugfs entries for controlling clock operations. So I thought allowing to
change rate, parent, enable_count and prepare_count of clocks through debugfs
may be a desirable feature. I felt debugging is much easier with these features
as one need not boot the kernel every time he/she wants to test a clock,
especially helpful in case of booting linux on an emulator where it takes
hours to finish booting. Being new to linux, I'm not sure whether it is desirable
or not. Hence I request for comments.

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9ae92aa..c15a41e7 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2436,6 +2436,7 @@ bool clk_is_match(const struct clk *p, const struct clk *q)
 
 #ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
+#include <linux/uaccess.h>
 
 static struct dentry *rootdir;
 static int inited = 0;
@@ -2614,6 +2615,158 @@ static int possible_parents_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(possible_parents);
 
+static int debugfs_clk_rate_set(void *core, u64 val)
+{
+	clk_prepare_lock();
+	clk_core_set_rate_nolock((struct clk_core *)core, val);
+	clk_prepare_unlock();
+	return 0;
+}
+
+static int debugfs_clk_rate_get(void *core, u64 *val)
+{
+	*val = clk_core_get_rate((struct clk_core *)core);
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_clk_rate, debugfs_clk_rate_get,
+			 debugfs_clk_rate_set, "%llu\n");
+
+static int debugfs_clk_enable_count_set(void *core, u64 val)
+{
+	struct clk_core *this_core = (struct clk_core *)core;
+
+	if (this_core->enable_count + 1 == val) {
+		if (this_core->prepare_count == 0) {
+			pr_err("Clock not yet prepared for enabling\n");
+			return 0;
+		}
+		return clk_core_enable_lock(this_core);
+	} else if (this_core->enable_count-1 == val) {
+		clk_core_disable_lock(this_core);
+		return 0;
+	} else if (this_core->enable_count == val)
+		return 0;
+	else
+		return -EINVAL;
+}
+
+static int debugfs_clk_enable_count_get(void *core, u64 *val)
+{
+	*val = ((struct clk_core *)core)->enable_count;
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_clk_enable_count, debugfs_clk_enable_count_get,
+			 debugfs_clk_enable_count_set, "%llu\n");
+
+
+static int debugfs_clk_prepare_count_set(void *core, u64 val)
+{
+	struct clk_core *this_core = (struct clk_core *)core;
+
+	if (this_core->prepare_count + 1 == val)
+		return clk_core_prepare_lock(this_core);
+	else if (this_core->prepare_count - 1 == val) {
+		if ((val == 0) && (this_core->enable_count > 0)) {
+			pr_err("Can't unprepare, this clock is enabled\n");
+			return 0;
+		}
+		clk_core_unprepare_lock(this_core);
+		return 0;
+	} else if (this_core->prepare_count == val)
+		return 0;
+	else
+		return -EINVAL;
+}
+
+static int debugfs_clk_prepare_count_get(void *core, u64 *val)
+{
+	*val = ((struct clk_core *)core)->prepare_count;
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_clk_prepare_count, debugfs_clk_prepare_count_get,
+			 debugfs_clk_prepare_count_set, "%llu\n");
+
+
+static int clk_parent_open(struct inode *inode, struct file *filp)
+{
+	filp->private_data = inode->i_private;
+	return 0;
+}
+
+static ssize_t clk_parent_write(struct file *filp, const char __user *userbuf,
+				size_t count, loff_t *ppos)
+{
+	struct clk_core *core, *parent;
+	char *parent_name;
+	int ret;
+
+	core = (struct clk_core *)filp->private_data;
+
+	parent_name = kzalloc(128, GFP_KERNEL);
+	if (!parent_name)
+		return -ENOMEM;
+
+	if (copy_from_user(parent_name + *ppos, userbuf, count))
+		return -EFAULT;
+
+	if (count > 0 && parent_name[count-1] == '\n')
+		parent_name[count-1] = '\0';
+
+	*ppos += count;
+
+	parent = clk_core_lookup(parent_name);
+	kfree(parent_name);
+
+	ret = clk_core_set_parent_nolock(core, parent);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t clk_parent_read(struct file *filp, char __user *userbuf,
+			       size_t count, loff_t *ppos)
+{
+	struct clk_core *core;
+	char *parent_name;
+
+	core = (struct clk_core *)filp->private_data;
+
+	parent_name = kzalloc(128, GFP_KERNEL);
+	if (!parent_name)
+		return -ENOMEM;
+
+	clk_prepare_lock();
+	if (core->parent) {
+		sprintf(parent_name, "%s\n", core->parent->name);
+		count = strlen(parent_name) - *ppos;
+	} else {
+		sprintf(parent_name, "NULL\n");
+		count = strlen(parent_name) - *ppos;
+	}
+	clk_prepare_unlock();
+
+	if (copy_to_user(userbuf, parent_name, count)) {
+		kfree(parent_name);
+		return -EFAULT;
+	}
+
+	*ppos += count;
+
+	kfree(parent_name);
+	return count;
+}
+
+static const struct file_operations fops_clk_parent = {
+	.write	= clk_parent_write,
+	.open	= clk_parent_open,
+	.read	= clk_parent_read,
+};
+
 static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 {
 	struct dentry *d;
@@ -2630,7 +2783,8 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 
 	core->dentry = d;
 
-	d = debugfs_create_ulong("clk_rate", 0444, core->dentry, &core->rate);
+	d = debugfs_create_file("clk_rate", 0664, core->dentry,
+				 core, &fops_clk_rate);
 	if (!d)
 		goto err_out;
 
@@ -2648,13 +2802,13 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_prepare_count", 0444, core->dentry,
-			       &core->prepare_count);
+	d = debugfs_create_file("clk_prepare_count", 0664, core->dentry,
+				core, &fops_clk_prepare_count);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_enable_count", 0444, core->dentry,
-			       &core->enable_count);
+	d = debugfs_create_file("clk_enable_count", 0664, core->dentry,
+				core, &fops_clk_enable_count);
 	if (!d)
 		goto err_out;
 
@@ -2675,6 +2829,11 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 			goto err_out;
 	}
 
+	d = debugfs_create_file("clk_parent", 0664, core->dentry,
+				core, &fops_clk_parent);
+	if (!d)
+		goto err_out;
+
 	if (core->ops->debug_init) {
 		ret = core->ops->debug_init(core->hw, core->dentry);
 		if (ret)
-- 
1.9.1
