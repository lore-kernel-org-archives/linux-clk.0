Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Xing Zheng <zhengxing@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 6/7] clk: rockchip: remove redundant checking of device_node
Date: Sun, 13 Mar 2016 00:25:53 +0800
Message-Id: <1457799953-3267-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1457799871-3015-1-git-send-email-shawn.lin@rock-chips.com>
References: <1457799871-3015-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

rockchip_clk_of_add_provider is used by sub-clk driver which
already call of_iomap before calling it. If device_node does
not exist, of_iomap returns NULL which will fail to init the
sub-clk driver. So really it's redundant.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index c12db69..7345be4 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -357,11 +357,9 @@ err_free:
 void __init rockchip_clk_of_add_provider(struct device_node *np,
 				struct rockchip_clk_provider *ctx)
 {
-	if (np) {
-		if (of_clk_add_provider(np, of_clk_src_onecell_get,
-					&ctx->clk_data))
-			pr_err("%s: could not register clk provider\n", __func__);
-	}
+	if (of_clk_add_provider(np, of_clk_src_onecell_get,
+				&ctx->clk_data))
+		pr_err("%s: could not register clk provider\n", __func__);
 }
 
 struct regmap *rockchip_clk_get_grf(struct rockchip_clk_provider *ctx)
-- 
2.3.7
