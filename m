Return-Path: <dbasehore@chromium.org>
Return-Path: <dbasehore@chromium.org>
From: Derek Basehore <dbasehore@chromium.org>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH] clk: fix clk_calc_subtree compute duplications
Date: Fri, 31 Aug 2018 14:20:07 -0700
Message-Id: <20180831212007.247186-1-dbasehore@chromium.org>
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

clk_calc_subtree was called at every step up the clk tree in
clk_calc_new_rates. Since it recursively calls itself for its
children, this means it would be called once on each clk for each
step above the top clk is.

This is fixed by adding a non-recursive function called at every
step in clk_calc_new_rates that fills in new_rate, new_parent, etc.
Since the clks not called directly for clk_calc_new_rates can only
change their rate, we only set new_rate in clk_calc_subtree.
clk_calc_subtree is also only called on the top clk after it's found
via clk_calc_new_rates to remove the duplicate recursive calls.

Signed-off-by: Derek Basehore <dbasehore@chromium.org>
---
 drivers/clk/clk.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d31055ae6ec6..52032fb1a8a2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1609,11 +1609,18 @@ static int __clk_speculate_rates(struct clk_core *core,
 	return ret;
 }
 
-static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
-			     struct clk_core *new_parent, u8 p_index)
+static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate)
 {
 	struct clk_core *child;
 
+	core->new_rate = new_rate;
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_calc_subtree(child, clk_recalc(child, new_rate));
+}
+
+static void clk_set_change(struct clk_core *core, unsigned long new_rate,
+			   struct clk_core *new_parent, u8 p_index)
+{
 	core->new_rate = new_rate;
 	core->new_parent = new_parent;
 	core->new_parent_index = p_index;
@@ -1621,11 +1628,6 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
 	core->new_child = NULL;
 	if (new_parent && new_parent != core->parent)
 		new_parent->new_child = core;
-
-	hlist_for_each_entry(child, &core->children, child_node) {
-		child->new_rate = clk_recalc(child, new_rate);
-		clk_calc_subtree(child, child->new_rate, NULL, 0);
-	}
 }
 
 /*
@@ -1709,7 +1711,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 		top = clk_calc_new_rates(parent, best_parent_rate);
 
 out:
-	clk_calc_subtree(core, new_rate, parent, p_index);
+	clk_set_change(core, new_rate, parent, p_index);
 
 	return top;
 }
@@ -1910,6 +1912,8 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	if (ret)
 		return ret;
 
+	clk_calc_subtree(top, top->new_rate);
+
 	/* notify that we are about to change rates */
 	fail_clk = clk_propagate_rate_change(top, PRE_RATE_CHANGE);
 	if (fail_clk) {
-- 
2.19.0.rc1.350.ge57e33dbd1-goog
