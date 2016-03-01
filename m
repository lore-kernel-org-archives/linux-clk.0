Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 16/41] clk: sunxi: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:01 -0800
Message-Id: <1456858826-28541-17-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/sunxi/clk-a10-hosc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi/clk-a10-hosc.c b/drivers/clk/sunxi/clk-a10-hosc.c
index 0481d5d673d6..3bb4f6295474 100644
--- a/drivers/clk/sunxi/clk-a10-hosc.c
+++ b/drivers/clk/sunxi/clk-a10-hosc.c
@@ -54,8 +54,7 @@ static void __init sun4i_osc_clk_setup(struct device_node *node)
 			NULL, 0,
 			NULL, NULL,
 			&fixed->hw, &clk_fixed_rate_ops,
-			&gate->hw, &clk_gate_ops,
-			CLK_IS_ROOT);
+			&gate->hw, &clk_gate_ops, 0);
 
 	if (IS_ERR(clk))
 		goto err_free_gate;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
