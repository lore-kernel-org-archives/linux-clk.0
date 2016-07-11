Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	stephen.boyd@linaro.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 6/6] clk: qcom: Add support for PLLs supporting dynamic reprogramming
Date: Mon, 11 Jul 2016 16:20:39 +0530
Message-Id: <1468234239-28693-7-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1468234239-28693-1-git-send-email-rnayak@codeaurora.org>
References: <1468234239-28693-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some PLLs can support dynamic reprogramming, which means just a L value
change is whats needed to change the PLL frequency without having to
explicitly enable/disable or bypass/re-lock the PLL.
Add support for such PLLs' initial configuration and the ops needed to
support the dynamic reprogramming thereafter.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-pll.c | 106 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-pll.h |   9 +++-
 2 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-pll.c b/drivers/clk/qcom/clk-pll.c
index b463432..13d3f64 100644
--- a/drivers/clk/qcom/clk-pll.c
+++ b/drivers/clk/qcom/clk-pll.c
@@ -32,6 +32,7 @@
 #define PLL_BIAS_COUNT_SHIFT	14
 #define PLL_BIAS_COUNT_MASK	0x3f
 #define PLL_VOTE_FSM_ENA	BIT(20)
+#define PLL_DYN_FSM_ENA		BIT(20)
 #define PLL_VOTE_FSM_RESET	BIT(21)
 
 static int clk_pll_enable(struct clk_hw *hw)
@@ -248,6 +249,19 @@ clk_pll_set_fsm_mode(struct clk_pll *pll, struct regmap *regmap, u8 lock_count)
 		PLL_VOTE_FSM_ENA);
 }
 
