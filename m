Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/16] clk: simplify __clk_init_parent()
Date: Mon, 28 Dec 2015 19:10:24 +0900
Message-Id: <1451297429-21689-12-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
References: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

The translation from the index into clk_core is done by
clk_core_get_parent_by_index().  The if-block for num_parents == 1
case is duplicating the code in the clk_core_get_parent_by_index().

Drop the "if (num_parents == 1)" from the special case.  Instead,
set the index to zero if .get_parent() is missing.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/clk/clk.c | 38 ++++----------------------------------
 1 file changed, 4 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 4ad0a36..03b87d8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1651,44 +1651,14 @@ struct clk *clk_get_parent(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_get_parent);
 
-/*
- * .get_parent is mandatory for clocks with multiple possible parents.  It is
- * optional for single-parent clocks.  Always call .get_parent if it is
- * available and WARN if it is missing for multi-parent clocks.
- *
- * For single-parent clocks without .get_parent, first check to see if the
- * .parents array exists, and if so use it to avoid an expensive tree
- * traversal.  If .parents does not exist then walk the tree.
- */
 static struct clk_core *__clk_init_parent(struct clk_core *core)
 {
-	struct clk_core *ret = NULL;
-	u8 index;
-
-	/* handle the trivial cases */
+	u8 index = 0;
 
-	if (!core->num_parents)
-		goto out;
-
-	if (core->num_parents == 1) {
-		if (IS_ERR_OR_NULL(core->parent))
-			core->parent = clk_core_lookup(core->parent_names[0]);
-		ret = core->parent;
-		goto out;
-	}
+	if (core->ops->get_parent)
+		index = core->ops->get_parent(core->hw);
 
-	/*
-	 * Do our best to cache parent clocks in core->parents.  This prevents
-	 * unnecessary and expensive lookups.  We don't set core->parent here;
-	 * that is done by the calling function.
-	 */
-
-	index = core->ops->get_parent(core->hw);
-
-	ret = clk_core_get_parent_by_index(core, index);
-
-out:
-	return ret;
+	return clk_core_get_parent_by_index(core, index);
 }
 
 static void clk_core_reparent(struct clk_core *core,
-- 
1.9.1
