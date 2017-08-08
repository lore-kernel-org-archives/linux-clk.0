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
	Abhishek Sahu <absahu@codeaurora.org>,
	Taniya Das <tdas@codeaurora.org>
Subject: [RFC v2 05/12] clk: qcom: support for dynamic updating the PLL
Date: Tue,  8 Aug 2017 23:54:10 +0530
Message-Id: <1502216657-3342-6-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
References: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Some of the Alpha PLL’s support dynamic update in which the
frequency can be changed dynamically without turning off the PLL.

This dynamic update requires the following sequence

1. Write the desired values to pll_l_val and pll_alpha_val
2. Toggle pll_latch_input from low to high
3. Wait for pll_ack_latch to transition from low to high
   The new L and alpha values have been latched. It make
   take some time for the PLL to fully settle with these
   new values
4. Pull pll_latch_input low

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 67 +++++++++++++++++++++++++++++++++++++++-
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 2 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 6694fd5..1f37bf8a 100644
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
 
@@ -123,6 +126,15 @@ static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
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
@@ -396,6 +408,56 @@ static void clk_alpha_pll_disable(struct clk_hw *hw)
 	return alpha_pll_calc_rate(prate, l, a, alpha_width);
 }
 
+static int clk_alpha_pll_update_latch(struct clk_alpha_pll *pll)
+{
+	u32 mode;
+	int ret;
+
+	regmap_read(pll->clkr.regmap, pll_mode(pll), &mode);
+
+	/* Latch the input to the PLL */
+	regmap_update_bits(pll->clkr.regmap, pll_mode(pll), PLL_UPDATE,
+			   PLL_UPDATE);
+
+	/* Make sure PLL_UPDATE request goes through*/
+	mb();
+
+	/* Wait for 2 reference cycle before checking ACK bit */
+	udelay(1);
+
+	/*
+	 * PLL will latch the new L, Alpha and freq control word.
+	 * PLL will respond by raising PLL_ACK_LATCH output when new programming
+	 * has been latched in and PLL is being updated. When
+	 * UPDATE_LOGIC_BYPASS bit is not set, PLL_UPDATE will be cleared
+	 * automatically by hardware when PLL_ACK_LATCH is asserted by PLL.
+	 */
+	if (mode & PLL_UPDATE_BYPASS) {
+		ret = wait_for_pll_update_ack_set(pll);
+		if (ret)
+			return ret;
+
+		regmap_update_bits(pll->clkr.regmap, pll_mode(pll),
+				   PLL_UPDATE, 0);
+
+		/* Make sure PLL_UPDATE request goes through*/
+		mb();
+	} else {
+		ret = wait_for_pll_update(pll);
+		if (ret)
+			return ret;
+	}
+
+	ret = wait_for_pll_update_ack_clear(pll);
+	if (ret)
+		return ret;
+
+	/* Wait for PLL output to stabilize */
+	udelay(10);
+
+	return 0;
+}
+
 static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long prate)
 {
@@ -428,7 +490,10 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	regmap_update_bits(pll->clkr.regmap, pll_user_ctl(pll), PLL_ALPHA_EN,
 			   PLL_ALPHA_EN);
 
-	return 0;
+	if (!clk_hw_is_enabled(hw) || !(pll->flags & SUPPORTS_DYNAMIC_UPDATE))
+		return 0;
+
+	return clk_alpha_pll_update_latch(pll);
 }
 
 static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 4901d92..8b27c05 100644
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
