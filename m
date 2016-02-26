Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [RFC PATCH 1/3] clk: add clk_round_phase support
Date: Fri, 26 Feb 2016 13:08:46 +0800
Message-Id: <1456463326-3625-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1456463290-3581-1-git-send-email-shawn.lin@rock-chips.com>
References: <1456463290-3581-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

This patch add new clk_round_phase API for drivers to
know what the actual phase the clk will provide. Also, add
round_rate and determine_rate callback into clk_ops for clk-driver
to do that. By default, we make min_phase and max_phase to be
0 and 360 respectively.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

 drivers/clk/clk.c            | 138 +++++++++++++++++++++++++++++++++++++++----
 include/linux/clk-provider.h |  20 +++++++
 include/linux/clk.h          |  23 ++++++++
 3 files changed, 171 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 549fdb8..3a8407c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -64,6 +64,8 @@ struct clk_core {
 	unsigned long		max_rate;
 	unsigned long		accuracy;
 	int			phase;
+	unsigned long		min_phase;
+	unsigned long		max_phase;
 	struct hlist_head	children;
 	struct hlist_node	child_node;
 	struct hlist_head	clks;
@@ -522,18 +524,27 @@ struct clk *__clk_lookup(const char *name)
 
 static void clk_core_get_boundaries(struct clk_core *core,
 				    unsigned long *min_rate,
-				    unsigned long *max_rate)
+				    unsigned long *max_rate,
+				    unsigned long *min_phase,
+				    unsigned long *max_phase)
 {
 	struct clk *clk_user;
 
-	*min_rate = core->min_rate;
-	*max_rate = core->max_rate;
+	if (min_rate && max_rate) {
+		*min_rate = core->min_rate;
+		*max_rate = core->max_rate;
 
-	hlist_for_each_entry(clk_user, &core->clks, clks_node)
-		*min_rate = max(*min_rate, clk_user->min_rate);
+		hlist_for_each_entry(clk_user, &core->clks, clks_node)
+			*min_rate = max(*min_rate, clk_user->min_rate);
 
-	hlist_for_each_entry(clk_user, &core->clks, clks_node)
-		*max_rate = min(*max_rate, clk_user->max_rate);
+		hlist_for_each_entry(clk_user, &core->clks, clks_node)
+			*max_rate = min(*max_rate, clk_user->max_rate);
+	}
+
+	if (min_phase && max_phase) {
+		*min_phase = core->min_phase;
+		*max_phase = core->max_phase;
+	}
 }
 
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
@@ -845,7 +856,8 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 	int ret;
 	struct clk_rate_request req;
 
-	clk_core_get_boundaries(hw->core, &req.min_rate, &req.max_rate);
+	clk_core_get_boundaries(hw->core, &req.min_rate, &req.max_rate,
+				NULL, NULL);
 	req.rate = rate;
 
 	ret = clk_core_round_rate_nolock(hw->core, &req);
@@ -875,7 +887,8 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 
 	clk_prepare_lock();
 
-	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
+	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate,
+				NULL, NULL);
 	req.rate = rate;
 
 	ret = clk_core_round_rate_nolock(clk->core, &req);
@@ -888,6 +901,106 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_round_rate);
 
