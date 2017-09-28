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
Subject: [PATCH 05/13] clk: qcom: add and use alpha register width from PLL properties
Date: Thu, 28 Sep 2017 23:20:42 +0530
Message-Id: <1506621050-10129-6-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Currently SUPPORTS_16BIT_ALPHA flag determines the PLL alpha
register width. If this flag is set then the alpha register width
is 16 bits otherwise it is 40 bits. The alpha width is always
fixed for PLL type so it can be added in PLL properties and clock
driver don’t have to specify explicitly.

The SUPPORTS_16BIT_ALPHA flag is unused in the current code so
it’s safe to remove this flags.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 16 ++++++++--------
 drivers/clk/qcom/clk-alpha-pll.h |  3 +--
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index a12f7b4..78eb6bf 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -44,13 +44,10 @@
 /*
  * Even though 40 bits are present, use only 32 for ease of calculation.
  */
-#define ALPHA_REG_BITWIDTH	40
-#define ALPHA_REG_16BIT_WIDTH	16
 #define ALPHA_BITWIDTH		32
 
-/* Returns the Alpha register width for pll */
-#define pll_alpha_width(pll)	(pll->flags & SUPPORTS_16BIT_ALPHA ?	\
-				 ALPHA_REG_16BIT_WIDTH : ALPHA_REG_BITWIDTH)
+/* Returns the Alpha register width for pll type */
+#define pll_alpha_width(type)	(alpha_pll_props[type].alpha_width)
 
 /* Returns the alpha_pll_clk_ops for pll type */
 #define pll_clk_ops(hw)		(alpha_pll_props[to_clk_alpha_pll(hw)->	   \
@@ -127,10 +124,12 @@ struct alpha_pll_clk_ops {
  * struct alpha_pll_props - contains the various properties which
  *			    will be fixed for PLL type.
  * @reg_offsets: register offsets mapping array
+ * @alpha_width: alpha value width
  * @ops: clock operations for alpha PLL
  */
 struct alpha_pll_props {
 	u8 reg_offsets[PLL_MAX_REGS];
+	u8 alpha_width;
 	struct alpha_pll_clk_ops ops;
 };
 
@@ -423,8 +422,8 @@ static void alpha_pll_default_disable(struct clk_hw *hw)
 	u32 l, low, high, ctl;
 	u64 a = 0, prate = parent_rate;
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 off = pll->offset, alpha_width = pll_alpha_width(pll);
 	u8 type = pll->pll_type;
+	u32 off = pll->offset, alpha_width = pll_alpha_width(type);
 
 	regmap_read(pll->clkr.regmap, off + pll_l(type), &l);
 
@@ -451,8 +450,8 @@ static int alpha_pll_default_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	const struct pll_vco *vco;
-	u32 l, off = pll->offset, alpha_width = pll_alpha_width(pll);
 	u8 type = pll->pll_type;
+	u32 l, off = pll->offset, alpha_width = pll_alpha_width(type);
 	u64 a;
 
 	rate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
@@ -487,7 +486,7 @@ static long alpha_pll_default_round_rate(struct clk_hw *hw, unsigned long rate,
 					 unsigned long *prate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 l, alpha_width = pll_alpha_width(pll);
+	u32 l, alpha_width = pll_alpha_width(pll->pll_type);
 	u64 a;
 	unsigned long min_freq, max_freq;
 
@@ -640,6 +639,7 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 			[PLL_TEST_CTL_U] = 0x20,
 			[PLL_STATUS] = 0x24,
 		},
+		.alpha_width = 40,
 		.ops = {
 			.enable = alpha_pll_default_enable,
 			.disable = alpha_pll_default_disable,
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 4c91fbc..b9caefc 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -42,8 +42,7 @@ struct clk_alpha_pll {
 	const struct pll_vco *vco_table;
 	size_t num_vco;
 #define SUPPORTS_OFFLINE_REQ	BIT(0)
-#define SUPPORTS_16BIT_ALPHA	BIT(1)
-#define SUPPORTS_FSM_MODE	BIT(2)
+#define SUPPORTS_FSM_MODE	BIT(1)
 	u8 flags;
 	u8 pll_type;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
