Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: fix a typo in comment block of clk_notifier_register()
Date: Mon, 30 Nov 2015 16:40:51 +0900
Message-Id: <1448869251-6219-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

The word "cases" is doubled.  Keep decent forms for the following
lines.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index efb0dfd..6d9cd05 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2806,10 +2806,9 @@ void __clk_put(struct clk *clk)
  * re-enter into the clk framework by calling any top-level clk APIs;
  * this will cause a nested prepare_lock mutex.
  *
- * In all notification cases cases (pre, post and abort rate change) the
- * original clock rate is passed to the callback via struct
- * clk_notifier_data.old_rate and the new frequency is passed via struct
- * clk_notifier_data.new_rate.
+ * In all notification cases (pre, post and abort rate change) the original
+ * clock rate is passed to the callback via struct clk_notifier_data.old_rate
+ * and the new frequency is passed via struct clk_notifier_data.new_rate.
  *
  * clk_notifier_register() must be called from non-atomic context.
  * Returns -EINVAL if called with null arguments, -ENOMEM upon
-- 
1.9.1