+static void
+clk_pll_set_dynamic_fsm_mode(struct clk_pll *pll, struct regmap *regmap)
+{
+	u32 val;
+	u32 mask;
+
+	mask = PLL_BIAS_COUNT_MASK | PLL_DYN_FSM_ENA;
+	val = 6 << PLL_BIAS_COUNT_SHIFT;
+	val |= PLL_DYN_FSM_ENA;
+
+	regmap_update_bits(regmap, pll->mode_reg, mask, val);
+}
+
 static void clk_pll_configure(struct clk_pll *pll, struct regmap *regmap,
 	const struct pll_config *config)
 {
@@ -299,6 +313,21 @@ void clk_pll_configure_sr_hpm_lp(struct clk_pll *pll, struct regmap *regmap,
 }
 EXPORT_SYMBOL_GPL(clk_pll_configure_sr_hpm_lp);
 
+void clk_pll_configure_dynamic(struct clk_pll *pll, struct regmap *regmap,
+			       const struct pll_config *config)
+{
+	u32 config_ctl_reg = pll->config_ctl_reg;
+	u32 config_ctl_hi_reg = pll->config_ctl_reg + 4;
+
+	clk_pll_configure(pll, regmap, config);
+
+	regmap_write(regmap, config_ctl_reg, config->config_ctl_val);
+	regmap_write(regmap, config_ctl_hi_reg, config->config_ctl_hi_val);
+
+	clk_pll_set_dynamic_fsm_mode(pll, regmap);
+}
+EXPORT_SYMBOL_GPL(clk_pll_configure_dynamic);
+
 static int clk_pll_sr2_enable(struct clk_hw *hw)
 {
 	struct clk_pll *pll = to_clk_pll(hw);
@@ -373,3 +402,80 @@ const struct clk_ops clk_pll_sr2_ops = {
 	.determine_rate = clk_pll_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_pll_sr2_ops);
+
+static int clk_pll_dynamic_enable(struct clk_hw *hw)
+{
+	struct clk_pll *pll = to_clk_pll(hw);
+
+	/* Wait for 50us explicitly to avoid transient locks */
+	udelay(50);
+
+	return wait_for_pll(pll);
+};
+
+static void clk_pll_dynamic_disable(struct clk_hw *hw)
+{
+	/* 8 reference clock cycle delay mandated by the HPG */
+	udelay(1);
+};
+
+static unsigned long
+clk_pll_dynamic_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	u32 l_val;
+	int ret;
+
+	struct clk_pll *pll = to_clk_pll(hw);
+
+	ret = regmap_read(pll->clkr.regmap, pll->l_reg, &l_val);
+	if (ret)
+		return ret;
+
+	return l_val * parent_rate;
+};
+
+static int
+clk_pll_dynamic_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	struct clk_pll *pll = to_clk_pll(hw);
+	const struct pll_freq_tbl *f;
+
+	f = find_freq(pll->freq_tbl, req->rate);
+	if (!f)
+		req->rate = DIV_ROUND_UP(req->rate, req->best_parent_rate)
+					* req->best_parent_rate;
+	else
+		req->rate = f->freq;
+
+	if (req->rate < pll->min_rate)
+		req->rate = pll->min_rate;
+	else if (req->rate > pll->max_rate)
+		req->rate = pll->max_rate;
+
+	return 0;
+}
+
+static int
+clk_pll_dynamic_set_rate(struct clk_hw *hw, unsigned long rate,
+			 unsigned long prate)
+{
+	u32 l_val;
+	struct clk_pll *pll = to_clk_pll(hw);
+
+	if ((rate < pll->min_rate) || (rate > pll->max_rate) || !prate)
+		return -EINVAL;
+
+	l_val = rate / prate;
+	regmap_write(pll->clkr.regmap, pll->l_reg, l_val);
+
+	return 0;
+}
+
+const struct clk_ops clk_pll_dynamic_ops = {
+	.enable = clk_pll_dynamic_enable,
+	.disable = clk_pll_dynamic_disable,
+	.set_rate = clk_pll_dynamic_set_rate,
+	.recalc_rate = clk_pll_dynamic_recalc_rate,
+	.determine_rate = clk_pll_dynamic_determine_rate,
+};
+EXPORT_SYMBOL_GPL(clk_pll_dynamic_ops);
diff --git a/drivers/clk/qcom/clk-pll.h b/drivers/clk/qcom/clk-pll.h
index dbe22a9..627588f 100644
--- a/drivers/clk/qcom/clk-pll.h
+++ b/drivers/clk/qcom/clk-pll.h
@@ -52,9 +52,12 @@ struct clk_pll {
 	u32	config_reg;
 	u32	mode_reg;
 	u32	status_reg;
+	u32	config_ctl_reg;
 	u8	status_bit;
 	u8	post_div_width;
 	u8	post_div_shift;
+	unsigned long min_rate;
+	unsigned long max_rate;
 
 	const struct pll_freq_tbl *freq_tbl;
 
@@ -64,6 +67,7 @@ struct clk_pll {
 extern const struct clk_ops clk_pll_ops;
 extern const struct clk_ops clk_pll_vote_ops;
 extern const struct clk_ops clk_pll_sr2_ops;
+extern const struct clk_ops clk_pll_dynamic_ops;
 
 #define to_clk_pll(_hw) container_of(to_clk_regmap(_hw), struct clk_pll, clkr)
 
@@ -78,6 +82,8 @@ struct pll_config {
 	u32 pre_div_mask;
 	u32 post_div_val;
 	u32 post_div_mask;
+	u32 config_ctl_val;
+	u32 config_ctl_hi_val;
 	u32 mn_ena_mask;
 	u32 main_output_mask;
 	u32 aux_output_mask;
@@ -88,5 +94,6 @@ void clk_pll_configure_sr(struct clk_pll *pll, struct regmap *regmap,
 		const struct pll_config *config, bool fsm_mode);
 void clk_pll_configure_sr_hpm_lp(struct clk_pll *pll, struct regmap *regmap,
 		const struct pll_config *config, bool fsm_mode);
-
+void clk_pll_configure_dynamic(struct clk_pll *pll, struct regmap *regmap,
+		const struct pll_config *config);
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
