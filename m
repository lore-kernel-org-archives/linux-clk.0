Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH 20/45] clk: nxp: Remove clk.h include
Date: Fri, 10 Jul 2015 16:33:18 -0700
Message-Id: <1436571223-10959-21-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the include here because this is a
provider driver.

Cc: Joachim Eastwood <manabian@gmail.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/nxp/clk-lpc18xx-cgu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/nxp/clk-lpc18xx-cgu.c b/drivers/clk/nxp/clk-lpc18xx-cgu.c
index 81e9e1c788f4..e0a3cb8970ab 100644
--- a/drivers/clk/nxp/clk-lpc18xx-cgu.c
+++ b/drivers/clk/nxp/clk-lpc18xx-cgu.c
@@ -8,7 +8,6 @@
  * warranty of any kind, whether express or implied.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

