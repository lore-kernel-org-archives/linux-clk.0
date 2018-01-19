Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:48305 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932382AbeASXSJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Jan 2018 18:18:09 -0500
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [RFC PATCH 1/9] ARM: add CONFIG_ARCH_SUNXI_V7 for differentiate ARMv5/v7 Allwinner SoCs
Date: Sat, 20 Jan 2018 07:17:27 +0800
Message-Id: <20180119231735.61504-2-icenowy@aosc.io>
In-Reply-To: <20180119231735.61504-1-icenowy@aosc.io>
References: <20180119231735.61504-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Allwinner also has some ARMv5 SoCs.

In order to add support for them, add a CONFIG_ARCH_SUNXI_V7 option that
is selectable when ARMv7 is selceted, and make CONFIG_ARCH_SUNXI a
common bool config which is selected by both V7 and V5 sunxi option.

The ARMv7 defconfigs are modified to have the new CONFIG_ARCH_SUNXI_V7
option.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm/configs/multi_v7_defconfig |  2 +-
 arch/arm/configs/sunxi_defconfig    |  2 +-
 arch/arm/mach-sunxi/Kconfig         | 14 ++++++++++++--
 arch/arm/mach-sunxi/Makefile        |  2 +-
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 61509c4b769f..9b4267b2ad49 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -98,7 +98,7 @@ CONFIG_ARCH_R8A7792=y
 CONFIG_ARCH_R8A7793=y
 CONFIG_ARCH_R8A7794=y
 CONFIG_ARCH_SH73A0=y
-CONFIG_ARCH_SUNXI=y
+CONFIG_ARCH_SUNXI_V7=y
 CONFIG_ARCH_SIRF=y
 CONFIG_ARCH_TEGRA=y
 CONFIG_ARCH_TEGRA_2x_SOC=y
diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
index 5caaf971fb50..9e9be989a4bd 100644
--- a/arch/arm/configs/sunxi_defconfig
+++ b/arch/arm/configs/sunxi_defconfig
@@ -5,7 +5,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_PERF_EVENTS=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-CONFIG_ARCH_SUNXI=y
+CONFIG_ARCH_SUNXI_V7=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=8
 CONFIG_AEABI=y
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 58153cdf025b..65509a35935f 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -1,6 +1,16 @@
-menuconfig ARCH_SUNXI
+config ARCH_SUNXI
+	bool
+	select ARCH_HAS_RESET_CONTROLLER
+	select CLKSRC_MMIO
+	select GENERIC_IRQ_CHIP
+	select GPIOLIB
+	select PINCTRL
+	select RESET_CONTROLLER
+
+menuconfig ARCH_SUNXI_V7
 	bool "Allwinner SoCs"
 	depends on ARCH_MULTI_V7
+	select ARCH_SUNXI
 	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_MMIO
 	select GENERIC_IRQ_CHIP
@@ -10,7 +20,7 @@ menuconfig ARCH_SUNXI
 	select SUN4I_TIMER
 	select RESET_CONTROLLER
 
-if ARCH_SUNXI
+if ARCH_SUNXI_V7
 
 config MACH_SUN4I
 	bool "Allwinner A10 (sun4i) SoCs support"
diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makefile
index 27b168f121a1..6d874f6c9d3a 100644
--- a/arch/arm/mach-sunxi/Makefile
+++ b/arch/arm/mach-sunxi/Makefile
@@ -1,2 +1,2 @@
-obj-$(CONFIG_ARCH_SUNXI) += sunxi.o
+obj-$(CONFIG_ARCH_SUNXI_V7) += sunxi.o
 obj-$(CONFIG_SMP) += platsmp.o
-- 
2.14.2

