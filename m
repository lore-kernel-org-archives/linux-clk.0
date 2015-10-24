Return-Path: <manabian@gmail.com>
Return-Path: <manabian@gmail.com>
From: Joachim Eastwood <manabian@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: Joachim Eastwood <manabian@gmail.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 2/3] clk: lpc18xx-ccu: fix potential system hang when disabling unused clocks
Date: Sat, 24 Oct 2015 18:55:23 +0200
Message-Id: <1445705724-20805-3-git-send-email-manabian@gmail.com>
In-Reply-To: <1445705724-20805-1-git-send-email-manabian@gmail.com>
References: <1445705724-20805-1-git-send-email-manabian@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

CCU branch clock register must only be accessed while the base
(parent) clock is running. Access with a disabled base clock
will cause the system to hang. Fix this issue by adding code
that check if the parent clock is running in the is_enabled
clk_ops callback.

This hang would occur when disabling unused clocks after AMBA
runtime pm had already disabled some of the clocks.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---
 drivers/clk/nxp/clk-lpc18xx-ccu.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc18xx-ccu.c b/drivers/clk/nxp/clk-lpc18xx-ccu.c
index eeaee97da110..13aabbb3acbe 100644
--- a/drivers/clk/nxp/clk-lpc18xx-ccu.c
+++ b/drivers/clk/nxp/clk-lpc18xx-ccu.c
@@ -179,9 +179,22 @@ static void lpc18xx_ccu_gate_disable(struct clk_hw *hw)
 
 static int lpc18xx_ccu_gate_is_enabled(struct clk_hw *hw)
 {
-	struct clk_gate *gate = to_clk_gate(hw);
+	const struct clk_hw *parent;
+
+	/*
+	 * The branch clock registers are only accessible
+	 * if the base (parent) clock is enabled. Register
+	 * access with a disabled base clock will hang the
+	 * system.
+	 */
+	parent = clk_hw_get_parent(hw);
+	if (!parent)
+		return 0;
+
+	if (!clk_hw_is_enabled(parent))
+		return 0;
 
-	return clk_readl(gate->reg) & LPC18XX_CCU_RUN;
+	return clk_gate_ops.is_enabled(hw);
 }
 
 static const struct clk_ops lpc18xx_ccu_gate_ops = {
-- 
1.8.0
