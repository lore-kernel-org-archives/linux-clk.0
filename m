Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: linux-clk@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/2] clk: rockchip: add clock ids for memory controller parts on rk3066/rk3188
Date: Fri, 13 Jan 2017 17:47:51 +0100
Message-Id: <20170113164752.25368-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

Add clock ids for the upctl and publ controllers used for ddr control.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
Posted for public reference :-)

 include/dt-bindings/clock/rk3188-cru-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/rk3188-cru-common.h b/include/dt-bindings/clock/rk3188-cru-common.h
index d141c1f0c778..eff4319d008b 100644
--- a/include/dt-bindings/clock/rk3188-cru-common.h
+++ b/include/dt-bindings/clock/rk3188-cru-common.h
@@ -108,6 +108,8 @@
 #define PCLK_TSADC		349
 #define PCLK_CPU		350
 #define PCLK_PERI		351
+#define PCLK_DDRUPCTL		352
+#define PCLK_PUBL		353
 
 /* hclk gates */
 #define HCLK_SDMMC		448
-- 
2.11.0
