Return-Path: <hl@rock-chips.com>
From: huang lin <hl@rock-chips.com>
To: heiko@sntech.de,
	dianders@chromium.org
Cc: linux-rockchip@lists.infradead.org,
	huang lin <hl@rock-chips.com>,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] clk: rockchip: add pclk_pd_pmu to the list of rk3288 critical clocks
Date: Mon,  3 Aug 2015 11:56:50 +0800
Message-Id: <1438574211-4887-1-git-send-email-hl@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

pclk_pd_pmu needs to keep running and with the upcoming gpio clock
handling this is not always the case anymore. So add it to the list
of critical clocks for now.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Signed-off-by: huang lin <hl@rock-chips.com>
---
 drivers/clk/rockchip/clk-rk3288.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 0df5bae..9040878 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -780,6 +780,7 @@ static const char *const rk3288_critical_clocks[] __initconst = {
 	"aclk_cpu",
 	"aclk_peri",
 	"hclk_peri",
+	"pclk_pd_pmu",
 };
 
 #ifdef CONFIG_PM_SLEEP
-- 
1.9.1
