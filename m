Return-Path: <a.hajda@samsung.com>
From: Andrzej Hajda <a.hajda@samsung.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: [PATCH v2 14/38] clk: vt8500: fix sign of possible PLL values
Date: Fri, 02 Oct 2015 06:49:53 +0200
Message-id: <1443761393-29366-1-git-send-email-a.hajda@samsung.com>
In-reply-to: <20151001225628.GU19319@codeaurora.org>
References: <20151001225628.GU19319@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

With unsigned values underflow in loops can occur resulting in
theoretically infinite loops.

The problem has been detected using proposed semantic patch
scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci [1].

[1]: http://permalink.gmane.org/gmane.linux.kernel/2038576

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi Stephen,

This is modified version according to your request, ie only problematic
variables have changed type.
I still think that 1st version is better, but of course it is up to you.

Regards
Andrzej

 drivers/clk/clk-vt8500.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-vt8500.c b/drivers/clk/clk-vt8500.c
index 37e9288..98c4492 100644
--- a/drivers/clk/clk-vt8500.c
+++ b/drivers/clk/clk-vt8500.c
@@ -384,7 +384,8 @@ static void vt8500_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 static void wm8650_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 				u32 *multiplier, u32 *divisor1, u32 *divisor2)
 {
-	u32 mul, div1, div2;
+	u32 mul, div1;
+	int div2;
 	u32 best_mul, best_div1, best_div2;
 	unsigned long tclk, rate_err, best_err;
 
@@ -452,7 +453,8 @@ static u32 wm8750_get_filter(u32 parent_rate, u32 divisor1)
 static void wm8750_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 				u32 *filter, u32 *multiplier, u32 *divisor1, u32 *divisor2)
 {
-	u32 mul, div1, div2;
+	u32 mul;
+	int div1, div2;
 	u32 best_mul, best_div1, best_div2;
 	unsigned long tclk, rate_err, best_err;
 
@@ -496,7 +498,8 @@ static void wm8750_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 static void wm8850_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 				u32 *multiplier, u32 *divisor1, u32 *divisor2)
 {
-	u32 mul, div1, div2;
+	u32 mul;
+	int div1, div2;
 	u32 best_mul, best_div1, best_div2;
 	unsigned long tclk, rate_err, best_err;
 
-- 
1.9.1
