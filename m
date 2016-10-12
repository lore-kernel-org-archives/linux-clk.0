Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Lin Huang <hl@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] clk: rockchip: don't return NULL when failing to register ddrclk branch
Date: Wed, 12 Oct 2016 20:31:41 +0800
Message-Id: <1476275501-2653-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

rockchip_clk_register_ddrclk should not return NULL when faling
to call clk_register, otherwise rockchip_clk_register_branches
prints "unknown clock type". The acutal case is that it's a known
clock type but we fail to regiser it, which may makes user confuse
the reason of failure. And the pr_err here is pointless as
rockchip_clk_register_branches will also print the similar message.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-ddr.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-ddr.c b/drivers/clk/rockchip/clk-ddr.c
index 8feba93..e807535 100644
--- a/drivers/clk/rockchip/clk-ddr.c
+++ b/drivers/clk/rockchip/clk-ddr.c
@@ -144,11 +144,8 @@ struct clk *rockchip_clk_register_ddrclk(const char *name, int flags,
 	ddrclk->ddr_flag = ddr_flag;
 
 	clk = clk_register(NULL, &ddrclk->hw);
-	if (IS_ERR(clk)) {
-		pr_err("%s: could not register ddrclk %s\n", __func__,	name);
+	if (IS_ERR(clk))
 		kfree(ddrclk);
-		return NULL;
-	}
 
 	return clk;
 }
-- 
2.3.7
