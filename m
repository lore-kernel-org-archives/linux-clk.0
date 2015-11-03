Return-Path: <mike.looijmans@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
        linux-kernel@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 2/3] drivers/clk/Kconfig: Fix typo "Sypport" instead of "Support"
Date: Tue,  3 Nov 2015 12:55:53 +0100
Message-Id: <1446551754-26208-3-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1446551754-26208-1-git-send-email-mike.looijmans@topic.nl>
References: <1446551754-26208-1-git-send-email-mike.looijmans@topic.nl>
List-ID: <linux-clk.vger.kernel.org>

Simple cosmetic fix.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 7205d2b..48ec7d3 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -154,7 +154,7 @@ config COMMON_CLK_PWM
 config COMMON_CLK_PXA
 	def_bool COMMON_CLK && ARCH_PXA
 	help
-	  Sypport for the Marvell PXA SoC.
+	  Support for the Marvell PXA SoC.
 
 config COMMON_CLK_CDCE706
 	tristate "Clock driver for TI CDCE706 clock synthesizer"
-- 
1.9.1
