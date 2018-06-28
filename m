Return-Path: <brgl@bgdev.pl>
Return-Path: <brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>,
	Kevin Hilman <khilman@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	David Lechner <david@lechnology.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 01/13] clk: davinci: psc-da850: remove the 'davinci_nand.0" lookup
Date: Thu, 28 Jun 2018 11:57:36 +0200
Message-Id: <20180628095748.4462-2-brgl@bgdev.pl>
In-Reply-To: <20180628095748.4462-1-brgl@bgdev.pl>
References: <20180628095748.4462-1-brgl@bgdev.pl>
List-ID: <linux-clk.vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Since commit a8e3923ab571 ("mtd: rawnand: davinci: don't acquire and
enable clock") we no longer acquire the aemif clock from the davinci
nand driver - we only do it from the ti-aemif driver. Remove the nand
entry from the psc lookup table.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: David Lechner <david@lechnology.com>
---
 drivers/clk/davinci/psc-da850.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/davinci/psc-da850.c b/drivers/clk/davinci/psc-da850.c
index d196dcbed560..5a18bca464cd 100644
--- a/drivers/clk/davinci/psc-da850.c
+++ b/drivers/clk/davinci/psc-da850.c
@@ -16,8 +16,7 @@
 
 #include "psc.h"
 
-LPSC_CLKDEV2(emifa_clkdev,	NULL,		"ti-aemif",
-				"aemif",	"davinci_nand.0");
+LPSC_CLKDEV1(emifa_clkdev,	NULL,		"ti-aemif");
 LPSC_CLKDEV1(spi0_clkdev,	NULL,		"spi_davinci.0");
 LPSC_CLKDEV1(mmcsd0_clkdev,	NULL,		"da830-mmc.0");
 LPSC_CLKDEV1(uart0_clkdev,	NULL,		"serial8250.0");
-- 
2.17.1
