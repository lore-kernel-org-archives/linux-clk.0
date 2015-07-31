Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 12/26] clk: Convert basic types to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:03:52 -0700
Message-Id: <1438362246-6664-13-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-composite.c    | 14 +++++++-------
 drivers/clk/clk-divider.c      |  6 +++---
 drivers/clk/clk-fixed-factor.c |  3 +--
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 15bbe7e96e10..4735de0660cc 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -63,7 +63,7 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 	const struct clk_ops *mux_ops = composite->mux_ops;
 	struct clk_hw *rate_hw = composite->rate_hw;
 	struct clk_hw *mux_hw = composite->mux_hw;
-	struct clk *parent;
+	struct clk_hw *parent;
 	unsigned long parent_rate;
 	long tmp_rate, best_rate = 0;
 	unsigned long rate_diff;
@@ -79,9 +79,9 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 		req->best_parent_hw = NULL;
 
 		if (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT) {
-			parent = clk_get_parent(mux_hw->clk);
-			req->best_parent_hw = __clk_get_hw(parent);
-			req->best_parent_rate = __clk_get_rate(parent);
+			parent = clk_hw_get_parent(mux_hw);
+			req->best_parent_hw = parent;
+			req->best_parent_rate = clk_hw_get_rate(parent);
 
 			rate = rate_ops->round_rate(rate_hw, req->rate,
 						    &req->best_parent_rate);
@@ -93,11 +93,11 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 		}
 
 		for (i = 0; i < clk_hw_get_num_parents(mux_hw); i++) {
-			parent = clk_get_parent_by_index(mux_hw->clk, i);
+			parent = clk_hw_get_parent_by_index(mux_hw, i);
 			if (!parent)
 				continue;
 
-			parent_rate = __clk_get_rate(parent);
+			parent_rate = clk_hw_get_rate(parent);
 
 			tmp_rate = rate_ops->round_rate(rate_hw, req->rate,
 							&parent_rate);
@@ -108,7 +108,7 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 
 			if (!rate_diff || !req->best_parent_hw
 				       || best_rate_diff > rate_diff) {
-				req->best_parent_hw = __clk_get_hw(parent);
+				req->best_parent_hw = parent;
 				req->best_parent_rate = parent_rate;
 				best_rate_diff = rate_diff;
 				best_rate = tmp_rate;
diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 79003042aabb..f24d0a19ae70 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -128,7 +128,7 @@ unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
 	if (!div) {
 		WARN(!(flags & CLK_DIVIDER_ALLOW_ZERO),
 			"%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
-			__clk_get_name(hw->clk));
+			clk_hw_get_name(hw));
 		return parent_rate;
 	}
 
@@ -316,7 +316,7 @@ static int clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 			*best_parent_rate = parent_rate_saved;
 			return i;
 		}
-		parent_rate = __clk_round_rate(__clk_get_parent(hw->clk),
+		parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw),
 					       rate * i);
 		now = DIV_ROUND_UP(parent_rate, i);
 		if (_is_best_div(rate, now, best, flags)) {
@@ -328,7 +328,7 @@ static int clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 
 	if (!bestdiv) {
 		bestdiv = _get_maxdiv(table, width, flags);
-		*best_parent_rate = __clk_round_rate(__clk_get_parent(hw->clk), 1);
+		*best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), 1);
 	}
 
 	return bestdiv;
diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 4a8ebfd82734..83de57aeceea 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -45,8 +45,7 @@ static long clk_factor_round_rate(struct clk_hw *hw, unsigned long rate,
 		unsigned long best_parent;
 
 		best_parent = (rate / fix->mult) * fix->div;
-		*prate = __clk_round_rate(__clk_get_parent(hw->clk),
-				best_parent);
+		*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
 	}
 
 	return (*prate / fix->div) * fix->mult;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

