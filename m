Return-Path: <v1ron@mail.ru>
From: Roman Volkov <v1ron@mail.ru>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Roman Volkov <rvolkov@v1ros.org>,
	Tony Prisk <linux@prisktech.co.nz>
Subject: [PATCH v2 1/2] clk: vt8500: fix gcc-4.9 warnings
Date: Wed,  8 Jun 2016 00:56:09 +0300
Message-Id: <20160607215610.8724-2-v1ron@mail.ru>
In-Reply-To: <20160607215610.8724-1-v1ron@mail.ru>
References: <20160607215610.8724-1-v1ron@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

From: Arnd Bergmann <arnd@arndb.de>

This fixes some false positive warnings we get with older compiler
versions:

clk-vt8500.c: In function ‘wm8650_find_pll_bits’:
clk-vt8500.c:430:12: ‘best_div2’ may be used uninitialized in this function
clk-vt8500.c:429:12: ‘best_div1’ may be used uninitialized in this function
clk-vt8500.c:428:14: ‘best_mul’ may be used uninitialized in this function
clk-vt8500.c: In function ‘wm8750_find_pll_bits’:
clk-vt8500.c:509:12: ‘best_div2’ may be used uninitialized in this function
clk-vt8500.c:508:12: ‘best_div1’ may be used uninitialized in this function
clk-vt8500.c:507:14: ‘best_mul’ may be used uninitialized in this function
clk-vt8500.c: In function ‘wm8850_find_pll_bits’:
clk-vt8500.c:560:12: ‘best_div2’ may be used uninitialized in this function
clk-vt8500.c:559:12: ‘best_div1’ may be used uninitialized in this function
clk-vt8500.c:558:14: ‘best_mul’ may be used uninitialized in this function

As the local variables are only use for temporaries, we can just
as well assign the final values directly, which also makes the
code slightly shorter.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Roman Volkov <rvolkov@v1ros.org>
---
 drivers/clk/clk-vt8500.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/clk-vt8500.c b/drivers/clk/clk-vt8500.c
index b0f76a84f1e9..d5a3453970d0 100644
--- a/drivers/clk/clk-vt8500.c
+++ b/drivers/clk/clk-vt8500.c
@@ -388,7 +388,6 @@ static int wm8650_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 {
 	u32 mul, div1;
 	int div2;
-	u32 best_mul, best_div1, best_div2;
 	unsigned long tclk, rate_err, best_err;
 
 	best_err = (unsigned long)-1;
@@ -411,9 +410,9 @@ static int wm8650_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 
 				if (rate_err < best_err) {
 					best_err = rate_err;
-					best_mul = mul;
-					best_div1 = div1;
-					best_div2 = div2;
+					*multiplier = mul;
+					*divisor1 = div1;
+					*divisor2 = div2;
 				}
 			}
 
@@ -425,10 +424,6 @@ static int wm8650_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 	/* if we got here, it wasn't an exact match */
 	pr_warn("%s: requested rate %lu, found rate %lu\n", __func__, rate,
 							rate - best_err);
-	*multiplier = best_mul;
-	*divisor1 = best_div1;
-	*divisor2 = best_div2;
-
 	return 0;
 }
 
@@ -464,7 +459,6 @@ static int wm8750_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 {
 	u32 mul;
 	int div1, div2;
-	u32 best_mul, best_div1, best_div2;
 	unsigned long tclk, rate_err, best_err;
 
 	best_err = (unsigned long)-1;
@@ -488,9 +482,9 @@ static int wm8750_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 
 				if (rate_err < best_err) {
 					best_err = rate_err;
-					best_mul = mul;
-					best_div1 = div1;
-					best_div2 = div2;
+					*multiplier = mul;
+					*divisor1 = div1;
+					*divisor2 = div2;
 				}
 			}
 
@@ -503,10 +497,7 @@ static int wm8750_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 	pr_warn("%s: requested rate %lu, found rate %lu\n", __func__, rate,
 							rate - best_err);
 
-	*filter = wm8750_get_filter(parent_rate, best_div1);
-	*multiplier = best_mul;
-	*divisor1 = best_div1;
-	*divisor2 = best_div2;
+	*filter = wm8750_get_filter(parent_rate, *divisor1);
 
 	return 0;
 }
@@ -516,7 +507,6 @@ static int wm8850_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 {
 	u32 mul;
 	int div1, div2;
-	u32 best_mul, best_div1, best_div2;
 	unsigned long tclk, rate_err, best_err;
 
 	best_err = (unsigned long)-1;
@@ -540,9 +530,9 @@ static int wm8850_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 
 				if (rate_err < best_err) {
 					best_err = rate_err;
-					best_mul = mul;
-					best_div1 = div1;
-					best_div2 = div2;
+					*multiplier = mul;
+					*divisor1 = div1;
+					*divisor2 = div2;
 				}
 			}
 
@@ -555,10 +545,6 @@ static int wm8850_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 	pr_warn("%s: requested rate %lu, found rate %lu\n", __func__, rate,
 							rate - best_err);
 
-	*multiplier = best_mul;
-	*divisor1 = best_div1;
-	*divisor2 = best_div2;
-
 	return 0;
 }
 
-- 
2.8.3
