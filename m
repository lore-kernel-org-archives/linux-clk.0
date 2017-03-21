Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [RFC 1/7] clk: take the prepare lock out of clk_core_set_parent
Date: Tue, 21 Mar 2017 19:33:24 +0100
Message-Id: <20170321183330.26722-2-jbrunet@baylibre.com>
In-Reply-To: <20170321183330.26722-1-jbrunet@baylibre.com>
References: <20170321183330.26722-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Rework set_parent core function so it can be called when the prepare lock
is already held by the caller.

This rework is done to ease the integration of the "protected" clock
functionality.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 67201f67a14a..e77f03a47da6 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1794,23 +1794,16 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
 	if (!core)
 		return 0;
 
-	/* prevent racing with updates to the clock topology */
-	clk_prepare_lock();
-
 	if (core->parent == parent)
-		goto out;
+		return 0;
 
 	/* verify ops for for multi-parent clks */
-	if ((core->num_parents > 1) && (!core->ops->set_parent)) {
-		ret = -ENOSYS;
-		goto out;
-	}
+	if ((core->num_parents > 1) && (!core->ops->set_parent))
+		return -ENOSYS;
 
 	/* check that we are allowed to re-parent if the clock is in use */
-	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
+		return -EBUSY;
 
 	/* try finding the new parent index */
 	if (parent) {
@@ -1818,8 +1811,7 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
 		if (p_index < 0) {
 			pr_debug("%s: clk %s can not be parent of clk %s\n",
 					__func__, parent->name, core->name);
-			ret = p_index;
-			goto out;
+			return p_index;
 		}
 		p_rate = parent->rate;
 	}
@@ -1829,7 +1821,7 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
 
 	/* abort if a driver objects */
 	if (ret & NOTIFY_STOP_MASK)
-		goto out;
+		return ret;
 
 	/* do the re-parent */
 	ret = __clk_set_parent(core, parent, p_index);
@@ -1842,7 +1834,16 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
 		__clk_recalc_accuracies(core);
 	}
 
-out:
+	return ret;
+}
+
+static int clk_core_set_parent_lock(struct clk_core *core,
+				    struct clk_core *parent)
+{
+	int ret;
+
+	clk_prepare_lock();
+	ret = clk_core_set_parent(core, parent);
 	clk_prepare_unlock();
 
 	return ret;
@@ -1870,7 +1871,8 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 	if (!clk)
 		return 0;
 
-	return clk_core_set_parent(clk->core, parent ? parent->core : NULL);
+	return clk_core_set_parent_lock(clk->core,
+					parent ? parent->core : NULL);
 }
 EXPORT_SYMBOL_GPL(clk_set_parent);
 
@@ -2720,7 +2722,7 @@ void clk_unregister(struct clk *clk)
 		/* Reparent all children to the orphan list. */
 		hlist_for_each_entry_safe(child, t, &clk->core->children,
 					  child_node)
-			clk_core_set_parent(child, NULL);
+			clk_core_set_parent_lock(child, NULL);
 	}
 
 	hlist_del_init(&clk->core->child_node);
-- 
2.9.3
