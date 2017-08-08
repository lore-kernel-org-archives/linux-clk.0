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
Subject: [RFC v2 01/12] clk: qcom: flag for 64 bit CONFIG_CTL
Date: Tue,  8 Aug 2017 23:54:06 +0530
Message-Id: <1502216657-3342-2-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
References: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Some of the Alpha PLL’s (like Spark, Brammo PLL) do not have
CONFIG_CTL_U register. This patch adds the flag for PLL’s
which have CONFIG_CTL_U register and checks the same while
doing PLL initial configuration.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 5 ++++-
 drivers/clk/qcom/clk-alpha-pll.h | 7 ++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 47a1da3..e6cde2d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -118,7 +118,10 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	regmap_write(regmap, off + PLL_L_VAL, config->l);
 	regmap_write(regmap, off + PLL_ALPHA_VAL, config->alpha);
 	regmap_write(regmap, off + PLL_CONFIG_CTL, config->config_ctl_val);
-	regmap_write(regmap, off + PLL_CONFIG_CTL_U, config->config_ctl_hi_val);
+
+	if (pll->flags & SUPPORTS_64BIT_CONFIG_CTL)
+		regmap_write(regmap, off + PLL_CONFIG_CTL_U,
+			     config->config_ctl_hi_val);
 
 	val = config->main_output_mask;
 	val |= config->aux_output_mask;
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index d6e1ee2..bbd6aa9 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -34,9 +34,10 @@ struct clk_alpha_pll {
 
 	const struct pll_vco *vco_table;
 	size_t num_vco;
-#define SUPPORTS_OFFLINE_REQ	BIT(0)
-#define SUPPORTS_16BIT_ALPHA	BIT(1)
-#define SUPPORTS_FSM_MODE	BIT(2)
+#define SUPPORTS_OFFLINE_REQ		BIT(0)
+#define SUPPORTS_16BIT_ALPHA		BIT(1)
+#define SUPPORTS_FSM_MODE		BIT(2)
+#define SUPPORTS_64BIT_CONFIG_CTL	BIT(3)
 	u8 flags;
 
 	struct clk_regmap clkr;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
