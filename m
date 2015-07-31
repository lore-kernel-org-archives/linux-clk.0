Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 03/26] clk: Remove __clk_get_num_parents()
Date: Fri, 31 Jul 2015 10:03:43 -0700
Message-Id: <1438362246-6664-4-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

... as all the users have been converted to
clk_hw_get_num_parents() now.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c            | 6 ------
 include/linux/clk-provider.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5a147c2b1e36..3e295f255913 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -283,12 +283,6 @@ struct clk_hw *__clk_get_hw(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_get_hw);
 
-u8 __clk_get_num_parents(struct clk *clk)
-{
-	return !clk ? 0 : clk->core->num_parents;
-}
-EXPORT_SYMBOL_GPL(__clk_get_num_parents);
-
 unsigned int clk_hw_get_num_parents(struct clk_hw *hw)
 {
 	return hw->core->num_parents;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 214634a88f38..8fe7dac77a0d 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -608,7 +608,6 @@ void devm_clk_unregister(struct device *dev, struct clk *clk);
 /* helper functions */
 const char *__clk_get_name(struct clk *clk);
 struct clk_hw *__clk_get_hw(struct clk *clk);
-u8 __clk_get_num_parents(struct clk *clk);
 unsigned int clk_hw_get_num_parents(struct clk_hw *hw);
 struct clk *__clk_get_parent(struct clk *clk);
 struct clk *clk_get_parent_by_index(struct clk *clk, u8 index);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
