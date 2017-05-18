Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH 04/10] clk: add support for clock protection
Date: Thu, 18 May 2017 18:37:58 +0200
Message-Id: <20170518163804.14123-5-jbrunet@baylibre.com>
In-Reply-To: <20170518163804.14123-1-jbrunet@baylibre.com>
References: <20170518163804.14123-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The patch adds clk_protect and clk_unprotect to the CCF API. These
functions allow a consumer to inform the system that the rate of clock is
critical to for its operations and it can't tolerate other consumers
changing the rate or introducing glitches while the clock is protected.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c            | 198 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/clk-provider.h |   1 +
 include/linux/clk.h          |  29 +++++++
 3 files changed, 221 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 100f72472e10..9c15319bc454 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -60,6 +60,7 @@ struct clk_core {
 	bool			orphan;
 	unsigned int		enable_count;
 	unsigned int		prepare_count;
+	unsigned int		protect_count;
 	unsigned long		min_rate;
 	unsigned long		max_rate;
 	unsigned long		accuracy;
@@ -84,6 +85,7 @@ struct clk {
 	const char *con_id;
 	unsigned long min_rate;
 	unsigned long max_rate;
+	unsigned long protect_count;
 	struct hlist_node clks_node;
 };
 
@@ -160,6 +162,11 @@ static bool clk_core_is_prepared(struct clk_core *core)
 	return core->ops->is_prepared(core->hw);
 }
 
