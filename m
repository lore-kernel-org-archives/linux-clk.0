Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/16] clk: simplify clk_fetch_parent_index() function
Date: Mon, 30 Nov 2015 16:34:52 +0900
Message-Id: <1448868893-4575-16-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
References: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

The clk_core_get_parent_by_index can be used as a helper function
to simplify the implementation of clk_fetch_parent_index().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 50b9b3d..8a6a33b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1069,23 +1069,9 @@ static int clk_fetch_parent_index(struct clk_core *core,
 	if (parent)
 		return -EINVAL;
 
-	/*
-	 * find index of new parent clock using cached parent ptrs,
-	 * or if not yet cached, use string name comparison and cache
-	 * them now to avoid future calls to clk_core_lookup.
-	 */
-	for (i = 0; i < core->num_parents; i++) {
-		if (core->parents[i] == parent)
-			return i;
-
-		if (core->parents[i])
-			continue;
-
-		if (!strcmp(core->parent_names[i], parent->name)) {
-			core->parents[i] = clk_core_lookup(parent->name);
+	for (i = 0; i < core->num_parents; i++)
+		if (clk_core_get_parent_by_index(core, i) == parent)
 			return i;
-		}
-	}
 
 	return -EINVAL;
 }
-- 
1.9.1
