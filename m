Return-Path: <javier@osg.samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Luis de Bethencourt <luisbg@osg.samsung.com>,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Scott Branden <sbranden@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: Allow drivers to build if COMPILE_TEST is enabled
Date: Tue, 13 Oct 2015 16:18:18 +0200
Message-Id: <1444745898-11537-1-git-send-email-javier@osg.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

These drivers only have runtime but no build time dependencies so can be
built for testing purposes if the Kconfig COMPILE_TEST option is enabled.

This is useful to have more build coverage and make sure that drivers are
not affected by changes that could cause build regressions.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/clk/Kconfig           | 8 ++++----
 drivers/clk/bcm/Kconfig       | 4 ++--
 drivers/clk/versatile/Kconfig | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 573517151976..57316528e924 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -124,7 +124,7 @@ config CLK_TWL6040
 
 config COMMON_CLK_AXI_CLKGEN
 	tristate "AXI clkgen driver"
-	depends on ARCH_ZYNQ || MICROBLAZE
+	depends on ARCH_ZYNQ || MICROBLAZE || COMPILE_TEST
 	help
 	---help---
 	  Support for the Analog Devices axi-clkgen pcore clock generator for Xilinx
@@ -132,7 +132,7 @@ config COMMON_CLK_AXI_CLKGEN
 
 config CLK_QORIQ
 	bool "Clock driver for Freescale QorIQ platforms"
-	depends on (PPC_E500MC || ARM) && OF
+	depends on (PPC_E500MC || ARM || COMPILE_TEST) && OF
 	---help---
 	  This adds the clock driver support for Freescale QorIQ platforms
 	  using common clock framework.
@@ -140,13 +140,13 @@ config CLK_QORIQ
 config COMMON_CLK_XGENE
 	bool "Clock driver for APM XGene SoC"
 	default y
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	---help---
 	  Sypport for the APM X-Gene SoC reference, PLL, and device clocks.
 
 config COMMON_CLK_KEYSTONE
 	tristate "Clock drivers for Keystone based SOCs"
-	depends on ARCH_KEYSTONE && OF
+	depends on (ARCH_KEYSTONE || COMPILE_TEST) && OF
 	---help---
           Supports clock drivers for Keystone based SOCs. These SOCs have local
 	  a power sleep control module that gate the clock to the IPs and PLLs.
diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
index 88febf53b276..561e9dc6d40d 100644
--- a/drivers/clk/bcm/Kconfig
+++ b/drivers/clk/bcm/Kconfig
@@ -1,6 +1,6 @@
 config CLK_BCM_KONA
 	bool "Broadcom Kona CCU clock support"
-	depends on ARCH_BCM_MOBILE
+	depends on ARCH_BCM_MOBILE || COMPILE_TEST
 	depends on COMMON_CLK
 	default y
 	help
@@ -10,7 +10,7 @@ config CLK_BCM_KONA
 
 config COMMON_CLK_IPROC
 	bool "Broadcom iProc clock support"
-	depends on ARCH_BCM_IPROC
+	depends on ARCH_BCM_IPROC || COMPILE_TEST
 	depends on COMMON_CLK
 	default ARCH_BCM_IPROC
 	help
diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
index 1530c9352a76..fc50b6264bed 100644
--- a/drivers/clk/versatile/Kconfig
+++ b/drivers/clk/versatile/Kconfig
@@ -1,6 +1,6 @@
 config COMMON_CLK_VERSATILE
 	bool "Clock driver for ARM Reference designs"
-	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64
+	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64 || COMPILE_TEST
 	---help---
           Supports clocking on ARM Reference designs:
 	  - Integrator/AP and Integrator/CP
-- 
2.4.3
