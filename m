Return-Path: <pdeschrijver@nvidia.com>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: add clk_possible_parents debugfs file
Date: Tue, 21 Mar 2017 15:20:31 +0200
Message-ID: <1490102432-21314-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

For validation purposes, it's often useful to be able to retrieve the list
of possible parents in userspace. Add a debugfs file for every clock which
has more than 1 possible parent.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Reviewed-by: Jon Mayo <jmayo@nvidia.com>
---
 drivers/clk/clk.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f5f2bcd..2fa2fb8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2128,6 +2128,34 @@ static int clk_dump_open(struct inode *inode, struct file *file)
 	.release	= single_release,
 };
 
+static int possible_parents_dump(struct seq_file *s, void *data)
+{
+	struct clk_core *core;
+	int i;
+
+	core = (struct clk_core *)s->private;
+
+	for (i = 0; i < core->num_parents - 1; i++)
+		seq_printf(s, "%s ", core->parent_names[i]);
+
+	seq_printf(s, "%s\n", core->parent_names[i]);
+
+	return 0;
+}
+
+static int possible_parents_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, possible_parents_dump, inode->i_private);
+}
+
+
+static const struct file_operations possible_parents_fops = {
+	.open		= possible_parents_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 {
 	struct dentry *d;
@@ -2179,6 +2207,13 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 	if (!d)
 		goto err_out;
 
+	if (core->num_parents > 1) {
+		d = debugfs_create_file("clk_possible_parents", S_IRUGO,
+				core->dentry, core, &possible_parents_fops);
+		if (!d)
+			goto err_out;
+	}
+
 	if (core->ops->debug_init) {
 		ret = core->ops->debug_init(core->hw, core->dentry);
 		if (ret)
-- 
1.9.1
