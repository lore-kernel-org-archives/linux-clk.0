Return-Path: <hl@rock-chips.com>
From: Lin Huang <hl@rock-chips.com>
To: heiko@sntech.de,
	dianders@chromium.org,
	linus.walleij@linaro.org
Cc: linux-rockchip@lists.infradead.org,
	Lin Huang <hl@rock-chips.com>,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] clk: rockchip: add pclk_pd_pmu to the list of rk3288 critical clocks
Date: Tue, 11 Aug 2015 18:12:03 +0800
Message-Id: <1439287924-6988-1-git-send-email-hl@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

From: Heiko Stuebner <heiko@sntech.de>

pclk_pd_pmu needs to keep running and with the upcoming gpio clock
handling this is not always the case anymore. So add it to the list
of critical clocks for now.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Lin Huang <hl@rock-chips.com>
---
Changes in v5:
- Add From: Heiko Stuebner <heiko@sntech.de>
- Add Signed-off-by: Heiko Stuebner <heiko@sntech.de>

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
