Return-Path: <riku.voipio@linaro.org>
Return-Path: <riku.voipio@linaro.org>
From: riku.voipio@linaro.org
To: linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: arnd@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Riku Voipio <riku.voipio@linaro.org>,
	John Stultz <john.stultz@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [RESEND PATCH] clk: enable hi655x common clk automatically
Date: Mon, 12 Mar 2018 12:49:45 +0200
Message-Id: <20180312104945.3001-1-riku.voipio@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

From: Riku Voipio <riku.voipio@linaro.org>

Without COMMON_CLK_HI655X Wifi and bluetooth are non-functional on Hikey.
As suggested by Arnd, enable the driver automatically when the parent
driver is selected. With sensible defaults in place, we can leave other
choices for EXPERT.

Cc: John Stultz <john.stultz@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Suggested-by: Arnd Bergmann <arnd@linaro.org>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
Previous discussion at https://patchwork.kernel.org/patch/9767143/
---
 drivers/clk/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 98ce9fc6e6c0..448ce83b334d 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -55,8 +55,10 @@ config COMMON_CLK_RK808
 	  by control register.
 
 config COMMON_CLK_HI655X
-	tristate "Clock driver for Hi655x"
-	depends on MFD_HI655X_PMIC || COMPILE_TEST
+	tristate "Clock driver for Hi655x" if EXPERT
+	depends on (MFD_HI655X_PMIC || COMPILE_TEST)
+	depends on REGMAP
+	default MFD_HI655X_PMIC
 	---help---
 	  This driver supports the hi655x PMIC clock. This
 	  multi-function device has one fixed-rate oscillator, clocked
-- 
2.15.1
