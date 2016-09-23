Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: change the type of clk_hw_onecell_data.num to unsigned int
Date: Fri, 23 Sep 2016 21:29:36 +0900
Message-Id: <1474633776-11586-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

The "num" is the number of clk_hw entries in the structure, so
"unsigned int" would be a better fit.  (size_t looks like data
size we count by byte.)

Besides, struct clk_onecell_data already uses unsigned int for
"clk_num".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/clk-provider.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a39c0c5..e91d31f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -772,7 +772,7 @@ struct clk_onecell_data {
 };
 
 struct clk_hw_onecell_data {
-	size_t num;
+	unsigned int num;
 	struct clk_hw *hws[];
 };
 
-- 
1.9.1
