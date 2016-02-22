Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] clk: Update some outdated comments
Date: Mon, 22 Feb 2016 15:46:18 -0800
Message-Id: <1456184778-22242-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

__clk_init() was renamed to __clk_core_init() but these comments
weren't updated.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 51d673370d42..d95d6f924cac 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2157,7 +2157,7 @@ unlock:
  *
  * Dynamically removes a clk and all its child nodes from the
  * debugfs clk directory if clk->dentry points to debugfs created by
- * clk_debug_register in __clk_init.
+ * clk_debug_register in __clk_core_init.
  */
 static void clk_debug_unregister(struct clk_core *core)
 {
@@ -2309,8 +2309,8 @@ static int __clk_core_init(struct clk_core *core)
 	core->parent = __clk_init_parent(core);
 
 	/*
-	 * Populate core->parent if parent has already been __clk_init'd.  If
-	 * parent has not yet been __clk_init'd then place clk in the orphan
+	 * Populate core->parent if parent has already been clk_core_init'd. If
+	 * parent has not yet been clk_core_init'd then place clk in the orphan
 	 * list.  If clk doesn't have any parents then place it in the root
 	 * clk list.
 	 *
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
