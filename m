Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 03/11] clk: qcom: handle alpha PLLs with 16bit alpha val registers
Date: Thu, 29 Sep 2016 14:05:44 +0530
Message-Id: <1475138152-859-4-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some alpha PLLs have support for only a 16bit programable Alpha Value
(as against the default 40bits). Add a flag to handle the 16bit alpha
registers

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 24 +++++++++++++++++-------
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index a1188c8..fd3e32c 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -59,6 +59,7 @@
  */
 #define ALPHA_REG_BITWIDTH	40
 #define ALPHA_BITWIDTH		32
+#define ALPHA_16BIT_MASK	0xffff
 
 #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
 					   struct clk_alpha_pll, clkr)
@@ -334,9 +335,14 @@ clk_alpha_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	regmap_read(pll->clkr.regmap, off + PLL_USER_CTL, &ctl);
 	if (ctl & PLL_ALPHA_EN) {
 		regmap_read(pll->clkr.regmap, off + PLL_ALPHA_VAL, &low);
-		regmap_read(pll->clkr.regmap, off + PLL_ALPHA_VAL_U, &high);
-		a = (u64)high << 32 | low;
-		a >>= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
+		if (pll->flags & SUPPORTS_16BIT_ALPHA) {
+			a = low & ALPHA_16BIT_MASK;
+		} else {
+			regmap_read(pll->clkr.regmap, off + PLL_ALPHA_VAL_U,
+				    &high);
+			a = (u64)high << 32 | low;
+			a >>= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
+		}
 	}
 
 	return alpha_pll_calc_rate(prate, l, a);
@@ -357,11 +363,15 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
-	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
-
 	regmap_write(pll->clkr.regmap, off + PLL_L_VAL, l);
-	regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL, a);
-	regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL_U, a >> 32);
+
+	if (pll->flags & SUPPORTS_16BIT_ALPHA) {
+		regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL,
+			     a & ALPHA_16BIT_MASK);
+	} else {
+		a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
+		regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL_U, a >> 32);
+	}
 
 	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL,
 			   PLL_VCO_MASK << PLL_VCO_SHIFT,
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 2f48530..4808ff7 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -35,6 +35,7 @@ struct clk_alpha_pll {
 	const struct pll_vco *vco_table;
 	size_t num_vco;
 #define SUPPORTS_OFFLINE_REQ	BIT(0)
+#define SUPPORTS_16BIT_ALPHA	BIT(1)
 	u8 flags;
 
 	struct clk_regmap clkr;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
