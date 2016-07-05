Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 7/7] arm: amlogic: select meson8b clk driver
Date: Tue,  5 Jul 2016 19:56:31 +0200
Message-Id: <1467741391-60534-8-git-send-email-serveralex@gmail.com>
In-Reply-To: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Select the Amlogic clk code for meson SoCs and the more specific meson8b clk
driver for Amlogic meson8b.

Signed-off-by: Alexander Müller <serveralex@gmail.com>
---
 arch/arm/mach-meson/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
index 31bdd91..b3add39 100644
--- a/arch/arm/mach-meson/Kconfig
+++ b/arch/arm/mach-meson/Kconfig
@@ -7,6 +7,7 @@ menuconfig ARCH_MESON
 	select CACHE_L2X0
 	select PINCTRL
 	select PINCTRL_MESON
+	select COMMON_CLK_AMLOGIC
 
 if ARCH_MESON
 
@@ -24,5 +25,6 @@ config MACH_MESON8B
 	bool "Amlogic Meson8b SoCs support"
 	default ARCH_MESON
 	select MESON6_TIMER
+	select COMMON_CLK_MESON8B
 
 endif
-- 
2.5.0
