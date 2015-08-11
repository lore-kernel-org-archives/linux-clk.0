Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Shunqian Zheng <zhengsq@rock-chips.com>
To: gregkh@linuxfoundation.org, srinivas.kandagatla@linaro.org,
	maxime.ripard@free-electrons.com, heiko@sntech.de,
	caesar.wang@rock-chips.com
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, dianders@chromium.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	xjq@rock-chips.com, ZhengShunQian <zhengsq@rock-chips.com>
Subject: [PATCH v2 1/5] clk: rockchip: rk3288: Add the clock id of eFuse
Date: Tue, 11 Aug 2015 18:13:40 +0800
Message-Id: <1439288024-13359-2-git-send-email-zhengsq@rock-chips.com>
In-Reply-To: <1439288024-13359-1-git-send-email-zhengsq@rock-chips.com>
References: <1439288024-13359-1-git-send-email-zhengsq@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: ZhengShunQian <zhengsq@rock-chips.com>

The clock id is necessary item, changing it from 0
then can be referred in driver and device tree.

Signed-off-by: ZhengShunQian <zhengsq@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3288.c      | 2 +-
 include/dt-bindings/clock/rk3288-cru.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 0df5bae..31c4f78 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -647,7 +647,7 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	GATE(0, "pclk_efuse_1024", "pclk_cpu", 0, RK3288_CLKGATE_CON(11), 2, GFLAGS),
 	GATE(PCLK_TZPC, "pclk_tzpc", "pclk_cpu", 0, RK3288_CLKGATE_CON(11), 3, GFLAGS),
 	GATE(PCLK_UART2, "pclk_uart2", "pclk_cpu", 0, RK3288_CLKGATE_CON(11), 9, GFLAGS),
-	GATE(0, "pclk_efuse_256", "pclk_cpu", 0, RK3288_CLKGATE_CON(11), 10, GFLAGS),
+	GATE(PCLK_EFUSE256, "pclk_efuse_256", "pclk_cpu", 0, RK3288_CLKGATE_CON(11), 10, GFLAGS),
 	GATE(PCLK_RKPWM, "pclk_rkpwm", "pclk_cpu", CLK_IGNORE_UNUSED, RK3288_CLKGATE_CON(11), 11, GFLAGS),
 
 	/* ddrctrl [DDR Controller PHY clock] gates */
diff --git a/include/dt-bindings/clock/rk3288-cru.h b/include/dt-bindings/clock/rk3288-cru.h
index c719aac..ab74d5e 100644
--- a/include/dt-bindings/clock/rk3288-cru.h
+++ b/include/dt-bindings/clock/rk3288-cru.h
@@ -164,6 +164,7 @@
 #define PCLK_DDRUPCTL1		366
 #define PCLK_PUBL1		367
 #define PCLK_WDT		368
+#define PCLK_EFUSE256		369
 
 /* hclk gates */
 #define HCLK_GPS		448
-- 
1.9.1

