Return-Path: <jdelvare@suse.de>
Date: Thu, 8 Sep 2016 23:28:29 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2] clk: sunxi-ng: Add hardware dependency
Message-ID: <20160908232829.07adc10b@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

The sunxi-ng clock driver is useless for other architectures.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>
---
Changes since v1:
 * Leave default in place (suggested by Stephen Boyd.)

 drivers/clk/sunxi-ng/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-4.8-rc5.orig/drivers/clk/sunxi-ng/Kconfig	2016-09-04 23:31:46.000000000 +0200
+++ linux-4.8-rc5/drivers/clk/sunxi-ng/Kconfig	2016-09-08 21:51:36.600085604 +0200
@@ -1,5 +1,6 @@
 config SUNXI_CCU
 	bool "Clock support for Allwinner SoCs"
+	depends on ARCH_SUNXI || COMPILE_TEST
 	default ARCH_SUNXI
 
 if SUNXI_CCU


-- 
Jean Delvare
SUSE L3 Support
