Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ralf Baechle <ralf@linux-mips.org>,
	linux-mips@linux-mips.org
Subject: [PATCH] clk: Get rid of HAVE_MACH_CLKDEV
Date: Wed, 27 Jan 2016 14:17:00 -0800
Message-Id: <1453933020-8577-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This config was used for the ARM port so that it could use a
machine specific clkdev.h include, but those are all gone now.
The MIPS architecture is the last user, and from what I can tell
it doesn't actually use it anyway, so let's remove the config all
together.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: <linux-mips@linux-mips.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

I don't see a problem if this goes through the MIPS tree or the clk tree.
Let me know and I can take it through clk.

 arch/mips/Kconfig       | 2 --
 arch/mips/pic32/Kconfig | 1 -
 drivers/clk/Kconfig     | 3 ---
 3 files changed, 6 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 56f57816613e..8e1be2889af3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -328,7 +328,6 @@ config LANTIQ
 	select ARCH_REQUIRE_GPIOLIB
 	select SWAP_IO_SPACE
 	select BOOT_RAW
-	select HAVE_MACH_CLKDEV
 	select CLKDEV_LOOKUP
 	select USE_OF
 	select PINCTRL
@@ -590,7 +589,6 @@ config RALINK
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_MIPS16
 	select SYS_HAS_EARLY_PRINTK
-	select HAVE_MACH_CLKDEV
 	select CLKDEV_LOOKUP
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
diff --git a/arch/mips/pic32/Kconfig b/arch/mips/pic32/Kconfig
index fde56a8b85ca..1985971b9890 100644
--- a/arch/mips/pic32/Kconfig
+++ b/arch/mips/pic32/Kconfig
@@ -15,7 +15,6 @@ config PIC32MZDA
 	select SYS_SUPPORTS_32BIT_KERNEL
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select ARCH_REQUIRE_GPIOLIB
-	select HAVE_MACH_CLKDEV
 	select COMMON_CLK
 	select CLKDEV_LOOKUP
 	select LIBFDT
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index eca8e019e005..35cbde8449a0 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -6,9 +6,6 @@ config CLKDEV_LOOKUP
 config HAVE_CLK_PREPARE
 	bool
 
-config HAVE_MACH_CLKDEV
-	bool
-
 config COMMON_CLK
 	bool
 	select HAVE_CLK_PREPARE
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
