Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org,
	agross@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/5] clk: qcom: Add support for SR2 PLLs
Date: Fri, 12 Jun 2015 11:41:55 +0300
Message-Id: <1434098519-26406-2-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1434098519-26406-1-git-send-email-georgi.djakov@linaro.org>
References: <1434098519-26406-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add support for SR2 type pll operations. SR2 is optimized for Time Interval
Error (TIE) or absolute jitter.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/clk-pll.c |   75 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-pll.h |    1 +
 2 files changed, 76 insertions(+)

diff --git a/drivers/clk/qcom/clk-pll.c b/drivers/clk/qcom/clk-pll.c
index 245d5063a385..017eede87237 100644
--- a/drivers/clk/qcom/clk-pll.c
+++ b/drivers/clk/qcom/clk-pll.c
@@ -292,3 +292,78 @@ void clk_pll_configure_sr_hpm_lp(struct clk_pll *pll, struct regmap *regmap,
 		clk_pll_set_fsm_mode(pll, regmap, 0);
 }
 EXPORT_SYMBOL_GPL(clk_pll_configure_sr_hpm_lp);
+
+static int clk_pll_sr2_enable(struct clk_hw *hw)
+{
+	struct clk_pll *pll = to_clk_pll(hw);
+	int ret;
+	u32 mode;
+
+	ret = regmap_read(pll->clkr.regmap, pll->mode_reg, &mode);
+	if (ret)
+		return ret;
+
+	/* Disable PLL bypass mode. */
+	ret = regmap_update_bits(pll->clkr.regmap, pll->mode_reg, PLL_BYPASSNL,
+				 PLL_BYPASSNL);
+	if (ret)
+		return ret;
+
+	/*
+	 * H/W requires a 5us delay between disabling the bypass and
+	 * de-asserting the reset. Delay 10us just to be safe.
+	 */
+	udelay(10);
+
+	/* De-assert active-low PLL reset. */
+	ret = regmap_update_bits(pll->clkr.regmap, pll->mode_reg, PLL_RESET_N,
+				 PLL_RESET_N);
+	if (ret)
+		return ret;
+
+	ret = wait_for_pll(pll);
+	if (ret)
+		return ret;
+
+	/* Enable PLL output. */
+	return regmap_update_bits(pll->clkr.regmap, pll->mode_reg, PLL_OUTCTRL,
+				 PLL_OUTCTRL);
+}
+
+static int
+clk_pll_sr2_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
+{
+	struct clk_pll *pll = to_clk_pll(hw);
+	const struct pll_freq_tbl *f;
+	bool enabled;
+	u32 mode;
+	u32 enable_mask = PLL_OUTCTRL | PLL_BYPASSNL | PLL_RESET_N;
+
+	f = find_freq(pll->freq_tbl, rate);
+	if (!f)
+		return -EINVAL;
+
+	regmap_read(pll->clkr.regmap, pll->mode_reg, &mode);
+	enabled = (mode & enable_mask) == enable_mask;
+
+	if (enabled)
+		clk_pll_disable(hw);
+
+	regmap_update_bits(pll->clkr.regmap, pll->l_reg, 0x3ff, f->l);
+	regmap_update_bits(pll->clkr.regmap, pll->m_reg, 0x7ffff, f->m);
+	regmap_update_bits(pll->clkr.regmap, pll->n_reg, 0x7ffff, f->n);
+
+	if (enabled)
+		clk_pll_sr2_enable(hw);
+
+	return 0;
+}
+
+const struct clk_ops clk_pll_sr2_ops = {
+	.enable = clk_pll_sr2_enable,
+	.disable = clk_pll_disable,
+	.set_rate = clk_pll_sr2_set_rate,
+	.recalc_rate = clk_pll_recalc_rate,
+	.determine_rate = clk_pll_determine_rate,
+};
+EXPORT_SYMBOL_GPL(clk_pll_sr2_ops);
diff --git a/drivers/clk/qcom/clk-pll.h b/drivers/clk/qcom/clk-pll.h
index c9c0cda306d0..ffd0c63bddbc 100644
--- a/drivers/clk/qcom/clk-pll.h
+++ b/drivers/clk/qcom/clk-pll.h
@@ -62,6 +62,7 @@ struct clk_pll {
 
 extern const struct clk_ops clk_pll_ops;
 extern const struct clk_ops clk_pll_vote_ops;
+extern const struct clk_ops clk_pll_sr2_ops;
 
 #define to_clk_pll(_hw) container_of(to_clk_regmap(_hw), struct clk_pll, clkr)
 
