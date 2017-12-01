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
Subject: [PATCH v5 02/10] clk: take the prepare lock out of clk_core_set_parent
Date: Fri,  1 Dec 2017 22:51:52 +0100
Message-Id: <20171201215200.23523-3-jbrunet@baylibre.com>
In-Reply-To: <20171201215200.23523-1-jbrunet@baylibre.com>
References: <20171201215200.23523-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Rework set_parent core function so it can be called when the prepare lock
is already held by the caller.

This rework is done to ease the integration of the "protected" clock
functionality.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5fe9e63b15c6..e60b2a26b10b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1871,32 +1871,28 @@ bool clk_has_parent(struct clk *clk, struct clk *parent)
 }
 EXPORT_SYMBOL_GPL(clk_has_parent);
 
-static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
+static int clk_core_set_parent_nolock(struct clk_core *core,
+				      struct clk_core *parent)
 {
 	int ret = 0;
 	int p_index = 0;
 	unsigned long p_rate = 0;
 
+	lockdep_assert_held(&prepare_lock);
+
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
-		ret = -EPERM;
-		goto out;
-	}
+	if (core->num_parents > 1 && !core->ops->set_parent)
+		return -EPERM;
 
 	/* check that we are allowed to re-parent if the clock is in use */
-	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
+		return -EBUSY;
 
 	/* try finding the new parent index */
 	if (parent) {
@@ -1904,15 +1900,14 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
 		if (p_index < 0) {
 			pr_debug("%s: clk %s can not be parent of clk %s\n",
 					__func__, parent->name, core->name);
-			ret = p_index;
-			goto out;
+			return p_index;
 		}
 		p_rate = parent->rate;
 	}
 
 	ret = clk_pm_runtime_get(core);
 	if (ret)
-		goto out;
+		return ret;
 
 	/* propagate PRE_RATE_CHANGE notifications */
 	ret = __clk_speculate_rates(core, p_rate);
@@ -1934,8 +1929,6 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
 
 runtime_put:
 	clk_pm_runtime_put(core);
-out:
-	clk_prepare_unlock();
 
 	return ret;
 }
@@ -1959,10 +1952,17 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
  */
 int clk_set_parent(struct clk *clk, struct clk *parent)
 {
+	int ret;
+
 	if (!clk)
 		return 0;
 
-	return clk_core_set_parent(clk->core, parent ? parent->core : NULL);
+	clk_prepare_lock();
+	ret = clk_core_set_parent_nolock(clk->core,
+					 parent ? parent->core : NULL);
+	clk_prepare_unlock();
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(clk_set_parent);
 
@@ -2851,7 +2851,7 @@ void clk_unregister(struct clk *clk)
 		/* Reparent all children to the orphan list. */
 		hlist_for_each_entry_safe(child, t, &clk->core->children,
 					  child_node)
-			clk_core_set_parent(child, NULL);
+			clk_core_set_parent_nolock(child, NULL);
 	}
 
 	hlist_del_init(&clk->core->child_node);
-- 
2.14.3
