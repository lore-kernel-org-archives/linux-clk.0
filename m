Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: xgene: Remove unused setup.h include
Date: Fri, 16 Oct 2015 12:08:47 -0700
Message-Id: <1445022527-15605-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This include doesn't look to be used, and compiling this file on
arm64 still works, so remove it.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-xgene.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index 96a6190acac2..27c0da29eca3 100644
--- a/drivers/clk/clk-xgene.c
+++ b/drivers/clk/clk-xgene.c
@@ -27,7 +27,6 @@
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
-#include <asm/setup.h>
 
 /* Register SCU_PCPPLL bit fields */
 #define N_DIV_RD(src)			(((src) & 0x000001ff))
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
