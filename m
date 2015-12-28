Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 08/16] clk: drop the initial core->parents look-ups from __clk_core_init()
Date: Mon, 28 Dec 2015 19:23:02 +0900
Message-Id: <1451298191-30815-9-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

The core->parents is a cache to save expensive clock parent look-ups.
It will be filled as needed later.  We do not have to do it here.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/clk/clk.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ca7849a..3215b2b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2329,17 +2329,6 @@ static int __clk_core_init(struct clk_core *core)
 				"%s: invalid NULL in %s's .parent_names\n",
 				__func__, core->name);
 
-	/*
-	 * clk_core_lookup returns NULL for parents that have not been
-	 * clk_init'd; thus any access to clk->parents[] must check
-	 * for a NULL pointer.  We can always perform lazy lookups for
-	 * missing parents later on.
-	 */
-	if (core->parents)
-		for (i = 0; i < core->num_parents; i++)
-			core->parents[i] =
-				clk_core_lookup(core->parent_names[i]);
-
 	core->parent = __clk_init_parent(core);
 
 	/*
-- 
1.9.1
