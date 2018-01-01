Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 06/34] clk: at91: change clk_pll_get_best_div_mul() return logic
Date: Mon,  1 Jan 2018 19:42:45 +0000
Message-Id: <1514835793-1104-7-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514835793-1104-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514835793-1104-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

This patch updates the round_rate() logic here to return zero instead of a
negative number on error.

In conjunction with higher-level changes associated with acting on the
return value of clk_ops->round_rate() it is then possible to have
clk_ops->round_rate() return values from 1 Hz to ULONG_MAX Hz instead of
the current limitation of 1 Hz to LONG_MAX Hz.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/at91/clk-pll.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/at91/clk-pll.c b/drivers/clk/at91/clk-pll.c
index 630203e..1c90ae7 100644
--- a/drivers/clk/at91/clk-pll.c
+++ b/drivers/clk/at91/clk-pll.c
@@ -157,14 +157,14 @@ static unsigned long clk_pll_get_best_div_mul(struct clk_pll *pll,
 							pll->characteristics;
 	unsigned long bestremainder = ULONG_MAX;
 	unsigned long maxdiv, mindiv, tmpdiv;
-	long bestrate = -ERANGE;
+	unsigned long bestrate = 0;
 	unsigned long bestdiv;
 	unsigned long bestmul;
 	int i = 0;
 
 	/* Check if parent_rate is a valid input rate */
 	if (parent_rate < characteristics->input.min)
-		return -ERANGE;
+		return 0;
 
 	/*
 	 * Calculate minimum divider based on the minimum multiplier, the
@@ -179,7 +179,7 @@ static unsigned long clk_pll_get_best_div_mul(struct clk_pll *pll,
 	if (parent_rate > characteristics->input.max) {
 		tmpdiv = DIV_ROUND_UP(parent_rate, characteristics->input.max);
 		if (tmpdiv > PLL_DIV_MAX)
-			return -ERANGE;
+			return 0;
 
 		if (tmpdiv > mindiv)
 			mindiv = tmpdiv;
@@ -234,8 +234,8 @@ static unsigned long clk_pll_get_best_div_mul(struct clk_pll *pll,
 			break;
 	}
 
-	/* We haven't found any multiplier/divider pair => return -ERANGE */
-	if (bestrate < 0)
+	/* We haven't found any multiplier/divider pair => return 0 */
+	if (bestrate == 0)
 		return bestrate;
 
 	/* Check if bestrate is a valid output rate  */
@@ -246,7 +246,7 @@ static unsigned long clk_pll_get_best_div_mul(struct clk_pll *pll,
 	}
 
 	if (i >= characteristics->num_output)
-		return -ERANGE;
+		return 0;
 
 	if (div)
 		*div = bestdiv;
@@ -271,15 +271,15 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 			    unsigned long parent_rate)
 {
 	struct clk_pll *pll = to_clk_pll(hw);
-	long ret;
+	unsigned long ret;
 	u32 div;
 	u32 mul;
 	u32 index;
 
 	ret = clk_pll_get_best_div_mul(pll, rate, parent_rate,
 				       &div, &mul, &index);
-	if (ret < 0)
-		return ret;
+	if (ret == 0)
+		return -ERANGE;
 
 	pll->range = index;
 	pll->div = div;
-- 
2.7.4
