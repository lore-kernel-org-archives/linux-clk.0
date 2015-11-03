Return-Path: <mike.looijmans@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
        linux-kernel@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 1/3] drivers/clk/Kconfig: Use "help" only once
Date: Tue,  3 Nov 2015 12:55:52 +0100
Message-Id: <1446551754-26208-2-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1446551754-26208-1-git-send-email-mike.looijmans@topic.nl>
References: <1446551754-26208-1-git-send-email-mike.looijmans@topic.nl>
List-ID: <linux-clk.vger.kernel.org>

Use only the plain "help" header. No functional change, only cosmetic.

This Kconfig file has entries using "help", "---help---" and, probably in
an attempt to be extra helpful, some entires have both. With people like
me usually copying an existing entry, the duplicates have been spreading.

A quick survey in the kernel using grep revealed that simply "help" is
most commonly used, so convert all entries to only use a single "help"
header line.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 drivers/clk/Kconfig | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 42f7120..7205d2b 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -14,7 +14,7 @@ config COMMON_CLK
 	select HAVE_CLK_PREPARE
 	select CLKDEV_LOOKUP
 	select SRCU
-	---help---
+	help
 	  The common clock framework is a single definition of struct
 	  clk, useful across many platforms, as well as an
 	  implementation of the clock API in include/linux/clk.h.
@@ -27,7 +27,7 @@ menu "Common Clock Framework"
 config COMMON_CLK_WM831X
 	tristate "Clock driver for WM831x/2x PMICs"
 	depends on MFD_WM831X
-	---help---
+	help
           Supports the clocking subsystem of the WM831x/2x series of
 	  PMICs from Wolfson Microelectronics.
 
@@ -40,20 +40,20 @@ config COMMON_CLK_MAX77686
 	tristate "Clock driver for Maxim 77686 MFD"
 	depends on MFD_MAX77686
 	select COMMON_CLK_MAX_GEN
-	---help---
+	help
 	  This driver supports Maxim 77686 crystal oscillator clock. 
 
 config COMMON_CLK_MAX77802
 	tristate "Clock driver for Maxim 77802 PMIC"
 	depends on MFD_MAX77686
 	select COMMON_CLK_MAX_GEN
-	---help---
+	help
 	  This driver supports Maxim 77802 crystal oscillator clock.
 
 config COMMON_CLK_RK808
 	tristate "Clock driver for RK808"
 	depends on MFD_RK808
-	---help---
+	help
 	  This driver supports RK808 crystal oscillator clock. These
 	  multi-function devices have two fixed-rate oscillators,
 	  clocked at 32KHz each. Clkout1 is always on, Clkout2 can off
@@ -64,7 +64,7 @@ config COMMON_CLK_SI5351
 	depends on I2C
 	select REGMAP_I2C
 	select RATIONAL
-	---help---
+	help
 	  This driver supports Silicon Labs 5351A/B/C programmable clock
 	  generators.
 
@@ -74,7 +74,6 @@ config COMMON_CLK_SI570
 	depends on OF
 	select REGMAP_I2C
 	help
-	---help---
 	  This driver supports Silicon Labs 570/571/598/599 programmable
 	  clock generators.
 
@@ -84,7 +83,6 @@ config COMMON_CLK_CDCE925
 	depends on OF
 	select REGMAP_I2C
 	help
-	---help---
 	  This driver supports the TI CDCE925 programmable clock synthesizer.
 	  The chip contains two PLLs with spread-spectrum clocking support and
 	  five output dividers. The driver only supports the following setup,
@@ -98,7 +96,7 @@ config COMMON_CLK_CDCE925
 config COMMON_CLK_S2MPS11
 	tristate "Clock driver for S2MPS1X/S5M8767 MFD"
 	depends on MFD_SEC_CORE
-	---help---
+	help
 	  This driver supports S2MPS11/S2MPS14/S5M8767 crystal oscillator
 	  clock. These multi-function devices have two (S2MPS14) or three
 	  (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz each.
@@ -106,7 +104,7 @@ config COMMON_CLK_S2MPS11
 config CLK_TWL6040
 	tristate "External McPDM functional clock from twl6040"
 	depends on TWL6040_CORE
-	---help---
+	help
 	  Enable the external functional clock support on OMAP4+ platforms for
 	  McPDM. McPDM module is using the external bit clock on the McPDM bus
 	  as functional clock.
@@ -115,14 +113,13 @@ config COMMON_CLK_AXI_CLKGEN
 	tristate "AXI clkgen driver"
 	depends on ARCH_ZYNQ || MICROBLAZE
 	help
-	---help---
 	  Support for the Analog Devices axi-clkgen pcore clock generator for Xilinx
 	  FPGAs. It is commonly used in Analog Devices' reference designs.
 
 config CLK_QORIQ
 	bool "Clock driver for Freescale QorIQ platforms"
 	depends on (PPC_E500MC || ARM) && OF
-	---help---
+	help
 	  This adds the clock driver support for Freescale QorIQ platforms
 	  using common clock framework.
 
@@ -130,33 +127,33 @@ config COMMON_CLK_XGENE
 	bool "Clock driver for APM XGene SoC"
 	default y
 	depends on ARM64
-	---help---
+	help
 	  Sypport for the APM X-Gene SoC reference, PLL, and device clocks.
 
 config COMMON_CLK_KEYSTONE
 	tristate "Clock drivers for Keystone based SOCs"
 	depends on ARCH_KEYSTONE && OF
-	---help---
+	help
           Supports clock drivers for Keystone based SOCs. These SOCs have local
 	  a power sleep control module that gate the clock to the IPs and PLLs.
 
 config COMMON_CLK_PALMAS
 	tristate "Clock driver for TI Palmas devices"
 	depends on MFD_PALMAS
-	---help---
+	help
 	  This driver supports TI Palmas devices 32KHz output KG and KG_AUDIO
 	  using common clock framework.
 
 config COMMON_CLK_PWM
 	tristate "Clock driver for PWMs used as clock outputs"
 	depends on PWM
-	---help---
+	help
 	  Adapter driver so that any PWM output can be (mis)used as clock signal
 	  at 50% duty cycle.
 
 config COMMON_CLK_PXA
 	def_bool COMMON_CLK && ARCH_PXA
-	---help---
+	help
 	  Sypport for the Marvell PXA SoC.
 
 config COMMON_CLK_CDCE706
@@ -164,7 +161,7 @@ config COMMON_CLK_CDCE706
 	depends on I2C
 	select REGMAP_I2C
 	select RATIONAL
-	---help---
+	help
 	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
 
 source "drivers/clk/bcm/Kconfig"
-- 
1.9.1
