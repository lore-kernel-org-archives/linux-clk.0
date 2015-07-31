Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chao Xie <chao.xie@marvell.com>
Subject: [PATCH 13/26] clk: mmp: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:03:53 -0700
Message-Id: <1438362246-6664-14-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Cc: Chao Xie <chao.xie@marvell.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/mmp/clk-gate.c |  3 +--
 drivers/clk/mmp/clk-mix.c  | 35 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/mmp/clk-gate.c b/drivers/clk/mmp/clk-gate.c
index adbd9d64ded2..d20cd3431ac2 100644
--- a/drivers/clk/mmp/clk-gate.c
+++ b/drivers/clk/mmp/clk-gate.c
@@ -27,7 +27,6 @@
 static int mmp_clk_gate_enable(struct clk_hw *hw)
 {
 	struct mmp_clk_gate *gate = to_clk_mmp_gate(hw);
-	struct clk *clk = hw->clk;
 	unsigned long flags = 0;
 	unsigned long rate;
 	u32 tmp;
@@ -44,7 +43,7 @@ static int mmp_clk_gate_enable(struct clk_hw *hw)
 		spin_unlock_irqrestore(gate->lock, flags);
 
 	if (gate->flags & MMP_CLK_GATE_NEED_DELAY) {
-		rate = __clk_get_rate(clk);
+		rate = clk_hw_get_rate(hw);
 		/* Need delay 2 cycles. */
 		udelay(2000000/rate);
 	}
diff --git a/drivers/clk/mmp/clk-mix.c b/drivers/clk/mmp/clk-mix.c
index 8653e555c920..979e2cfc07c2 100644
--- a/drivers/clk/mmp/clk-mix.c
+++ b/drivers/clk/mmp/clk-mix.c
@@ -113,15 +113,15 @@ static void _filter_clk_table(struct mmp_clk_mix *mix,
 {
 	int i;
 	struct mmp_clk_mix_clk_table *item;
-	struct clk *parent, *clk;
+	struct clk_hw *parent, *hw;
 	unsigned long parent_rate;
 
-	clk = mix->hw.clk;
+	hw = &mix->hw
 
 	for (i = 0; i < table_size; i++) {
 		item = &table[i];
-		parent = clk_get_parent_by_index(clk, item->parent_index);
-		parent_rate = __clk_get_rate(parent);
+		parent = clk_hw_get_parent_by_index(hw, item->parent_index);
+		parent_rate = clk_hw_get_rate(parent);
 		if (parent_rate % item->rate) {
 			item->valid = 0;
 		} else {
@@ -181,7 +181,7 @@ static int _set_rate(struct mmp_clk_mix *mix, u32 mux_val, u32 div_val,
 
 		if (timeout == 0) {
 			pr_err("%s:%s cannot do frequency change\n",
-				__func__, __clk_get_name(mix->hw.clk));
+				__func__, clk_hw_get_name(&mix->hw));
 			ret = -EBUSY;
 			goto error;
 		}
@@ -206,16 +206,14 @@ static int mmp_clk_mix_determine_rate(struct clk_hw *hw,
 {
 	struct mmp_clk_mix *mix = to_clk_mix(hw);
 	struct mmp_clk_mix_clk_table *item;
-	struct clk *parent, *parent_best, *mix_clk;
+	struct clk_hw *parent, *parent_best;
 	unsigned long parent_rate, mix_rate, mix_rate_best, parent_rate_best;
 	unsigned long gap, gap_best;
 	u32 div_val_max;
 	unsigned int div;
 	int i, j;
 
-	mix_clk = hw->clk;
 
-	parent = NULL;
 	mix_rate_best = 0;
 	parent_rate_best = 0;
 	gap_best = ULONG_MAX;
@@ -226,9 +224,9 @@ static int mmp_clk_mix_determine_rate(struct clk_hw *hw,
 			item = &mix->table[i];
 			if (item->valid == 0)
 				continue;
-			parent = clk_get_parent_by_index(mix_clk,
+			parent = clk_hw_get_parent_by_index(hw,
 							item->parent_index);
-			parent_rate = __clk_get_rate(parent);
+			parent_rate = clk_hw_get_rate(parent);
 			mix_rate = parent_rate / item->divisor;
 			gap = abs(mix_rate - req->rate);
 			if (parent_best == NULL || gap < gap_best) {
@@ -242,8 +240,8 @@ static int mmp_clk_mix_determine_rate(struct clk_hw *hw,
 		}
 	} else {
 		for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
-			parent = clk_get_parent_by_index(mix_clk, i);
-			parent_rate = __clk_get_rate(parent);
+			parent = clk_hw_get_parent_by_index(hw, i);
+			parent_rate = clk_hw_get_rate(parent);
 			div_val_max = _get_maxdiv(mix);
 			for (j = 0; j < div_val_max; j++) {
 				div = _get_div(mix, j);
@@ -266,7 +264,7 @@ found:
 		return -EINVAL;
 
 	req->best_parent_rate = parent_rate_best;
-	req->best_parent_hw = __clk_get_hw(parent_best);
+	req->best_parent_hw = parent_best;
 	req->rate = mix_rate_best;
 
 	return 0;
@@ -382,20 +380,19 @@ static int mmp_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct mmp_clk_mix_clk_table *item;
 	unsigned long parent_rate;
 	unsigned int best_divisor;
-	struct clk *mix_clk, *parent;
+	struct clk_hw *parent;
 	int i;
 
 	best_divisor = best_parent_rate / rate;
 
-	mix_clk = hw->clk;
 	if (mix->table) {
 		for (i = 0; i < mix->table_size; i++) {
 			item = &mix->table[i];
 			if (item->valid == 0)
 				continue;
-			parent = clk_get_parent_by_index(mix_clk,
+			parent = clk_hw_get_parent_by_index(hw,
 							item->parent_index);
-			parent_rate = __clk_get_rate(parent);
+			parent_rate = clk_hw_get_rate(parent);
 			if (parent_rate == best_parent_rate
 				&& item->divisor == best_divisor)
 				break;
@@ -409,8 +406,8 @@ static int mmp_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			return -EINVAL;
 	} else {
 		for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
-			parent = clk_get_parent_by_index(mix_clk, i);
-			parent_rate = __clk_get_rate(parent);
+			parent = clk_hw_get_parent_by_index(hw, i);
+			parent_rate = clk_hw_get_rate(parent);
 			if (parent_rate == best_parent_rate)
 				break;
 		}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
