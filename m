Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 04/11] clk: qcom: Enable FSM mode for votable alpha PLLs
Date: Thu, 29 Sep 2016 14:05:45 +0530
Message-Id: <1475138152-859-5-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The votable alpha PLLs need to have the fsm mode enabled as part
of the initialization. The sequence seems to be the same as used
by clk-pll, so move the function which does this into a common
place and reuse it for the clk-alpha-pll

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c |  4 ++++
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 drivers/clk/qcom/clk-pll.c       | 31 +++----------------------------
 drivers/clk/qcom/common.c        | 21 +++++++++++++++++++++
 drivers/clk/qcom/common.h        |  9 +++++++++
 5 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index fd3e32c..c6ddc04e 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 
 #include "clk-alpha-pll.h"
+#include "common.h"
 
 #define PLL_MODE		0x00
 # define PLL_OUTCTRL		BIT(0)
@@ -136,6 +137,9 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	mask |= config->vco_mask;
 
 	regmap_update_bits(regmap, off + PLL_USER_CTL, mask, val);
+
+	if (pll->flags & SUPPORTS_FSM_MODE)
+		qcom_pll_set_fsm_mode(regmap, off + PLL_MODE, 6, 0);
 }
 
 static int clk_alpha_pll_hwfsm_enable(struct clk_hw *hw)
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 4808ff7..d6e1ee2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -36,6 +36,7 @@ struct clk_alpha_pll {
 	size_t num_vco;
 #define SUPPORTS_OFFLINE_REQ	BIT(0)
 #define SUPPORTS_16BIT_ALPHA	BIT(1)
+#define SUPPORTS_FSM_MODE	BIT(2)
 	u8 flags;
 
 	struct clk_regmap clkr;
diff --git a/drivers/clk/qcom/clk-pll.c b/drivers/clk/qcom/clk-pll.c
index 5b940d6..cb6cb87 100644
--- a/drivers/clk/qcom/clk-pll.c
+++ b/drivers/clk/qcom/clk-pll.c
@@ -23,16 +23,11 @@
 #include <asm/div64.h>
 
 #include "clk-pll.h"
+#include "common.h"
 
 #define PLL_OUTCTRL		BIT(0)
 #define PLL_BYPASSNL		BIT(1)
 #define PLL_RESET_N		BIT(2)
-#define PLL_LOCK_COUNT_SHIFT	8
-#define PLL_LOCK_COUNT_MASK	0x3f
-#define PLL_BIAS_COUNT_SHIFT	14
-#define PLL_BIAS_COUNT_MASK	0x3f
-#define PLL_VOTE_FSM_ENA	BIT(20)
-#define PLL_VOTE_FSM_RESET	BIT(21)
 
 static int clk_pll_enable(struct clk_hw *hw)
 {
@@ -228,26 +223,6 @@ const struct clk_ops clk_pll_vote_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_pll_vote_ops);
 
-static void
-clk_pll_set_fsm_mode(struct clk_pll *pll, struct regmap *regmap, u8 lock_count)
-{
-	u32 val;
-	u32 mask;
-
-	/* De-assert reset to FSM */
-	regmap_update_bits(regmap, pll->mode_reg, PLL_VOTE_FSM_RESET, 0);
-
-	/* Program bias count and lock count */
-	val = 1 << PLL_BIAS_COUNT_SHIFT | lock_count << PLL_LOCK_COUNT_SHIFT;
-	mask = PLL_BIAS_COUNT_MASK << PLL_BIAS_COUNT_SHIFT;
-	mask |= PLL_LOCK_COUNT_MASK << PLL_LOCK_COUNT_SHIFT;
-	regmap_update_bits(regmap, pll->mode_reg, mask, val);
-
-	/* Enable PLL FSM voting */
-	regmap_update_bits(regmap, pll->mode_reg, PLL_VOTE_FSM_ENA,
-		PLL_VOTE_FSM_ENA);
-}
-
 static void clk_pll_configure(struct clk_pll *pll, struct regmap *regmap,
 	const struct pll_config *config)
 {
@@ -280,7 +255,7 @@ void clk_pll_configure_sr(struct clk_pll *pll, struct regmap *regmap,
 {
 	clk_pll_configure(pll, regmap, config);
 	if (fsm_mode)
-		clk_pll_set_fsm_mode(pll, regmap, 8);
+		qcom_pll_set_fsm_mode(regmap, pll->mode_reg, 1, 8);
 }
 EXPORT_SYMBOL_GPL(clk_pll_configure_sr);
 
@@ -289,7 +264,7 @@ void clk_pll_configure_sr_hpm_lp(struct clk_pll *pll, struct regmap *regmap,
 {
 	clk_pll_configure(pll, regmap, config);
 	if (fsm_mode)
-		clk_pll_set_fsm_mode(pll, regmap, 0);
+		qcom_pll_set_fsm_mode(regmap, pll->mode_reg, 1, 0);
 }
 EXPORT_SYMBOL_GPL(clk_pll_configure_sr_hpm_lp);
 
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index f7c226a..bba225e 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -74,6 +74,27 @@ qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 }
 EXPORT_SYMBOL_GPL(qcom_cc_map);
 
+void
+qcom_pll_set_fsm_mode(struct regmap *map, u32 reg, u8 bias_count, u8 lock_count)
+{
+	u32 val;
+	u32 mask;
+
+	/* De-assert reset to FSM */
+	regmap_update_bits(map, reg, PLL_VOTE_FSM_RESET, 0);
+
+	/* Program bias count and lock count */
+	val = bias_count << PLL_BIAS_COUNT_SHIFT |
+		lock_count << PLL_LOCK_COUNT_SHIFT;
+	mask = PLL_BIAS_COUNT_MASK << PLL_BIAS_COUNT_SHIFT;
+	mask |= PLL_LOCK_COUNT_MASK << PLL_LOCK_COUNT_SHIFT;
+	regmap_update_bits(map, reg, mask, val);
+
+	/* Enable PLL FSM voting */
+	regmap_update_bits(map, reg, PLL_VOTE_FSM_ENA, PLL_VOTE_FSM_ENA);
+}
+EXPORT_SYMBOL_GPL(qcom_pll_set_fsm_mode);
+
 static void qcom_cc_del_clk_provider(void *data)
 {
 	of_clk_del_provider(data);
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index ae9bdeb..9fb5b8e 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -22,6 +22,13 @@ struct freq_tbl;
 struct clk_hw;
 struct parent_map;
 
+#define PLL_LOCK_COUNT_SHIFT	8
+#define PLL_LOCK_COUNT_MASK	0x3f
+#define PLL_BIAS_COUNT_SHIFT	14
+#define PLL_BIAS_COUNT_MASK	0x3f
+#define PLL_VOTE_FSM_ENA	BIT(20)
+#define PLL_VOTE_FSM_RESET	BIT(21)
+
 struct qcom_cc_desc {
 	const struct regmap_config *config;
 	struct clk_regmap **clks;
@@ -34,6 +41,8 @@ struct qcom_cc_desc {
 
 extern const struct freq_tbl *qcom_find_freq(const struct freq_tbl *f,
 					     unsigned long rate);
+extern void
+qcom_pll_set_fsm_mode(struct regmap *m, u32 reg, u8 bias_count, u8 lock_count);
 extern int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map,
 			       u8 src);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
