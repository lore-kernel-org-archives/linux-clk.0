Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/16] clk: rename __clk_init() into __clk_core_init()
Date: Mon, 30 Nov 2015 16:34:40 +0900
Message-Id: <1448868893-4575-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
References: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Now this function takes clk_core as its argument.  __clk_core_init()
would be more suitable for the name of this function.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8c8ba91..36373d3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2285,13 +2285,13 @@ static inline void clk_debug_unregister(struct clk_core *core)
 #endif
 
 /**
- * __clk_init - initialize the data structures in a struct clk_core
+ * __clk_core_init - initialize the data structures in a struct clk_core
  * @core:	clk_core being initialized
  *
  * Initializes the lists in struct clk_core, queries the hardware for the
  * parent and rate and sets them both.
  */
-static int __clk_init(struct clk_core *core)
+static int __clk_core_init(struct clk_core *core)
 {
 	int i, ret = 0;
 	struct clk_core *orphan;
@@ -2571,7 +2571,7 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 		goto fail_parent_names_copy;
 	}
 
-	ret = __clk_init(core);
+	ret = __clk_core_init(core);
 	if (!ret)
 		return hw->clk;
 
-- 
1.9.1
