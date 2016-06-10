Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 10/10] clk: meson: only build selected platforms
Date: Thu,  9 Jun 2016 17:27:47 -0700
Message-Id: <1465518467-23939-11-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
References: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Break the AmLogic clock code up so that only the necessary parts are
compiled and linked. The core code is selected by both arm and arm64
builds with COMMON_CLK_AMLOGIC. The individual drivers have their own
config options as well.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/Kconfig        |  1 +
 drivers/clk/Makefile       |  2 +-
 drivers/clk/meson/Kconfig  | 12 ++++++++++++
 drivers/clk/meson/Makefile |  4 ++--
 4 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 drivers/clk/meson/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 53ddba2..30feb6b 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -208,6 +208,7 @@ config COMMON_CLK_OXNAS
 
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
+source "drivers/clk/meson/Kconfig"
 source "drivers/clk/mvebu/Kconfig"
 source "drivers/clk/qcom/Kconfig"
 source "drivers/clk/renesas/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index dcc5e69..af03eb2 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -65,7 +65,7 @@ ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_ARCH_MMP)			+= mmp/
 endif
 obj-y					+= mvebu/
-obj-$(CONFIG_ARCH_MESON)		+= meson/
+obj-$(CONFIG_COMMON_CLK_AMLOGIC)	+= meson/
 obj-$(CONFIG_ARCH_MXS)			+= mxs/
 obj-$(CONFIG_MACH_PISTACHIO)		+= pistachio/
 obj-$(CONFIG_COMMON_CLK_NXP)		+= nxp/
diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
new file mode 100644
index 0000000..7bb19ad
--- /dev/null
+++ b/drivers/clk/meson/Kconfig
@@ -0,0 +1,12 @@
+config COMMON_CLK_AMLOGIC
+	bool
+	depends on OF
+	depends on ARCH_MESON || COMPILE_TEST
+
+config COMMON_CLK_MESON8B
+	bool
+	depends on COMMON_CLK_AMLOGIC
+	help
+	  Support for the clock controller on AmLogic S805 devices, aka
+	  meson8b. Say Y if you want peripherals and CPU frequency scaling to
+	  work.
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 901b5d4..b3d60fe 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -2,5 +2,5 @@
 # Makefile for Meson specific clk
 #
 
-obj-y += clk-pll.o clk-cpu.o
-obj-y += meson8b-clkc.o
+obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-cpu.o
+obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b-clkc.o
-- 
2.1.4
