Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 06/26] clk: Add clk_hw_*() API for use by providers
Date: Fri, 31 Jul 2015 10:03:46 -0700
Message-Id: <1438362246-6664-7-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

clk providers shouldn't need to use the consumer API (clk.h).
Add a provider API to replace the __clk_*() APIs that take struct
clk_hw as their first argument instead of a struct clk pointer.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c            | 49 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  7 +++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e06e906315e1..821f1c510955 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -277,6 +277,12 @@ const char *__clk_get_name(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_get_name);
 
+const char *clk_hw_get_name(struct clk_hw *hw)
+{
+	return hw->core->name;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_name);
+
 struct clk_hw *__clk_get_hw(struct clk *clk)
 {
 	return !clk ? NULL : clk->core->hw;
@@ -299,6 +305,12 @@ struct clk *__clk_get_parent(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_get_parent);
 
+struct clk_hw *clk_hw_get_parent(struct clk_hw *hw)
+{
+	return hw->core->parent ? hw->core->parent->hw : NULL;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_parent);
+
 static struct clk_core *__clk_lookup_subtree(const char *name,
 					     struct clk_core *core)
 {
@@ -369,6 +381,16 @@ struct clk *clk_get_parent_by_index(struct clk *clk, u8 index)
 }
 EXPORT_SYMBOL_GPL(clk_get_parent_by_index);
 
+struct clk_hw *clk_hw_get_parent_by_index(struct clk_hw *hw, unsigned int index)
+{
+	struct clk_core *parent;
+
+	parent = clk_core_get_parent_by_index(hw->core, index);
+
+	return !parent ? NULL : parent->hw;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_parent_by_index);
+
 unsigned int __clk_get_enable_count(struct clk *clk)
 {
 	return !clk ? 0 : clk->core->enable_count;
@@ -404,6 +426,12 @@ unsigned long __clk_get_rate(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(__clk_get_rate);
 
+unsigned long clk_hw_get_rate(struct clk_hw *hw)
+{
+	return clk_core_get_rate_nolock(hw->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_rate);
+
 static unsigned long __clk_get_accuracy(struct clk_core *core)
 {
 	if (!core)
@@ -432,6 +460,11 @@ bool __clk_is_prepared(struct clk *clk)
 	return clk_core_is_prepared(clk->core);
 }
 
+bool clk_hw_is_prepared(struct clk_hw *hw)
+{
+	return clk_core_is_prepared(hw->core);
+}
+
 bool __clk_is_enabled(struct clk *clk)
 {
 	if (!clk)
@@ -866,6 +899,22 @@ unsigned long __clk_round_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(__clk_round_rate);
 
+unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
+{
+	int ret;
+	struct clk_rate_request req;
+
+	clk_core_get_boundaries(hw->core, &req.min_rate, &req.max_rate);
+	req.rate = rate;
+
+	ret = clk_core_round_rate_nolock(hw->core, &req);
+	if (ret)
+		return 0;
+
+	return req.rate;
+}
+EXPORT_SYMBOL_GPL(clk_hw_round_rate);
+
 /**
  * clk_round_rate - round the given rate for a clk
  * @clk: the clk for which we are rounding a rate
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a0e7d626bc90..2944a515111d 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -607,15 +607,21 @@ void devm_clk_unregister(struct device *dev, struct clk *clk);
 
 /* helper functions */
 const char *__clk_get_name(struct clk *clk);
+const char *clk_hw_get_name(struct clk_hw *hw);
 struct clk_hw *__clk_get_hw(struct clk *clk);
 unsigned int clk_hw_get_num_parents(struct clk_hw *hw);
 struct clk *__clk_get_parent(struct clk *clk);
+struct clk_hw *clk_hw_get_parent(struct clk_hw *hw);
 struct clk *clk_get_parent_by_index(struct clk *clk, u8 index);
+struct clk_hw *clk_hw_get_parent_by_index(struct clk_hw *hw,
+					  unsigned int index);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long __clk_get_rate(struct clk *clk);
+unsigned long clk_hw_get_rate(struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
 unsigned long clk_hw_get_flags(struct clk_hw *hw);
 bool __clk_is_prepared(struct clk *clk);
+bool clk_hw_is_prepared(struct clk_hw *hw);
 bool __clk_is_enabled(struct clk *clk);
 struct clk *__clk_lookup(const char *name);
 int __clk_mux_determine_rate(struct clk_hw *hw,
@@ -637,6 +643,7 @@ static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
  * FIXME clock api without lock protection
  */
 unsigned long __clk_round_rate(struct clk *clk, unsigned long rate);
+unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate);
 
 struct of_device_id;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

