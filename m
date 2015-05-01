Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 6/6] clk: Update some comments to reflect reality
Date: Thu, 30 Apr 2015 17:14:21 -0700
Message-Id: <1430439261-10291-7-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
References: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The debugfs clk directory no longer expresses a clk tree. Update
the comments around that apporiately. Also drop comments about
prepare locks needing to be held as we have the proper
annotations with lockdep_assert_held().

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 51 ++++++++++++++++++---------------------------------
 1 file changed, 18 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0001b91f2b6e..43b7e7227056 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -162,7 +162,6 @@ static bool clk_core_is_enabled(struct clk_core *core)
 	return core->ops->is_enabled(core->hw);
 }
 
-/* caller must hold prepare_lock */
 static void clk_unprepare_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
@@ -188,7 +187,6 @@ static void clk_unprepare_unused_subtree(struct clk_core *core)
 	}
 }
 
-/* caller must hold prepare_lock */
 static void clk_disable_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
@@ -791,8 +789,7 @@ static unsigned long clk_core_round_rate_nolock(struct clk_core *core,
  * @min_rate: returned rate must be greater than this rate
  * @max_rate: returned rate must be less than this rate
  *
- * Caller must hold prepare_lock.  Useful for clk_ops such as .set_rate and
- * .determine_rate.
+ * Useful for clk_ops such as .set_rate and .determine_rate.
  */
 unsigned long __clk_determine_rate(struct clk_hw *hw,
 				   unsigned long rate,
@@ -811,7 +808,7 @@ EXPORT_SYMBOL_GPL(__clk_determine_rate);
  * @clk: round the rate of this clock
  * @rate: the rate which is to be rounded
  *
- * Caller must hold prepare_lock.  Useful for clk_ops such as .set_rate
+ * Useful for clk_ops such as .set_rate
  */
 unsigned long __clk_round_rate(struct clk *clk, unsigned long rate)
 {
@@ -892,10 +889,8 @@ static int __clk_notify(struct clk_core *core, unsigned long msg,
  *
  * Walks the subtree of clks starting with clk and recalculates accuracies as
  * it goes.  Note that if a clk does not implement the .recalc_accuracy
- * callback then it is assumed that the clock will take on the accuracy of it's
+ * callback then it is assumed that the clock will take on the accuracy of its
  * parent.
- *
- * Caller must hold prepare_lock.
  */
 static void __clk_recalc_accuracies(struct clk_core *core)
 {
@@ -968,8 +963,6 @@ static unsigned long clk_recalc(struct clk_core *core,
  *
  * clk_recalc_rates also propagates the POST_RATE_CHANGE notification,
  * if necessary.
- *
- * Caller must hold prepare_lock.
  */
 static void __clk_recalc_rates(struct clk_core *core, unsigned long msg)
 {
@@ -1179,8 +1172,6 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
  * subtree have subscribed to the notifications.  Note that if a clk does not
  * implement the .recalc_rate callback then it is assumed that the clock will
  * take on the rate of its parent.
- *
- * Caller must hold prepare_lock.
  */
 static int __clk_speculate_rates(struct clk_core *core,
 				 unsigned long parent_rate)
@@ -2091,11 +2082,11 @@ out:
 }
 
 /**
- * clk_debug_register - add a clk node to the debugfs clk tree
- * @core: the clk being added to the debugfs clk tree
+ * clk_debug_register - add a clk node to the debugfs clk directory
+ * @core: the clk being added to the debugfs clk directory
  *
- * Dynamically adds a clk to the debugfs clk tree if debugfs has been
- * initialized.  Otherwise it bails out early since the debugfs clk tree
+ * Dynamically adds a clk to the debugfs clk directory if debugfs has been
+ * initialized.  Otherwise it bails out early since the debugfs clk directory
  * will be created lazily by clk_debug_init as part of a late_initcall.
  */
 static int clk_debug_register(struct clk_core *core)
@@ -2116,11 +2107,11 @@ unlock:
 }
 
  /**
- * clk_debug_unregister - remove a clk node from the debugfs clk tree
- * @core: the clk being removed from the debugfs clk tree
+ * clk_debug_unregister - remove a clk node from the debugfs clk directory
+ * @core: the clk being removed from the debugfs clk directory
  *
- * Dynamically removes a clk and all it's children clk nodes from the
- * debugfs clk tree if clk->dentry points to debugfs created by
+ * Dynamically removes a clk and all its child nodes from the
+ * debugfs clk directory if clk->dentry points to debugfs created by
  * clk_debug_register in __clk_init.
  */
 static void clk_debug_unregister(struct clk_core *core)
@@ -2146,16 +2137,13 @@ struct dentry *clk_debugfs_add_file(struct clk_hw *hw, char *name, umode_t mode,
 EXPORT_SYMBOL_GPL(clk_debugfs_add_file);
 
 /**
- * clk_debug_init - lazily create the debugfs clk tree visualization
+ * clk_debug_init - lazily populate the debugfs clk directory
  *
- * clks are often initialized very early during boot before memory can
- * be dynamically allocated and well before debugfs is setup.
- * clk_debug_init walks the clk tree hierarchy while holding
- * prepare_lock and creates the topology as part of a late_initcall,
- * thus insuring that clks initialized very early will still be
- * represented in the debugfs clk tree.  This function should only be
- * called once at boot-time, and all other clks added dynamically will
- * be done so with clk_debug_register.
+ * clks are often initialized very early during boot before memory can be
+ * dynamically allocated and well before debugfs is setup. This function
+ * populates the debugfs clk directory once at boot-time when we know that
+ * debugfs is setup. It should only be called once at boot-time, all other clks
+ * added dynamically will be done so with clk_debug_register.
  */
 static int __init clk_debug_init(void)
 {
@@ -2512,10 +2500,7 @@ fail_out:
 }
 EXPORT_SYMBOL_GPL(clk_register);
 
-/*
- * Free memory allocated for a clock.
- * Caller must hold prepare_lock.
- */
+/* Free memory allocated for a clock. */
 static void __clk_release(struct kref *ref)
 {
 	struct clk_core *core = container_of(ref, struct clk_core, ref);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
