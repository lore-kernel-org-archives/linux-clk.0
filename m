Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: dianders@chromium.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux@arm.linux.org.uk
Subject: [PATCH v2 1/2] clk: track the orphan status of clocks and their children
Date: Sun, 12 Apr 2015 13:37:33 +0200
Message-ID: <2713774.ah3QzH8epf@diego>
In-Reply-To: <75204537.lSvovFhEiG@diego>
References: <75204537.lSvovFhEiG@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

While children of orphan clocks are not carried in the orphan-list itself,
they're nevertheless orphans in their own right as they also don't have an
input-rate available. To ease tracking if a clock is an orphan or has an
orphan in its parent path introduce an orphan field into struct clk and
update it and the fields in child-clocks when a clock gets added or removed
from the orphan-list.

Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/clk.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f85c8e2..a9fa5ab 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -62,6 +62,7 @@ struct clk_core {
 	struct clk_core		*new_parent;
 	struct clk_core		*new_child;
 	unsigned long		flags;
+	bool			orphan;
 	unsigned int		enable_count;
 	unsigned int		prepare_count;
 	unsigned long		accuracy;
@@ -1433,18 +1434,40 @@ static int clk_fetch_parent_index(struct clk_core *clk,
 	return -EINVAL;
 }
 
+/*
+ * Update the orphan status of @clk and all its children.
+ */
+static void clk_update_orphan_status(struct clk_core *clk, int is_orphan)
+{
+	struct clk_core *child;
+
+	clk->orphan = is_orphan;
+
+	hlist_for_each_entry(child, &clk->children, child_node)
+		clk_update_orphan_status(child, is_orphan);
+}
+
 static void clk_reparent(struct clk_core *clk, struct clk_core *new_parent)
 {
+	bool was_orphan = clk->orphan;
+
 	hlist_del(&clk->child_node);
 
 	if (new_parent) {
+		bool becomes_orphan = new_parent->orphan;
+
 		/* avoid duplicate POST_RATE_CHANGE notifications */
 		if (new_parent->new_child == clk)
 			new_parent->new_child = NULL;
 
 		hlist_add_head(&clk->child_node, &new_parent->children);
+
+		if (was_orphan != becomes_orphan)
+			clk_update_orphan_status(clk, becomes_orphan);
 	} else {
 		hlist_add_head(&clk->child_node, &clk_orphan_list);
+		if (!was_orphan)
+			clk_update_orphan_status(clk, 1);
 	}
 
 	clk->parent = new_parent;
@@ -2348,13 +2371,17 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 	 * clocks and re-parent any that are children of the clock currently
 	 * being clk_init'd.
 	 */
-	if (clk->parent)
+	if (clk->parent) {
 		hlist_add_head(&clk->child_node,
 				&clk->parent->children);
-	else if (clk->flags & CLK_IS_ROOT)
+		clk->orphan = clk->parent->orphan;
+	} else if (clk->flags & CLK_IS_ROOT) {
 		hlist_add_head(&clk->child_node, &clk_root_list);
-	else
+		clk->orphan = 0;
+	} else {
 		hlist_add_head(&clk->child_node, &clk_orphan_list);
+		clk->orphan = 1;
+	}
 
 	/*
 	 * Set clk's accuracy.  The preferred method is to use
-- 
2.1.4
