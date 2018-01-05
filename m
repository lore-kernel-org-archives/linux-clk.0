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
Subject: [PATCH 4/7] clk: hisilicon: make use of clk_alloc_onecell_data()
Date: Thu,  4 Jan 2018 18:38:09 -0600
Message-Id: <1515112695-3160-5-git-send-email-david@lechnology.com>
In-Reply-To: <1515112695-3160-1-git-send-email-david@lechnology.com>
References: <1515112695-3160-1-git-send-email-david@lechnology.com>
List-ID: <linux-clk.vger.kernel.org>

Use helper function clk_alloc_onecell_data() to allocate struct
clk_onecell_data.

Signed-off-by: David Lechner <david@lechnology.com>
---
 drivers/clk/hisilicon/clk-hi3620.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3620.c b/drivers/clk/hisilicon/clk-hi3620.c
index 77072c7..15f8d50 100644
--- a/drivers/clk/hisilicon/clk-hi3620.c
+++ b/drivers/clk/hisilicon/clk-hi3620.c
@@ -476,21 +476,16 @@ static void __init hi3620_mmc_clk_init(struct device_node *node)
 		return;
 	}
 
-	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
+	clk_data = clk_alloc_onecell_data(num);
 	if (WARN_ON(!clk_data))
 		return;
 
-	clk_data->clks = kcalloc(num, sizeof(*clk_data->clks), GFP_KERNEL);
-	if (!clk_data->clks)
-		return;
-
 	for (i = 0; i < num; i++) {
 		struct hisi_mmc_clock *mmc_clk = &hi3620_mmc_clks[i];
 		clk_data->clks[mmc_clk->id] =
 			hisi_register_clk_mmc(mmc_clk, base, node);
 	}
 
-	clk_data->clk_num = num;
 	of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 }
 
-- 
2.7.4
