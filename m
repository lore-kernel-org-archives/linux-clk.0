Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: use ERR_CAST() for __clk_create_clk()
Date: Tue, 19 Jul 2016 16:28:47 +0900
Message-Id: <1468913327-7876-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

This code is clear enough, but the intention will be even clearer
with this.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2bd00ef..953643f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2430,7 +2430,7 @@ struct clk *__clk_create_clk(struct clk_hw *hw, const char *dev_id,
 
 	/* This is to allow this function to be chained to others */
 	if (IS_ERR_OR_NULL(hw))
-		return (struct clk *) hw;
+		return ERR_CAST(hw);
 
 	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
 	if (!clk)
-- 
1.9.1
