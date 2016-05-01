Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: fix comment of devm_clk_hw_register()
Date: Sun,  1 May 2016 19:56:08 +0900
Message-Id: <1462100168-15888-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Unlike devm_clk_register(), devm_clk_hw_register() returns integer.
So, the statement "Clocks returned from this function ..." sounds
odd.  Adjust the comment for this new API.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 49e1aa2..aa6e5e2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2712,7 +2712,7 @@ EXPORT_SYMBOL_GPL(devm_clk_register);
  * @dev: device that is registering this clock
  * @hw: link to hardware-specific clock data
  *
- * Managed clk_hw_register(). Clocks returned from this function are
+ * Managed clk_hw_register(). Clocks registered by this function are
  * automatically clk_hw_unregister()ed on driver detach. See clk_hw_register()
  * for more information.
  */
-- 
1.9.1
