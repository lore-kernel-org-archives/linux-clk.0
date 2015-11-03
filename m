Return-Path: <mike.looijmans@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
        linux-kernel@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 3/3] drivers/clk/Kconfig: Move the TI CDCE chips close together
Date: Tue,  3 Nov 2015 12:55:54 +0100
Message-Id: <1446551754-26208-4-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1446551754-26208-1-git-send-email-mike.looijmans@topic.nl>
References: <1446551754-26208-1-git-send-email-mike.looijmans@topic.nl>
List-ID: <linux-clk.vger.kernel.org>

There are two TI CDCE clock chips in this file. Move them close
together so they're easier to find.

No functional change, just cosmetic.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 drivers/clk/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 48ec7d3..26fff3b 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -93,6 +93,14 @@ config COMMON_CLK_CDCE925
 	  Given a target output frequency, the driver will set the PLL and
 	  divider to best approximate the desired output.
 
+config COMMON_CLK_CDCE706
+	tristate "Clock driver for TI CDCE706 clock synthesizer"
+	depends on I2C
+	select REGMAP_I2C
+	select RATIONAL
+	help
+	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
+
 config COMMON_CLK_S2MPS11
 	tristate "Clock driver for S2MPS1X/S5M8767 MFD"
 	depends on MFD_SEC_CORE
@@ -156,14 +164,6 @@ config COMMON_CLK_PXA
 	help
 	  Support for the Marvell PXA SoC.
 
-config COMMON_CLK_CDCE706
-	tristate "Clock driver for TI CDCE706 clock synthesizer"
-	depends on I2C
-	select REGMAP_I2C
-	select RATIONAL
-	help
-	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
-
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/qcom/Kconfig"
-- 
1.9.1
