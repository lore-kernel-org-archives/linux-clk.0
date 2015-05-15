Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alex Elder <elder@linaro.org>
Subject: [PATCH] clk: Kconfig: Move bcm Kconfig into clk menu
Date: Thu, 14 May 2015 17:40:08 -0700
Message-Id: <1431650408-6178-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Having this Kconfig sourced outside the clk menu means the option
is under the "Device Drivers" menu instead of the "Common Clock
Framework" menu. Move it so that the bcm clock config options are
in the right place.

Cc: Alex Elder <elder@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 9897f353bf1a..67e3a84d2805 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -150,11 +150,11 @@ config COMMON_CLK_CDCE706
 	---help---
 	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
 
+source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/qcom/Kconfig"
 
 endmenu
 
-source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/mvebu/Kconfig"
 
 source "drivers/clk/samsung/Kconfig"
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
