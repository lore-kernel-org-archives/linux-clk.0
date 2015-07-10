Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Nishanth Menon <nm@ti.com>
Subject: [PATCH 07/45] clk: palmas: Remove clkdev.h includes
Date: Fri, 10 Jul 2015 16:33:05 -0700
Message-Id: <1436571223-10959-8-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This driver includes clkdev.h even though it isn't used, so drop
it.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Nishanth Menon <nm@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-palmas.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
index 45a535ab48aa..8e3039f0c3f9 100644
--- a/drivers/clk/clk-palmas.c
+++ b/drivers/clk/clk-palmas.c
@@ -18,7 +18,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/mfd/palmas.h>
 #include <linux/module.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