+static int clk_core_round_phase_nolock(struct clk_core *core,
+				      struct clk_phase_request *req)
+{
+	long phase;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return 0;
+
+	/* sanity check  */
+	req->phase %= 360;
+	if (req->phase < 0)
+		req->phase += 360;
+
+	if (core->ops->determine_phase) {
+		return core->ops->determine_phase(core->hw, req);
+	} else if (core->ops->round_phase) {
+		phase = core->ops->round_phase(core->hw, req->phase);
+		if (phase < 0)
+			return phase;
+
+		req->phase = phase;
+	}
+
+	return 0;
+}
+
+/**
+ * __clk_determine_phase - get the closest phase actually supported by a clock
+ * @hw: determine the phase of this clock
+ * @phase: target rate
+ * @min_phase: returned phase must be greater than this phase
+ * @max_phase: returned phase must be less than this phase
+ *
+ * Useful for clk_ops such as .set_phase and .determine_phase.
+ */
+int __clk_determine_phase(struct clk_hw *hw, struct clk_phase_request *req)
+{
+	if (!hw) {
+		req->phase = 0;
+		return 0;
+	}
+
+	return clk_core_round_phase_nolock(hw->core, req);
+}
+EXPORT_SYMBOL_GPL(__clk_determine_phase);
+
+unsigned long clk_hw_round_phase(struct clk_hw *hw, int phase)
+{
+	int ret;
+	struct clk_phase_request req;
+
+	clk_core_get_boundaries(hw->core, NULL, NULL,
+				&req.min_phase, &req.max_phase);
+
+	req.phase = phase;
+
+	ret = clk_core_round_phase_nolock(hw->core, &req);
+	if (ret)
+		return 0;
+
+	return req.phase;
+}
+EXPORT_SYMBOL_GPL(clk_hw_round_phase);
+
+/**
+ * clk_round_phase - round the given phase for a clk
+ * @clk: the clk for which we are rounding a phase
+ * @phase: the phase which is to be rounded
+ *
+ * Takes in a phase as input and rounds it to a phase that the clk can actually
+ * use which is then returned.  If clk doesn't support round_phase operation
+ * then the requested phase is returned.
+ */
+long clk_round_phase(struct clk *clk, int phase)
+{
+	struct clk_phase_request req;
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	clk_prepare_lock();
+
+	clk_core_get_boundaries(clk->core, NULL, NULL,
+				&req.min_phase, &req.max_phase);
+	req.phase = phase;
+
+	ret = clk_core_round_phase_nolock(clk->core, &req);
+	clk_prepare_unlock();
+
+	if (ret)
+		return ret;
+
+	return req.phase;
+}
+EXPORT_SYMBOL_GPL(clk_round_phase);
+
+
 /**
  * __clk_notify - call clk notifier chain
  * @core: clk that is changing rate
@@ -1312,7 +1425,8 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 	if (parent)
 		best_parent_rate = parent->rate;
 
-	clk_core_get_boundaries(core, &min_rate, &max_rate);
+	clk_core_get_boundaries(core, &min_rate, &max_rate,
+				NULL, NULL);
 
 	/* find the closest rate and parent clk/rate */
 	if (core->ops->determine_rate) {
@@ -2443,6 +2557,10 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 	else
 		core->phase = 0;
 
+	/* Set phase range from 0 to 360 by default */
+	core->min_phase = 0;
+	core->max_phase = 360;
+
 	/*
 	 * Set clk's rate.  The preferred method is to use .recalc_rate.  For
 	 * simple clocks and lazy developers the default fallback is to use the
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1143e38..f7e58ae 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -61,6 +61,23 @@ struct clk_rate_request {
 };
 
 /**
+ * struct clk_phase_request - Structure encoding the clk constraints that
+ * a clock user might require.
+ *
+ * @phase:		Requested clock phase. This field will be adjusted by
+ *			clock drivers according to hardware capabilities.
+ * @min_phase:		Minimum phase imposed by clk users.
+ * @max_phase:		Maximum phase imposed by clk users.
+ *
+ */
+struct clk_phase_request {
+	int phase;
+	unsigned long min_phase;
+	unsigned long max_phase;
+};
+
+
+/**
  * struct clk_ops -  Callback operations for hardware clocks; these are to
  * be provided by the clock implementation, and will be called by drivers
  * through the clk_* api.
@@ -212,6 +229,9 @@ struct clk_ops {
 					   unsigned long parent_accuracy);
 	int		(*get_phase)(struct clk_hw *hw);
 	int		(*set_phase)(struct clk_hw *hw, int degrees);
+	int		(*round_phase)(struct clk_hw *hw, int degrees);
+	int		(*determine_phase)(struct clk_hw *hw,
+					  struct clk_phase_request *req);
 	void		(*init)(struct clk_hw *hw);
 	int		(*debug_init)(struct clk_hw *hw, struct dentry *dentry);
 };
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 0df4a51..105cae0 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -325,6 +325,29 @@ void devm_clk_put(struct device *dev, struct clk *clk);
 long clk_round_rate(struct clk *clk, unsigned long rate);
 
 /**
+ * clk_round_phase - adjust a phase to the exact phase a clock can provide
+ * @clk: clock source
+ * @phase: desired clock phase in degrees
+ *
+ * This answers the question "if I were to pass @phase to clk_set_phase(),
+ * what clock phase would I end up with?" without changing the hardware
+ * in any way.  In other words:
+ *
+ *   phase = clk_round_phase(clk, p);
+ *
+ * and:
+ *
+ *   clk_set_phase(clk, p);
+ *   phase = clk_get_phase(clk);
+ *
+ * are equivalent except the former does not modify the clock hardware
+ * in any way.
+ *
+ * Returns rounded clock phase in degrees, or negative errno.
+ */
+long clk_round_phase(struct clk *clk, int phase);
+
+/**
  * clk_set_rate - set the clock rate for a clock source
  * @clk: clock source
  * @rate: desired clock rate in Hz
-- 
2.3.7
