Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:57475 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759746AbeD1JZB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 28 Apr 2018 05:25:01 -0400
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 1/2] clk: Add clk_set_rate_safe() API support
Date: Sat, 28 Apr 2018 17:16:57 +0800
Message-Id: <1524907018-195819-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Elaine Zhang <zhangqing@rock-chips.com>

Compared with clk_set_rate(), this API would maintain the clock rate
of its children to avoid exception if the new rate is higher than
the old rate.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/clk.c   | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk.h | 15 +++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9ae92aa..7dec6a8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2013,6 +2013,57 @@ int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
 EXPORT_SYMBOL_GPL(clk_set_rate_exclusive);
 
 /**
+ * clk_set_rate_safe - specify a new rate for clk
+ * @clk: the clk whose rate is being changed
+ * @new_rate: the new rate for clk
+ *
+ * Compared with clk_set_rate, this API would also make sure children
+ * of @clk are in the safe clock rate range by maintaining the original
+ * clock rate.
+ *
+ * When changing the parent's clock rate in some cases, we should make
+ * sure the children's clock rate are still in the safe range, namely
+ * [clk->min_rate, clk->max_rate], which is especially important
+ * if its child is a system bus. In general, the lower clock rate the
+ * safer, so simply walk through the parent's clock chain to maintain
+ * the children's clock rate if the new clock rate is higher than the
+ * older one.
+ *
+ * Returns 0 on success, -EERROR otherwise.
+ */
+int clk_set_rate_safe(struct clk *clk, unsigned long new_rate)
+{
+	unsigned long old_rate, child_rate;
+	struct hlist_node *hn;
+	struct clk_core *core;
+	int div, ret;
+
+	if (!clk)
+		return 0;
+
+	old_rate = clk_get_rate(clk);
+
+	if (new_rate <= old_rate)
+		goto set_rate;
+
+	hlist_for_each_entry_safe(core, hn, &clk->core->children,
+				  child_node) {
+		if (strcmp(core->parent->name, clk->core->name))
+			continue;
+
+		child_rate = core->rate;
+		div = DIV_ROUND_UP_ULL((u64)new_rate, old_rate);
+		core->rate = child_rate / div;
+		clk_change_rate(core);
+	}
+
+set_rate:
+	ret = clk_set_rate(clk, new_rate);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_set_rate_safe);
+
+/**
  * clk_set_rate_range - set a rate range for a clock source
  * @clk: clock source
  * @min: desired minimum clock rate in Hz, inclusive
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 0dbd088..244d030 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -505,6 +505,16 @@ int __must_check clk_bulk_enable(int num_clks,
 int clk_set_rate(struct clk *clk, unsigned long rate);
 
 /**
+ * clk_set_rate_safe - set the clock rate for a clock source and make sure
+ *		       its children still maintain the original rate
+ * @clk: clock source
+ * @rate: desired clock rate in Hz
+ *
+ * Returns success (0) or negative errno.
+ */
+int clk_set_rate_safe(struct clk *clk, unsigned long rate);
+
+/**
  * clk_set_rate_exclusive- set the clock rate and claim exclusivity over
  *                         clock source
  * @clk: clock source
@@ -671,6 +681,11 @@ static inline int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
 	return 0;
 }
 
+static inline int clk_set_rate_safe(struct clk *clk, unsigned long rate)
+{
+	return 0;
+}
+
 static inline long clk_round_rate(struct clk *clk, unsigned long rate)
 {
 	return 0;
-- 
1.9.1


