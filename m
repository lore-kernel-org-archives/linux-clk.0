Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 10/10] clk: qcom: Fix .set_rate to handle alpha PLLs w/wo dynamic update
Date: Thu, 11 Aug 2016 14:10:58 +0530
Message-Id: <1470904858-11930-11-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

From: Taniya Das <tdas@codeaurora.org>

Alpha PLLs which do not support dynamic update feature
need to be explicitly disabled before a rate change. The ones which do
support dynamic update don't have to be disabled but need to follow a update
sequence (as implemented by clk_alpha_pll_dynamic_update() in the patch).
They also need the PLL_HW_LOGIC_BYPASS bit set at init.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 48 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 2 files changed, 49 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 2184dc1..68c90f3 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -113,6 +113,11 @@ static int wait_for_pll_offline(struct clk_alpha_pll *pll, u32 mask)
 #define PLL_OFFLINE_ACK		BIT(28)
 #define PLL_ACTIVE_FLAG		BIT(30)
 
+/* alpha pll with dynamic update support */
+#define PLL_UPDATE		BIT(22)
+#define PLL_HW_LOGIC_BYPASS	BIT(23)
+#define PLL_ACK_LATCH		BIT(29)
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
@@ -138,6 +143,37 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	if (pll->flags & SUPPORTS_VOTE_FSM)
 		qcom_pll_set_fsm_mode(regmap, pll->offset + PLL_MODE, 6, 0);
 
+	if (pll->flags & SUPPORTS_DYNAMIC_UPDATE)
+		regmap_update_bits(regmap, pll->offset + PLL_MODE,
+				   PLL_HW_LOGIC_BYPASS,
+				   PLL_HW_LOGIC_BYPASS);
+}
+
+static int clk_alpha_pll_dynamic_update(struct clk_alpha_pll *pll)
+{
+	u32 val;
+
+	/* Latch the input to the PLL */
+	regmap_update_bits(pll->clkr.regmap, pll->offset + PLL_MODE,
+			   PLL_UPDATE, PLL_UPDATE);
+
+	/* Wait for 2 reference cycle before checking ACK bit */
+	udelay(1);
+
+	regmap_read(pll->clkr.regmap, pll->offset + PLL_MODE, &val);
+	if (!(val & PLL_ACK_LATCH)) {
+		WARN(1, "PLL latch failed. Output may be unstable!\n");
+		return -EINVAL;
+	}
+
+	/* Return latch input to 0 */
+	regmap_update_bits(pll->clkr.regmap, pll->offset + PLL_MODE,
+			   PLL_UPDATE, 0);
+
+	/* Wait for PLL output to stabilize */
+	udelay(100);
+
+	return 0;
 }
 
 static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
@@ -366,6 +402,7 @@ clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long prate)
 {
+	int enabled;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	const struct pll_vco *vco;
 	u32 l, off = pll->offset;
@@ -378,6 +415,11 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
+	enabled = hw->init->ops->is_enabled(hw);
+
+	if (!(pll->flags & SUPPORTS_DYNAMIC_UPDATE) && enabled)
+		hw->init->ops->disable(hw);
+
 	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
 
 	regmap_write(pll->clkr.regmap, off + PLL_L_VAL, l);
@@ -391,6 +433,12 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL, PLL_ALPHA_EN,
 			   PLL_ALPHA_EN);
 
+	if (!(pll->flags & SUPPORTS_DYNAMIC_UPDATE) && enabled)
+		hw->init->ops->enable(hw);
+
+	if (pll->flags & SUPPORTS_DYNAMIC_UPDATE)
+		clk_alpha_pll_dynamic_update(pll);
+
 	return 0;
 }
 
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 4bd42fd..23e32db 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -36,6 +36,7 @@ struct clk_alpha_pll {
 	size_t num_vco;
 
 #define SUPPORTS_VOTE_FSM	BIT(0)
+#define SUPPORTS_DYNAMIC_UPDATE	BIT(1)
 	u8 flags;
 	struct clk_regmap clkr;
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
