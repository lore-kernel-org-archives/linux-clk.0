Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/16] clk: remove unnecessary !core->parents conditional
Date: Mon, 30 Nov 2015 16:34:41 +0900
Message-Id: <1448868893-4575-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
References: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

This if-block has been here since the introduction of the common
clock framework.  Now no clock drivers are statically initialized.
core->parent is always NULL at this point.  Drop the redundant
check and the confusing comment.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 36373d3..66c6f34 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2348,11 +2348,8 @@ static int __clk_core_init(struct clk_core *core)
 	 * in to clk_init during early boot; thus any access to core->parents[]
 	 * must always check for a NULL pointer and try to populate it if
 	 * necessary.
-	 *
-	 * If core->parents is not NULL we skip this entire block.  This allows
-	 * for clock drivers to statically initialize core->parents.
 	 */
-	if (core->num_parents > 1 && !core->parents) {
+	if (core->num_parents > 1) {
 		core->parents = kcalloc(core->num_parents, sizeof(struct clk *),
 					GFP_KERNEL);
 		/*
-- 
1.9.1
