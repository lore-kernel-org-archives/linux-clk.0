Return-Path: <v1ron@mail.ru>
From: Roman Volkov <v1ron@mail.ru>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Roman Volkov <rvolkov@v1ros.org>,
	Tony Prisk <linux@prisktech.co.nz>
Subject: [PATCH 1/2] clk/vt8500: Rework wm8650_find_pll_bits()
Date: Tue, 24 May 2016 23:07:52 +0300
Message-Id: <1464120473-1808-2-git-send-email-v1ron@mail.ru>
In-Reply-To: <1464120473-1808-1-git-send-email-v1ron@mail.ru>
References: <1464120473-1808-1-git-send-email-v1ron@mail.ru>
List-ID: <linux-clk.vger.kernel.org>

From: Roman Volkov <rvolkov@v1ros.org>

WM8650 has the following limitation in the clock architecture:

600MHz >= (M * parent) / P >= 300MHz

Where M is multiplier and P is divisor 1 (refer to the source code
comment). This information can be found in the WMT's GPL source. The
algorithm from this change is optimized, performance increase is about
10000 times per the user-mode testing application.

The following GCC warnings are fixed inside the function:

'best_div2', 'best_div1', 'best_mul' may be used uninitialized in
this function [-Wmaybe-uninitialized]

Fixes: 090341b0a95d ("clk: vt8500: fix sign of possible PLL values")
Signed-off-by: Roman Volkov <rvolkov@v1ros.org>
---
 drivers/clk/clk-vt8500.c | 77 +++++++++++++++++++++++-------------------------
 1 file changed, 37 insertions(+), 40 deletions(-)

diff --git a/drivers/clk/clk-vt8500.c b/drivers/clk/clk-vt8500.c
index b0f76a84f1e9..77650f19a9b6 100644
--- a/drivers/clk/clk-vt8500.c
+++ b/drivers/clk/clk-vt8500.c
@@ -383,52 +383,49 @@ static int vt8500_find_pll_bits(unsigned long rate, unsigned long parent_rate,
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
-	u32 best_mul, best_div1, best_div2;
-	unsigned long tclk, rate_err, best_err;
+	unsigned long O1, min_err, rate_err;
 
-	best_err = (unsigned long)-1;
-
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
-
-				if (rate_err < best_err) {
-					best_err = rate_err;
-					best_mul = mul;
-					best_div1 = div1;
-					best_div2 = div2;
-				}
-			}
-
-	if (best_err == (unsigned long)-1) {
-		pr_warn("%s: impossible rate %lu\n", __func__, rate);
+	if (!parent_rate || (rate < 37500000) || (rate > 600000000))
 		return -EINVAL;
+
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
 	}
 
-	/* if we got here, it wasn't an exact match */
-	pr_warn("%s: requested rate %lu, found rate %lu\n", __func__, rate,
-							rate - best_err);
-	*multiplier = best_mul;
-	*divisor1 = best_div1;
-	*divisor2 = best_div2;
+	if ((*multiplier < 3) || (*multiplier > 1023))
+		return -EINVAL;
 
+	pr_warn("%s: rate error is %lu\n", __func__, min_err);
 	return 0;
 }
 
-- 
2.8.0
