Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/16] clk: change the argument of __clk_init() into pointer to clk_core
Date: Mon, 28 Dec 2015 19:10:15 +0900
Message-Id: <1451297429-21689-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
References: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

The argument clk_user is used only for the clk_user->core.  The rest
of this function only takes care of clk_core.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/clk/clk.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 897e5ae..623838f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2285,25 +2285,22 @@ static inline void clk_debug_unregister(struct clk_core *core)
 #endif
 
 /**
- * __clk_init - initialize the data structures in a struct clk
- * @clk:	clk being initialized
+ * __clk_init - initialize the data structures in a struct clk_core
+ * @core:	clk_core being initialized
  *
  * Initializes the lists in struct clk_core, queries the hardware for the
  * parent and rate and sets them both.
  */
-static int __clk_init(struct clk *clk_user)
+static int __clk_init(struct clk_core *core)
 {
 	int i, ret = 0;
 	struct clk_core *orphan;
 	struct hlist_node *tmp2;
-	struct clk_core *core;
 	unsigned long rate;
 
-	if (!clk_user)
+	if (!core)
 		return -EINVAL;
 
-	core = clk_user->core;
-
 	clk_prepare_lock();
 
 	/* check to see if a clock with this name is already registered */
@@ -2574,7 +2571,7 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 		goto fail_parent_names_copy;
 	}
 
-	ret = __clk_init(hw->clk);
+	ret = __clk_init(core);
 	if (!ret)
 		return hw->clk;
 
-- 
1.9.1
