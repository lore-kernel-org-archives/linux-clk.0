Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	xf@rock-chips.com,
	zhangqing@rock-chips.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/4] clk: rockchip: fix cpuclk mux bit of big cpu-cluster
Date: Wed, 20 Jan 2016 22:49:17 +0100
Message-Id: <1453326560-20475-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

Both clusters have their mux bit in bit 7 of their respective register.
For whatever reason the big cluster currently lists bit 15 which is
definitly wrong.

Fixes: 3536c97a52db ("clk: rockchip: add rk3368 clock controller")
Reported-by: Zhang Qing <zhangqing@rock-chips.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
I plan to include them into my clk-fixes branch, so posted for reference
and possible objections ;-)

 drivers/clk/rockchip/clk-rk3368.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 21f3ea9..f6667b8 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -165,7 +165,7 @@ static const struct rockchip_cpuclk_reg_data rk3368_cpuclkb_data = {
 	.core_reg = RK3368_CLKSEL_CON(0),
 	.div_core_shift = 0,
 	.div_core_mask = 0x1f,
-	.mux_core_shift = 15,
+	.mux_core_shift = 7,
 };
 
 static const struct rockchip_cpuclk_reg_data rk3368_cpuclkl_data = {
-- 
2.6.4
