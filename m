Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/6] clk: Drop unnecessary OOM prints
Date: Thu, 30 Apr 2015 17:14:18 -0700
Message-Id: <1430439261-10291-4-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
References: <1430439261-10291-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

We don't need to print error messages when allocations fail.
We'll get a nice backtrace in such situations anyway.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 88439af5d032..8d36100c00ce 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2476,14 +2476,12 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 
 	core = kzalloc(sizeof(*core), GFP_KERNEL);
 	if (!core) {
-		pr_err("%s: could not allocate clk\n", __func__);
 		ret = -ENOMEM;
 		goto fail_out;
 	}
 
 	core->name = kstrdup_const(hw->init->name, GFP_KERNEL);
 	if (!core->name) {
-		pr_err("%s: could not allocate clk->name\n", __func__);
 		ret = -ENOMEM;
 		goto fail_name;
 	}
@@ -2500,7 +2498,6 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 					GFP_KERNEL);
 
 	if (!core->parent_names) {
-		pr_err("%s: could not allocate clk->parent_names\n", __func__);
 		ret = -ENOMEM;
 		goto fail_parent_names;
 	}
@@ -2511,7 +2508,6 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 		core->parent_names[i] = kstrdup_const(hw->init->parent_names[i],
 						GFP_KERNEL);
 		if (!core->parent_names[i]) {
-			pr_err("%s: could not copy parent_names\n", __func__);
 			ret = -ENOMEM;
 			goto fail_parent_names_copy;
 		}
@@ -2521,7 +2517,6 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 
 	hw->clk = __clk_create_clk(hw, NULL, NULL);
 	if (IS_ERR(hw->clk)) {
-		pr_err("%s: could not allocate per-user clk\n", __func__);
 		ret = PTR_ERR(hw->clk);
 		goto fail_parent_names_copy;
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
