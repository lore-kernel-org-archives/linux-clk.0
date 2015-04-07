Return-Path: <ce3a@gmx.de>
From: Sergej Sawazki <ce3a@gmx.de>
To: mturquette@linaro.org,
	sboyd@codeaurora.org,
	sebastian.hesselbarth@gmail.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>
Subject: [PATCH v2] clk: si5351: fix .round_rate for multisynth 6-7
Date: Tue,  7 Apr 2015 21:11:58 +0200
Message-Id: <1428433918-6339-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

The divider calculation for multisynth 6 and 7 differs from the
calculation for multisynth 0-5.

For MS6 and MS7, set MSx_P1 directly, MSx_P1=divide value
[AN619, p. 6].

Referenced document:
[AN619] Manually Generating an Si5351 Register Map, Rev. 0.4

Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
---
 drivers/clk/clk-si5351.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 44ea107..1029bf7 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -552,7 +552,8 @@ static const struct clk_ops si5351_pll_ops = {
  * MSx_P2[19:0] = 128 * b - c * floor(128 * b/c) = (128*b) mod c
  * MSx_P3[19:0] = c
  *
- * MS[6,7] are integer (P1) divide only, P2 = 0, P3 = 0
+ * MS[6,7] are integer (P1) divide only, P1 = divide value,
+ * P2 and P3 are not applicable
  *
  * for 150MHz < fOUT <= 160MHz:
  *
@@ -645,7 +646,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct si5351_hw_data *hwdata =
 		container_of(hw, struct si5351_hw_data, hw);
 	unsigned long long lltmp;
-	unsigned long a, b, c;
+	unsigned long a, b = 0, c = 1;
 	int divby4;
 
 	/* multisync6-7 can only handle freqencies < 150MHz */
@@ -675,9 +676,6 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 		} else
 			a = 4;
 
-		b = 0;
-		c = 1;
-
 		*parent_rate = a * rate;
 	} else {
 		unsigned long rfrac, denom;
@@ -698,18 +696,19 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 			a = SI5351_MULTISYNTH_A_MAX;
 
 		/* find best approximation for b/c = fVCO mod fOUT */
-		denom = 1000 * 1000;
-		lltmp = (*parent_rate) % rate;
-		lltmp *= denom;
-		do_div(lltmp, rate);
-		rfrac = (unsigned long)lltmp;
-
-		b = 0;
-		c = 1;
-		if (rfrac)
-			rational_best_approximation(rfrac, denom,
-			    SI5351_MULTISYNTH_B_MAX, SI5351_MULTISYNTH_C_MAX,
-			    &b, &c);
+		if (hwdata->num <= 5) {
+			denom = 1000 * 1000;
+			lltmp = (*parent_rate) % rate;
+			lltmp *= denom;
+			do_div(lltmp, rate);
+			rfrac = (unsigned long)lltmp;
+
+			if (rfrac)
+				rational_best_approximation(rfrac, denom,
+					SI5351_MULTISYNTH_B_MAX,
+					SI5351_MULTISYNTH_C_MAX,
+					&b, &c);
+		}
 	}
 
 	/* recalculate rate by fOUT = fIN / (a + b/c) */
@@ -723,6 +722,10 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 		hwdata->params.p3 = 1;
 		hwdata->params.p2 = 0;
 		hwdata->params.p1 = 0;
+	} else if (hwdata->num >= 6) {
+		hwdata->params.p3 = c;
+		hwdata->params.p2 = b;
+		hwdata->params.p1 = a;
 	} else {
 		hwdata->params.p3  = c;
 		hwdata->params.p2  = (128 * b) % c;
-- 
1.9.1
