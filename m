Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 07/11] clk: qcom: support dynamic update using latched interface
Date: Thu, 29 Sep 2016 14:05:48 +0530
Message-Id: <1475138152-859-8-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

From: Taniya Das <tdas@codeaurora.org>

Alpha PLLs can support 2 kinds of input signals, normal and latched. The
normal input is directly passed to the core, while the latched input
requires a latch and acknowledge sequence to be performed for the
changed input to propagate.

Alpha PLLs can support dynamic update with both kind of input signals.
The ones which support this using a latched interface however need to
follow the latch/wait-for-ack sequence to be performed when the rate changes.
Mark these with a new flag 'SUPPORTS_LATCHED_INPUT' to handle this as
part of clk_alpha_pll_set_rate()

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 37 ++++++++++++++++++++++++++++++++++++-
 drivers/clk/qcom/clk-alpha-pll.h |  3 +++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6f90a86..08fff75 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -32,6 +32,7 @@
 # define PLL_VOTE_FSM_ENA	BIT(20)
 # define PLL_FSM_ENA		BIT(20)
 # define PLL_VOTE_FSM_RESET	BIT(21)
+# define PLL_UPDATE		BIT(22)
 # define PLL_OFFLINE_ACK	BIT(28)
 # define PLL_ACTIVE_FLAG	BIT(30)
 # define PLL_LOCK_DET		BIT(31)
@@ -48,6 +49,7 @@
 # define PLL_VCO_MASK		0x3
 
 #define PLL_USER_CTL_U		0x14
+# define PLL_LATCH_INTERFACE	BIT(11)
 
 #define PLL_CONFIG_CTL		0x18
 #define PLL_CONFIG_CTL_U	0x20
@@ -109,6 +111,10 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 #define wait_for_pll_offline(pll) \
 	wait_for_pll(pll, PLL_OFFLINE_ACK, 0, "offline")
 
+#define wait_for_pll_latch_ack(pll) \
+	wait_for_pll(pll, BIT(pll->latch_ack_bit), pll->latch_ack_inverse, \
+		     "latch ack")
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
@@ -140,6 +146,10 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 
 	if (pll->flags & SUPPORTS_FSM_MODE)
 		qcom_pll_set_fsm_mode(regmap, off + PLL_MODE, 6, 0);
+
+	if (pll->flags & SUPPORTS_LATCHED_INPUT)
+		regmap_update_bits(regmap, off + PLL_USER_CTL_U,
+				   PLL_LATCH_INTERFACE, 0);
 }
 
 static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
@@ -379,6 +389,27 @@ clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	return alpha_pll_calc_rate(prate, l, a);
 }
 
+static int clk_alpha_pll_update_latch(struct clk_alpha_pll *pll)
+{
+	/* Latch the input to the PLL */
+	regmap_update_bits(pll->clkr.regmap, pll->offset + PLL_MODE,
+			   PLL_UPDATE, PLL_UPDATE);
+
+	/* Wait for 2 reference cycle before checking ACK bit */
+	udelay(1);
+
+	wait_for_pll_latch_ack(pll);
+
+	/* Return latch input to 0 */
+	regmap_update_bits(pll->clkr.regmap, pll->offset + PLL_MODE,
+			   PLL_UPDATE, 0);
+
+	/* Wait for PLL output to stabilize */
+	udelay(100);
+
+	return 0;
+}
+
 static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long prate)
 {
@@ -432,8 +463,12 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL, PLL_ALPHA_EN,
 			   PLL_ALPHA_EN);
 
-	if (!(pll->flags & SUPPORTS_DYNAMIC_UPDATE) && enabled)
+	if (pll->flags & SUPPORTS_DYNAMIC_UPDATE) {
+		if (pll->flags & SUPPORTS_LATCHED_INPUT)
+			clk_alpha_pll_update_latch(pll);
+	} else if (enabled) {
 		hw->init->ops->enable(hw);
+	}
 
 	return 0;
 }
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index e43a9c0..dab2ef3 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -38,7 +38,10 @@ struct clk_alpha_pll {
 #define SUPPORTS_16BIT_ALPHA	BIT(1)
 #define SUPPORTS_FSM_MODE	BIT(2)
 #define SUPPORTS_DYNAMIC_UPDATE	BIT(3)
+#define SUPPORTS_LATCHED_INPUT	BIT(4)
 	u8 flags;
+	u8 latch_ack_bit;
+	bool latch_ack_inverse;
 
 	unsigned long min_rate;
 	unsigned long max_rate;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
