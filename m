Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 10/26] clk: at91: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:03:50 -0700
Message-Id: <1438362246-6664-11-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/at91/clk-peripheral.c   |  6 +++---
 drivers/clk/at91/clk-programmable.c |  8 ++++----
 drivers/clk/at91/clk-usb.c          | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
index df2c1afa52b4..e4d7b574f1ea 100644
--- a/drivers/clk/at91/clk-peripheral.c
+++ b/drivers/clk/at91/clk-peripheral.c
@@ -134,7 +134,7 @@ at91_clk_register_peripheral(struct at91_pmc *pmc, const char *name,
 
 static void clk_sam9x5_peripheral_autodiv(struct clk_sam9x5_peripheral *periph)
 {
-	struct clk *parent;
+	struct clk_hw *parent;
 	unsigned long parent_rate;
 	int shift = 0;
 
@@ -142,8 +142,8 @@ static void clk_sam9x5_peripheral_autodiv(struct clk_sam9x5_peripheral *periph)
 		return;
 
 	if (periph->range.max) {
-		parent = clk_get_parent_by_index(periph->hw.clk, 0);
-		parent_rate = __clk_get_rate(parent);
+		parent = clk_hw_get_parent_by_index(&periph->hw, 0);
+		parent_rate = clk_hw_get_rate(parent);
 		if (!parent_rate)
 			return;
 
diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
index 42ec812404ab..14b270b85fec 100644
--- a/drivers/clk/at91/clk-programmable.c
+++ b/drivers/clk/at91/clk-programmable.c
@@ -57,7 +57,7 @@ static unsigned long clk_programmable_recalc_rate(struct clk_hw *hw,
 static int clk_programmable_determine_rate(struct clk_hw *hw,
 					   struct clk_rate_request *req)
 {
-	struct clk *parent = NULL;
+	struct clk_hw *parent;
 	long best_rate = -EINVAL;
 	unsigned long parent_rate;
 	unsigned long tmp_rate;
@@ -65,11 +65,11 @@ static int clk_programmable_determine_rate(struct clk_hw *hw,
 	int i;
 
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
-		parent = clk_get_parent_by_index(hw->clk, i);
+		parent = clk_hw_get_parent_by_index(hw, i);
 		if (!parent)
 			continue;
 
-		parent_rate = __clk_get_rate(parent);
+		parent_rate = clk_hw_get_rate(parent);
 		for (shift = 0; shift < PROG_PRES_MASK; shift++) {
 			tmp_rate = parent_rate >> shift;
 			if (tmp_rate <= req->rate)
@@ -83,7 +83,7 @@ static int clk_programmable_determine_rate(struct clk_hw *hw,
 		    (req->rate - tmp_rate) < (req->rate - best_rate)) {
 			best_rate = tmp_rate;
 			req->best_parent_rate = parent_rate;
-			req->best_parent_hw = __clk_get_hw(parent);
+			req->best_parent_hw = parent;
 		}
 
 		if (!best_rate)
diff --git a/drivers/clk/at91/clk-usb.c b/drivers/clk/at91/clk-usb.c
index 82dce8f2e03b..8ab8502778a2 100644
--- a/drivers/clk/at91/clk-usb.c
+++ b/drivers/clk/at91/clk-usb.c
@@ -59,7 +59,7 @@ static unsigned long at91sam9x5_clk_usb_recalc_rate(struct clk_hw *hw,
 static int at91sam9x5_clk_usb_determine_rate(struct clk_hw *hw,
 					     struct clk_rate_request *req)
 {
-	struct clk *parent = NULL;
+	struct clk_hw *parent;
 	long best_rate = -EINVAL;
 	unsigned long tmp_rate;
 	int best_diff = -1;
@@ -69,7 +69,7 @@ static int at91sam9x5_clk_usb_determine_rate(struct clk_hw *hw,
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
 		int div;
 
-		parent = clk_get_parent_by_index(hw->clk, i);
+		parent = clk_hw_get_parent_by_index(hw, i);
 		if (!parent)
 			continue;
 
@@ -77,7 +77,7 @@ static int at91sam9x5_clk_usb_determine_rate(struct clk_hw *hw,
 			unsigned long tmp_parent_rate;
 
 			tmp_parent_rate = req->rate * div;
-			tmp_parent_rate = __clk_round_rate(parent,
+			tmp_parent_rate = clk_hw_round_rate(parent,
 							   tmp_parent_rate);
 			tmp_rate = DIV_ROUND_CLOSEST(tmp_parent_rate, div);
 			if (tmp_rate < req->rate)
@@ -89,7 +89,7 @@ static int at91sam9x5_clk_usb_determine_rate(struct clk_hw *hw,
 				best_rate = tmp_rate;
 				best_diff = tmp_diff;
 				req->best_parent_rate = tmp_parent_rate;
-				req->best_parent_hw = __clk_get_hw(parent);
+				req->best_parent_hw = parent;
 			}
 
 			if (!best_diff || tmp_rate < req->rate)
@@ -273,7 +273,7 @@ static long at91rm9200_clk_usb_round_rate(struct clk_hw *hw, unsigned long rate,
 					  unsigned long *parent_rate)
 {
 	struct at91rm9200_clk_usb *usb = to_at91rm9200_clk_usb(hw);
-	struct clk *parent = __clk_get_parent(hw->clk);
+	struct clk_hw *parent = clk_hw_get_parent(hw);
 	unsigned long bestrate = 0;
 	int bestdiff = -1;
 	unsigned long tmprate;
@@ -287,7 +287,7 @@ static long at91rm9200_clk_usb_round_rate(struct clk_hw *hw, unsigned long rate,
 			continue;
 
 		tmp_parent_rate = rate * usb->divisors[i];
-		tmp_parent_rate = __clk_round_rate(parent, tmp_parent_rate);
+		tmp_parent_rate = clk_hw_round_rate(parent, tmp_parent_rate);
 		tmprate = DIV_ROUND_CLOSEST(tmp_parent_rate, usb->divisors[i]);
 		if (tmprate < rate)
 			tmpdiff = rate - tmprate;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
