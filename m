Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 10/45] clk: twl6040: Remove clk.h include
Date: Fri, 10 Jul 2015 16:33:08 -0700
Message-Id: <1436571223-10959-11-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the include here because this is a
provider driver.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-twl6040.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-twl6040.c b/drivers/clk/clk-twl6040.c
index 4a755135bcd3..3094b10c6149 100644
--- a/drivers/clk/clk-twl6040.c
+++ b/drivers/clk/clk-twl6040.c
@@ -20,7 +20,6 @@
 *
 */
 
-#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

