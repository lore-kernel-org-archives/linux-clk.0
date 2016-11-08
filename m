Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: pxa mark dummy helper as 'inline'
Date: Tue,  8 Nov 2016 15:49:30 +0100
Message-Id: <20161108144950.3472058-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

The dummy_clk_set_parent function is marked as 'static' but is
no longer referenced from the pxa25x clk driver after the last use
of the RATE_RO_OPS() macro is gone from this file, causing a
harmless build warning:

In file included from drivers/clk/pxa/clk-pxa25x.c:24:0:
drivers/clk/pxa/clk-pxa.h:146:12: error: 'dummy_clk_set_parent' defined but not used [-Werror=unused-function]

This marks the functon as 'inline', which lets the compiler simply
drop it when it gets referenced.

Fixes: 9fe694295098 ("clk: pxa: transfer CPU clock setting from pxa2xx-cpufreq")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/pxa/clk-pxa.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/pxa/clk-pxa.h b/drivers/clk/pxa/clk-pxa.h
index f60a7bccae4e..58abfa816d53 100644
--- a/drivers/clk/pxa/clk-pxa.h
+++ b/drivers/clk/pxa/clk-pxa.h
@@ -143,7 +143,7 @@ struct pxa2xx_freq {
 	unsigned int clkcfg;
 };
 
-static int dummy_clk_set_parent(struct clk_hw *hw, u8 index)
+static inline int dummy_clk_set_parent(struct clk_hw *hw, u8 index)
 {
 	return 0;
 }
-- 
2.9.0
