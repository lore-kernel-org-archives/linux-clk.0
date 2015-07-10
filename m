Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Michal Simek <michal.simek@xilinx.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 4/7] clocksource: cadence_ttc: Remove clk-provider.h include
Date: Fri, 10 Jul 2015 16:03:26 -0700
Message-Id: <1436569409-27964-5-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
References: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This file doesn't use the clk provider APIs. Remove the include.

Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Please ack if you want this to go through clk-tree, otherwise
it's ok to take it through the clocksource side.

 drivers/clocksource/cadence_ttc_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/cadence_ttc_timer.c b/drivers/clocksource/cadence_ttc_timer.c
index 510c8a1d37b3..5ea91e3818d0 100644
--- a/drivers/clocksource/cadence_ttc_timer.c
+++ b/drivers/clocksource/cadence_ttc_timer.c
@@ -16,7 +16,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/clk-provider.h>
 #include <linux/interrupt.h>
 #include <linux/clockchips.h>
 #include <linux/of_address.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
