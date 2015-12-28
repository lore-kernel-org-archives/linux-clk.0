Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/16] clk: change sizeof(struct clk *) to sizeof(*core->parents)
Date: Mon, 28 Dec 2015 19:10:18 +0900
Message-Id: <1451297429-21689-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
References: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Now, the clock parent is not "struct clk *", but "struct clk_core *".
Of course, the size of a pointer is always same, but strictly speaking,
sizeof(struct clk *) should be sizeof(struct clk_core *) here.

This mismatch happened when we split the structure into struct clk
and struct clk_core.  For the potential possibility of future renaming,
sizeof(*core->parents) would be better.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/clk/clk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 30c0bbc..98745c3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1069,7 +1069,7 @@ static int clk_fetch_parent_index(struct clk_core *core,
 
 	if (!core->parents) {
 		core->parents = kcalloc(core->num_parents,
-					sizeof(struct clk *), GFP_KERNEL);
+					sizeof(*core->parents), GFP_KERNEL);
 		if (!core->parents)
 			return -ENOMEM;
 	}
@@ -1702,7 +1702,7 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
 
 	if (!core->parents)
 		core->parents =
-			kcalloc(core->num_parents, sizeof(struct clk *),
+			kcalloc(core->num_parents, sizeof(*core->parents),
 					GFP_KERNEL);
 
 	ret = clk_core_get_parent_by_index(core, index);
@@ -2350,8 +2350,8 @@ static int __clk_core_init(struct clk_core *core)
 	 * necessary.
 	 */
 	if (core->num_parents > 1) {
-		core->parents = kcalloc(core->num_parents, sizeof(struct clk *),
-					GFP_KERNEL);
+		core->parents = kcalloc(core->num_parents,
+					sizeof(*core->parents), GFP_KERNEL);
 		/*
 		 * clk_core_lookup returns NULL for parents that have not been
 		 * clk_init'd; thus any access to clk->parents[] must check
-- 
1.9.1
