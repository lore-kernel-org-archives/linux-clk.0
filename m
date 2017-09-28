Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 06/13] clk: qcom: flag for 64 bit CONFIG_CTL
Date: Thu, 28 Sep 2017 23:20:43 +0530
Message-Id: <1506621050-10129-7-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Some of the Alpha PLL’s (like Spark, Brammo PLL) do not have
CONFIG_CTL_U register. This patch adds the flag in properties
for PLL’s which have CONFIG_CTL_U register and checks the same
while doing PLL initial configuration.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 78eb6bf..b33d120 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -49,6 +49,9 @@
 /* Returns the Alpha register width for pll type */
 #define pll_alpha_width(type)	(alpha_pll_props[type].alpha_width)
 
+/* Returns the flags for pll type */
+#define pll_flags(type)		(alpha_pll_props[type].flags)
+
 /* Returns the alpha_pll_clk_ops for pll type */
 #define pll_clk_ops(hw)		(alpha_pll_props[to_clk_alpha_pll(hw)->	   \
 				 pll_type].ops)
@@ -130,6 +133,9 @@ struct alpha_pll_clk_ops {
 struct alpha_pll_props {
 	u8 reg_offsets[PLL_MAX_REGS];
 	u8 alpha_width;
+
+#define HAVE_64BIT_CONFIG_CTL	BIT(0)
+	u8 flags;
 	struct alpha_pll_clk_ops ops;
 };
 
@@ -180,7 +186,7 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 {
 	u32 val, mask;
 	u32 off = pll->offset;
-	u8 type = pll->pll_type;
+	u8 type = pll->pll_type, flags = pll_flags(type);
 
 	regmap_write(regmap, off + pll_l(type), config->l);
 	regmap_write(regmap, off + pll_alpha(type), config->alpha);
@@ -188,6 +194,10 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	regmap_write(regmap, off + pll_cfg_ctl_u(type),
 		     config->config_ctl_hi_val);
 
+	if (flags & HAVE_64BIT_CONFIG_CTL)
+		regmap_write(regmap, off + pll_cfg_ctl_u(type),
+			     config->config_ctl_hi_val);
+
 	val = config->main_output_mask;
 	val |= config->aux_output_mask;
 	val |= config->aux2_output_mask;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
