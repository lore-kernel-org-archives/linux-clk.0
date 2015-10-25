Return-Path: <javier@osg.samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Scott Branden <sbranden@broadcom.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: versatile: Make depend on OF when COMPILE_TEST
Date: Mon, 26 Oct 2015 07:41:28 +0900
Message-Id: <1445812888-8170-1-git-send-email-javier@osg.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Commit 4a7748c3d641 ("clk: Allow drivers to build if COMPILE_TEST is
enabled") allowed clk drives to be compile tested on other archs but
the COMMON_CLK_VERSATILE was only enabled on platforms that already
selected OF support so the drivers assume it will always be enabled.

So, restrict compile test for these drivers only if OF is enabled.

Fixes: 4a7748c3d641 ("clk: Allow drivers to build if COMPILE_TEST is enabled")
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/clk/versatile/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
index fc50b6264bed..e85863cf145f 100644
--- a/drivers/clk/versatile/Kconfig
+++ b/drivers/clk/versatile/Kconfig
@@ -1,6 +1,6 @@
 config COMMON_CLK_VERSATILE
 	bool "Clock driver for ARM Reference designs"
-	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64 || COMPILE_TEST
+	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || ARCH_VEXPRESS || ARM64 || (COMPILE_TEST && OF)
 	---help---
           Supports clocking on ARM Reference designs:
 	  - Integrator/AP and Integrator/CP
-- 
2.4.3
