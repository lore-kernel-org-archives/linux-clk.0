Return-Path: <slongerbeam@gmail.com>
Return-Path: <slongerbeam@gmail.com>
From: Steve Longerbeam <slongerbeam@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steve Longerbeam <steve_longerbeam@mentor.com>
Subject: [PATCH] clk: vc5: Avoid divide by zero when rounding or setting rates
Date: Thu, 31 May 2018 18:59:17 -0700
Message-Id: <1527818357-8154-1-git-send-email-steve_longerbeam@mentor.com>
List-ID: <linux-clk.vger.kernel.org>

Add checks in the .round_rate and .set_rate ops for zero requested
rate or zero parent rate. If either are zero in .round_rate, just
return zero. If either are zero in .set_rate, return -EINVAL.

Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
---
 drivers/clk/clk-versaclock5.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index decffb3..5524e5d 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -304,6 +304,9 @@ static int vc5_dbl_set_rate(struct clk_hw *hw, unsigned long rate,
 		container_of(hw, struct vc5_driver_data, clk_mul);
 	u32 mask;
 
+	if (parent_rate == 0 || rate == 0)
+		return -EINVAL;
+
 	if ((parent_rate * 2) == rate)
 		mask = VC5_PRIM_SRC_SHDN_EN_DOUBLE_XTAL_FREQ;
 	else
@@ -349,6 +352,10 @@ static long vc5_pfd_round_rate(struct clk_hw *hw, unsigned long rate,
 {
 	unsigned long idiv;
 
+	/* avoid division by zero */
+	if (*parent_rate == 0 || rate == 0)
+		return 0;
+
 	/* PLL cannot operate with input clock above 50 MHz. */
 	if (rate > 50000000)
 		return -EINVAL;
@@ -372,6 +379,10 @@ static int vc5_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long idiv;
 	u8 div;
 
+	/* avoid division by zero */
+	if (parent_rate == 0 || rate == 0)
+		return -EINVAL;
+
 	/* CLKIN within range of PLL input, feed directly to PLL. */
 	if (parent_rate <= 50000000) {
 		regmap_update_bits(vc5->regmap, VC5_VCO_CTRL_AND_PREDIV,
@@ -429,6 +440,10 @@ static long vc5_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	u32 div_int;
 	u64 div_frc;
 
+	/* avoid division by zero */
+	if (*parent_rate == 0 || rate == 0)
+		return 0;
+
 	if (rate < VC5_PLL_VCO_MIN)
 		rate = VC5_PLL_VCO_MIN;
 	if (rate > VC5_PLL_VCO_MAX)
@@ -457,6 +472,9 @@ static int vc5_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct vc5_driver_data *vc5 = hwdata->vc5;
 	u8 fb[5];
 
+	if (parent_rate == 0 || rate == 0)
+		return -EINVAL;
+
 	fb[0] = hwdata->div_int >> 4;
 	fb[1] = hwdata->div_int << 4;
 	fb[2] = hwdata->div_frc >> 16;
@@ -509,6 +527,10 @@ static long vc5_fod_round_rate(struct clk_hw *hw, unsigned long rate,
 	u32 div_int;
 	u64 div_frc;
 
+	/* avoid division by zero */
+	if (*parent_rate == 0 || rate == 0)
+		return 0;
+
 	/* Determine integer part, which is 12 bit wide */
 	div_int = f_in / rate;
 	/*
@@ -546,6 +568,9 @@ static int vc5_fod_set_rate(struct clk_hw *hw, unsigned long rate,
 		0
 	};
 
+	if (parent_rate == 0 || rate == 0)
+		return -EINVAL;
+
 	regmap_bulk_write(vc5->regmap, VC5_OUT_DIV_FRAC(hwdata->num, 0),
 			  data, 14);
 
-- 
2.7.4
