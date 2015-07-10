Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH 39/45] clk: si570: Include clk.h
Date: Fri, 10 Jul 2015 16:33:37 -0700
Message-Id: <1436571223-10959-40-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This clock provider uses the consumer API, so include clk.h
explicitly.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Soren Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-si570.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
index 20a5aec98b1a..cf478aa9fa5d 100644
--- a/drivers/clk/clk-si570.c
+++ b/drivers/clk/clk-si570.c
@@ -19,6 +19,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/module.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
