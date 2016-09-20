Return-Path: <>
Return-Path: <>
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: ssantosh@kernel.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] clk: keystone: pll: Unmap region obtained by of_iomap
Date: Tue, 20 Sep 2016 17:16:55 +0530
Message-Id: <1474372015-16301-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Arvind Yadav <arvind.yadav.cs@gmail.com>

Free memory mapping, if of_pll_div_clk_init is not successful.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/clk/keystone/pll.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/keystone/pll.c b/drivers/clk/keystone/pll.c
index a26ba21..cba9a0e 100644
--- a/drivers/clk/keystone/pll.c
+++ b/drivers/clk/keystone/pll.c
@@ -267,25 +267,30 @@ static void __init of_pll_div_clk_init(struct device_node *node)
 	parent_name = of_clk_get_parent_name(node, 0);
 	if (!parent_name) {
 		pr_err("%s: missing parent clock\n", __func__);
+		iounmap(reg);
 		return;
 	}
 
 	if (of_property_read_u32(node, "bit-shift", &shift)) {
 		pr_err("%s: missing 'shift' property\n", __func__);
+		iounmap(reg);
 		return;
 	}
 
 	if (of_property_read_u32(node, "bit-mask", &mask)) {
 		pr_err("%s: missing 'bit-mask' property\n", __func__);
+		iounmap(reg);
 		return;
 	}
 
 	clk = clk_register_divider(NULL, clk_name, parent_name, 0, reg, shift,
 				 mask, 0, NULL);
-	if (clk)
+	if (clk) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
-	else
+	} else {
 		pr_err("%s: error registering divider %s\n", __func__, clk_name);
+		iounmap(reg);
+	}
 }
 CLK_OF_DECLARE(pll_divider_clock, "ti,keystone,pll-divider-clock", of_pll_div_clk_init);
 
-- 
1.7.9.5
