Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] clk: remove redundant negative index check in of_clk_get_parent_name()
Date: Fri, 20 Nov 2015 16:36:19 +0900
Message-Id: <1448004981-11133-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

This if-block can be dropped because the of_parse_phandle_with_args()
in the following line returns -EINVAL for negative index.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 764aca2..20d8e07 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3062,9 +3062,6 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 	int count;
 	struct clk *clk;
 
-	if (index < 0)
-		return NULL;
-
 	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
 					&clkspec);
 	if (rc)
-- 
1.9.1
