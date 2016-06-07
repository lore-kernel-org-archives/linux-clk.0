Return-Path: <v1ron@mail.ru>
From: Roman Volkov <v1ron@mail.ru>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Roman Volkov <rvolkov@v1ros.org>,
	Tony Prisk <linux@prisktech.co.nz>
Subject: [PATCH v2 2/2] clk: vt8500: rework wm8650_find_pll_bits()
Date: Wed,  8 Jun 2016 00:56:10 +0300
Message-Id: <20160607215610.8724-3-v1ron@mail.ru>
In-Reply-To: <20160607215610.8724-1-v1ron@mail.ru>
References: <20160607215610.8724-1-v1ron@mail.ru>
List-ID: <linux-clk.vger.kernel.org>

From: Roman Volkov <rvolkov@v1ros.org>

PLL clock on WM8650 is calculated in the following way:

M * parent [O1] => / P [O2] => / D [O3]

Where O2 is 600MHz >= (M * parent) / P >= 300MHz.

Current algorithm does not met this requirement, so that the
function may return rates which are not supported by the hardware.

This patch fixes the algorithm and simplifies the code, reducing
the calculation time by ~10000 times (according to usermode app) by
removing the nested loops.

Signed-off-by: Roman Volkov <rvolkov@v1ros.org>
---
 drivers/clk/clk-vt8500.c | 73 +++++++++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/clk-vt8500.c b/drivers/clk/clk-vt8500.c
index d5a3453970d0..37368a399ff9 100644
--- a/drivers/clk/clk-vt8500.c
+++ b/drivers/clk/clk-vt8500.c
@@ -383,47 +383,50 @@ static int vt8500_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 	return 0;
 }
 
-static int wm8650_find_pll_bits(unsigned long rate, unsigned long parent_rate,
-				u32 *multiplier, u32 *divisor1, u32 *divisor2)
+/*
+ * M * parent [O1] => / P [O2] => / D [O3]
+ * Where O1 is 900MHz...3GHz;
+ * O2 is 600MHz >= (M * parent) / P >= 300MHz;
+ * M is 36...120 [25MHz parent]; D is 1 or 2 or 4 or 8.
+ * Possible ranges (O3):
+ * D = 8: 37,5MHz...75MHz
+ * D = 4: 75MHz...150MHz
+ * D = 2: 150MHz...300MHz
+ * D = 1: 300MHz...600MHz
+ */
+static int wm8650_find_pll_bits(unsigned long rate,
+	unsigned long parent_rate, u32 *multiplier, u32 *divisor1,
+	u32 *divisor2)
 {
-	u32 mul, div1;
-	int div2;
-	unsigned long tclk, rate_err, best_err;
-
-	best_err = (unsigned long)-1;
+	unsigned long O1, min_err, rate_err;
 
-	/* Find the closest match (lower or equal to requested) */
-	for (div1 = 5; div1 >= 3; div1--)
-		for (div2 = 3; div2 >= 0; div2--)
-			for (mul = 3; mul <= 1023; mul++) {
-				tclk = parent_rate * mul / (div1 * (1 << div2));
-				if (tclk > rate)
-					continue;
-				/* error will always be +ve */
-				rate_err = rate - tclk;
-				if (rate_err == 0) {
-					*multiplier = mul;
-					*divisor1 = div1;
-					*divisor2 = div2;
-					return 0;
-				}
+	if (!parent_rate || (rate < 37500000) || (rate > 600000000))
+		return -EINVAL;
 
-				if (rate_err < best_err) {
-					best_err = rate_err;
-					*multiplier = mul;
-					*divisor1 = div1;
-					*divisor2 = div2;
-				}
-			}
+	*divisor2 = rate <= 75000000 ? 3 : rate <= 150000000 ? 2 :
+					   rate <= 300000000 ? 1 : 0;
+	/*
+	 * Divisor P cannot be calculated. Test all divisors and find where M
+	 * will be as close as possible to the requested rate.
+	 */
+	min_err = ULONG_MAX;
+	for (*divisor1 = 5; *divisor1 >= 3; (*divisor1)--) {
+		O1 = rate * *divisor1 * (1 << (*divisor2));
+		rate_err = O1 % parent_rate;
+		if (rate_err < min_err) {
+			*multiplier = O1 / parent_rate;
+			if (rate_err == 0)
+				return 0;
+
+			min_err = rate_err;
+		}
+	}
 
-	if (best_err == (unsigned long)-1) {
-		pr_warn("%s: impossible rate %lu\n", __func__, rate);
+	if ((*multiplier < 3) || (*multiplier > 1023))
 		return -EINVAL;
-	}
 
-	/* if we got here, it wasn't an exact match */
-	pr_warn("%s: requested rate %lu, found rate %lu\n", __func__, rate,
-							rate - best_err);
+	pr_warn("%s: rate error is %lu\n", __func__, min_err);
+
 	return 0;
 }
 
-- 
2.8.3
