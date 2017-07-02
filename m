Return-Path: <vincent.legoll@gmail.com>
Return-Path: <vincent.legoll@gmail.com>
From: Vincent Legoll <vincent.legoll@gmail.com>
To: linux-kernel@vger.kernel.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
Cc: Vincent Legoll <vincent.legoll@gmail.com>
Subject: [PATCH] Make Common clock framework a menuconfig to ease disabling it all
Date: Sun,  2 Jul 2017 18:09:28 +0200
Message-Id: <1499011768-8046-1-git-send-email-vincent.legoll@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

No need to get into the submenu to disable all common clock framework
-related config entries

Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
---
 drivers/clk/Kconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 36cfea3..a1b174c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -19,9 +19,12 @@ config COMMON_CLK
 	  Architectures utilizing the common struct clk should select
 	  this option.
 
-menu "Common Clock Framework"
+menuconfig COMMON_CLK_FRAMEWORK
+	tristate "Common Clock Framework"
 	depends on COMMON_CLK
 
+if COMMON_CLK_FRAMEWORK
+
 config COMMON_CLK_WM831X
 	tristate "Clock driver for WM831x/2x PMICs"
 	depends on MFD_WM831X
@@ -230,4 +233,4 @@ source "drivers/clk/tegra/Kconfig"
 source "drivers/clk/ti/Kconfig"
 source "drivers/clk/uniphier/Kconfig"
 
-endmenu
+endif # COMMON_CLK_FRAMEWORK
-- 
2.7.4
