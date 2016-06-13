Return-Path: <neidhard.kim@lge.com>
From: Jongsung Kim <neidhard.kim@lge.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Chanho Min
	<chanho.min@lge.com>, Jongsung Kim <neidhard.kim@lge.com>
Subject: [RESEND][PATCH] clk: fixed-factor: set CLK_SET_RATE_PARENT
Date: Mon, 13 Jun 2016 18:08:00 +0900
Message-ID: <1465808880-12332-1-git-send-email-neidhard.kim@lge.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: neidhard.kim@lge.com
List-ID: <linux-clk.vger.kernel.org>

Without CLK_SET_RATE_PARENT-flag set, clk_factor_round_rate() just
returns the current frequency. A fixed-factor-clock initialzed via
of_fixed_factor_clk_set() (ie, by device-tree) can't have the flag
set. It can be problematic when the parent of a fixed-factor-clock
is rate-controllable clk, because the rounding can't be propagated
to parent, the rounded target frequency is always the current, and
finally the frequency can't be changed.

This patch sets the flags CLK_SET_RATE_PARENT for all fixed-factor-
clocks, from clk_register_fixed_factor(), and removes checking the
flag from clk_factor_round_rate().

Signed-off-by: Jongsung Kim <neidhard.kim@lge.com>
---
 drivers/clk/clk-fixed-factor.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 75cd6c7..9568306 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -38,13 +38,10 @@ static long clk_factor_round_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long *prate)
 {
 	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+	unsigned long best_parent;
 
-	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-		unsigned long best_parent;
-
-		best_parent = (rate / fix->mult) * fix->div;
-		*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
-	}
+	best_parent = (rate / fix->mult) * fix->div;
+	*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
 
 	return (*prate / fix->div) * fix->mult;
 }
@@ -88,7 +85,7 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 
 	init.name = name;
 	init.ops = &clk_fixed_factor_ops;
-	init.flags = flags | CLK_IS_BASIC;
+	init.flags = flags | CLK_IS_BASIC | CLK_SET_RATE_PARENT;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
-- 
2.7.4
