Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: gxbb: expose CLKID_MMC_PCLK
Date: Wed,  6 Jul 2016 16:07:49 -0700
Message-Id: <20160706230749.9620-1-khilman@baylibre.com>
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

The MMC_PCLK is needed for the SD/eMMC driver.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 include/dt-bindings/clock/gxbb-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index f889d80246cb..5eb69ec74f6b 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -8,5 +8,6 @@
 #define CLKID_CPUCLK		1
 #define CLKID_CLK81		12
 #define CLKID_ETH		36
+#define CLKID_MMC_PCLK		66
 
 #endif /* __GXBB_CLKC_H */
-- 
2.9.0
