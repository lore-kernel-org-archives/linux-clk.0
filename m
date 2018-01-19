Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:1582 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932305AbeASRoE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Jan 2018 12:44:04 -0500
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] clk: Remove redundant selection of RATIONAL
Date: Fri, 19 Jan 2018 19:44:01 +0200
Message-Id: <20180119174401.23051-1-andriy.shevchenko@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Since the commit

  0777591e715a ("clk: fractional-divider: switch to rational best approximation")

enables rational best approximation to all common based clocks, there is
no need to repeat the selection in each of them.

No functional changes intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 98ce9fc6e6c0..2e65cf731b00 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -76,7 +76,6 @@ config COMMON_CLK_SI5351
 	tristate "Clock driver for SiLabs 5351A/B/C"
 	depends on I2C
 	select REGMAP_I2C
-	select RATIONAL
 	---help---
 	  This driver supports Silicon Labs 5351A/B/C programmable clock
 	  generators.
@@ -105,7 +104,6 @@ config COMMON_CLK_CDCE706
 	tristate "Clock driver for TI CDCE706 clock synthesizer"
 	depends on I2C
 	select REGMAP_I2C
-	select RATIONAL
 	---help---
 	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
 
-- 
2.15.1

