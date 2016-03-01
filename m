Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49953 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753644AbcCATAt (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2016 14:00:49 -0500
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 39/41] clk: twl6040: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:24 -0800
Message-Id: <1456858826-28541-40-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-twl6040.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-twl6040.c b/drivers/clk/clk-twl6040.c
index 8e5ed649a098..697c66757400 100644
--- a/drivers/clk/clk-twl6040.c
+++ b/drivers/clk/clk-twl6040.c
@@ -74,7 +74,6 @@ static const struct clk_ops twl6040_mcpdm_ops = {
 static struct clk_init_data wm831x_clkout_init = {
 	.name = "mcpdm_fclk",
 	.ops = &twl6040_mcpdm_ops,
-	.flags = CLK_IS_ROOT,
 };
 
 static int twl6040_clk_probe(struct platform_device *pdev)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