+static bool clk_core_rate_is_protected(struct clk_core *core)
+{
+	return core->protect_count;
+}
+
 static bool clk_core_is_enabled(struct clk_core *core)
 {
 	/*
@@ -328,6 +335,11 @@ bool clk_hw_is_prepared(const struct clk_hw *hw)
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
@@ -584,6 +596,102 @@ int clk_prepare(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_prepare);
 
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
+/**
+ * clk_rate_unprotect - unprotect the rate of a clock source
+ * @clk: the clk being unprotected
+ *
+ * clk_unprotect completes a critical section during which the clock
+ * consumer cannot tolerate any change to the clock rate. If no other clock
+ * consumers have protected clocks in the parent chain, then calls to this
+ * function will allow the clocks in the parent chain to change rates
+ * freely.
+ *
+ * Unlike the clk_set_rate_range method, which allows the rate to change
+ * within a given range, protected clocks cannot have their rate changed,
+ * either directly or indirectly due to changes further up the parent chain
+ * of clocks.
+ *
+ * Calls to clk_unprotect must be balanced with calls to clk_protect. Calls
+ * to this function may sleep, and do not return error status.
+ */
+void clk_rate_unprotect(struct clk *clk)
+{
+	if (!clk)
+		return;
+
+	clk_prepare_lock();
+
+	/*
+	 * if there is something wrong with this consumer protect count, stop
+	 * here before messing with the provider
+	 */
+	if (WARN_ON(clk->protect_count <= 0))
+		goto out;
+
+	clk_core_rate_unprotect(clk->core);
+	clk->protect_count--;
+out:
+	clk_prepare_unlock();
+}
+EXPORT_SYMBOL_GPL(clk_rate_unprotect);
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
+/**
+ * clk_rate_protect - protect a clock source
+ * @clk: the clk being protected
+ *
+ * clk_protect begins a critical section during which the clock consumer
+ * cannot tolerate any change to the clock rate. This results in all clocks
+ * up the parent chain to also be rate-protected.
+ *
+ * Unlike the clk_set_rate_range method, which allows the rate to change
+ * within a given range, protected clocks cannot have their rate changed,
+ * either directly or indirectly due to changes further up the parent chain
+ * of clocks.
+ *
+ * Calls to clk_protect should be balanced with calls to clk_unprotect.
+ * Calls to this function may sleep, and do not return error status.
+ */
+void clk_rate_protect(struct clk *clk)
+{
+	if (!clk)
+		return;
+
+	clk_prepare_lock();
+	clk_core_rate_protect(clk->core);
+	clk->protect_count++;
+	clk_prepare_unlock();
+}
+EXPORT_SYMBOL_GPL(clk_rate_protect);
+
 static void clk_core_disable(struct clk_core *core)
 {
 	lockdep_assert_held(&enable_lock);
@@ -838,7 +946,15 @@ static int clk_core_determine_round(struct clk_core *core,
 {
 	long rate;
 
-	if (core->ops->determine_rate) {
+	/*
+	 * At this point, core protection will be disabled if
+	 * - if the provider is not protected at all
+	 * - if the calling consumer is the only one protecting the
+	 *   provider (and only once)
+	 */
+	if (clk_core_rate_is_protected(core)) {
+		req->rate = core->rate;
+	} else if (core->ops->determine_rate) {
 		return core->ops->determine_rate(core->hw, req);
 	} else if (core->ops->round_rate) {
 		rate = core->ops->round_rate(core->hw, req->rate,
@@ -944,10 +1060,17 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 
 	clk_prepare_lock();
 
+	if (clk->protect_count)
+		clk_core_rate_unprotect(clk->core);
+
 	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
 	req.rate = rate;
 
 	ret = clk_core_round_rate_nolock(clk->core, &req);
+
+	if (clk->protect_count)
+		clk_core_rate_protect(clk->core);
+
 	clk_prepare_unlock();
 
 	if (ret)
@@ -1583,6 +1706,10 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	if (rate == clk_core_get_rate_nolock(core))
 		return 0;
 
+	/* fail on a direct rate set of a protected provider */
+	if (clk_core_rate_is_protected(core))
+		return -EBUSY;
+
 	if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
 		return -EBUSY;
 
@@ -1639,8 +1766,14 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
 	/* prevent racing with updates to the clock topology */
 	clk_prepare_lock();
 
+	if (clk->protect_count)
+		clk_core_rate_unprotect(clk->core);
+
 	ret = clk_core_set_rate_nolock(clk->core, rate);
 
+	if (clk->protect_count)
+		clk_core_rate_protect(clk->core);
+
 	clk_prepare_unlock();
 
 	return ret;
@@ -1671,12 +1804,18 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 
 	clk_prepare_lock();
 
+	if (clk->protect_count)
+		clk_core_rate_unprotect(clk->core);
+
 	if (min != clk->min_rate || max != clk->max_rate) {
 		clk->min_rate = min;
 		clk->max_rate = max;
 		ret = clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
 	}
 
+	if (clk->protect_count)
+		clk_core_rate_protect(clk->core);
+
 	clk_prepare_unlock();
 
 	return ret;
@@ -1818,6 +1957,9 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
 		return -EBUSY;
 
+	if (clk_core_rate_is_protected(core))
+		return -EBUSY;
+
 	/* try finding the new parent index */
 	if (parent) {
 		p_index = clk_fetch_parent_index(core, parent);
@@ -1875,8 +2017,16 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 		return 0;
 
 	clk_prepare_lock();
+
+	if (clk->protect_count)
+		clk_core_rate_unprotect(clk->core);
+
 	ret = clk_core_set_parent_nolock(clk->core,
 					 parent ? parent->core : NULL);
+
+	if (clk->protect_count)
+		clk_core_rate_protect(clk->core);
+
 	clk_prepare_unlock();
 
 	return ret;
@@ -1890,7 +2040,10 @@ static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
 	if (!core)
 		return 0;
 
-	trace_clk_set_phase(clk->core, degrees);
+	if (clk_core_rate_is_protected(core))
+		return -EBUSY;
+
+	trace_clk_set_phase(core, degrees);
 
 	if (core->ops->set_phase)
 		ret = core->ops->set_phase(core->hw, degrees);
@@ -1933,7 +2086,15 @@ int clk_set_phase(struct clk *clk, int degrees)
 		degrees += 360;
 
 	clk_prepare_lock();
+
+	if (clk->protect_count)
+		clk_core_rate_unprotect(clk->core);
+
 	ret = clk_core_set_phase_nolock(clk->core, degrees);
+
+	if (clk->protect_count)
+		clk_core_rate_protect(clk->core);
+
 	clk_prepare_unlock();
 
 	return ret;
@@ -2020,11 +2181,12 @@ static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
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
@@ -2046,8 +2208,8 @@ static int clk_summary_show(struct seq_file *s, void *data)
 	struct clk_core *c;
 	struct hlist_head **lists = (struct hlist_head **)s->private;
 
-	seq_puts(s, "   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase\n");
-	seq_puts(s, "----------------------------------------------------------------------------------------\n");
+	seq_puts(s, "   clock                         enable_cnt  prepare_cnt  protect_cnt        rate   accuracy   phase\n");
+	seq_puts(s, "----------------------------------------------------------------------------------------------------\n");
 
 	clk_prepare_lock();
 
@@ -2082,6 +2244,7 @@ static void clk_dump_one(struct seq_file *s, struct clk_core *c, int level)
 	seq_printf(s, "\"%s\": { ", c->name);
 	seq_printf(s, "\"enable_count\": %d,", c->enable_count);
 	seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
+	seq_printf(s, "\"protect_count\": %d,", c->protect_count);
 	seq_printf(s, "\"rate\": %lu,", clk_core_get_rate(c));
 	seq_printf(s, "\"accuracy\": %lu,", clk_core_get_accuracy(c));
 	seq_printf(s, "\"phase\": %d", clk_core_get_phase(c));
@@ -2212,6 +2375,11 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
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
@@ -2775,6 +2943,11 @@ void clk_unregister(struct clk *clk)
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
@@ -2933,6 +3106,17 @@ void __clk_put(struct clk *clk)
 
 	clk_prepare_lock();
 
+	/*
+	 * Before calling clk_put, all calls to clk_rate_protect from a given
+	 * user must be balanced with calls to clk_rate_unprotect and by that
+	 * same user
+	 */
+	WARN_ON(clk->protect_count);
+
+	/* We voiced our concern, let's sanitize the situation */
+	for (; clk->protect_count; clk->protect_count--)
+		clk_core_rate_unprotect(clk->core);
+
 	hlist_del(&clk->clks_node);
 	if (clk->min_rate > clk->core->req_rate ||
 	    clk->max_rate < clk->core->req_rate)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a428aec36ace..ebd7df5f375f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -739,6 +739,7 @@ unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
 unsigned long clk_hw_get_flags(const struct clk_hw *hw);
 bool clk_hw_is_prepared(const struct clk_hw *hw);
+bool clk_hw_rate_is_protected(const struct clk_hw *hw);
 bool clk_hw_is_enabled(const struct clk_hw *hw);
 bool __clk_is_enabled(struct clk *clk);
 struct clk *__clk_lookup(const char *name);
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 024cd07870d0..85d73e02df40 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -265,6 +265,30 @@ struct clk *devm_clk_get(struct device *dev, const char *id);
  */
 struct clk *devm_get_clk_from_child(struct device *dev,
 				    struct device_node *np, const char *con_id);
+/**
+ * clk_rate_protect - inform the system when the clock rate must be protected.
+ * @clk: clock source
+ *
+ * This function informs the system that the consumer protecting the clock
+ * depends on the rate of the clock source and can't tolerate any glitches
+ * introduced by further clock rate change or re-parenting of the clock source.
+ *
+ * Must not be called from within atomic context.
+ */
+void clk_rate_protect(struct clk *clk);
+
+/**
+ * clk_rate_unprotect - release the protection of the clock source.
+ * @clk: clock source
+ *
+ * This function informs the system that the consumer previously protecting the
+ * clock rate can now deal with other consumer altering the clock source rate
+ *
+ * The caller must balance the number of rate_protect and rate_unprotect calls.
+ *
+ * Must not be called from within atomic context.
+ */
+void clk_rate_unprotect(struct clk *clk);
 
 /**
  * clk_enable - inform the system when the clock source should be running.
@@ -460,6 +484,11 @@ static inline void clk_put(struct clk *clk) {}
 
 static inline void devm_clk_put(struct device *dev, struct clk *clk) {}
 
+
+static inline void clk_protect(struct clk *clk) {}
+
+static inline void clk_unprotect(struct clk *clk) {}
+
 static inline int clk_enable(struct clk *clk)
 {
 	return 0;
-- 
2.9.4
