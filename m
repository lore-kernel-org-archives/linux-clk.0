Return-Path: <shunqian.zheng@gmail.com>
Return-Path: <shunqian.zheng@gmail.com>
From: Shunqian Zheng <zhengsq@rock-chips.com>
To: zhengxing@rock-chips.com,
	heiko@sntech.de,
	sboyd@codeaurora.org,
	mturquette@baylibre.com,
	dianders@chromium.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	zhangqing@rock-chips.com,
	linux-kernel@vger.kernel.org,
	Shunqian Zheng <zhengsq@rock-chips.com>
Subject: [PATCH] clk: rockchip: add 2016M to big cpu clk rate table
Date: Thu,  1 Sep 2016 07:06:22 +0800
Message-Id: <1472684782-17940-1-git-send-email-zhengsq@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

We would prefer the 2016M as 2.0G than 1992M which seems odd, adding
it to big cpu clk rate table then we can set 2016M in dts.

Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
---
 drivers/clk/rockchip/clk-rk3399.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index ede6c47..a6a15c6 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -375,6 +375,7 @@ static struct rockchip_cpuclk_rate_table rk3399_cpuclkb_rates[] __initdata = {
 	RK3399_CPUCLKB_RATE(2184000000, 1, 11, 11),
 	RK3399_CPUCLKB_RATE(2088000000, 1, 10, 10),
 	RK3399_CPUCLKB_RATE(2040000000, 1, 10, 10),
+	RK3399_CPUCLKB_RATE(2016000000, 1, 9, 9),
 	RK3399_CPUCLKB_RATE(1992000000, 1, 9, 9),
 	RK3399_CPUCLKB_RATE(1896000000, 1, 9, 9),
 	RK3399_CPUCLKB_RATE(1800000000, 1, 8, 8),
-- 
1.9.1
