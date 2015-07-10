Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/7] spi: spi-pxa2xx: Remove clk.h include
Date: Fri, 10 Jul 2015 16:03:25 -0700
Message-Id: <1436569409-27964-4-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
References: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the include here because this is a
provider driver.

Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Please ack so this can go through the clk tree. Otherwise
it's ok to go through spi tree.

 drivers/spi/spi-pxa2xx-pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-pxa2xx-pci.c b/drivers/spi/spi-pxa2xx-pci.c
index 3cfd4357489a..d19d7f28aecb 100644
--- a/drivers/spi/spi-pxa2xx-pci.c
+++ b/drivers/spi/spi-pxa2xx-pci.c
@@ -7,7 +7,6 @@
 #include <linux/of_device.h>
 #include <linux/module.h>
 #include <linux/spi/pxa2xx_spi.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 
 #include <linux/dmaengine.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

