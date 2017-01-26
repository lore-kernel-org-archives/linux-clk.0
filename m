Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: gxbb: fix CLKID_ETH defined twice
Date: Thu, 26 Jan 2017 17:05:49 +0100
Message-Id: <1485446749-12679-1-git-send-email-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

CLKID_ETH is define in the dt-bindings but has not be commented out in the
clock driver. Just do it now.

Fixes: 738f66d3211d ("clk: gxbb: add AmLogic GXBB clk controller driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Patch based on khilman/linux-amlogic.git master branch
 Tested on the gxxb p200.

 drivers/clk/meson/gxbb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index 0252939ba58f..2ede250921f1 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -204,7 +204,7 @@
 #define CLKID_ASSIST_MISC	  33
 /* CLKID_SPI */
 #define CLKID_I2S_SPDIF		  35
-#define CLKID_ETH		  36
+/* CLKID_ETH */
 #define CLKID_DEMUX		  37
 #define CLKID_AIU_GLUE		  38
 #define CLKID_IEC958		  39
-- 
2.7.4
