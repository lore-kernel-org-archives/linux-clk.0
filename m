Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v4 2/3] clk: qcom: support dynamic update using latched interface
Date: Mon, 14 Nov 2016 16:30:39 +0530
Message-Id: <1479121240-20922-3-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1479121240-20922-1-git-send-email-rnayak@codeaurora.org>
References: <1479121240-20922-1-git-send-email-rnayak@codeaurora.org>
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
 drivers/clk/qcom/clk-alpha-pll.h |  5 +++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index ecb9e7f..15703b4 100644
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
@@ -376,6 +386,27 @@ static unsigned long alpha_pll_calc_rate(u64 prate, u32 l, u32 a)
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
 static int alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 			      unsigned long prate,
 			      int (*enable)(struct clk_hw *hw),
@@ -431,8 +462,12 @@ static int alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL, PLL_ALPHA_EN,
 			   PLL_ALPHA_EN);
 
-	if (!(pll->flags & SUPPORTS_DYNAMIC_UPDATE) && enabled)
+	if (pll->flags & SUPPORTS_DYNAMIC_UPDATE) {
+		if (pll->flags & SUPPORTS_LATCHED_INPUT)
+			clk_alpha_pll_update_latch(pll);
+	} else if (enabled) {
 		enable(hw);
+	}
 
 	return 0;
 }
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 7aaa11c..c580d20 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -27,6 +27,8 @@ struct pll_vco {
  * struct clk_alpha_pll - phase locked loop (PLL)
  * @offset: base address of registers
  * @vco_table: array of VCO settings
+ * @latch_ack_bit: Bit to check for latch acknowledge
+ * @latch_ack_inverse: Bit set to 0 signifies an ack
  * @min_rate: Minimim rate for PLLs with single VCO range
  * @max_rate: Maximun rate for PLLs with single VCO range
  * @clkr: regmap clock handle
@@ -40,7 +42,10 @@ struct clk_alpha_pll {
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
