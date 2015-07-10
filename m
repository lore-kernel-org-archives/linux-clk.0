Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 5/7] ARM: orion5x: Remove clk-provider.h include
Date: Fri, 10 Jul 2015 15:45:45 -0700
Message-Id: <1436568347-24554-6-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436568347-24554-1-git-send-email-sboyd@codeaurora.org>
References: <1436568347-24554-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This file doesn't use the clk provider APIs. Remove the include.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Please ack if you want this to go through clk-tree.

 arch/arm/mach-orion5x/board-dt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-orion5x/board-dt.c b/arch/arm/mach-orion5x/board-dt.c
index 79f033b1ddff..d0871786dd8a 100644
--- a/arch/arm/mach-orion5x/board-dt.c
+++ b/arch/arm/mach-orion5x/board-dt.c
@@ -16,7 +16,6 @@
 #include <linux/of_platform.h>
 #include <linux/cpu.h>
 #include <linux/mbus.h>
-#include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <asm/system_misc.h>
 #include <asm/mach/arch.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

