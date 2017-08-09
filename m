Return-Path: <zhangqing@rock-chips.com>
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	heiko@sntech.de
Cc: boris.brezillon@free-electrons.com,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xxx@rock-chips.com,
	xf@rock-chips.com,
	huangtao@rock-chips.com,
	david.wu@rock-chips.com,
	xjq@rock-chips.com,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1] clk: Keep clocks in their initial state until clk_disable_unused() is called
Date: Wed,  9 Aug 2017 15:37:29 +0800
Message-Id: <1502264249-30509-1-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

ome drivers are briefly preparing+enabling the clock in their
->probe() hook and disable+unprepare them before leaving the function.

This can be problem if a clock is shared between different devices, and
one of these devices is critical to the system. If this clock is
enabled/disabled by a non-critical device before the driver of the
critical one had a chance to enable+prepare it, there might be a short
period of time during which the critical device is not clocked.

To solve this problem, we save the initial clock state (at registration
time) and prevent the clock from being disabled until kernel init is done
(which is when clk_disable_unused() is called).

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 drivers/clk/clk.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fc58c52a26b4..3f61374a364b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -58,6 +58,8 @@ struct clk_core {
 	struct clk_core		*new_child;
 	unsigned long		flags;
 	bool			orphan;
+	bool			keep_enabled;
+	bool			keep_prepared;
 	unsigned int		enable_count;
 	unsigned int		prepare_count;
 	unsigned long		min_rate;
@@ -486,7 +488,7 @@ static void clk_core_unprepare(struct clk_core *core)
 
 	trace_clk_unprepare(core);
 
-	if (core->ops->unprepare)
+	if (core->ops->unprepare && !core->keep_prepared)
 		core->ops->unprepare(core->hw);
 
 	trace_clk_unprepare_complete(core);
@@ -602,7 +604,7 @@ static void clk_core_disable(struct clk_core *core)
 
 	trace_clk_disable_rcuidle(core);
 
-	if (core->ops->disable)
+	if (core->ops->disable && !core->keep_enabled)
 		core->ops->disable(core->hw);
 
 	trace_clk_disable_complete_rcuidle(core);
@@ -739,6 +741,12 @@ static void clk_unprepare_unused_subtree(struct clk_core *core)
 	hlist_for_each_entry(child, &core->children, child_node)
 		clk_unprepare_unused_subtree(child);
 
+	/*
+	 * Reset the ->keep_prepared flag so that subsequent calls to
+	 * clk_unprepare() on this clk actually unprepare it.
+	 */
+	core->keep_prepared = false;
+
 	if (core->prepare_count)
 		return;
 
@@ -770,6 +778,12 @@ static void clk_disable_unused_subtree(struct clk_core *core)
 
 	flags = clk_enable_lock();
 
+	/*
+	 * Reset the ->keep_enabled flag so that subsequent calls to
+	 * clk_disable() on this clk actually disable it.
+	 */
+	core->keep_enabled = false;
+
 	if (core->enable_count)
 		goto unlock_out;
 
@@ -2446,6 +2460,17 @@ static int __clk_core_init(struct clk_core *core)
 		core->accuracy = 0;
 
 	/*
+	 * We keep track of the initial clk status to keep clks in the state
+	 * they were left in by the bootloader until all drivers had a chance
+	 * to keep them prepared/enabled if they need to.
+	 */
+	if (core->ops->is_prepared && !clk_ignore_unused)
+		core->keep_prepared = core->ops->is_prepared(core->hw);
+
+	if (core->ops->is_enabled && !clk_ignore_unused)
+		core->keep_enabled = core->ops->is_enabled(core->hw);
+
+	/*
 	 * Set clk's phase.
 	 * Since a phase is by definition relative to its parent, just
 	 * query the current clock phase, or just assume it's in phase.
-- 
1.9.1
