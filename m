Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] clk: refactor of_clk_del_provider()
Date: Tue, 19 Jul 2016 18:21:36 +0900
Message-Id: <1468920098-8553-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1468920098-8553-1-git-send-email-yamada.masahiro@socionext.com>
References: <1468920098-8553-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Now, it is guaranteed that a single node does not appear twice in
the list of OF clock providers.  So, of_clk_del_provider() only
needs to free the first occurrence.  This can be implemented more
simply with __of_clk_find_provider().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7832343..60daf60 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3121,13 +3121,11 @@ void of_clk_del_provider(struct device_node *np)
 	struct of_clk_provider *cp;
 
 	mutex_lock(&of_clk_mutex);
-	list_for_each_entry(cp, &of_clk_providers, link) {
-		if (cp->node == np) {
-			list_del(&cp->link);
-			of_node_put(cp->node);
-			kfree(cp);
-			break;
-		}
+	cp = __of_clk_find_provider(np);
+	if (cp) {
+		list_del(&cp->link);
+		of_node_put(cp->node);
+		kfree(cp);
 	}
 	mutex_unlock(&of_clk_mutex);
 }
-- 
1.9.1
