Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v5 06/10] clk: add clock protection mechanism to clk core
Date: Fri,  1 Dec 2017 22:51:56 +0100
Message-Id: <20171201215200.23523-7-jbrunet@baylibre.com>
In-Reply-To: <20171201215200.23523-1-jbrunet@baylibre.com>
References: <20171201215200.23523-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The patch adds clk_core_protect and clk_core_unprotect to the internal
CCF API. These functions allow to set a new constraint along the clock
tree to prevent any change, even indirect, which may result in rate
change or glitch.

Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c            | 119 ++++++++++++++++++++++++++++++++++++++++---
 include/linux/clk-provider.h |   1 +
 2 files changed, 113 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index bbe90babdae4..f69a2176cde1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -62,6 +62,7 @@ struct clk_core {
 	bool			orphan;
 	unsigned int		enable_count;
 	unsigned int		prepare_count;
+	unsigned int		protect_count;
 	unsigned long		min_rate;
 	unsigned long		max_rate;
 	unsigned long		accuracy;
@@ -170,6 +171,11 @@ static void clk_enable_unlock(unsigned long flags)
 	spin_unlock_irqrestore(&enable_lock, flags);
 }
 
+static bool clk_core_rate_is_protected(struct clk_core *core)
+{
+	return core->protect_count;
+}
+
 static bool clk_core_is_prepared(struct clk_core *core)
 {
 	bool ret = false;
@@ -381,6 +387,11 @@ bool clk_hw_is_prepared(const struct clk_hw *hw)
 	return clk_core_is_prepared(hw->core);
 }
 
