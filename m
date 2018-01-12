Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:52853 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754017AbeALFsP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Jan 2018 00:48:15 -0500
Message-ID: <1515736081.31850.88.camel@kernel.crashing.org>
Subject: [PATCH] clk: aspeed: Handle inverse polarity of USB port 1 clock
 gate
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel.stanley@au1.ibm.com>
Date: Fri, 12 Jan 2018 16:48:01 +1100
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The USB port 1 clock gate control has an inversed polarity
from all the other clock gates in the chip. This makes the
aspeed_clk_{enable,disable} functions honor the flag
CLK_GATE_SET_TO_DISABLE and set that flag appropriately
so it's set for all clocks except USB port 1.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
--

I chose not to add a column to the table for that one special
case. If future chips start growing more of these, we should
consider adding this to the table instead.

Without this, USB port 1 doesn't work properly with the new
clk driver.

---
 drivers/clk/clk-aspeed.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 6fb344730cea..f5dc5101174e 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -211,6 +211,7 @@ static int aspeed_clk_enable(struct clk_hw *hw)
 	unsigned long flags;
 	u32 clk = BIT(gate->clock_idx);
 	u32 rst = BIT(gate->reset_idx);
+	u32 enval;
 
 	spin_lock_irqsave(gate->lock, flags);
 
@@ -223,7 +224,8 @@ static int aspeed_clk_enable(struct clk_hw *hw)
 	}
 
 	/* Enable clock */
-	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, 0);
+	enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
+	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
 
 	if (gate->reset_idx >= 0) {
 		/* A delay of 10ms is specified by the ASPEED docs */
@@ -243,10 +245,12 @@ static void aspeed_clk_disable(struct clk_hw *hw)
 	struct aspeed_clk_gate *gate = to_aspeed_clk_gate(hw);
 	unsigned long flags;
 	u32 clk = BIT(gate->clock_idx);
+	u32 enval;
 
 	spin_lock_irqsave(gate->lock, flags);
 
-	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, clk);
+	enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? clk : 0;
+	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
 
 	spin_unlock_irqrestore(gate->lock, flags);
 }
@@ -478,7 +482,12 @@ static int aspeed_clk_probe(struct platform_device *pdev)
 
 	for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
 		const struct aspeed_gate_data *gd = &aspeed_gates[i];
+		u32 gate_flags;
 
+		/* Special case: the USB port 1 clock (bit 14) is always
+		 * working the opposite way from the other ones.
+		 */
+		gate_flags = (gd->clock_idx == 14) ? 0 : CLK_GATE_SET_TO_DISABLE;
 		hw = aspeed_clk_hw_register_gate(dev,
 				gd->name,
 				gd->parent_name,
@@ -486,7 +495,7 @@ static int aspeed_clk_probe(struct platform_device *pdev)
 				map,
 				gd->clock_idx,
 				gd->reset_idx,
-				CLK_GATE_SET_TO_DISABLE,
+				gate_flags,
 				&aspeed_clk_lock);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);


