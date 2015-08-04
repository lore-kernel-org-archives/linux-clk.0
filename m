Return-Path: <hl@rock-chips.com>
From: Lin Huang <hl@rock-chips.com>
To: heiko@sntech.de,
	dianders@chromium.org
Cc: linux-rockchip@lists.infradead.org,
	Lin Huang <hl@rock-chips.com>,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] clk: rockchip: add pclk_pd_pmu to the list of rk3288 critical clocks
Date: Tue,  4 Aug 2015 14:41:26 +0800
Message-Id: <1438670487-27598-1-git-send-email-hl@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

pclk_pd_pmu needs to keep running and with the upcoming gpio clock
handling this is not always the case anymore. So add it to the list
of critical clocks for now.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Lin Huang <hl@rock-chips.com>
---
Changes in v3:
-match the author and Signed-off-by name

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
