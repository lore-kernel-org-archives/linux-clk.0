Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Victorien Vedrine <victorien.vedrine@ophrys.net>
To: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org, sboyd@codeaurora.org,
	mturquette@baylibre.com,
	Victorien Vedrine <victorien.vedrine@ophrys.net>
Subject: [PATCH] clk:mxs: Fix bug on frequency divider
Date: Fri, 31 Jul 2015 18:24:17 +0200
Message-Id: <1438359857-11074-1-git-send-email-victorien.vedrine@ophrys.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On drivers/clk/mxs/clk-frac.c, the function clk_frac_round_rate returned a bad
result. The division before multiplication computes a wrong value ; the
calculation is inverted to fix the problem. The second issue is that the exact
rate have decimals and they are truncate. The consequence is that the function
clk_frac_set_rate (which use the result of clk_frac_round_rate) computes a
wrong value for the register (the rate generated can be closer to the desired
rate). The correction is : if there is decimal to the result, it is rounded to
the next larger integer.

On drivers/clk/mxs/clk-frac.c, the function clk_frac_recalc_rate returned
a bad result. The multiplication is made before the division to compute a
correct value.

The issue is reproducible by this way : Set the SAIF frequency to 22579200Hz
(it's the appropriate frequency for 44100hz sample rate for SGTL5000 codec).
With the divider register (HW_CLKCTRL_SAIF0), the closest lower value is
22573242.1875Hz (0xC0A on register). The original clk-frac functions give 0xC09
on the divider register.

Signed-off-by: Victorien Vedrine <victorien.vedrine@ophrys.net>
---
 drivers/clk/mxs/clk-frac.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mxs/clk-frac.c b/drivers/clk/mxs/clk-frac.c
index e6aa6b5..d51cf03 100644
--- a/drivers/clk/mxs/clk-frac.c
+++ b/drivers/clk/mxs/clk-frac.c
@@ -42,11 +42,13 @@ static unsigned long clk_frac_recalc_rate(struct clk_hw *hw,
 {
 	struct clk_frac *frac = to_clk_frac(hw);
 	u32 div;
+	u64 tmp_rate;
 
 	div = readl_relaxed(frac->reg) >> frac->shift;
 	div &= (1 << frac->width) - 1;
 
-	return (parent_rate >> frac->width) * div;
+	tmp_rate = (u64)parent_rate * (u64)div;
+	return (unsigned long)(tmp_rate >> frac->width);
 }
 
 static long clk_frac_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -55,7 +57,7 @@ static long clk_frac_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_frac *frac = to_clk_frac(hw);
 	unsigned long parent_rate = *prate;
 	u32 div;
-	u64 tmp;
+	u64 tmp, tmp_rate, result;
 
 	if (rate > parent_rate)
 		return -EINVAL;
@@ -68,7 +70,12 @@ static long clk_frac_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (!div)
 		return -EINVAL;
 
-	return (parent_rate >> frac->width) * div;
+	tmp_rate = (u64)parent_rate * (u64)div;
+	result = (u64)(tmp_rate >> frac->width);
+	if ((result << frac->width) < tmp_rate)
+		return result + 1;
+	else
+		return result;
 }
 
 static int clk_frac_set_rate(struct clk_hw *hw, unsigned long rate,
-- 
1.9.1

