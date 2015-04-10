Return-Path: <ce3a@gmx.de>
From: Sergej Sawazki <ce3a@gmx.de>
To: mturquette@linaro.org,
	sboyd@codeaurora.org,
	sebastian.hesselbarth@gmail.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>
Subject: [PATCH v3] clk: si5351: fix .round_rate for multisynth 6-7
Date: Fri, 10 Apr 2015 21:14:12 +0200
Message-Id: <1428693252-14886-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

The divider calculation for multisynth 6 and 7 differs from the
calculation for multisynth 0-5.

For MS6 and MS7, set MSx_P1 directly, MSx_P1 = divide value
[AN619, p. 6].

Referenced document:
[AN619] Manually Generating an Si5351 Register Map, Rev. 0.4

Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
---
 drivers/clk/clk-si5351.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 44ea107..8e90bdd 100644
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
@@ -679,6 +680,16 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 		c = 1;
 
 		*parent_rate = a * rate;
+	} else if (hwdata->num >= 6) {
+		/* determine the closest integer divider */
+		a = DIV_ROUND_CLOSEST(*parent_rate, rate);
+		if (a < SI5351_MULTISYNTH_A_MIN)
+			a = SI5351_MULTISYNTH_A_MIN;
+		if (a > SI5351_MULTISYNTH67_A_MAX)
+			a = SI5351_MULTISYNTH67_A_MAX;
+
+		b = 0;
+		c = 1;
 	} else {
 		unsigned long rfrac, denom;
 
@@ -692,9 +703,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 		a = *parent_rate / rate;
 		if (a < SI5351_MULTISYNTH_A_MIN)
 			a = SI5351_MULTISYNTH_A_MIN;
-		if (hwdata->num >= 6 && a > SI5351_MULTISYNTH67_A_MAX)
-			a = SI5351_MULTISYNTH67_A_MAX;
-		else if (a > SI5351_MULTISYNTH_A_MAX)
+		if (a > SI5351_MULTISYNTH_A_MAX)
 			a = SI5351_MULTISYNTH_A_MAX;
 
 		/* find best approximation for b/c = fVCO mod fOUT */
@@ -723,6 +732,10 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 		hwdata->params.p3 = 1;
 		hwdata->params.p2 = 0;
 		hwdata->params.p1 = 0;
+	} else if (hwdata->num >= 6) {
+		hwdata->params.p3 = 0;
+		hwdata->params.p2 = 0;
+		hwdata->params.p1 = a;
 	} else {
 		hwdata->params.p3  = c;
 		hwdata->params.p2  = (128 * b) % c;
-- 
1.9.1
