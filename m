Return-Path: <vishnupatekar0510@gmail.com>
Return-Path: <vishnupatekar0510@gmail.com>
From: Vishnu Patekar <vishnupatekar0510@gmail.com>
To: robh+dt@kernel.org,
	corbet@lwn.net,
	pawel.moll@arm.com,
	mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org,
	maxime.ripard@free-electrons.com,
	linux@arm.linux.org.uk,
	emilio@elopez.com.ar
Cc: jenskuske@gmail.com,
	hdegoede@redhat.com,
	wens@csie.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	patchesrdh@mveas.com,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 13/13] ARM: sunxi: Introduce MACH_SUN8I_A83T option
Date: Sun, 28 Feb 2016 23:18:58 +0800
Message-Id: <1456672738-4993-14-git-send-email-vishnupatekar0510@gmail.com>
In-Reply-To: <1456672738-4993-1-git-send-email-vishnupatekar0510@gmail.com>
References: <1456672738-4993-1-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

A83T has CPUS clock similar to A80's. currently, a80 cpus clock only
compiled for A80. So, Introduce MACH_SUN8I_A83T to compile it for
A83T as well.

Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
---
 arch/arm/mach-sunxi/Kconfig | 5 +++++
 drivers/clk/sunxi/Makefile  | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index c124d65..424b76d 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -41,6 +41,11 @@ config MACH_SUN8I
 	select ARM_GIC
 	select MFD_SUN6I_PRCM
 
+config MACH_SUN8I_A83T
+	bool "Allwinner A83T (sun8i) SoCs support"
+	default ARCH_SUNXI
+	select ARM_GIC
+
 config MACH_SUN9I
 	bool "Allwinner (sun9i) SoCs support"
 	default ARCH_SUNXI
diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
index 3fd7901..2aabfc4 100644
--- a/drivers/clk/sunxi/Makefile
+++ b/drivers/clk/sunxi/Makefile
@@ -20,6 +20,9 @@ obj-y += clk-usb.o
 obj-$(CONFIG_MACH_SUN9I) += clk-sun8i-apb0.o
 obj-$(CONFIG_MACH_SUN9I) += clk-sun9i-cpus.o
 
+obj-$(CONFIG_MACH_SUN8I_A83T) += clk-sun8i-apb0.o
+obj-$(CONFIG_MACH_SUN8I_A83T) += clk-sun9i-cpus.o
+
 obj-$(CONFIG_MFD_SUN6I_PRCM) += \
 	clk-sun6i-ar100.o clk-sun6i-apb0.o clk-sun6i-apb0-gates.o \
 	clk-sun8i-apb0.o
-- 
1.9.1
