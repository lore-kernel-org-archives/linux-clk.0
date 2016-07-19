Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] clk: avoid adding clock provider multiple times for one node
Date: Tue, 19 Jul 2016 18:21:35 +0900
Message-Id: <1468920098-8553-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1468920098-8553-1-git-send-email-yamada.masahiro@socionext.com>
References: <1468920098-8553-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

It is insane to add multiple OF clock providers against one device
node.

Let of_clk_add(_hw)_provider() fail with -EEXIST if the given node
is already associated with an OF clock provider.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e8c79a7..7832343 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3038,15 +3038,24 @@ int of_clk_add_provider(struct device_node *np,
 	struct of_clk_provider *cp;
 	int ret;
 
+	mutex_lock(&of_clk_mutex);
+
+	cp = __of_clk_find_provider(np);
+	if (cp) {
+		mutex_unlock(&of_clk_mutex);
+		return -EEXIST;
+	}
+
 	cp = kzalloc(sizeof(struct of_clk_provider), GFP_KERNEL);
-	if (!cp)
+	if (!cp) {
+		mutex_unlock(&of_clk_mutex);
 		return -ENOMEM;
+	}
 
 	cp->node = of_node_get(np);
 	cp->data = data;
 	cp->get = clk_src_get;
 
-	mutex_lock(&of_clk_mutex);
 	list_add(&cp->link, &of_clk_providers);
 	mutex_unlock(&of_clk_mutex);
 	pr_debug("Added clock from %s\n", np->full_name);
@@ -3073,15 +3082,24 @@ int of_clk_add_hw_provider(struct device_node *np,
 	struct of_clk_provider *cp;
 	int ret;
 
+	mutex_lock(&of_clk_mutex);
+
+	cp = __of_clk_find_provider(np);
+	if (cp) {
+		mutex_unlock(&of_clk_mutex);
+		return -EEXIST;
+	}
+
 	cp = kzalloc(sizeof(*cp), GFP_KERNEL);
-	if (!cp)
+	if (!cp) {
+		mutex_unlock(&of_clk_mutex);
 		return -ENOMEM;
+	}
 
 	cp->node = of_node_get(np);
 	cp->data = data;
 	cp->get_hw = get;
 
-	mutex_lock(&of_clk_mutex);
 	list_add(&cp->link, &of_clk_providers);
 	mutex_unlock(&of_clk_mutex);
 	pr_debug("Added clk_hw provider from %s\n", np->full_name);
-- 
1.9.1
