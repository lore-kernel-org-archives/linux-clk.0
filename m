Return-Path: <zhangqing@rock-chips.com>
From: Elaine Zhang <zhangqing@rock-chips.com>
To: heiko@sntech.de,
	xf@rock-chips.com
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	huangtao@rock-chips.com,
	xxx@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v2 1/4] clk: rockchip: rk3036: make pclk_ddrupctl as critical_clock
Date: Tue, 28 Mar 2017 18:06:51 +0800
Message-Id: <1490695614-3220-2-git-send-email-zhangqing@rock-chips.com>
In-Reply-To: <1490695614-3220-1-git-send-email-zhangqing@rock-chips.com>
References: <1490695614-3220-1-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 drivers/clk/rockchip/clk-rk3036.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 924f560dcf80..e97bee585b2f 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -436,6 +436,7 @@ enum rk3036_plls {
 	"aclk_peri",
 	"hclk_peri",
 	"pclk_peri",
+	"pclk_ddrupctl",
 };
 
 static void __init rk3036_clk_init(struct device_node *np)
-- 
1.9.1
