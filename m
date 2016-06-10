Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 09/10] arm: meson: explicitly select clk drivers
Date: Thu,  9 Jun 2016 17:27:46 -0700
Message-Id: <1465518467-23939-10-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
References: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The AmLogic clock controller code is used by both arm and arm64
architectures. Explicitly select the core code for all Meson (32-bit
arm) builds, and also select the Meson8b driver when that machine is
built.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 arch/arm/mach-meson/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index 31bdd91..c689219 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -7,6 +7,8 @@ menuconfig ARCH_MESON
 	select CACHE_L2X0
 	select PINCTRL
 	select PINCTRL_MESON
+	select COMMON_CLK
+	select COMMON_CLK_AMLOGIC
 
 if ARCH_MESON
 
@@ -24,5 +26,6 @@ config MACH_MESON8B
 	bool "Amlogic Meson8b SoCs support"
 	default ARCH_MESON
 	select MESON6_TIMER
+	select COMMON_CLK_MESON8B
 
 endif
-- 
2.1.4
