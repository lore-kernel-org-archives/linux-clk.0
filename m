Return-Path: <christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	mcoquelin.stm32@gmail.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] clk: stm32f4: fix error handling
Date: Sun,  3 Jul 2016 08:06:43 +0200
Message-Id: <1467526003-13318-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-ID: <linux-clk.vger.kernel.org>

This is likely that checking 'clks[idx]' instead of 'clks[n]' is
expected here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/clk-stm32f4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index b6ca33f..02d6810 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -364,7 +364,7 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 		    NULL, gd->name, gd->parent_name, gd->flags,
 		    base + gd->offset, gd->bit_idx, 0, &stm32f4_clk_lock);
 
-		if (IS_ERR(clks[n])) {
+		if (IS_ERR(clks[idx])) {
 			pr_err("%s: Unable to register leaf clock %s\n",
 			       np->full_name, gd->name);
 			goto fail;
-- 
2.7.4
