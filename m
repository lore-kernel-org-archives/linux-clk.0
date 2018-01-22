Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-rockchip@lists.infradead.org,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	devicetree@vger.kernel.org,
	yang.zheng@rock-chips.com,
	zhangqing@rock-chips.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/7] clk: rockchip: remove HCLK_VIO from rk3328 dt header
Date: Mon, 22 Jan 2018 15:15:25 +0100
Message-Id: <20180122141530.12398-3-heiko@sntech.de>
In-Reply-To: <20180122141530.12398-1-heiko@sntech.de>
References: <20180122141530.12398-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

This clock is not hclk_vio but hclk_vio_niu, the clock for the interconnect
output. The clock got fixed and the id was never used in this incorrect form,
so remove it.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/dt-bindings/clock/rk3328-cru.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/rk3328-cru.h b/include/dt-bindings/clock/rk3328-cru.h
index d2b26a4b43eb..a82a0109faff 100644
--- a/include/dt-bindings/clock/rk3328-cru.h
+++ b/include/dt-bindings/clock/rk3328-cru.h
@@ -193,7 +193,6 @@
 #define HCLK_VPU_PRE		324
 #define HCLK_VIO_PRE		325
 #define HCLK_VPU		326
-#define HCLK_VIO		327
 #define HCLK_BUS_PRE		328
 #define HCLK_PERI_PRE		329
 #define HCLK_H264		330
-- 
2.14.2
