Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH 35/41] clk: rk808: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:20 -0800
Message-Id: <1456858826-28541-36-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Chris Zhong <zyw@rock-chips.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-rk808.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-rk808.c b/drivers/clk/clk-rk808.c
index 0fee2f4ca258..74383039761e 100644
--- a/drivers/clk/clk-rk808.c
+++ b/drivers/clk/clk-rk808.c
@@ -106,7 +106,6 @@ static int rk808_clkout_probe(struct platform_device *pdev)
 	if (!clk_table)
 		return -ENOMEM;
 
-	init.flags = CLK_IS_ROOT;
 	init.parent_names = NULL;
 	init.num_parents = 0;
 	init.name = "rk808-clkout1";
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
