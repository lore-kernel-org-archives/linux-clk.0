Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Manuel Lauss <manuel.lauss@gmail.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	Linux-MIPS <linux-mips@linux-mips.org>
Subject: [PATCH 09/26] MIPS: alchemy: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:03:49 -0700
Message-Id: <1438362246-6664-10-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Cc: Manuel Lauss <manuel.lauss@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Linux-MIPS <linux-mips@linux-mips.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 arch/mips/alchemy/common/clock.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/alchemy/common/clock.c b/arch/mips/alchemy/common/clock.c
index 5a62b18b8500..bd34f4093cd9 100644
--- a/arch/mips/alchemy/common/clock.c
+++ b/arch/mips/alchemy/common/clock.c
@@ -394,7 +394,7 @@ static int alchemy_clk_fgcs_detr(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 int scale, int maxdiv)
 {
-	struct clk *pc, *bpc, *free;
+	struct clk_hw *pc, *bpc, *free;
 	long tdv, tpr, pr, nr, br, bpr, diff, lastdiff;
 	int j;
 
@@ -408,7 +408,7 @@ static int alchemy_clk_fgcs_detr(struct clk_hw *hw,
 	 * the one that gets closest to but not over the requested rate.
 	 */
 	for (j = 0; j < 7; j++) {
-		pc = clk_get_parent_by_index(hw->clk, j);
+		pc = clk_hw_get_parent_by_index(hw, j);
 		if (!pc)
 			break;
 
@@ -416,12 +416,12 @@ static int alchemy_clk_fgcs_detr(struct clk_hw *hw,
 		 * XXX: we would actually want clk_has_active_children()
 		 * but this is a good-enough approximation for now.
 		 */
-		if (!__clk_is_prepared(pc)) {
+		if (!clk_hw_is_prepared(pc)) {
 			if (!free)
 				free = pc;
 		}
 
-		pr = clk_get_rate(pc);
+		pr = clk_hw_get_rate(pc);
 		if (pr < req->rate)
 			continue;
 
@@ -451,7 +451,7 @@ static int alchemy_clk_fgcs_detr(struct clk_hw *hw,
 			tpr = req->rate * j;
 			if (tpr < 0)
 				break;
-			pr = clk_round_rate(free, tpr);
+			pr = clk_hw_round_rate(free, tpr);
 
 			tdv = alchemy_calc_div(req->rate, pr, scale, maxdiv,
 					       NULL);
@@ -474,7 +474,7 @@ static int alchemy_clk_fgcs_detr(struct clk_hw *hw,
 		return br;
 
 	req->best_parent_rate = bpr;
-	req->best_parent_hw = __clk_get_hw(bpc);
+	req->best_parent_hw = bpc;
 	req->rate = br;
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

