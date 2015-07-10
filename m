Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 03/45] clk: clps711x: Remove clk.h include
Date: Fri, 10 Jul 2015 16:33:01 -0700
Message-Id: <1436571223-10959-4-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the include here because this is a
provider driver.

Cc: Alexander Shiyan <shc_work@mail.ru>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-clps711x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-clps711x.c b/drivers/clk/clk-clps711x.c
index 715eec1a9902..ff4ef4f1df62 100644
--- a/drivers/clk/clk-clps711x.c
+++ b/drivers/clk/clk-clps711x.c
@@ -9,7 +9,6 @@
  * (at your option) any later version.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/io.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

