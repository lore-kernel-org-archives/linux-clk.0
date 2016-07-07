Return-Path: <jdelvare@suse.de>
Date: Thu, 7 Jul 2016 09:18:44 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH] clk: oxnas: Add hardware dependencies
Message-ID: <20160707091844.196a7930@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

The clk-oxnas driver is specific to its architecture, so do not
propose it on other architectures, unless build-testing.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-4.7-rc6.orig/drivers/clk/Kconfig	2016-07-04 08:01:00.000000000 +0200
+++ linux-4.7-rc6/drivers/clk/Kconfig	2016-07-07 09:12:17.723329794 +0200
@@ -203,6 +203,7 @@ config COMMON_CLK_PIC32
 
 config COMMON_CLK_OXNAS
 	bool "Clock driver for the OXNAS SoC Family"
+	depends on ARCH_OXNAS || COMPILE_TEST
 	select MFD_SYSCON
 	---help---
 	  Support for the OXNAS SoC Family clocks.


-- 
Jean Delvare
SUSE L3 Support
