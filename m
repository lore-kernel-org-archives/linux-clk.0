Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	sboyd@codeaurora.org,
	mturquette@baylibre.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/4] clk: rockchip: add SCLK_UARTPLL to rk3036 clock ids
Date: Tue, 28 Feb 2017 06:14:18 +0100
Message-Id: <20170228051420.7214-3-heiko@sntech.de>
In-Reply-To: <20170228051420.7214-1-heiko@sntech.de>
References: <20170228051420.7214-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

Systems might need it, if they want to assign the pll-mux shared
by all uart clocks to some specific pll.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 include/dt-bindings/clock/rk3036-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3036-cru.h b/include/dt-bindings/clock/rk3036-cru.h
index de44109a3a04..58dd05af77e2 100644
--- a/include/dt-bindings/clock/rk3036-cru.h
+++ b/include/dt-bindings/clock/rk3036-cru.h
@@ -56,6 +56,7 @@
 #define SCLK_MACREF		152
 #define SCLK_MACPLL		153
 #define SCLK_SFC		160
+#define SCLK_UARTPLL		161
 
 /* aclk gates */
 #define ACLK_DMAC2		194
-- 
2.11.0
