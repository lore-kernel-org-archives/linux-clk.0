Return-Path: <jacobchen110@gmail.com>
Return-Path: <jacobchen110@gmail.com>
From: Jacob Chen <jacob-chen@iotwrt.com>
To: heiko@sntech.de,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	zhangqing@rock-chips.com,
	zhengxing@rock-chips.com,
	Jacob Chen <jacob-chen@iotwrt.com>
Subject: [PATCH 1/4] clk: rockchip: add rk3288 isp_in clock ids
Date: Tue, 10 Jan 2017 19:59:17 +0800
Message-Id: <1484049560-14820-1-git-send-email-jacob-chen@iotwrt.com>
List-ID: <linux-clk.vger.kernel.org>

Add clock-ids for the isp block of the rk3288.


Signed-off-by: Jacob Chen <jacob-chen@iotwrt.com>
---
 include/dt-bindings/clock/rk3288-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3288-cru.h b/include/dt-bindings/clock/rk3288-cru.h
index 9a586e2..08de7de 100644
--- a/include/dt-bindings/clock/rk3288-cru.h
+++ b/include/dt-bindings/clock/rk3288-cru.h
@@ -168,6 +168,7 @@
 #define PCLK_WDT		368
 #define PCLK_EFUSE256		369
 #define PCLK_EFUSE1024		370
+#define PCLK_ISP_IN		371
 
 /* hclk gates */
 #define HCLK_GPS		448
-- 
2.7.4
