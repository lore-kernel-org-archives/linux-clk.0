Return-Path: <manabian@gmail.com>
Return-Path: <manabian@gmail.com>
From: Joachim Eastwood <manabian@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: Joachim Eastwood <manabian@gmail.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/2] clk: lpc18xx-ccu: fix potential system hang when disabling unused clocks
Date: Tue, 25 Aug 2015 20:34:02 +0200
Message-Id: <1440527643-2960-2-git-send-email-manabian@gmail.com>
In-Reply-To: <1440527643-2960-1-git-send-email-manabian@gmail.com>
References: <1440527643-2960-1-git-send-email-manabian@gmail.com>
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

No changes from v1.

 drivers/clk/nxp/clk-lpc18xx-ccu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/nxp/clk-lpc18xx-ccu.c b/drivers/clk/nxp/clk-lpc18xx-ccu.c
index eeaee97da110..1845476e635e 100644
--- a/drivers/clk/nxp/clk-lpc18xx-ccu.c
+++ b/drivers/clk/nxp/clk-lpc18xx-ccu.c
@@ -180,6 +180,20 @@ static void lpc18xx_ccu_gate_disable(struct clk_hw *hw)
 static int lpc18xx_ccu_gate_is_enabled(struct clk_hw *hw)
 {
 	struct clk_gate *gate = to_clk_gate(hw);
+	struct clk *parent;
+
+	/*
+	 * The branch clock registers are only accessible
+	 * if the base (parent) clock is enabled. Register
+	 * access with a disabled base clock will hang the
+	 * system.
+	 */
+	parent = clk_get_parent(hw->clk);
+	if (IS_ERR(parent))
+		return 0;
+
+	if (!__clk_is_enabled(parent))
+		return 0;
 
 	return clk_readl(gate->reg) & LPC18XX_CCU_RUN;
 }
-- 
1.8.0
