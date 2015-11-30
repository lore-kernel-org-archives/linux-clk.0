Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/16] clk: move core->parents allocation to clk_register()
Date: Mon, 30 Nov 2015 16:34:43 +0900
Message-Id: <1448868893-4575-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
References: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Currently, __clk_core_init() allows failure of the kcalloc() for the
core->parents.  So, clk_fetch_parent_index() and __clk_init_parent()
also try to allocate core->parents in case it has not been allocated
yet.  Scattering memory allocation here and there makes things
complicated.

Like other clk_core members, allocate core->parents in clk_register()
and let it fail in case of memory shortage.  If we cannot allocate
such a small piece of memory, the system is already insane.  There is
no point to postpone the memory allocation.

Also, allocate core->parents regardless of core->num_parents.  We want
it even if core->num_parents == 1 because clk_fetch_parent_index()
might be called against the clk_core with a single parent.

If core->num_parents == 0, core->parents is set to ZERO_SIZE_PTR. It
is harmless because no access happens to core->parents in such a case.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 51 +++++++++++++++++++--------------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0f80c69..e05084e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1067,13 +1067,6 @@ static int clk_fetch_parent_index(struct clk_core *core,
 {
 	int i;
 
-	if (!core->parents) {
-		core->parents = kcalloc(core->num_parents,
-					sizeof(*core->parents), GFP_KERNEL);
-		if (!core->parents)
-			return -ENOMEM;
-	}
-
 	/*
 	 * find index of new parent clock using cached parent ptrs,
 	 * or if not yet cached, use string name comparison and cache
@@ -1700,11 +1693,6 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
 
 	index = core->ops->get_parent(core->hw);
 
-	if (!core->parents)
-		core->parents =
-			kcalloc(core->num_parents, sizeof(*core->parents),
-					GFP_KERNEL);
-
 	ret = clk_core_get_parent_by_index(core, index);
 
 out:
@@ -2343,26 +2331,15 @@ static int __clk_core_init(struct clk_core *core)
 				__func__, core->name);
 
 	/*
-	 * Allocate an array of struct clk *'s to avoid unnecessary string
-	 * look-ups of clk's possible parents.  This can fail for clocks passed
-	 * in to clk_init during early boot; thus any access to core->parents[]
-	 * must always check for a NULL pointer and try to populate it if
-	 * necessary.
+	 * clk_core_lookup returns NULL for parents that have not been
+	 * clk_init'd; thus any access to clk->parents[] must check
+	 * for a NULL pointer.  We can always perform lazy lookups for
+	 * missing parents later on.
 	 */
-	if (core->num_parents > 1) {
-		core->parents = kcalloc(core->num_parents,
-					sizeof(*core->parents), GFP_KERNEL);
-		/*
-		 * clk_core_lookup returns NULL for parents that have not been
-		 * clk_init'd; thus any access to clk->parents[] must check
-		 * for a NULL pointer.  We can always perform lazy lookups for
-		 * missing parents later on.
-		 */
-		if (core->parents)
-			for (i = 0; i < core->num_parents; i++)
-				core->parents[i] =
-					clk_core_lookup(core->parent_names[i]);
-	}
+	if (core->parents)
+		for (i = 0; i < core->num_parents; i++)
+			core->parents[i] =
+				clk_core_lookup(core->parent_names[i]);
 
 	core->parent = __clk_init_parent(core);
 
@@ -2560,12 +2537,20 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 		}
 	}
 
+	/* avoid unnecessary string look-ups of clk_core's possible parents. */
+	core->parents = kcalloc(core->num_parents, sizeof(*core->parents),
+				GFP_KERNEL);
+	if (!core->parents) {
+		ret = -ENOMEM;
+		goto fail_parents;
+	};
+
 	INIT_HLIST_HEAD(&core->clks);
 
 	hw->clk = __clk_create_clk(hw, NULL, NULL);
 	if (IS_ERR(hw->clk)) {
 		ret = PTR_ERR(hw->clk);
-		goto fail_parent_names_copy;
+		goto fail_parents;
 	}
 
 	ret = __clk_core_init(core);
@@ -2575,6 +2560,8 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 	__clk_free_clk(hw->clk);
 	hw->clk = NULL;
 
+fail_parents:
+	kfree(core->parents);
 fail_parent_names_copy:
 	while (--i >= 0)
 		kfree_const(core->parent_names[i]);
-- 
1.9.1
