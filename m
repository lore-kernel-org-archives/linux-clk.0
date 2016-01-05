Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: optimize the divider walk in clk_divider_bestdiv()
Date: Tue,  5 Jan 2016 12:43:41 +0900
Message-Id: <1451965421-28227-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Because _next_div() returns a valid divider, there is no need to
consult _is_valid_div() for the validity of the divider in every
iteration.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk-divider.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 358b9f9..8ced09e 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -304,9 +304,8 @@ static int clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 	 */
 	maxdiv = min(ULONG_MAX / rate, maxdiv);
 
-	for (i = 1; i <= maxdiv; i = _next_div(table, i, flags)) {
-		if (!_is_valid_div(table, i, flags))
-			continue;
+	for (i = _next_div(table, 0, flags); i <= maxdiv;
+					     i = _next_div(table, i, flags)) {
 		if (rate * i == parent_rate_saved) {
 			/*
 			 * It's the most ideal case if the requested rate can be
-- 
1.9.1
