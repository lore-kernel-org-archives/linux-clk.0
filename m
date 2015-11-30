Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/16] clk: remove unused first argument of __clk_init()
Date: Mon, 30 Nov 2015 16:34:38 +0900
Message-Id: <1448868893-4575-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
References: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

The "struct device *dev" is not used at all in this function.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 6d9cd05..65530e9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2286,13 +2286,12 @@ static inline void clk_debug_unregister(struct clk_core *core)
 
 /**
  * __clk_init - initialize the data structures in a struct clk
- * @dev:	device initializing this clk, placeholder for now
  * @clk:	clk being initialized
  *
  * Initializes the lists in struct clk_core, queries the hardware for the
  * parent and rate and sets them both.
  */
-static int __clk_init(struct device *dev, struct clk *clk_user)
+static int __clk_init(struct clk *clk_user)
 {
 	int i, ret = 0;
 	struct clk_core *orphan;
@@ -2575,7 +2574,7 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 		goto fail_parent_names_copy;
 	}
 
-	ret = __clk_init(dev, hw->clk);
+	ret = __clk_init(hw->clk);
 	if (!ret)
 		return hw->clk;
 
-- 
1.9.1
