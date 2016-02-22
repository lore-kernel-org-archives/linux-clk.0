Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] Revert "clk: avoid circular clock topology"
Date: Mon, 22 Feb 2016 15:19:23 -0800
Message-Id: <1456183163-13595-1-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <CAK7LNARhh0o8t_qLHc4_+yyZE6Hx6cwL2XEKbFsHZJmeHndzyA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

This reverts commit 858d5881564026cbc4e6f5e25ae878a27df5d4c9.

Joachim reports that this commit breaks lpc18xx boot. This is
because the hardware has circular clk topology where PLLs can
feed into dividers and the same dividers can feed into the PLLs.
The hardware is designed this way so that you can choose to put
the divider before the PLL or after the PLL depending on what you
configure to be the parent of the divider and what you configure
to be the parent of the PLL.

So let's drop this patch for now because we have hardware that
actually has loops. A future patch could check for circular
parents when we change parents and fail the switch, but that's
probably best left to some debugging Kconfig option so that we
don't suffer the sanity checking cost all the time.

Reported-by: Joachim Eastwood <manabian@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 40 ----------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 58ef3dab894a..51d673370d42 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2242,38 +2242,6 @@ static inline void clk_debug_unregister(struct clk_core *core)
 #endif
 
 /**
- * __clk_is_ancestor - check if a clk_core is a possible ancestor of another
- * @core: clock core
- * @ancestor: ancestor clock core
- *
- * Returns true if there is a possibility that @ancestor can be an ancestor
- * of @core, false otherwise.
- *
- * This function can be used against @core or @ancestor that has not been
- * registered yet.
- */
-static bool __clk_is_ancestor(struct clk_core *core, struct clk_core *ancestor)
-{
-	struct clk_core *parent;
-	int i;
-
-	for (i = 0; i < core->num_parents; i++) {
-		parent = clk_core_get_parent_by_index(core, i);
-		/*
-		 * If ancestor has not been added to clk_{root,orphan}_list
-		 * yet, clk_core_lookup() cannot find it.  If parent is NULL,
-		 * compare the name strings, too.
-		 */
-		if ((parent && (parent == ancestor ||
-				__clk_is_ancestor(parent, ancestor))) ||
-		    (!parent && !strcmp(core->parent_names[i], ancestor->name)))
-			return true;
-	}
-
-	return false;
-}
-
-/**
  * __clk_core_init - initialize the data structures in a struct clk_core
  * @core:	clk_core being initialized
  *
@@ -2338,14 +2306,6 @@ static int __clk_core_init(struct clk_core *core)
 				"%s: invalid NULL in %s's .parent_names\n",
 				__func__, core->name);
 
-	/* If core is an ancestor of itself, it would make a loop. */
-	if (__clk_is_ancestor(core, core)) {
-		pr_err("%s: %s would create circular parent\n", __func__,
-		       core->name);
-		ret = -EINVAL;
-		goto out;
-	}
-
 	core->parent = __clk_init_parent(core);
 
 	/*
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
