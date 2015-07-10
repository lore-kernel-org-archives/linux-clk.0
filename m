Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH 04/45] clk: efm32gg: Remove clk.h include
Date: Fri, 10 Jul 2015 16:33:02 -0700
Message-Id: <1436571223-10959-5-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the include here because this is a
provider driver.

Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-efm32gg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-efm32gg.c b/drivers/clk/clk-efm32gg.c
index 73a8d0ff530c..bac4553f04b8 100644
--- a/drivers/clk/clk-efm32gg.c
+++ b/drivers/clk/clk-efm32gg.c
@@ -6,7 +6,6 @@
  * the terms of the GNU General Public License version 2 as published by the
  * Free Software Foundation.
  */
-#include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

