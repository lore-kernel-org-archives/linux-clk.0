Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 02/10] clk: qcom: Add support for alpha pll hwfsm ops
Date: Thu, 11 Aug 2016 14:10:50 +0530
Message-Id: <1470904858-11930-3-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add support to enable/disable the alpha pll using hwfsm

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 109 ++++++++++++++++++++++++++++++++++-----
 drivers/clk/qcom/clk-alpha-pll.h |   1 +
 2 files changed, 98 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index e6a03ea..bae31f9 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -62,9 +62,10 @@
 #define to_clk_alpha_pll_postdiv(_hw) container_of(to_clk_regmap(_hw), \
 					   struct clk_alpha_pll_postdiv, clkr)
 
-static int wait_for_pll(struct clk_alpha_pll *pll)
+static int wait_for_pll(struct clk_alpha_pll *pll, u32 mask, bool inverse,
+			const char *action)
 {
-	u32 val, mask, off;
+	u32 val, off;
 	int count;
 	int ret;
 	const char *name = clk_hw_get_name(&pll->clkr.hw);
@@ -74,26 +75,101 @@ static int wait_for_pll(struct clk_alpha_pll *pll)
 	if (ret)
 		return ret;
 
-	if (val & PLL_VOTE_FSM_ENA)
-		mask = PLL_ACTIVE_FLAG;
-	else
-		mask = PLL_LOCK_DET;
-
-	/* Wait for pll to enable. */
 	for (count = 100; count > 0; count--) {
 		ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
 		if (ret)
 			return ret;
-		if ((val & mask) == mask)
+		if (inverse && (val & mask))
+			return 0;
+		else if ((val & mask) == mask)
 			return 0;
 
 		udelay(1);
 	}
 
-	WARN(1, "%s didn't enable after voting for it!\n", name);
+	WARN(1, "%s failed to %s!\n", name, action);
 	return -ETIMEDOUT;
 }
 
+static int wait_for_pll_enable(struct clk_alpha_pll *pll, u32 mask)
+{
+	return wait_for_pll(pll, mask, 0, "enable");
+}
+
+static int wait_for_pll_disable(struct clk_alpha_pll *pll, u32 mask)
+{
+	return wait_for_pll(pll, mask, 1, "disable");
+}
+
+static int wait_for_pll_offline(struct clk_alpha_pll *pll, u32 mask)
+{
+	return wait_for_pll(pll, mask, 0, "offline");
+}
+
+/* alpha pll with hwfsm support */
+#define PLL_OFFLINE_REQ		BIT(7)
+#define PLL_FSM_ENA		BIT(20)
+#define PLL_OFFLINE_ACK		BIT(28)
+#define PLL_ACTIVE_FLAG		BIT(30)
+
+static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
+{
+	int ret;
+	u32 val, off;
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+
+	off = pll->offset;
+	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	if (ret)
+		return ret;
+
+	/* Enable HW FSM mode, clear OFFLINE request */
+	val |= PLL_FSM_ENA;
+	val &= ~PLL_OFFLINE_REQ;
+	ret = regmap_write(pll->clkr.regmap, off + PLL_MODE, val);
+	if (ret)
+		return ret;
+
+	/* Make sure enable request goes through before waiting for update */
+	mb();
+
+	ret = wait_for_pll_enable(pll, PLL_ACTIVE_FLAG);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void clk_alpha_pll_hwfsm_disable(struct clk_hw *hw)
+{
+	int ret;
+	u32 val, off;
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+
+	off = pll->offset;
+	ret = regmap_read(pll->clkr.regmap, off + PLL_MODE, &val);
+	if (ret)
+		return;
+
+	/* Request PLL_OFFLINE and wait for ack */
+	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+				 PLL_OFFLINE_REQ, PLL_OFFLINE_REQ);
+	if (ret)
+		return;
+
+	ret = wait_for_pll_offline(pll, PLL_OFFLINE_ACK);
+	if (ret)
+		return;
+
+	/* Disable hwfsm */
+	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+				 PLL_FSM_ENA, 0);
+	if (ret)
+		return;
+
+	wait_for_pll_disable(pll, PLL_ACTIVE_FLAG);
+}
+
 static int clk_alpha_pll_enable(struct clk_hw *hw)
 {
 	int ret;
@@ -112,7 +188,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 		ret = clk_enable_regmap(hw);
 		if (ret)
 			return ret;
-		return wait_for_pll(pll);
+		return wait_for_pll_enable(pll, PLL_ACTIVE_FLAG);
 	}
 
 	/* Skip if already enabled */
@@ -136,7 +212,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 	if (ret)
 		return ret;
 
-	ret = wait_for_pll(pll);
+	ret = wait_for_pll_enable(pll, PLL_LOCK_DET);
 	if (ret)
 		return ret;
 
@@ -300,6 +376,15 @@ const struct clk_ops clk_alpha_pll_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_ops);
 
+const struct clk_ops clk_alpha_pll_hwfsm_ops = {
+	.enable = clk_alpha_pll_hwfsm_enable,
+	.disable = clk_alpha_pll_hwfsm_disable,
+	.recalc_rate = clk_alpha_pll_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = clk_alpha_pll_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_hwfsm_ops);
+
 static unsigned long
 clk_alpha_pll_postdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 90ce201..f78bf4c 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -52,6 +52,7 @@ struct clk_alpha_pll_postdiv {
 };
 
 extern const struct clk_ops clk_alpha_pll_ops;
+extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ops;
 
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
