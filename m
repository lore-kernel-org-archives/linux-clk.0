Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 01/11] clk: qcom: Add support for alpha pll hwfsm ops
Date: Thu, 29 Sep 2016 14:05:42 +0530
Message-Id: <1475138152-859-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some PLLs can support an HW FSM mode (different from the Votable FSMs,
though its the same bit used to enable Votable FSMs as well as HW FSMs)
which enables the HW to do the bypass/reset/enable-output-ctrl sequence
on its own. So all thats needed from SW is to set the FSM_ENA bit.
PLL_ACTIVE_FLAG is whats used to check if the PLL is active/enabled.

Some of the PLLs which support HW FSM can also need an OFFLINE request
that needs to be toggled across the enable/disable. We use a flag to
identify such cases and handle them.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 102 ++++++++++++++++++++++++++++++++++-----
 drivers/clk/qcom/clk-alpha-pll.h |   3 ++
 2 files changed, 93 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index e6a03ea..0cfbb29 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -23,12 +23,15 @@
 # define PLL_OUTCTRL		BIT(0)
 # define PLL_BYPASSNL		BIT(1)
 # define PLL_RESET_N		BIT(2)
+# define PLL_OFFLINE_REQ	BIT(7)
 # define PLL_LOCK_COUNT_SHIFT	8
 # define PLL_LOCK_COUNT_MASK	0x3f
 # define PLL_BIAS_COUNT_SHIFT	14
 # define PLL_BIAS_COUNT_MASK	0x3f
 # define PLL_VOTE_FSM_ENA	BIT(20)
+# define PLL_FSM_ENA		BIT(20)
 # define PLL_VOTE_FSM_RESET	BIT(21)
+# define PLL_OFFLINE_ACK	BIT(28)
 # define PLL_ACTIVE_FLAG	BIT(30)
 # define PLL_LOCK_DET		BIT(31)
 
@@ -62,9 +65,10 @@
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
@@ -74,26 +78,91 @@ static int wait_for_pll(struct clk_alpha_pll *pll)
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
+		if (inverse && !(val & mask))
+			return 0;
+		else if ((val & mask) == mask)
 			return 0;
 
 		udelay(1);
 	}
 
-	WARN(1, "%s didn't enable after voting for it!\n", name);
+	WARN(1, "%s failed to %s!\n", name, action);
 	return -ETIMEDOUT;
 }
 
+#define wait_for_pll_enable_active(pll) \
+	wait_for_pll(pll, PLL_ACTIVE_FLAG, 0, "enable")
+
+#define wait_for_pll_enable_lock(pll) \
+	wait_for_pll(pll, PLL_LOCK_DET, 0, "enable")
+
+#define wait_for_pll_disable(pll) \
+	wait_for_pll(pll, PLL_ACTIVE_FLAG, 1, "disable")
+
+#define wait_for_pll_offline(pll) \
+	wait_for_pll(pll, PLL_OFFLINE_ACK, 0, "offline")
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
+	val |= PLL_FSM_ENA;
+
+	if (pll->flags & SUPPORTS_OFFLINE_REQ)
+		val &= ~PLL_OFFLINE_REQ;
+
+	ret = regmap_write(pll->clkr.regmap, off + PLL_MODE, val);
+	if (ret)
+		return ret;
+
+	/* Make sure enable request goes through before waiting for update */
+	mb();
+
+	return wait_for_pll_enable_active(pll);
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
+	if (pll->flags & SUPPORTS_OFFLINE_REQ) {
+		ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+					 PLL_OFFLINE_REQ, PLL_OFFLINE_REQ);
+		if (ret)
+			return;
+
+		ret = wait_for_pll_offline(pll);
+		if (ret)
+			return;
+	}
+
+	/* Disable hwfsm */
+	ret = regmap_update_bits(pll->clkr.regmap, off + PLL_MODE,
+				 PLL_FSM_ENA, 0);
+	if (ret)
+		return;
+
+	wait_for_pll_disable(pll);
+}
+
 static int clk_alpha_pll_enable(struct clk_hw *hw)
 {
 	int ret;
@@ -112,7 +181,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 		ret = clk_enable_regmap(hw);
 		if (ret)
 			return ret;
-		return wait_for_pll(pll);
+		return wait_for_pll_enable_active(pll);
 	}
 
 	/* Skip if already enabled */
@@ -136,7 +205,7 @@ static int clk_alpha_pll_enable(struct clk_hw *hw)
 	if (ret)
 		return ret;
 
-	ret = wait_for_pll(pll);
+	ret = wait_for_pll_enable_lock(pll);
 	if (ret)
 		return ret;
 
@@ -300,6 +369,15 @@ const struct clk_ops clk_alpha_pll_ops = {
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
index 90ce201..0deb286 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -34,6 +34,8 @@ struct clk_alpha_pll {
 
 	const struct pll_vco *vco_table;
 	size_t num_vco;
+#define SUPPORTS_OFFLINE_REQ	BIT(0)
+	u8 flags;
 
 	struct clk_regmap clkr;
 };
@@ -52,6 +54,7 @@ struct clk_alpha_pll_postdiv {
 };
 
 extern const struct clk_ops clk_alpha_pll_ops;
+extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ops;
 
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
