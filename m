Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 26/26] clk: Remove unused provider APIs
Date: Fri, 31 Jul 2015 10:04:06 -0700
Message-Id: <1438362246-6664-27-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Remove these APIs now that we've converted the users of these
APIs to their replacement clk_hw based versions.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c            | 86 +++++++++-----------------------------------
 include/linux/clk-provider.h |  5 ---
 2 files changed, 16 insertions(+), 75 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 821f1c510955..aaa46f7ed572 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -295,16 +295,6 @@ unsigned int clk_hw_get_num_parents(struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_num_parents);
 
-struct clk *__clk_get_parent(struct clk *clk)
-{
-	if (!clk)
-		return NULL;
-
-	/* TODO: Create a per-user clk and change callers to call clk_put */
-	return !clk->core->parent ? NULL : clk->core->parent->hw->clk;
-}
-EXPORT_SYMBOL_GPL(__clk_get_parent);
-
 struct clk_hw *clk_hw_get_parent(struct clk_hw *hw)
 {
 	return hw->core->parent ? hw->core->parent->hw : NULL;
@@ -368,19 +358,6 @@ static struct clk_core *clk_core_get_parent_by_index(struct clk_core *core,
 		return core->parents[index];
 }
 
-struct clk *clk_get_parent_by_index(struct clk *clk, u8 index)
-{
-	struct clk_core *parent;
-
-	if (!clk)
-		return NULL;
-
-	parent = clk_core_get_parent_by_index(clk->core, index);
-
-	return !parent ? NULL : parent->hw->clk;
-}
-EXPORT_SYMBOL_GPL(clk_get_parent_by_index);
-
 struct clk_hw *clk_hw_get_parent_by_index(struct clk_hw *hw, unsigned int index)
 {
 	struct clk_core *parent;
@@ -417,15 +394,6 @@ out:
 	return ret;
 }
 
-unsigned long __clk_get_rate(struct clk *clk)
-{
-	if (!clk)
-		return 0;
-
-	return clk_core_get_rate_nolock(clk->core);
-}
-EXPORT_SYMBOL_GPL(__clk_get_rate);
-
 unsigned long clk_hw_get_rate(struct clk_hw *hw)
 {
 	return clk_core_get_rate_nolock(hw->core);
@@ -452,14 +420,6 @@ unsigned long clk_hw_get_flags(struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_flags);
 
-bool __clk_is_prepared(struct clk *clk)
-{
-	if (!clk)
-		return false;
-
-	return clk_core_is_prepared(clk->core);
-}
-
 bool clk_hw_is_prepared(struct clk_hw *hw)
 {
 	return clk_core_is_prepared(hw->core);
@@ -873,32 +833,6 @@ int __clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 }
 EXPORT_SYMBOL_GPL(__clk_determine_rate);
 
-/**
- * __clk_round_rate - round the given rate for a clk
- * @clk: round the rate of this clock
- * @rate: the rate which is to be rounded
- *
- * Useful for clk_ops such as .set_rate
- */
-unsigned long __clk_round_rate(struct clk *clk, unsigned long rate)
-{
-	struct clk_rate_request req;
-	int ret;
-
-	if (!clk)
-		return 0;
-
-	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
-	req.rate = rate;
-
-	ret = clk_core_round_rate_nolock(clk->core, &req);
-	if (ret)
-		return 0;
-
-	return req.rate;
-}
-EXPORT_SYMBOL_GPL(__clk_round_rate);
-
 unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 {
 	int ret;
@@ -926,16 +860,24 @@ EXPORT_SYMBOL_GPL(clk_hw_round_rate);
  */
 long clk_round_rate(struct clk *clk, unsigned long rate)
 {
-	unsigned long ret;
+	struct clk_rate_request req;
+	int ret;
 
 	if (!clk)
 		return 0;
 
 	clk_prepare_lock();
-	ret = __clk_round_rate(clk, rate);
+
+	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
+	req.rate = rate;
+
+	ret = clk_core_round_rate_nolock(clk->core, &req);
 	clk_prepare_unlock();
 
-	return ret;
+	if (ret)
+		return ret;
+
+	return req.rate;
 }
 EXPORT_SYMBOL_GPL(clk_round_rate);
 
@@ -1682,8 +1624,12 @@ struct clk *clk_get_parent(struct clk *clk)
 {
 	struct clk *parent;
 
+	if (!clk)
+		return NULL;
+
 	clk_prepare_lock();
-	parent = __clk_get_parent(clk);
+	/* TODO: Create a per-user clk and change callers to call clk_put */
+	parent = !clk->core->parent ? NULL : clk->core->parent->hw->clk;
 	clk_prepare_unlock();
 
 	return parent;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2944a515111d..0d3128fbc14e 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -610,17 +610,13 @@ const char *__clk_get_name(struct clk *clk);
 const char *clk_hw_get_name(struct clk_hw *hw);
 struct clk_hw *__clk_get_hw(struct clk *clk);
 unsigned int clk_hw_get_num_parents(struct clk_hw *hw);
-struct clk *__clk_get_parent(struct clk *clk);
 struct clk_hw *clk_hw_get_parent(struct clk_hw *hw);
-struct clk *clk_get_parent_by_index(struct clk *clk, u8 index);
 struct clk_hw *clk_hw_get_parent_by_index(struct clk_hw *hw,
 					  unsigned int index);
 unsigned int __clk_get_enable_count(struct clk *clk);
-unsigned long __clk_get_rate(struct clk *clk);
 unsigned long clk_hw_get_rate(struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
 unsigned long clk_hw_get_flags(struct clk_hw *hw);
-bool __clk_is_prepared(struct clk *clk);
 bool clk_hw_is_prepared(struct clk_hw *hw);
 bool __clk_is_enabled(struct clk *clk);
 struct clk *__clk_lookup(const char *name);
@@ -642,7 +638,6 @@ static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 /*
  * FIXME clock api without lock protection
  */
-unsigned long __clk_round_rate(struct clk *clk, unsigned long rate);
 unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate);
 
 struct of_device_id;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

