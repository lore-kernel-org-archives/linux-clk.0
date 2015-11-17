Return-Path: <Zhiqiang.Hou@freescale.com>
From: Zhiqiang Hou <Zhiqiang.Hou@freescale.com>
To: <linux-arm-kernel@lists.infradead.org>, <catalin.marinas@arm.com>,
	<will.deacon@arm.com>, <linux-i2c@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
CC: <mark.rutland@arm.com>, <linux@roeck-us.net>, <wsa@the-dreams.de>,
	<wim@iguana.be>, <corbet@lwn.net>, <mturquette@baylibre.com>,
	<sboyd@codeaurora.org>, <Mingkai.Hu@freescale.com>,
	<Shaohui.Xie@freescale.com>, <scottwood@freescale.com>,
	<bhupesh.sharma@freescale.com>, <Wenbin.Song@freescale.com>,
	<B48286@freescale.com>, Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
Subject: [PATCHv8 1/5] i2c: imx: fix a compiling error
Date: Tue, 17 Nov 2015 17:53:18 +0800
Message-ID: <1447754002-40555-1-git-send-email-Zhiqiang.Hou@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-Path: Zhiqiang.Hou@freescale.com
List-ID: <linux-clk.vger.kernel.org>

From: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>

drivers/i2c/busses/i2c-imx.c:978:2: error: implicit declaration of
function ‘pinctrl_select_state’ [-Werror=implicit-function-declaration]
  pinctrl_select_state(i2c_imx->pinctrl, i2c_imx->pinctrl_pins_gpio);
  ^

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
---
V8:
 - New patch.

 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1e4d99d..9bb0b05 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -50,6 +50,7 @@
 #include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/of_gpio.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_data/i2c-imx.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
-- 
2.1.0.27.g96db324
