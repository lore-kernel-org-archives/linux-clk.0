Return-Path: <zhengxing@rock-chips.com>
From: Xing Zheng <zhengxing@rock-chips.com>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	zhengxing@rock-chips.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dianders@chromium.org,
	briannorris@chromium.org,
	huangtao@rock-chips.com,
	zhangqing@rock-chips.com
Subject: [PATCH v2 5/7] clk: rockchip: rk3399: add 65MHz and 106.5MHz clocks for HDMI
Date: Mon,  1 Aug 2016 17:36:59 +0800
Message-Id: <1470044219-29856-1-git-send-email-zhengxing@rock-chips.com>
In-Reply-To: <1470044016-29764-1-git-send-email-zhengxing@rock-chips.com>
References: <1470044016-29764-1-git-send-email-zhengxing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

We need to add more clocks for supporting more display resolution
for HDMI.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---

Changes in v2: None

 drivers/clk/rockchip/clk-rk3399.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 44e673e..580abf1 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -100,8 +100,10 @@ static struct rockchip_pll_rate_table rk3399_pll_rates[] = {
 	RK3036_PLL_RATE( 297000000, 1, 99, 4, 2, 1, 0),
 	RK3036_PLL_RATE( 216000000, 1, 72, 4, 2, 1, 0),
 	RK3036_PLL_RATE( 148500000, 1, 99, 4, 4, 1, 0),
+	RK3036_PLL_RATE( 106500000, 1, 71, 4, 4, 1, 0),
 	RK3036_PLL_RATE(  96000000, 1, 64, 4, 4, 1, 0),
 	RK3036_PLL_RATE(  74250000, 2, 99, 4, 4, 1, 0),
+	RK3036_PLL_RATE(  65000000, 1, 65, 6, 4, 1, 0),
 	RK3036_PLL_RATE(  54000000, 1, 54, 6, 4, 1, 0),
 	RK3036_PLL_RATE(  27000000, 1, 27, 6, 4, 1, 0),
 	{ /* sentinel */ },
-- 
1.7.9.5
