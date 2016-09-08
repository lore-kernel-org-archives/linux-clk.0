Return-Path: <jdelvare@suse.de>
Date: Thu, 8 Sep 2016 17:36:51 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH] clk: sunxi-ng: Add hardware dependency
Message-ID: <20160908173651.769b6829@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

The sunxi-ng clock driver is useless for other architectures.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/sunxi-ng/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-4.8-rc5.orig/drivers/clk/sunxi-ng/Kconfig	2016-09-04 23:31:46.000000000 +0200
+++ linux-4.8-rc5/drivers/clk/sunxi-ng/Kconfig	2016-09-08 17:29:46.179508283 +0200
@@ -1,6 +1,6 @@
 config SUNXI_CCU
 	bool "Clock support for Allwinner SoCs"
-	default ARCH_SUNXI
+	depends on ARCH_SUNXI || COMPILE_TEST
 
 if SUNXI_CCU
 


-- 
Jean Delvare
SUSE L3 Support
