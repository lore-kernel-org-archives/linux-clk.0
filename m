Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 29/41] clk: max77{686,802}: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:14 -0800
Message-Id: <1456858826-28541-30-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Javier Martinez Canillas <javier@osg.samsung.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-max77686.c | 3 ---
 drivers/clk/clk-max77802.c | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index 446c2fe76dc2..9b6f2772e948 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -38,17 +38,14 @@ static struct clk_init_data max77686_clks_init[MAX77686_CLKS_NUM] = {
 	[MAX77686_CLK_AP] = {
 		.name = "32khz_ap",
 		.ops = &max_gen_clk_ops,
-		.flags = CLK_IS_ROOT,
 	},
 	[MAX77686_CLK_CP] = {
 		.name = "32khz_cp",
 		.ops = &max_gen_clk_ops,
-		.flags = CLK_IS_ROOT,
 	},
 	[MAX77686_CLK_PMIC] = {
 		.name = "32khz_pmic",
 		.ops = &max_gen_clk_ops,
-		.flags = CLK_IS_ROOT,
 	},
 };
 
diff --git a/drivers/clk/clk-max77802.c b/drivers/clk/clk-max77802.c
index 4a89f7979ba0..355dd2e522c3 100644
--- a/drivers/clk/clk-max77802.c
+++ b/drivers/clk/clk-max77802.c
@@ -39,12 +39,10 @@ static struct clk_init_data max77802_clks_init[MAX77802_CLKS_NUM] = {
 	[MAX77802_CLK_32K_AP] = {
 		.name = "32khz_ap",
 		.ops = &max_gen_clk_ops,
-		.flags = CLK_IS_ROOT,
 	},
 	[MAX77802_CLK_32K_CP] = {
 		.name = "32khz_cp",
 		.ops = &max_gen_clk_ops,
-		.flags = CLK_IS_ROOT,
 	},
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
