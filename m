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
Subject: [PATCH 7/7] clk: rockchip: fix a typo for rockchip_rk3399_pll_set_params
Date: Sun, 13 Mar 2016 00:26:02 +0800
Message-Id: <1457799962-3308-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1457799871-3015-1-git-send-email-shawn.lin@rock-chips.com>
References: <1457799871-3015-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index f490ce4..128a6b2 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -733,7 +733,7 @@ static int rockchip_rk3399_pll_set_params(struct rockchip_clk_pll *pll,
 	/* wait for the pll to lock */
 	ret = rockchip_rk3399_pll_wait_lock(pll);
 	if (ret) {
-		pr_warn("%s: pll update unsucessful, trying to restore old params\n",
+		pr_warn("%s: pll update unsuccessful, trying to restore old params\n",
 			__func__);
 		rockchip_rk3399_pll_set_params(pll, &cur);
 	}
-- 
2.3.7
