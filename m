Return-Path: <ezequiel@vanguardiasur.com.ar>
Return-Path: <ezequiel@vanguardiasur.com.ar>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Joachim Eastwood <manabian@gmail.com>
Cc: linux-clk@vger.kernel.org,
	sboyd@codeaurora.org,
	mturquette@baylibre.com,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] clk: nxp: Select MFD_SYSCON for creg driver
Date: Mon, 16 May 2016 12:45:36 -0300
Message-Id: <1463413536-20292-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-ID: <linux-clk.vger.kernel.org>

Commit 378523d15003 ("clk: add lpc18xx creg clk driver")
added a new clock driver but missed the proper MFD_SYSCON select.
Fix it.

Fixes: 378523d15003 ("clk: add lpc18xx creg clk driver")
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/clk/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 53ddba26578c..98efbfcdb503 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -175,6 +175,7 @@ config COMMON_CLK_KEYSTONE
 config COMMON_CLK_NXP
 	def_bool COMMON_CLK && (ARCH_LPC18XX || ARCH_LPC32XX)
 	select REGMAP_MMIO if ARCH_LPC32XX
+	select MFD_SYSCON if ARCH_LPC18XX
 	---help---
 	  Support for clock providers on NXP platforms.
 
-- 
2.7.0
