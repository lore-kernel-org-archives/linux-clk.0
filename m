Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/7] clk: rockchip: lookup General Register Files in rockchip_clk_init
Date: Thu, 28 Apr 2016 15:11:09 +0200
Message-Id: <1461849075-8310-2-git-send-email-heiko@sntech.de>
In-Reply-To: <1461849075-8310-1-git-send-email-heiko@sntech.de>
References: <1461849075-8310-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

In the distant past syscons were initialized pretty late and weren't
available at the time the clock init ran. As the GRF is mainly needed
for PLL lock-status checking, we had this lazy init that tried to grab
the syscon on PLL rate changes and denied these changes if it was not
available.

These days syscons are available very early and recent addition to
rockchip clocks, like the PLL clk_init actually also rely on them
being available at that time, so there is no need to keep that lazy
init around, as it will also result in some more simplifications in
other parts of the clock-code.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 7345be4..af6d47b 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -347,6 +347,9 @@ struct rockchip_clk_provider * __init rockchip_clk_init(struct device_node *np,
 	ctx->grf = ERR_PTR(-EPROBE_DEFER);
 	spin_lock_init(&ctx->lock);
 
+	ctx->grf = syscon_regmap_lookup_by_phandle(ctx->cru_node,
+						   "rockchip,grf");
+
 	return ctx;
 
 err_free:
@@ -364,9 +367,6 @@ void __init rockchip_clk_of_add_provider(struct device_node *np,
 
 struct regmap *rockchip_clk_get_grf(struct rockchip_clk_provider *ctx)
 {
-	if (IS_ERR(ctx->grf))
-		ctx->grf = syscon_regmap_lookup_by_phandle(ctx->cru_node,
-							   "rockchip,grf");
 	return ctx->grf;
 }
 
-- 
2.6.4
