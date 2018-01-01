Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 05/34] clk: at91: update clk_pll_get_best_div_mul to return unsigned long
Date: Mon,  1 Jan 2018 19:07:32 +0000
Message-Id: <1514833681-30737-6-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514833681-30737-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514833681-30737-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

clk_pll_get_best_div_mul() returns a value directly as the return
value to round_rate(). clk_ops->round_rate() has been changed to an
unsigned long so for the sake of completeness and neatness this patch
updates the helper function to return the same data-type.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/at91/clk-pll.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/at91/clk-pll.c b/drivers/clk/at91/clk-pll.c
index 4e7da3e..630203e 100644
--- a/drivers/clk/at91/clk-pll.c
+++ b/drivers/clk/at91/clk-pll.c
@@ -147,10 +147,11 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 	return (parent_rate / div) * (mul + 1);
 }
 
-static long clk_pll_get_best_div_mul(struct clk_pll *pll, unsigned long rate,
-				     unsigned long parent_rate,
-				     u32 *div, u32 *mul,
-				     u32 *index) {
+static unsigned long clk_pll_get_best_div_mul(struct clk_pll *pll,
+					      unsigned long rate,
+					      unsigned long parent_rate,
+					      u32 *div, u32 *mul, u32 *index)
+{
 	const struct clk_pll_layout *layout = pll->layout;
 	const struct clk_pll_characteristics *characteristics =
 							pll->characteristics;
-- 
2.7.4
