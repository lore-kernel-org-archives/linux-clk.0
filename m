Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: use IS_ERR_OR_NULL(hw) instead of !hw || IS_ERR(hw)
Date: Fri, 20 Nov 2015 14:38:49 +0900
Message-Id: <1447997929-780-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

This minor refactoring does not change the function behavior.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f13c3f4..764aca2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2482,7 +2482,7 @@ struct clk *__clk_create_clk(struct clk_hw *hw, const char *dev_id,
 	struct clk *clk;
 
 	/* This is to allow this function to be chained to others */
-	if (!hw || IS_ERR(hw))
+	if (IS_ERR_OR_NULL(hw))
 		return (struct clk *) hw;
 
 	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
-- 
1.9.1
