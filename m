Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/16] clk: walk the orphan clock list more simply
Date: Mon, 30 Nov 2015 16:34:50 +0900
Message-Id: <1448868893-4575-14-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
References: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

This loop can be much simpler.  If a new parent is available for
orphan clocks, __clk_init_parent(orphan) can detect it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a1d046c..e3c6559 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2402,24 +2402,15 @@ static int __clk_core_init(struct clk_core *core)
 	core->rate = core->req_rate = rate;
 
 	/*
-	 * walk the list of orphan clocks and reparent any that are children of
-	 * this clock
+	 * walk the list of orphan clocks and reparent any that newly finds a
+	 * parent.
 	 */
 	hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
-		if (orphan->num_parents && orphan->ops->get_parent) {
-			i = orphan->ops->get_parent(orphan->hw);
-			if (i >= 0 && i < orphan->num_parents &&
-			    !strcmp(core->name, orphan->parent_names[i]))
-				clk_core_reparent(orphan, core);
-			continue;
-		}
+		struct clk_core *parent = __clk_init_parent(orphan);
 
-		for (i = 0; i < orphan->num_parents; i++)
-			if (!strcmp(core->name, orphan->parent_names[i])) {
-				clk_core_reparent(orphan, core);
-				break;
-			}
-	 }
+		if (parent)
+			clk_core_reparent(orphan, parent);
+	}
 
 	/*
 	 * optional platform-specific magic
-- 
1.9.1
