Return-Path: <andriy.shevchenko@linux.intel.com>
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] clk: Re-use DEFINE_SHOW_ATTRIBUTE() macro
Date: Wed, 14 Feb 2018 17:48:00 +0200
Message-Id: <20180214154800.55292-1-andriy.shevchenko@linux.intel.com>
List-ID: <linux-clk.vger.kernel.org>

...instead of open coding file operations followed by custom ->open()
callbacks per each attribute.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/clk.c | 60 +++++++------------------------------------------------
 1 file changed, 7 insertions(+), 53 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0f686a9dac3e..cc97b18ac31f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2486,19 +2486,7 @@ static int clk_summary_show(struct seq_file *s, void *data)
 
 	return 0;
 }
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
+DEFINE_SHOW_ATTRIBUTE(clk_summary);
 
 static void clk_dump_one(struct seq_file *s, struct clk_core *c, int level)
 {
@@ -2532,7 +2520,7 @@ static void clk_dump_subtree(struct seq_file *s, struct clk_core *c, int level)
 	seq_putc(s, '}');
 }
 
-static int clk_dump(struct seq_file *s, void *data)
+static int clk_dump_show(struct seq_file *s, void *data)
 {
 	struct clk_core *c;
 	bool first_node = true;
@@ -2555,19 +2543,7 @@ static int clk_dump(struct seq_file *s, void *data)
 	seq_puts(s, "}\n");
 	return 0;
 }
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
+DEFINE_SHOW_ATTRIBUTE(clk_dump);
 
 static const struct {
 	unsigned long flag;
@@ -2589,7 +2565,7 @@ static const struct {
 #undef ENTRY
 };
 
-static int clk_flags_dump(struct seq_file *s, void *data)
+static int clk_flags_show(struct seq_file *s, void *data)
 {
 	struct clk_core *core = s->private;
 	unsigned long flags = core->flags;
@@ -2608,20 +2584,9 @@ static int clk_flags_dump(struct seq_file *s, void *data)
 
 	return 0;
 }
+DEFINE_SHOW_ATTRIBUTE(clk_flags);
 
-static int clk_flags_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, clk_flags_dump, inode->i_private);
-}
-
-static const struct file_operations clk_flags_fops = {
-	.open		= clk_flags_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
-static int possible_parents_dump(struct seq_file *s, void *data)
+static int possible_parents_show(struct seq_file *s, void *data)
 {
 	struct clk_core *core = s->private;
 	int i;
@@ -2633,18 +2598,7 @@ static int possible_parents_dump(struct seq_file *s, void *data)
 
 	return 0;
 }
-
-static int possible_parents_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, possible_parents_dump, inode->i_private);
-}
-
-static const struct file_operations possible_parents_fops = {
-	.open		= possible_parents_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(possible_parents);
 
 static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 {
-- 
2.15.1
