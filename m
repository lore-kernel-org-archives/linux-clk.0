Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/4] clk: Use octal instead of symbolic permissions
Date: Wed,  3 Jan 2018 12:06:15 +0100
Message-Id: <1514977577-11854-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
References: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Octal permissions are preferred, as they are easier to read than
symbolic permissions.  Hence replace "S_IRUGO" by "0444".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/clk/clk.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8c4769c50a71be93..240b1d427fadab66 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2600,48 +2600,48 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 
 	core->dentry = d;
 
-	d = debugfs_create_u32("clk_rate", S_IRUGO, core->dentry,
+	d = debugfs_create_u32("clk_rate", 0444, core->dentry,
 			(u32 *)&core->rate);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_accuracy", S_IRUGO, core->dentry,
+	d = debugfs_create_u32("clk_accuracy", 0444, core->dentry,
 			(u32 *)&core->accuracy);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_phase", S_IRUGO, core->dentry,
+	d = debugfs_create_u32("clk_phase", 0444, core->dentry,
 			(u32 *)&core->phase);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_x32("clk_flags", S_IRUGO, core->dentry,
+	d = debugfs_create_x32("clk_flags", 0444, core->dentry,
 			(u32 *)&core->flags);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_prepare_count", S_IRUGO, core->dentry,
+	d = debugfs_create_u32("clk_prepare_count", 0444, core->dentry,
 			(u32 *)&core->prepare_count);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_enable_count", S_IRUGO, core->dentry,
+	d = debugfs_create_u32("clk_enable_count", 0444, core->dentry,
 			(u32 *)&core->enable_count);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_protect_count", S_IRUGO, core->dentry,
+	d = debugfs_create_u32("clk_protect_count", 0444, core->dentry,
 			(u32 *)&core->protect_count);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_notifier_count", S_IRUGO, core->dentry,
+	d = debugfs_create_u32("clk_notifier_count", 0444, core->dentry,
 			(u32 *)&core->notifier_count);
 	if (!d)
 		goto err_out;
 
 	if (core->num_parents > 1) {
-		d = debugfs_create_file("clk_possible_parents", S_IRUGO,
+		d = debugfs_create_file("clk_possible_parents", 0444,
 				core->dentry, core, &possible_parents_fops);
 		if (!d)
 			goto err_out;
@@ -2737,22 +2737,22 @@ static int __init clk_debug_init(void)
 	if (!rootdir)
 		return -ENOMEM;
 
-	d = debugfs_create_file("clk_summary", S_IRUGO, rootdir, &all_lists,
+	d = debugfs_create_file("clk_summary", 0444, rootdir, &all_lists,
 				&clk_summary_fops);
 	if (!d)
 		return -ENOMEM;
 
-	d = debugfs_create_file("clk_dump", S_IRUGO, rootdir, &all_lists,
+	d = debugfs_create_file("clk_dump", 0444, rootdir, &all_lists,
 				&clk_dump_fops);
 	if (!d)
 		return -ENOMEM;
 
-	d = debugfs_create_file("clk_orphan_summary", S_IRUGO, rootdir,
+	d = debugfs_create_file("clk_orphan_summary", 0444, rootdir,
 				&orphan_list, &clk_summary_fops);
 	if (!d)
 		return -ENOMEM;
 
-	d = debugfs_create_file("clk_orphan_dump", S_IRUGO, rootdir,
+	d = debugfs_create_file("clk_orphan_dump", 0444, rootdir,
 				&orphan_list, &clk_dump_fops);
 	if (!d)
 		return -ENOMEM;
-- 
2.7.4
