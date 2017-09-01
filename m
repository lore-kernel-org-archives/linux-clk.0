Return-Path: <zhangqing@rock-chips.com>
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	heiko@sntech.de
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xxx@rock-chips.com,
	xf@rock-chips.com,
	huangtao@rock-chips.com,
	cl@rock-chips.com,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 3/3] clk: rockchip: rk3126: add sclk_timer5 as critical clock
Date: Fri,  1 Sep 2017 10:01:46 +0800
Message-Id: <1504231306-4450-4-git-send-email-zhangqing@rock-chips.com>
In-Reply-To: <1504231306-4450-1-git-send-email-zhangqing@rock-chips.com>
References: <1504231306-4450-1-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

sclk_timer5 is for arm arch counter, so need always on.
but no dts node to handle this clk, so make it as critical clock

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 drivers/clk/rockchip/clk-rk3128.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3128.c b/drivers/clk/rockchip/clk-rk3128.c
index ce02d2cff608..5970a50671b9 100644
--- a/drivers/clk/rockchip/clk-rk3128.c
+++ b/drivers/clk/rockchip/clk-rk3128.c
@@ -578,6 +578,7 @@ enum rk3128_plls {
 	"hclk_peri",
 	"pclk_peri",
 	"pclk_pmu",
+	"sclk_timer5",
 };
 
 static struct rockchip_clk_provider *__init rk3128_common_clk_init(struct device_node *np)
-- 
1.9.1
