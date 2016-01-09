Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jens Kuske <jenskuske@gmail.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH] clk: sunxi: Drop clk.h include
Date: Fri,  8 Jan 2016 17:14:42 -0800
Message-Id: <1452302082-18580-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This file is a clock provider, not a clk consumer. Drop the clk.h
include.

Cc: Jens Kuske <jenskuske@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/sunxi/clk-sun8i-bus-gates.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/sunxi/clk-sun8i-bus-gates.c b/drivers/clk/sunxi/clk-sun8i-bus-gates.c
index e32d18ba252b..1113eb98c9b4 100644
--- a/drivers/clk/sunxi/clk-sun8i-bus-gates.c
+++ b/drivers/clk/sunxi/clk-sun8i-bus-gates.c
@@ -17,7 +17,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
