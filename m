Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH] clk: h8300: Remove clk.h and clkdev.h includes
Date: Mon, 13 Jul 2015 16:48:57 -0700
Message-Id: <1436831337-8996-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Neither of these includes are used in this driver, remove them.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/h8300/clk-h8s2678.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/h8300/clk-h8s2678.c b/drivers/clk/h8300/clk-h8s2678.c
index 4701b093e497..44aa45f71f1b 100644
--- a/drivers/clk/h8300/clk-h8s2678.c
+++ b/drivers/clk/h8300/clk-h8s2678.c
@@ -4,8 +4,6 @@
  * Copyright 2015 Yoshinori Sato <ysato@users.sourceforge.jp>
  */
 
-#include <linux/clk.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/device.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

