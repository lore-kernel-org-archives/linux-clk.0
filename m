Return-Path: <david@lechnology.com>
From: David Lechner <david@lechnology.com>
To: linux-clk@vger.kernel.org
Cc: David Lechner <david@lechnology.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 5/7] clk: rockchip: make use of clk_alloc_onecell_data()
Date: Thu,  4 Jan 2018 18:38:10 -0600
Message-Id: <1515112695-3160-6-git-send-email-david@lechnology.com>
In-Reply-To: <1515112695-3160-1-git-send-email-david@lechnology.com>
References: <1515112695-3160-1-git-send-email-david@lechnology.com>
List-ID: <linux-clk.vger.kernel.org>

Use helper function clk_alloc_onecell_data() to allocate struct
clk_onecell_data.

Signed-off-by: David Lechner <david@lechnology.com>
---
 drivers/clk/rockchip/clk-rockchip.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rockchip.c b/drivers/clk/rockchip/clk-rockchip.c
index 2c9bb81..499af3a 100644
--- a/drivers/clk/rockchip/clk-rockchip.c
+++ b/drivers/clk/rockchip/clk-rockchip.c
@@ -52,19 +52,12 @@ static void __init rk2928_gate_clk_init(struct device_node *node)
 	if (!reg)
 		return;
 
-	clk_data = kzalloc(sizeof(struct clk_onecell_data), GFP_KERNEL);
+	clk_data = clk_alloc_onecell_data(qty);
 	if (!clk_data) {
 		iounmap(reg);
 		return;
 	}
 
-	clk_data->clks = kzalloc(qty * sizeof(struct clk *), GFP_KERNEL);
-	if (!clk_data->clks) {
-		kfree(clk_data);
-		iounmap(reg);
-		return;
-	}
-
 	flags = CLK_GATE_HIWORD_MASK | CLK_GATE_SET_TO_DISABLE;
 
 	for (i = 0; i < qty; i++) {
@@ -91,8 +84,6 @@ static void __init rk2928_gate_clk_init(struct device_node *node)
 		WARN_ON(IS_ERR(clk_data->clks[i]));
 	}
 
-	clk_data->clk_num = qty;
-
 	of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 }
 CLK_OF_DECLARE(rk2928_gate, "rockchip,rk2928-gate-clk", rk2928_gate_clk_init);
-- 
2.7.4
