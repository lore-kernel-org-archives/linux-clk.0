Return-Path: <vz@mleia.com>
From: Vladimir Zapolskiy <vz@mleia.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Subject: [PATCH 3/3] clk: remove redundant clock parents lookup table allocations
Date: Thu,  7 Jan 2016 05:16:08 +0200
Message-Id: <1452136568-478-4-git-send-email-vz@mleia.com>
In-Reply-To: <1452136568-478-1-git-send-email-vz@mleia.com>
References: <1452136568-478-1-git-send-email-vz@mleia.com>
List-ID: <linux-clk.vger.kernel.org>

Since clock parents lookup table for clocks with multiple parent
clocks is always allocated during clock registration, remove similar
allocations from __clk_init_parent() and clk_fetch_parent_index().

The change also corrects a pointer type of a single lookup table
entry on calculation of the lookup table size.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/clk/clk.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2fb0dae..f8872f9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1067,13 +1067,6 @@ static int clk_fetch_parent_index(struct clk_core *core,
 {
 	int i;
 
-	if (!core->parents) {
-		core->parents = kcalloc(core->num_parents,
-					sizeof(struct clk *), GFP_KERNEL);
-		if (!core->parents)
-			return -ENOMEM;
-	}
-
 	/*
 	 * find index of new parent clock using cached parent ptrs,
 	 * or if not yet cached, use string name comparison and cache
@@ -1711,18 +1704,11 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
 	}
 
 	/*
-	 * Do our best to cache parent clocks in core->parents.  This prevents
-	 * unnecessary and expensive lookups.  We don't set core->parent here;
-	 * that is done by the calling function.
+	 * We don't set core->parent here; that is done by the calling function.
 	 */
 
 	index = core->ops->get_parent(core->hw);
 
-	if (!core->parents)
-		core->parents =
-			kcalloc(core->num_parents, sizeof(struct clk *),
-					GFP_KERNEL);
-
 	ret = clk_core_get_parent_by_index(core, index);
 
 out:
@@ -2374,8 +2360,8 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 	 * look-ups of clk's possible parents.
 	 */
 	if (core->num_parents > 1) {
-		core->parents = kcalloc(core->num_parents, sizeof(struct clk *),
-					GFP_KERNEL);
+		core->parents = kcalloc(core->num_parents,
+					sizeof(struct clk_core *), GFP_KERNEL);
 		if (!core->parents) {
 			ret = -ENOMEM;
 			goto out;
-- 
2.1.4
