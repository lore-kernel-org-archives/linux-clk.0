Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: fix __clk_init_parent() for single parent clocks
Date: Tue,  9 Feb 2016 20:19:14 +0900
Message-Id: <1455016754-26006-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Before commit b3d192d5121f ("clk: simplify __clk_init_parent()"),
__clk_init_parent() called .get_parent() only for multi-parent
clocks.  That commit changed the behavior to call .get_parent()
if available even for single-parent clocks and root clocks.

It turned out a problem because there are some single-parent clocks
that implement .get_parent() callback and return non-zero index.
The SOCFPGA clock is the case; the commit broke the SOCFPGA boards.

To keep the original behavior, invoke .get_parent() only when
num_parents is greater than 1.

Fixes: b3d192d5121f ("clk: simplify __clk_init_parent()")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reported-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---

 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e2aa0bc..38515a9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1662,7 +1662,7 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
 {
 	u8 index = 0;
 
-	if (core->ops->get_parent)
+	if (core->num_parents > 1 && core->ops->get_parent)
 		index = core->ops->get_parent(core->hw);
 
 	return clk_core_get_parent_by_index(core, index);
-- 
1.9.1
