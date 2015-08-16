Return-Path: <manabian@gmail.com>
Return-Path: <manabian@gmail.com>
From: Joachim Eastwood <manabian@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: Joachim Eastwood <manabian@gmail.com>,
	linux-clk@vger.kernel.org,
	ezequiel@vanguardiasur.com.ar
Subject: [PATCH 2/2] clk: lpc18xx-cgu: fix potential system hang when disabling unused clocks
Date: Sun, 16 Aug 2015 23:08:34 +0200
Message-Id: <1439759314-12494-3-git-send-email-manabian@gmail.com>
In-Reply-To: <1439759314-12494-1-git-send-email-manabian@gmail.com>
References: <1439759314-12494-1-git-send-email-manabian@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

The clock consumer (CCU) of the CGU must be able to check if a CGU
base clock is really running since access to the CCU registers
requires a running base clock. Access with a disabled base clock will
cause the system to hang. Fix this issue by adding code that check if
the parent clock is running in the is_enabled clk_ops callback. Since
certain clocks can be cascaded this must be added to all clock gates.

The hang would occur if the boot ROM or boot loader didn't setup and
enable the USB0 clock. Then when the clk framework tried to access
the CCU register it would hang the system.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---
 drivers/clk/nxp/clk-lpc18xx-cgu.c | 42 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc18xx-cgu.c b/drivers/clk/nxp/clk-lpc18xx-cgu.c
index 81e9e1c788f4..3d8d0ac38f96 100644
--- a/drivers/clk/nxp/clk-lpc18xx-cgu.c
+++ b/drivers/clk/nxp/clk-lpc18xx-cgu.c
@@ -481,6 +481,42 @@ static const struct clk_ops lpc18xx_pll1_ops = {
 	.recalc_rate = lpc18xx_pll1_recalc_rate,
 };
 
+static int lpc18xx_cgu_gate_enabled(struct clk_hw *hw)
+{
+	return clk_gate_ops.enable(hw);
+}
+
+static void lpc18xx_cgu_gate_disable(struct clk_hw *hw)
+{
+	clk_gate_ops.disable(hw);
+}
+
+static int lpc18xx_cgu_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk *parent;
+
+	/*
+	 * The consumer of base clocks needs know if the
+	 * base clock is really enabled before it can be
+	 * accessed. It is therefore necessary to verify
+	 * this all the way up.
+	 */
+	parent = clk_get_parent(hw->clk);
+	if (IS_ERR(parent))
+		return 0;
+
+	if (!__clk_is_enabled(parent))
+		return 0;
+
+	return clk_gate_ops.is_enabled(hw);
+}
+
+static const struct clk_ops lpc18xx_gate_ops = {
+	.enable = lpc18xx_cgu_gate_enabled,
+	.disable = lpc18xx_cgu_gate_disable,
+	.is_enabled = lpc18xx_cgu_gate_is_enabled,
+};
+
 static struct lpc18xx_cgu_pll_clk lpc18xx_cgu_src_clk_plls[] = {
 	LPC1XX_CGU_CLK_PLL(PLL0USB,	pll0_src_ids, pll0_ops),
 	LPC1XX_CGU_CLK_PLL(PLL0AUDIO,	pll0_src_ids, pll0_ops),
@@ -511,7 +547,7 @@ static struct clk *lpc18xx_cgu_register_div(struct lpc18xx_cgu_src_clk_div *clk,
 	return clk_register_composite(NULL, name, parents, clk->n_parents,
 				      &clk->mux.hw, &clk_mux_ops,
 				      &clk->div.hw, &clk_divider_ops,
-				      &clk->gate.hw, &clk_gate_ops, 0);
+				      &clk->gate.hw, &lpc18xx_gate_ops, 0);
 }
 
 
@@ -539,7 +575,7 @@ static struct clk *lpc18xx_register_base_clk(struct lpc18xx_cgu_base_clk *clk,
 	return clk_register_composite(NULL, name, parents, clk->n_parents,
 				      &clk->mux.hw, &clk_mux_ops,
 				      NULL,  NULL,
-				      &clk->gate.hw, &clk_gate_ops, 0);
+				      &clk->gate.hw, &lpc18xx_gate_ops, 0);
 }
 
 
@@ -558,7 +594,7 @@ static struct clk *lpc18xx_cgu_register_pll(struct lpc18xx_cgu_pll_clk *clk,
 	return clk_register_composite(NULL, name, parents, clk->n_parents,
 				      &clk->mux.hw, &clk_mux_ops,
 				      &clk->pll.hw, clk->pll_ops,
-				      &clk->gate.hw, &clk_gate_ops, 0);
+				      &clk->gate.hw, &lpc18xx_gate_ops, 0);
 }
 
 static void __init lpc18xx_cgu_register_source_clks(struct device_node *np,
-- 
1.8.0
