Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/16] clk: simplify clk_core_get_parent_by_index()
Date: Mon, 28 Dec 2015 19:10:20 +0900
Message-Id: <1451297429-21689-8-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
References: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Drop the "if (!core->parents)" case and refactor the function a bit
because core->parents is always allocated.  (Strictly speaking, it is
ZERO_SIZE_PTR if core->num_parents == 0, but such a case is omitted
by the if-conditional above.)

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/clk/clk.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b5be02a..ca7849a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -350,13 +350,12 @@ static struct clk_core *clk_core_get_parent_by_index(struct clk_core *core,
 {
 	if (!core || index >= core->num_parents)
 		return NULL;
-	else if (!core->parents)
-		return clk_core_lookup(core->parent_names[index]);
-	else if (!core->parents[index])
-		return core->parents[index] =
-			clk_core_lookup(core->parent_names[index]);
-	else
-		return core->parents[index];
+
+	if (!core->parents[index])
+		core->parents[index] =
+				clk_core_lookup(core->parent_names[index]);
+
+	return core->parents[index];
 }
 
 struct clk_hw *
-- 
1.9.1
