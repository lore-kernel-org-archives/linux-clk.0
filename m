Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 3/6] clk: rockchip: don't return NULL when registering inverter fails
Date: Mon, 15 Feb 2016 11:33:33 +0800
Message-Id: <1455507213-13037-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com>
References: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

Avoid return NULL if rockchip_clk_register_inverter fails, otherwise
rockchip_clk_register_branches print "unknown clock type". The acutal
case is that it's a known clock type but we fail to regiser it, which
may makes user confuse the reason of failure.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk-inverter.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/rockchip/clk-inverter.c b/drivers/clk/rockchip/clk-inverter.c
index 7cbf43b..dcb6e37 100644
--- a/drivers/clk/rockchip/clk-inverter.c
+++ b/drivers/clk/rockchip/clk-inverter.c
@@ -90,7 +90,7 @@ struct clk *rockchip_clk_register_inverter(const char *name,
 
 	inv_clock = kmalloc(sizeof(*inv_clock), GFP_KERNEL);
 	if (!inv_clock)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
 	init.num_parents = num_parents;
@@ -106,11 +106,7 @@ struct clk *rockchip_clk_register_inverter(const char *name,
 
 	clk = clk_register(NULL, &inv_clock->hw);
 	if (IS_ERR(clk))
-		goto err_free;
+		kfree(inv_clock);
 
 	return clk;
-
-err_free:
-	kfree(inv_clock);
-	return NULL;
 }
-- 
2.3.7