+bool clk_hw_rate_is_protected(const struct clk_hw *hw)
+{
+	return clk_core_rate_is_protected(hw->core);
+}
+
 bool clk_hw_is_enabled(const struct clk_hw *hw)
 {
 	return clk_core_is_enabled(hw->core);
@@ -519,6 +530,68 @@ EXPORT_SYMBOL_GPL(__clk_mux_determine_rate_closest);
 
 /***        clk api        ***/
 
+static void clk_core_rate_unprotect(struct clk_core *core)
+{
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return;
+
+	if (WARN_ON(core->protect_count == 0))
+		return;
+
+	if (--core->protect_count > 0)
+		return;
+
+	clk_core_rate_unprotect(core->parent);
+}
+
+static int clk_core_rate_nuke_protect(struct clk_core *core)
+{
+	int ret;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return -EINVAL;
+
+	if (core->protect_count == 0)
+		return 0;
+
+	ret = core->protect_count;
+	core->protect_count = 1;
+	clk_core_rate_unprotect(core);
+
+	return ret;
+}
+
+static void clk_core_rate_protect(struct clk_core *core)
+{
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return;
+
+	if (core->protect_count == 0)
+		clk_core_rate_protect(core->parent);
+
+	core->protect_count++;
+}
+
+static void clk_core_rate_restore_protect(struct clk_core *core, int count)
+{
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return;
+
+	if (count == 0)
+		return;
+
+	clk_core_rate_protect(core);
+	core->protect_count = count;
+}
+
 static void clk_core_unprepare(struct clk_core *core)
 {
 	lockdep_assert_held(&prepare_lock);
@@ -915,7 +988,9 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 	if (!core)
 		return 0;
 
-	if (core->ops->determine_rate) {
+	if (clk_core_rate_is_protected(core)) {
+		req->rate = core->rate;
+	} else if (core->ops->determine_rate) {
 		return core->ops->determine_rate(core->hw, req);
 	} else if (core->ops->round_rate) {
 		rate = core->ops->round_rate(core->hw, req->rate,
@@ -1661,7 +1736,7 @@ static void clk_change_rate(struct clk_core *core)
 static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 						     unsigned long req_rate)
 {
-	int ret;
+	int ret, cnt;
 	struct clk_rate_request req;
 
 	lockdep_assert_held(&prepare_lock);
@@ -1669,11 +1744,19 @@ static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 	if (!core)
 		return 0;
 
+	/* simulate what the rate would be if it could be freely set */
+	cnt = clk_core_rate_nuke_protect(core);
+	if (cnt < 0)
+		return cnt;
+
 	clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
 	req.rate = req_rate;
 
 	ret = clk_core_round_rate_nolock(core, &req);
 
+	/* restore the protection */
+	clk_core_rate_restore_protect(core, cnt);
+
 	return ret ? 0 : req.rate;
 }
 
@@ -1693,6 +1776,10 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	if (rate == clk_core_get_rate_nolock(core))
 		return 0;
 
+	/* fail on a direct rate set of a protected provider */
+	if (clk_core_rate_is_protected(core))
+		return -EBUSY;
+
 	if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
 		return -EBUSY;
 
@@ -1937,6 +2024,9 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
 		return -EBUSY;
 
+	if (clk_core_rate_is_protected(core))
+		return -EBUSY;
+
 	/* try finding the new parent index */
 	if (parent) {
 		p_index = clk_fetch_parent_index(core, parent);
@@ -2018,6 +2108,9 @@ static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
 	if (!core)
 		return 0;
 
+	if (clk_core_rate_is_protected(core))
+		return -EBUSY;
+
 	trace_clk_set_phase(core, degrees);
 
 	if (core->ops->set_phase)
@@ -2148,11 +2241,12 @@ static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
 	if (!c)
 		return;
 
-	seq_printf(s, "%*s%-*s %11d %12d %11lu %10lu %-3d\n",
+	seq_printf(s, "%*s%-*s %11d %12d %12d %11lu %10lu %-3d\n",
 		   level * 3 + 1, "",
 		   30 - level * 3, c->name,
-		   c->enable_count, c->prepare_count, clk_core_get_rate(c),
-		   clk_core_get_accuracy(c), clk_core_get_phase(c));
+		   c->enable_count, c->prepare_count, c->protect_count,
+		   clk_core_get_rate(c), clk_core_get_accuracy(c),
+		   clk_core_get_phase(c));
 }
 
 static void clk_summary_show_subtree(struct seq_file *s, struct clk_core *c,
@@ -2174,8 +2268,8 @@ static int clk_summary_show(struct seq_file *s, void *data)
 	struct clk_core *c;
 	struct hlist_head **lists = (struct hlist_head **)s->private;
 
-	seq_puts(s, "   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase\n");
-	seq_puts(s, "----------------------------------------------------------------------------------------\n");
+	seq_puts(s, "   clock                         enable_cnt  prepare_cnt  protect_cnt        rate   accuracy   phase\n");
+	seq_puts(s, "----------------------------------------------------------------------------------------------------\n");
 
 	clk_prepare_lock();
 
@@ -2210,6 +2304,7 @@ static void clk_dump_one(struct seq_file *s, struct clk_core *c, int level)
 	seq_printf(s, "\"%s\": { ", c->name);
 	seq_printf(s, "\"enable_count\": %d,", c->enable_count);
 	seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
+	seq_printf(s, "\"protect_count\": %d,", c->protect_count);
 	seq_printf(s, "\"rate\": %lu,", clk_core_get_rate(c));
 	seq_printf(s, "\"accuracy\": %lu,", clk_core_get_accuracy(c));
 	seq_printf(s, "\"phase\": %d", clk_core_get_phase(c));
@@ -2340,6 +2435,11 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 	if (!d)
 		goto err_out;
 
+	d = debugfs_create_u32("clk_protect_count", S_IRUGO, core->dentry,
+			(u32 *)&core->protect_count);
+	if (!d)
+		goto err_out;
+
 	d = debugfs_create_u32("clk_notifier_count", S_IRUGO, core->dentry,
 			(u32 *)&core->notifier_count);
 	if (!d)
@@ -2911,6 +3011,11 @@ void clk_unregister(struct clk *clk)
 	if (clk->core->prepare_count)
 		pr_warn("%s: unregistering prepared clock: %s\n",
 					__func__, clk->core->name);
+
+	if (clk->core->protect_count)
+		pr_warn("%s: unregistering protected clock: %s\n",
+					__func__, clk->core->name);
+
 	kref_put(&clk->core->ref, __clk_release);
 unlock:
 	clk_prepare_unlock();
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 7c925e6211f1..73ac87f34df9 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -744,6 +744,7 @@ unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
 unsigned long clk_hw_get_flags(const struct clk_hw *hw);
 bool clk_hw_is_prepared(const struct clk_hw *hw);
+bool clk_hw_rate_is_protected(const struct clk_hw *hw);
 bool clk_hw_is_enabled(const struct clk_hw *hw);
 bool __clk_is_enabled(struct clk *clk);
 struct clk *__clk_lookup(const char *name);
-- 
2.14.3
