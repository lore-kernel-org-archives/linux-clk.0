Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Gerhard Sittig <gsi@denx.de>,
	Scott Wood <scottwood@freescale.com>,
	Anatolij Gustschin <agust@denx.de>
Subject: [PATCH 1/7] powerpc/512x: clk: Include clk.h
Date: Fri, 10 Jul 2015 16:03:23 -0700
Message-Id: <1436569409-27964-2-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
References: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This clock provider uses the consumer API, so include clk.h
explicitly.

Cc: Gerhard Sittig <gsi@denx.de>
Cc: Scott Wood <scottwood@freescale.com>
Cc: Anatolij Gustschin <agust@denx.de>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Please ack so this can go through the clk-tree.

 arch/powerpc/platforms/512x/clock-commonclk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
index f691bcabd710..c50ea76ba66c 100644
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/device.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
