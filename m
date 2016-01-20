Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	xf@rock-chips.com,
	zhangqing@rock-chips.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/4] clk: rockchip: fix rk3368 cpuclk core dividers
Date: Wed, 20 Jan 2016 22:49:18 +0100
Message-Id: <1453326560-20475-2-git-send-email-heiko@sntech.de>
In-Reply-To: <1453326560-20475-1-git-send-email-heiko@sntech.de>
References: <1453326560-20475-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

Similar to commit 9880d4277f6a ("clk: rockchip: fix rk3288 cpuclk core
dividers") it seems the cpuclk dividers are one to high on the rk3368
as well.

And again similar to the previous fix, we opt to make the divider list
contain the values to be written to use the same paradigm for them on all
supported socs.

Fixes: 3536c97a52db ("clk: rockchip: add rk3368 clock controller")
Reported-by: Zhang Qing <zhangqing@rock-chips.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3368.c | 40 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index f6667b8..3c9733e 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -218,29 +218,29 @@ static const struct rockchip_cpuclk_reg_data rk3368_cpuclkl_data = {
 	}
 
 static struct rockchip_cpuclk_rate_table rk3368_cpuclkb_rates[] __initdata = {
-	RK3368_CPUCLKB_RATE(1512000000, 2, 6, 6),
-	RK3368_CPUCLKB_RATE(1488000000, 2, 5, 5),
-	RK3368_CPUCLKB_RATE(1416000000, 2, 5, 5),
-	RK3368_CPUCLKB_RATE(1200000000, 2, 4, 4),
-	RK3368_CPUCLKB_RATE(1008000000, 2, 4, 4),
-	RK3368_CPUCLKB_RATE( 816000000, 2, 3, 3),
-	RK3368_CPUCLKB_RATE( 696000000, 2, 3, 3),
-	RK3368_CPUCLKB_RATE( 600000000, 2, 2, 2),
-	RK3368_CPUCLKB_RATE( 408000000, 2, 2, 2),
-	RK3368_CPUCLKB_RATE( 312000000, 2, 2, 2),
+	RK3368_CPUCLKB_RATE(1512000000, 1, 5, 5),
+	RK3368_CPUCLKB_RATE(1488000000, 1, 4, 4),
+	RK3368_CPUCLKB_RATE(1416000000, 1, 4, 4),
+	RK3368_CPUCLKB_RATE(1200000000, 1, 3, 3),
+	RK3368_CPUCLKB_RATE(1008000000, 1, 3, 3),
+	RK3368_CPUCLKB_RATE( 816000000, 1, 2, 2),
+	RK3368_CPUCLKB_RATE( 696000000, 1, 2, 2),
+	RK3368_CPUCLKB_RATE( 600000000, 1, 1, 1),
+	RK3368_CPUCLKB_RATE( 408000000, 1, 1, 1),
+	RK3368_CPUCLKB_RATE( 312000000, 1, 1, 1),
 };
 
 static struct rockchip_cpuclk_rate_table rk3368_cpuclkl_rates[] __initdata = {
-	RK3368_CPUCLKL_RATE(1512000000, 2, 7, 7),
-	RK3368_CPUCLKL_RATE(1488000000, 2, 6, 6),
-	RK3368_CPUCLKL_RATE(1416000000, 2, 6, 6),
-	RK3368_CPUCLKL_RATE(1200000000, 2, 5, 5),
-	RK3368_CPUCLKL_RATE(1008000000, 2, 5, 5),
-	RK3368_CPUCLKL_RATE( 816000000, 2, 4, 4),
-	RK3368_CPUCLKL_RATE( 696000000, 2, 3, 3),
-	RK3368_CPUCLKL_RATE( 600000000, 2, 3, 3),
-	RK3368_CPUCLKL_RATE( 408000000, 2, 2, 2),
-	RK3368_CPUCLKL_RATE( 312000000, 2, 2, 2),
+	RK3368_CPUCLKL_RATE(1512000000, 1, 6, 6),
+	RK3368_CPUCLKL_RATE(1488000000, 1, 5, 5),
+	RK3368_CPUCLKL_RATE(1416000000, 1, 5, 5),
+	RK3368_CPUCLKL_RATE(1200000000, 1, 4, 4),
+	RK3368_CPUCLKL_RATE(1008000000, 1, 4, 4),
+	RK3368_CPUCLKL_RATE( 816000000, 1, 3, 3),
+	RK3368_CPUCLKL_RATE( 696000000, 1, 2, 2),
+	RK3368_CPUCLKL_RATE( 600000000, 1, 2, 2),
+	RK3368_CPUCLKL_RATE( 408000000, 1, 1, 1),
+	RK3368_CPUCLKL_RATE( 312000000, 1, 1, 1),
 };
 
 static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
-- 
2.6.4
