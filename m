Return-Path: <linux-kernel-owner@vger.kernel.org>
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
Subject: [RFC PATCH 2/9] ARM: sunxi: add Allwinner ARMv5 SoCs
Date: Sat, 20 Jan 2018 07:17:28 +0800
Message-Id: <20180119231735.61504-3-icenowy@aosc.io>
In-Reply-To: <20180119231735.61504-1-icenowy@aosc.io>
References: <20180119231735.61504-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add option for Allwinner ARMv5 SoCs and a SoC suniv (which is a die used
for many new F-series products, including F1C100A, F1C100s, F1C200s,
F1C500, F1C600).

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm/mach-sunxi/Kconfig    | 13 +++++++++++++
 arch/arm/mach-sunxi/Makefile   |  1 +
 arch/arm/mach-sunxi/sunxi_v5.c | 22 ++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 arch/arm/mach-sunxi/sunxi_v5.c

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 65509a35935f..78ac9ce70641 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -59,3 +59,16 @@ config MACH_SUN9I
 	select ARM_GIC
 
 endif
+
+menuconfig ARCH_SUNXI_V5
+	bool "Allwinner SoCs"
+	depends on ARCH_MULTI_V5
+	select ARCH_SUNXI
+	select SUN4I_TIMER
+
+if ARCH_SUNXI_V5
+
+config MACH_SUNIV
+	bool "Allwinner new F-series (suniv) SoCs support"
+	default ARCH_SUNXI
+endif
diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makefile
index 6d874f6c9d3a..e43e1557842d 100644
--- a/arch/arm/mach-sunxi/Makefile
+++ b/arch/arm/mach-sunxi/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_ARCH_SUNXI_V7) += sunxi.o
+obj-$(CONFIG_ARCH_SUNXI_V5) += sunxi_v5.o
 obj-$(CONFIG_SMP) += platsmp.o
diff --git a/arch/arm/mach-sunxi/sunxi_v5.c b/arch/arm/mach-sunxi/sunxi_v5.c
new file mode 100644
index 000000000000..1777c5b0db4b
--- /dev/null
+++ b/arch/arm/mach-sunxi/sunxi_v5.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree support for Allwinner F series SoCs
+ *
+ * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <asm/mach/arch.h>
+
+static const char * const suniv_board_dt_compat[] = {
+	"allwinner,suniv",
+	"allwinner,suniv-f1c100s",
+	NULL,
+};
+
+DT_MACHINE_START(SUNXI_DT, "Allwinner suniv Family")
+	.dt_compat	= suniv_board_dt_compat,
+MACHINE_END
-- 
2.14.2
