Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>
Subject: [PATCH 2/7] ARM: hisi: Remove clk-provider.h include
Date: Fri, 10 Jul 2015 15:45:42 -0700
Message-Id: <1436568347-24554-3-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436568347-24554-1-git-send-email-sboyd@codeaurora.org>
References: <1436568347-24554-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This file doesn't use the clk provider APIs. Remove the include.

Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Wei Xu <xuwei5@hisilicon.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Please ack if you want this to go through clk-tree.

 arch/arm/mach-hisi/hisilicon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-hisi/hisilicon.c b/arch/arm/mach-hisi/hisilicon.c
index c6bd7c7bd4aa..8cc62150116a 100644
--- a/arch/arm/mach-hisi/hisilicon.c
+++ b/arch/arm/mach-hisi/hisilicon.c
@@ -11,7 +11,6 @@
  * published by the Free Software Foundation.
 */
 
-#include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/irqchip.h>
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

