Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: fix a typo in comment block of struct clk_rate_request
Date: Thu,  5 Nov 2015 18:02:34 +0900
Message-Id: <1446714154-2071-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/clk-provider.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 0d233689..02442eb 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -44,7 +44,7 @@ struct dentry;
  * @rate:		Requested clock rate. This field will be adjusted by
  *			clock drivers according to hardware capabilities.
  * @min_rate:		Minimum rate imposed by clk users.
- * @max_rate:		Maximum rate a imposed by clk users.
+ * @max_rate:		Maximum rate imposed by clk users.
  * @best_parent_rate:	The best parent rate a parent can provide to fulfill the
  *			requested constraints.
  * @best_parent_hw:	The most appropriate parent clock that fulfills the
-- 
1.9.1
