Return-Path: <christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lars@metafoo.de,
	dan.carpenter@oracle.com,
	ssantosh@kernel.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/3] clk: keystone: Fix an error checking
Date: Mon, 24 Oct 2016 22:43:24 +0200
Message-Id: <ff1de6a7af60b4e3804162e553d7174e2ad1ea16.1477339880.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1477339880.git.christophe.jaillet@wanadoo.fr>
References: <cover.1477339880.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1477339880.git.christophe.jaillet@wanadoo.fr>
References: <cover.1477339880.git.christophe.jaillet@wanadoo.fr>
List-ID: <linux-clk.vger.kernel.org>

clk_register_pll() can return ERR_PTR(-ENOMEM) so checking the return value
against NULL only is not correct.
In order to fix it, update clk_register_pll() to always return an error
pointer in case of error and check the return value with IS_ERR.

While at it, also fix a tab vs space in the surrounding code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Un-compiled and un-tested.
---
 drivers/clk/keystone/pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/keystone/pll.c b/drivers/clk/keystone/pll.c
index a26ba2184454..70d6fb2d23bc 100644
--- a/drivers/clk/keystone/pll.c
+++ b/drivers/clk/keystone/pll.c
@@ -140,7 +140,7 @@ static struct clk *clk_register_pll(struct device *dev,
 	init.parent_names = (parent_name ? &parent_name : NULL);
 	init.num_parents = (parent_name ? 1 : 0);
 
-	pll->pll_data	= pll_data;
+	pll->pll_data = pll_data;
 	pll->hw.init = &init;
 
 	clk = clk_register(NULL, &pll->hw);
@@ -150,7 +150,7 @@ static struct clk *clk_register_pll(struct device *dev,
 	return clk;
 out:
 	kfree(pll);
-	return NULL;
+	return clk;
 }
 
 /**
@@ -213,7 +213,7 @@ static void __init _of_pll_clk_init(struct device_node *node, bool pllctrl)
 	}
 
 	clk = clk_register_pll(NULL, node->name, parent_name, pll_data);
-	if (clk) {
+	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		return;
 	}
-- 
2.9.3
