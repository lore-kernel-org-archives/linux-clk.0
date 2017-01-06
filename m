Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
From: Douglas Anderson <dianders@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	Douglas Anderson <dianders@chromium.org>,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: rockchip: Remove useless init of "grf" to -EPROBE_DEFER
Date: Fri,  6 Jan 2017 08:31:01 -0800
Message-Id: <20170106163101.32048-1-dianders@chromium.org>
List-ID: <linux-clk.vger.kernel.org>

When we used to defer setting the "grf" member to
rockchip_clk_get_grf() it was important to init the "grf" member to an
error value in rockchip_clk_init().  With recent changes, we now set
"grf" right in rockchip_clk_init() (two lines below the place where we
initted it).  That makes the old init useless.  Get rid of it.

Fixes: 6f339dc2719e ("clk: rockchip: lookup General Register Files in rockchip_clk_init")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/clk/rockchip/clk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 3abcbf441cc5..fe1d393cf678 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -344,7 +344,6 @@ struct rockchip_clk_provider * __init rockchip_clk_init(struct device_node *np,
 	ctx->clk_data.clks = clk_table;
 	ctx->clk_data.clk_num = nr_clks;
 	ctx->cru_node = np;
-	ctx->grf = ERR_PTR(-EPROBE_DEFER);
 	spin_lock_init(&ctx->lock);
 
 	ctx->grf = syscon_regmap_lookup_by_phandle(ctx->cru_node,
-- 
2.11.0.390.gc69c2f50cf-goog
