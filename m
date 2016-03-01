Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Andi Shyti <andi.shyti@samsung.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 36/41] clk: s2mps11: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:21 -0800
Message-Id: <1456858826-28541-37-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Andi Shyti <andi.shyti@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-s2mps11.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 371150aabd15..f8c83977c7fa 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -99,17 +99,14 @@ static struct clk_init_data s2mps11_clks_init[S2MPS11_CLKS_NUM] = {
 	[S2MPS11_CLK_AP] = {
 		.name = "s2mps11_ap",
 		.ops = &s2mps11_clk_ops,
-		.flags = CLK_IS_ROOT,
 	},
 	[S2MPS11_CLK_CP] = {
 		.name = "s2mps11_cp",
 		.ops = &s2mps11_clk_ops,
-		.flags = CLK_IS_ROOT,
 	},
 	[S2MPS11_CLK_BT] = {
 		.name = "s2mps11_bt",
 		.ops = &s2mps11_clk_ops,
-		.flags = CLK_IS_ROOT,
 	},
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
