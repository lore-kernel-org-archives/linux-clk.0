Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 11/45] clk: u300: Remove clk.h include
Date: Fri, 10 Jul 2015 16:33:09 -0700
Message-Id: <1436571223-10959-12-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the include here because this is a
provider driver. Also add in slab.h because without clkdev.h
compilation of this file would fail.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-u300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-u300.c b/drivers/clk/clk-u300.c
index 18bf5e576b93..95d1742dac30 100644
--- a/drivers/clk/clk-u300.c
+++ b/drivers/clk/clk-u300.c
@@ -5,8 +5,8 @@
  * Author: Linus Walleij <linus.walleij@stericsson.com>
  * Author: Jonas Aaberg <jonas.aberg@stericsson.com>
  */
-#include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/clk-provider.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

