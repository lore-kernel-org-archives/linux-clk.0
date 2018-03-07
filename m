Return-Path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org, joel@jms.id.au, mturquette@baylibre.com,
        sboyd@kernel.org, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH] clk: aspeed: Prevent reset if clock is enabled
Date: Wed,  7 Mar 2018 10:36:10 -0600
Message-Id: <1520440570-25280-1-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-clk.vger.kernel.org>

According to the Aspeed specification, the reset and enable sequence
should be done when the clock is stopped. The specification doesn't
define behavior if the reset is done while the clock is enabled.

>From testing on the AST2500, the LPC Controller has problems if the
clock is reset while enabled.

Therefore, check whether the clock is enabled or not before performing
the reset and enable sequence in the Aspeed clock driver.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/clk/clk-aspeed.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 9f7f931..a13054d 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -212,6 +212,12 @@ static int aspeed_clk_enable(struct clk_hw *hw)
 	u32 clk = BIT(gate->clock_idx);
 	u32 rst = BIT(gate->reset_idx);
 	u32 enval;
+	u32 reg;
+
+	/* Only reset/enable/unreset if clock is stopped */
+	regmap_read(gate->map, ASPEED_CLK_STOP_CTRL, &reg);
+	if (!(reg & clk))
+		return 0;
 
 	spin_lock_irqsave(gate->lock, flags);
 
-- 
1.8.3.1
