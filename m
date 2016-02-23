Return-Path: <slemieux.tyco@gmail.com>
Return-Path: <slemieux.tyco@gmail.com>
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: stigge@antcom.de,
	vz@mleia.com,
	linux-clk@vger.kernel.org
Subject: [PATCH v2] clk: lpc32xx: fix compilation warning
Date: Tue, 23 Feb 2016 14:56:09 -0500
Message-Id: <1456257369-22342-1-git-send-email-slemieux.tyco@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Sylvain Lemieux <slemieux@tycoint.com>

Remove the following false positives compilation warning:
- drivers/clk/nxp/clk-lpc32xx.c: In function 'lpc32xx_clk_register':
  warning: 'hw' may be used uninitialized in this function [-Wmaybe-uninitialized]
- drivers/clk/nxp/clk-lpc32xx.c: In function 'clk_hclk_pll_round_rate':
  warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
  warning: 'n' may be used uninitialized in this function [-Wmaybe-uninitialized]
  warning: 'm' may be used uninitialized in this function [-Wmaybe-uninitialized]

Tested using gcc version 4.7.3.

Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
---
Changes from v1 to v2:
* Update the patch as per the feedback received from:
  - Vladimir: http://permalink.gmane.org/gmane.linux.kernel.clk/4315
    initialize to 0 or NULL instead of using "uninitialized_var".
  - Stephen: http://permalink.gmane.org/gmane.linux.kernel.clk/4331
    return an error pointer if type does not match in the if/else.

 drivers/clk/nxp/clk-lpc32xx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index 48b3a11..7f1712a 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -588,7 +588,8 @@ static long clk_hclk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long *parent_rate)
 {
 	struct lpc32xx_pll_clk *clk = to_lpc32xx_pll_clk(hw);
-	u64 m_i, m, n, p, o = rate, i = *parent_rate, d = (u64)rate << 6;
+	u64 m_i, o = rate, i = *parent_rate, d = (u64)rate << 6;
+	u64 m = 0, n = 0, p = 0;
 	int p_i, n_i;
 
 	pr_debug("%s: %lu/%lu\n", clk_hw_get_name(hw), *parent_rate, rate);
@@ -1414,7 +1415,7 @@ static struct clk * __init lpc32xx_clk_register(u32 id)
 			.flags = lpc32xx_clk->flags,
 			.ops = clk_hw->hw0.ops,
 		};
-		struct clk_hw *hw;
+		struct clk_hw *hw = NULL;
 
 		if (clk_hw->type == CLK_LPC32XX)
 			hw = &clk_hw->hw0.clk.hw;
@@ -1428,6 +1429,8 @@ static struct clk * __init lpc32xx_clk_register(u32 id)
 			hw = &clk_hw->hw0.div.hw;
 		else if (clk_hw->type == CLK_GATE)
 			hw = &clk_hw->hw0.gate.hw;
+		else
+			return ERR_PTR(-EINVAL);
 
 		hw->init = &clk_init;
 		clk = clk_register(NULL, hw);
-- 
1.8.3.1
