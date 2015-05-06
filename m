Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 02/19] clk: Silence sparse warnings about __clk_{get,put}()
Date: Wed,  6 May 2015 00:39:39 -0700
Message-Id: <1430897996-11597-3-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/clk.c:2700:5: warning: symbol '__clk_get' was not declared. Should it be static?
drivers/clk/clk.c:2713:6: warning: symbol '__clk_put' was not declared. Should it be static?

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 36d1a0156ce7..30d45c657a07 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -21,6 +21,7 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/sched.h>
+#include <linux/clkdev.h>
 
 #include "clk.h"
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
