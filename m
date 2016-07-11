Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	stephen.boyd@linaro.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 4/6] clk: qcom: Add support for PLLs with alpha mode
Date: Mon, 11 Jul 2016 16:20:37 +0530
Message-Id: <1468234239-28693-5-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1468234239-28693-1-git-send-email-rnayak@codeaurora.org>
References: <1468234239-28693-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some PLLs can support an alpha mode, and a single alpha
register (instead of registers to program the M/N values),
the contents of which depend on the alpha mode selected.
(They are either treated as two's complement or M/N value)
Add support for this in the clk PLL driver.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-pll.c | 8 ++++++--
 drivers/clk/qcom/clk-pll.h | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-pll.c b/drivers/clk/qcom/clk-pll.c
index 5b940d6..08d2fa2 100644
--- a/drivers/clk/qcom/clk-pll.c
+++ b/drivers/clk/qcom/clk-pll.c
@@ -255,8 +255,12 @@ static void clk_pll_configure(struct clk_pll *pll, struct regmap *regmap,
 	u32 mask;
 
 	regmap_write(regmap, pll->l_reg, config->l);
-	regmap_write(regmap, pll->m_reg, config->m);
-	regmap_write(regmap, pll->n_reg, config->n);
+	if (pll->alpha_reg) {
+		regmap_write(regmap, pll->alpha_reg, config->alpha);
+	} else {
+		regmap_write(regmap, pll->m_reg, config->m);
+		regmap_write(regmap, pll->n_reg, config->n);
+	}
 
 	val = config->vco_val;
 	val |= config->pre_div_val;
diff --git a/drivers/clk/qcom/clk-pll.h b/drivers/clk/qcom/clk-pll.h
index ffd0c63..083727e 100644
--- a/drivers/clk/qcom/clk-pll.h
+++ b/drivers/clk/qcom/clk-pll.h
@@ -48,6 +48,7 @@ struct clk_pll {
 	u32	l_reg;
 	u32	m_reg;
 	u32	n_reg;
+	u32	alpha_reg;
 	u32	config_reg;
 	u32	mode_reg;
 	u32	status_reg;
@@ -70,6 +71,7 @@ struct pll_config {
 	u16 l;
 	u32 m;
 	u32 n;
+	u32 alpha;
 	u32 vco_val;
 	u32 vco_mask;
 	u32 pre_div_val;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
