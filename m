Return-Path: <christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: ssantosh@kernel.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] clk: keystone: Fix an error checking
Date: Sun, 23 Oct 2016 10:12:49 +0200
Message-Id: <20161023081249.24668-1-christophe.jaillet@wanadoo.fr>
List-ID: <linux-clk.vger.kernel.org>

clk_register_pll() can return ERR_PTR(-ENOMEM) so here the check against
NULL only is not correct.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Un-compiled and un-tested.
---
 drivers/clk/keystone/pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/keystone/pll.c b/drivers/clk/keystone/pll.c
index a26ba2184454..b936029fa211 100644
--- a/drivers/clk/keystone/pll.c
+++ b/drivers/clk/keystone/pll.c
@@ -213,7 +213,7 @@ static void __init _of_pll_clk_init(struct device_node *node, bool pllctrl)
 	}
 
 	clk = clk_register_pll(NULL, node->name, parent_name, pll_data);
-	if (clk) {
+	if (!IS_ERR_OR_NULL(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		return;
 	}
-- 
2.9.3
