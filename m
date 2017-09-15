Return-Path: <hanetzer@startmail.com>
From: "Marty E. Plummer" <hanetzer@startmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: xuejiancheng@hisilicon.com,
	leo.yan@linaro.org,
	linux-clk@vger.kernel.org,
	mark.rutland@arm.com,
	mturquette@baylibre.com,
	wenpan@hisilicon.com,
	robh+dt@kernel.org,
	linux@armlinux.org.uk,
	sboyd@codeaurora.org,
	xuwei5@hisilicon.com,
	zhangfei.gao@linaro.org,
	"Marty E. Plummer" <hanetzer@startmail.com>
Subject: [RFC PATCH 2/3] arm: hisi: enable Hi3521A SoC
Date: Thu, 14 Sep 2017 22:56:35 -0500
Message-Id: <20170915035636.9903-3-hanetzer@startmail.com>
In-Reply-To: <20170915035636.9903-1-hanetzer@startmail.com>
References: <20170915035636.9903-1-hanetzer@startmail.com>
List-ID: <linux-clk.vger.kernel.org>

Enable Hisilicon Hi3521A/Hi3520DCV300 SoC. This SoC series includes
hardware mutlimedia codec cores, commonly used in consumer cctv/dvr
security systems and ipcameras. The arm core is a Cortex A7.

Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
---
 arch/arm/mach-hisi/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-hisi/Kconfig b/arch/arm/mach-hisi/Kconfig
index 65a048fa08ec..26755414f862 100644
--- a/arch/arm/mach-hisi/Kconfig
+++ b/arch/arm/mach-hisi/Kconfig
@@ -12,6 +12,12 @@ if ARCH_HISI
 
 menu "Hisilicon platform type"
 
+config ARCH_HI3521A
+	bool "Hisilicon Hi3521A/Hi3520DCV300 family"
+	depends on ARCH_MULTI_V7
+	help
+	  Support for Hisilicon Hi3521A/Hi3520DCV300 SoC family
+
 config ARCH_HI3xxx
 	bool "Hisilicon Hi36xx family"
 	depends on ARCH_MULTI_V7
-- 
2.14.1
