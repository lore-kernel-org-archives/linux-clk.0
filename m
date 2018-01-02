Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: Fix debugfs_create_*() usage
Date: Tue,  2 Jan 2018 16:27:33 +0100
Message-Id: <1514906853-9364-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

When exposing data access through debugfs, the correct
debugfs_create_*() functions must be used, depending on data type.

Remove all casts from data pointers passed to debugfs_create_*()
functions, as such casts prevent the compiler from flagging bugs.

clk_core.rate, .accuracy, and .flags are "unsigned long", hence casting
to "u32 *" exposed the wrong halves on big-endian 64-bit systems.

Fix .rate and .accuracy, by using debugfs_create_ulong() instead.

Fix .flags by changing the field to "unsigned int", as a change to
debugfs_create_x64() on 64-bit systems would change the user-visible
formatting in debugfs.
Note that __clk_get_flags() and clk_hw_get_flags() are left unchanged
and still return "unsigned long", to avoid having to change all their
users.  Likewise, of_clk_detect_critical() still takes "unsigned long",
but the comment is updated as it is never passed a real pointer to
clk_core.flags.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Looks like none of the 64-bit architectures support common clock yet?
---
 drivers/clk/clk.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5ec580914089510a..b23e0249f0e3c634 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -58,7 +58,7 @@ struct clk_core {
 	unsigned long		new_rate;
 	struct clk_core		*new_parent;
 	struct clk_core		*new_child;
-	unsigned long		flags;
+	unsigned int		flags;
 	bool			orphan;
 	unsigned int		enable_count;
 	unsigned int		prepare_count;
@@ -2600,43 +2600,43 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 
 	core->dentry = d;
 
-	d = debugfs_create_u32("clk_rate", S_IRUGO, core->dentry,
-			(u32 *)&core->rate);
+	d = debugfs_create_ulong("clk_rate", S_IRUGO, core->dentry,
+				 &core->rate);
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_u32("clk_accuracy", S_IRUGO, core->dentry,
-			(u32 *)&core->accuracy);
+	d = debugfs_create_ulong("clk_accuracy", S_IRUGO, core->dentry,
+				 &core->accuracy);
 	if (!d)
 		goto err_out;
 
 	d = debugfs_create_u32("clk_phase", S_IRUGO, core->dentry,
-			(u32 *)&core->phase);
+			       &core->phase);
 	if (!d)
 		goto err_out;
 
 	d = debugfs_create_x32("clk_flags", S_IRUGO, core->dentry,
-			(u32 *)&core->flags);
+			       &core->flags);
 	if (!d)
 		goto err_out;
 
 	d = debugfs_create_u32("clk_prepare_count", S_IRUGO, core->dentry,
-			(u32 *)&core->prepare_count);
+			       &core->prepare_count);
 	if (!d)
 		goto err_out;
 
 	d = debugfs_create_u32("clk_enable_count", S_IRUGO, core->dentry,
-			(u32 *)&core->enable_count);
+			       &core->enable_count);
 	if (!d)
 		goto err_out;
 
 	d = debugfs_create_u32("clk_protect_count", S_IRUGO, core->dentry,
-			(u32 *)&core->protect_count);
+			       &core->protect_count);
 	if (!d)
 		goto err_out;
 
 	d = debugfs_create_u32("clk_notifier_count", S_IRUGO, core->dentry,
-			(u32 *)&core->notifier_count);
+			       &core->notifier_count);
 	if (!d)
 		goto err_out;
 
@@ -3927,7 +3927,7 @@ static int parent_ready(struct device_node *np)
  * of_clk_detect_critical() - set CLK_IS_CRITICAL flag from Device Tree
  * @np: Device node pointer associated with clock provider
  * @index: clock index
- * @flags: pointer to clk_core->flags
+ * @flags: pointer to core clock flags
  *
  * Detects if the clock-critical property exists and, if so, sets the
  * corresponding CLK_IS_CRITICAL flag.
-- 
2.7.4
