Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: fix codying style of if ... else blocks
Date: Thu,  5 Nov 2015 17:59:39 +0900
Message-Id: <1446713979-32693-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

This code is unreadable due to the blank line between if and else
blocks.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk-mux.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 7129c86..5ed03c8 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -71,10 +71,9 @@ static int clk_mux_set_parent(struct clk_hw *hw, u8 index)
 	u32 val;
 	unsigned long flags = 0;
 
-	if (mux->table)
+	if (mux->table) {
 		index = mux->table[index];
-
-	else {
+	} else {
 		if (mux->flags & CLK_MUX_INDEX_BIT)
 			index = 1 << index;
 
-- 
1.9.1
