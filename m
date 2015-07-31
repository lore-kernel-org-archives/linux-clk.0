Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>
Subject: [PATCH 21/26] clk: sunxi: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:04:01 -0700
Message-Id: <1438362246-6664-22-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "Emilio López" <emilio@elopez.com.ar>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/sunxi/clk-factors.c     | 10 +++++-----
 drivers/clk/sunxi/clk-sun6i-ar100.c |  8 ++++----
 drivers/clk/sunxi/clk-sunxi.c       | 10 +++++-----
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
index b8c3ee5688f4..59428dbd607a 100644
--- a/drivers/clk/sunxi/clk-factors.c
+++ b/drivers/clk/sunxi/clk-factors.c
@@ -82,20 +82,20 @@ static long clk_factors_round_rate(struct clk_hw *hw, unsigned long rate,
 static int clk_factors_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req)
 {
-	struct clk *clk = hw->clk, *parent, *best_parent = NULL;
+	struct clk_hw *parent, *best_parent = NULL;
 	int i, num_parents;
 	unsigned long parent_rate, best = 0, child_rate, best_child_rate = 0;
 
 	/* find the parent that can help provide the fastest rate <= rate */
 	num_parents = clk_hw_get_num_parents(hw);
 	for (i = 0; i < num_parents; i++) {
-		parent = clk_get_parent_by_index(clk, i);
+		parent = clk_hw_get_parent_by_index(hw, i);
 		if (!parent)
 			continue;
 		if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)
-			parent_rate = __clk_round_rate(parent, req->rate);
+			parent_rate = clk_hw_round_rate(parent, req->rate);
 		else
-			parent_rate = __clk_get_rate(parent);
+			parent_rate = clk_hw_get_rate(parent);
 
 		child_rate = clk_factors_round_rate(hw, req->rate,
 						    &parent_rate);
@@ -110,7 +110,7 @@ static int clk_factors_determine_rate(struct clk_hw *hw,
 	if (!best_parent)
 		return -EINVAL;
 
-	req->best_parent_hw = __clk_get_hw(best_parent);
+	req->best_parent_hw = best_parent;
 	req->best_parent_rate = best;
 	req->rate = best_child_rate;
 
diff --git a/drivers/clk/sunxi/clk-sun6i-ar100.c b/drivers/clk/sunxi/clk-sun6i-ar100.c
index 3a9459197f9b..806fd019c05d 100644
--- a/drivers/clk/sunxi/clk-sun6i-ar100.c
+++ b/drivers/clk/sunxi/clk-sun6i-ar100.c
@@ -56,12 +56,12 @@ static int ar100_determine_rate(struct clk_hw *hw,
 	for (i = 0; i < nparents; i++) {
 		unsigned long parent_rate;
 		unsigned long tmp_rate;
-		struct clk *parent;
+		struct clk_hw *parent;
 		unsigned long div;
 		int shift;
 
-		parent = clk_get_parent_by_index(hw->clk, i);
-		parent_rate = __clk_get_rate(parent);
+		parent = clk_hw_get_parent_by_index(hw, i);
+		parent_rate = clk_hw_get_rate(parent);
 		div = DIV_ROUND_UP(parent_rate, req->rate);
 
 		/*
@@ -99,7 +99,7 @@ static int ar100_determine_rate(struct clk_hw *hw,
 
 		tmp_rate = (parent_rate >> shift) / div;
 		if (!req->best_parent_hw || tmp_rate > best_rate) {
-			req->best_parent_hw = __clk_get_hw(parent);
+			req->best_parent_hw = parent;
 			req->best_parent_rate = parent_rate;
 			best_rate = tmp_rate;
 		}
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 305193db6048..a834e4a9ecbc 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -123,20 +123,20 @@ static long sun6i_ahb1_clk_round(unsigned long rate, u8 *divp, u8 *pre_divp,
 static int sun6i_ahb1_clk_determine_rate(struct clk_hw *hw,
 					 struct clk_rate_request *req)
 {
-	struct clk *clk = hw->clk, *parent, *best_parent = NULL;
+	struct clk_hw *parent, *best_parent = NULL;
 	int i, num_parents;
 	unsigned long parent_rate, best = 0, child_rate, best_child_rate = 0;
 
 	/* find the parent that can help provide the fastest rate <= rate */
 	num_parents = clk_hw_get_num_parents(hw);
 	for (i = 0; i < num_parents; i++) {
-		parent = clk_get_parent_by_index(clk, i);
+		parent = clk_hw_get_parent_by_index(hw, i);
 		if (!parent)
 			continue;
 		if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)
-			parent_rate = __clk_round_rate(parent, req->rate);
+			parent_rate = clk_hw_round_rate(parent, req->rate);
 		else
-			parent_rate = __clk_get_rate(parent);
+			parent_rate = clk_hw_get_rate(parent);
 
 		child_rate = sun6i_ahb1_clk_round(req->rate, NULL, NULL, i,
 						  parent_rate);
@@ -151,7 +151,7 @@ static int sun6i_ahb1_clk_determine_rate(struct clk_hw *hw,
 	if (!best_parent)
 		return -EINVAL;
 
-	req->best_parent_hw = __clk_get_hw(best_parent);
+	req->best_parent_hw = best_parent;
 	req->best_parent_rate = best;
 	req->rate = best_child_rate;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

