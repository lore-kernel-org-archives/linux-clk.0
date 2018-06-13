Return-Path: <boris.brezillon@bootlin.com>
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH] MAINTAINERS: Remove the AT91 clk driver entry
Date: Wed, 13 Jun 2018 10:29:36 +0200
Message-Id: <20180613082936.14038-1-boris.brezillon@bootlin.com>
List-ID: <linux-clk.vger.kernel.org>

I've stopped actively maintaining this driver for quite some time
already, and at91 maintainers are doing a good job at maintaining it.
Remove the AT91 clk driver entry so that the driver automatically
falls under the "ARM/Microchip (AT91) SoC support" entry.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 MAINTAINERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 634abf4569c4..491cc42ab65f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1242,11 +1242,6 @@ F:	arch/arm/mach-aspeed/
 F:	arch/arm/boot/dts/aspeed-*
 N:	aspeed
 
-ARM/ATMEL AT91 Clock Support
-M:	Boris Brezillon <boris.brezillon@bootlin.com>
-S:	Maintained
-F:	drivers/clk/at91
-
 ARM/CALXEDA HIGHBANK ARCHITECTURE
 M:	Rob Herring <robh@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.14.1
