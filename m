Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: andy.gross@linaro.org,
	david.brown@linaro.org,
	rnayak@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [RFC 06/12] Clk: qcom: support for dynamic updating the PLL
Date: Thu, 27 Jul 2017 16:40:19 +0530
Message-Id: <1501153825-5181-7-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Some of the Alpha PLL’s support dynamic update in which the
frequency can be changed dynamically without turning off the PLL.

This dynamic update requires the following sequence

1. Write the desired values to pll_l_val and pll_alpha_val.
2. Toggle pll_latch_input from low to high.
3. Wait for pll_ack_latch to transition from low to high.
   The new L and alpha values have been latched. It make
   take some time for the PLL to fully settle with these
   new values.
4. Pull pll_latch_input low.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 62 +++++++++++++++++++++++++++++++++-------
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 2 files changed, 52 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 3a7ec42..e38f4d2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -31,7 +31,10 @@
 # define PLL_VOTE_FSM_ENA	BIT(20)
 # define PLL_FSM_ENA		BIT(20)
 # define PLL_VOTE_FSM_RESET	BIT(21)
+# define PLL_UPDATE		BIT(22)
+# define PLL_UPDATE_BYPASS	BIT(23)
 # define PLL_OFFLINE_ACK	BIT(28)
+# define ALPHA_PLL_ACK_LATCH	BIT(29)
 # define PLL_ACTIVE_FLAG	BIT(30)
 # define PLL_LOCK_DET		BIT(31)
 
@@ -122,6 +125,15 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
 #define wait_for_pll_offline(pll) \
 	wait_for_pll(pll, PLL_OFFLINE_ACK, 0, "offline")
 
+#define wait_for_pll_update(pll) \
+	wait_for_pll(pll, PLL_UPDATE, 1, "update")
+
+#define wait_for_pll_update_ack_set(pll) \
+	wait_for_pll(pll, ALPHA_PLL_ACK_LATCH, 0, "update_ack_set")
+
+#define wait_for_pll_update_ack_clear(pll) \
+	wait_for_pll(pll, ALPHA_PLL_ACK_LATCH, 1, "update_ack_clear")
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
@@ -398,7 +410,8 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	const struct pll_vco *vco;
-	u32 l, alpha_width = pll_alpha_width(pll);
+	u32 l, mode, alpha_width = pll_alpha_width(pll);
+	int ret;
 	u64 a;
 
 	rate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
@@ -410,22 +423,49 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	regmap_write(pll->clkr.regmap, pll_l(pll), l);
 
-	if (alpha_width > ALPHA_BITWIDTH) {
-		a <<= (alpha_width - ALPHA_BITWIDTH);
-		regmap_update_bits(pll->clkr.regmap, pll_alpha_u(pll),
-				   GENMASK(0, alpha_width - ALPHA_BITWIDTH - 1),
-				   a >> ALPHA_BITWIDTH);
-	}
+	a <<= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
+
+	regmap_write(pll->clkr.regmap, pll_alpha(pll), a);
+	regmap_write(pll->clkr.regmap, pll_alpha_u(pll), a >> 32);
 
 	regmap_update_bits(pll->clkr.regmap, pll_alpha(pll),
 			   GENMASK(0, alpha_width - 1), a);
 
 	regmap_update_bits(pll->clkr.regmap, pll_user_ctl(pll),
-			   PLL_VCO_MASK << PLL_VCO_SHIFT,
-			   vco->val << PLL_VCO_SHIFT);
+			   PLL_ALPHA_EN, PLL_ALPHA_EN);
+
+	if (!clk_hw_is_enabled(hw) || !(pll->flags & SUPPORTS_DYNAMIC_UPDATE))
+		return 0;
+
+	regmap_read(pll->clkr.regmap, pll_mode(pll), &mode);
+	regmap_update_bits(pll->clkr.regmap, pll_mode(pll), PLL_UPDATE,
+			   PLL_UPDATE);
+
+	/* Make sure PLL_UPDATE request goes through*/
+	mb();
 
-	regmap_update_bits(pll->clkr.regmap, pll_user_ctl(pll), PLL_ALPHA_EN,
-			   PLL_ALPHA_EN);
+	/*
+	 * PLL will latch the new L, Alpha and freq control word.
+	 * PLL will respond by raising PLL_ACK_LATCH output when new programming
+	 * has been latched in and PLL is being updated. When
+	 * UPDATE_LOGIC_BYPASS bit is not set, PLL_UPDATE will be cleared
+	 * automatically by hardware when PLL_ACK_LATCH is asserted by PLL.
+	 */
+	if (!(mode & PLL_UPDATE_BYPASS))
+		return wait_for_pll_update(pll);
+
+	ret = wait_for_pll_update_ack_set(pll);
+	if (ret)
+		return ret;
+
+	regmap_update_bits(pll->clkr.regmap, pll_mode(pll), PLL_UPDATE, 0);
+
+	/* Make sure PLL_UPDATE request goes through*/
+	mb();
+
+	ret = wait_for_pll_update_ack_clear(pll);
+	if (ret)
+		return ret;
 
 	return 0;
 }
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 51a61a0..6e40e09 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -54,6 +54,7 @@ struct clk_alpha_pll {
 #define SUPPORTS_16BIT_ALPHA		BIT(1)
 #define SUPPORTS_FSM_MODE		BIT(2)
 #define SUPPORTS_64BIT_CONFIG_CTL	BIT(3)
+#define SUPPORTS_DYNAMIC_UPDATE		BIT(4)
 	u8 flags;
 
 	struct clk_regmap clkr;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
