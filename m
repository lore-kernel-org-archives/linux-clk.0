Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] clk: add clock panic dump in tree-view
Date: Thu, 10 May 2018 16:50:05 +0800
Message-Id: <1525942205-111855-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

Sometimes it's useful and for debugging to check the whole system clock
configuration in tree-view upon panic.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 Documentation/admin-guide/kernel-parameters.txt |  3 ++
 drivers/clk/clk.c                               | 67 +++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3487be7..7bbdb6f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -519,6 +519,9 @@
 			debug and development, but should not be needed on a
 			platform with proper driver support.  For more
 			information, see Documentation/clk.txt.
+	clk_panic_dump
+			[CLK]
+			Dump the whole clock tree-view upon panic.
 
 	clock=		[BUGS=X86-32, HW] gettimeofday clocksource override.
 			[Deprecated]
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9ae92aa..adb5537 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2802,6 +2802,73 @@ static inline void clk_debug_unregister(struct clk_core *core)
 }
 #endif
 
+static bool clk_pdump_enable;
+static int __init clk_pdump_setup(char *__unused)
+{
+	clk_pdump_enable  = true;
+	return 1;
+}
+__setup("clk_panic_dump", clk_pdump_setup);
+
+static void clk_pdump_show_one(struct clk_core *c, int level)
+{
+	if (!c)
+		return;
+
+	pr_err("%*s%-*s %11d %12d %11lu %10lu %-3d\n",
+		level * 3 + 1, "", 30 - level * 3, c->name,
+		c->enable_count, c->prepare_count, clk_core_get_rate(c),
+		clk_core_get_accuracy(c), clk_core_get_phase(c));
+}
+
+static void clk_pdump_show_subtree(struct clk_core *c, int level)
+{
+	struct clk_core *child;
+
+	if (!c)
+		return;
+
+	clk_pdump_show_one(c, level);
+
+	hlist_for_each_entry(child, &c->children, child_node)
+		clk_pdump_show_subtree(child, level + 1);
+}
+
+static int clk_panic_dump(struct notifier_block *this, unsigned long ev,
+			  void *ptr)
+{
+	struct clk_core *c;
+
+	if (!clk_pdump_enable)
+		return 0;
+
+	pr_err("clock panic dump:\n");
+	pr_err("   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase\n");
+	pr_err("----------------------------------------------------------------------------------------\n");
+
+	clk_prepare_lock();
+
+	hlist_for_each_entry(c, &clk_root_list, child_node)
+		clk_pdump_show_subtree(c, 0);
+	hlist_for_each_entry(c, &clk_orphan_list, child_node)
+		clk_pdump_show_subtree(c, 0);
+
+	clk_prepare_unlock();
+
+	return 0;
+}
+
+static struct notifier_block clk_pdump_block = {
+	.notifier_call = clk_panic_dump,
+};
+
+static int clk_register_pdump(void)
+{
+	atomic_notifier_chain_register(&panic_notifier_list, &clk_pdump_block);
+	return 0;
+}
+late_initcall_sync(clk_register_pdump);
+
 /**
  * __clk_core_init - initialize the data structures in a struct clk_core
  * @core:	clk_core being initialized
-- 
1.9.1
