Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 1/2] clk: fixed-factor: Remove export symbol on setup function
Date: Fri, 12 Aug 2016 18:50:22 -0700
Message-Id: <20160813015023.28221-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This function is marked __init, so it can't possibly need to be
exported to modules. Remove the marking.

Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-fixed-factor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 070d0d75da97..a5d402de5584 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -196,7 +196,6 @@ void __init of_fixed_factor_clk_setup(struct device_node *node)
 {
 	_of_fixed_factor_clk_setup(node);
 }
-EXPORT_SYMBOL_GPL(of_fixed_factor_clk_setup);
 CLK_OF_DECLARE(fixed_factor_clk, "fixed-factor-clock",
 		of_fixed_factor_clk_setup);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
