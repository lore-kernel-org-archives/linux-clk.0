Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 22/41] clk: x86: Remove clkdev.h and clk.h includes
Date: Tue,  1 Mar 2016 11:00:07 -0800
Message-Id: <1456858826-28541-23-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This driver is a clk provider and not a clk consumer, so remove
the clk.h include. Also, drop clkdev.h because there's not clkdev
usage here either.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/x86/clk-lpt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/x86/clk-lpt.c b/drivers/clk/x86/clk-lpt.c
index 54e0cf9d8edd..6b40eb89ae19 100644
--- a/drivers/clk/x86/clk-lpt.c
+++ b/drivers/clk/x86/clk-lpt.c
@@ -10,8 +10,6 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/module.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
