Return-Path: <clabbe.montjoie@gmail.com>
Return-Path: <clabbe.montjoie@gmail.com>
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: emilio@elopez.com.ar,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	maxime.ripard@free-electrons.com,
	wens@csie.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH] clk: sunxi: fix build warning
Date: Thu, 19 Oct 2017 21:09:48 +0200
Message-Id: <20171019190948.5754-1-clabbe.montjoie@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

This patch fix the following build warning:
drivers/clk/sunxi/clk-factors.c:279:14: warning: variable 'name' set but not used [-Wunused-but-set-variable]

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 drivers/clk/sunxi/clk-factors.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
index dfe5e3e32d28..856fef65433b 100644
--- a/drivers/clk/sunxi/clk-factors.c
+++ b/drivers/clk/sunxi/clk-factors.c
@@ -276,13 +276,11 @@ void sunxi_factors_unregister(struct device_node *node, struct clk *clk)
 {
 	struct clk_hw *hw = __clk_get_hw(clk);
 	struct clk_factors *factors;
-	const char *name;
 
 	if (!hw)
 		return;
 
 	factors = to_clk_factors(hw);
-	name = clk_hw_get_name(hw);
 
 	of_clk_del_provider(node);
 	/* TODO: The composite clock stuff will leak a bit here. */
-- 
2.13.6
