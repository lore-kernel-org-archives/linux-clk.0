Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jon Mason <jonmason@broadcom.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH] clk: bcm: Fix unmet Kconfig dependencies for CLK_BCM_63XX
Date: Tue, 22 Nov 2016 09:43:27 -0800
Message-Id: <20161122174329.11592-1-f.fainelli@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

With commit f4e871509959 ("clk: iproc: Make clocks visible options"),
COMMON_CLK_IPROC gained a dependency on ARCH_BCM_IPROC, yet CLK_BCM_63XX
also selects that option, this causes the following Kconfig warning:

warning: (CLK_BCM_63XX) selects COMMON_CLK_IPROC which has unmet direct
dependencies ((ARCH_BCM_IPROC || COMPILE_TEST) && COMMON_CLK)

Fix this by adding proper depends/default for COMMON_CLK_IPROC

Fixes: f4e871509959 ("clk: iproc: Make clocks visible options")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/clk/bcm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
index f21e9b7afd1a..80de9fc2e833 100644
--- a/drivers/clk/bcm/Kconfig
+++ b/drivers/clk/bcm/Kconfig
@@ -20,9 +20,9 @@ config CLK_BCM_KONA
 
 config COMMON_CLK_IPROC
 	bool "Broadcom iProc clock support"
-	depends on ARCH_BCM_IPROC || COMPILE_TEST
+	depends on ARCH_BCM_IPROC || ARCH_BCM_63XX || COMPILE_TEST
 	depends on COMMON_CLK
-	default ARCH_BCM_IPROC
+	default ARCH_BCM_IPROC || ARCH_BCM_63XX
 	help
 	  Enable common clock framework support for Broadcom SoCs
 	  based on the iProc architecture
-- 
2.9.3
