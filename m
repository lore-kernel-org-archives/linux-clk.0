Return-Path: <v1ron@mail.ru>
From: Roman Volkov <v1ron@mail.ru>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Roman Volkov <rvolkov@v1ros.org>,
	Tony Prisk <linux@prisktech.co.nz>
Subject: [PATCH 2/2] clk/vt8500: Fix compilation warnings
Date: Tue, 24 May 2016 23:07:53 +0300
Message-Id: <1464120473-1808-3-git-send-email-v1ron@mail.ru>
In-Reply-To: <1464120473-1808-1-git-send-email-v1ron@mail.ru>
References: <1464120473-1808-1-git-send-email-v1ron@mail.ru>
List-ID: <linux-clk.vger.kernel.org>

From: Roman Volkov <rvolkov@v1ros.org>

GCC 5.3.0 still throws the following warnings for functions
wm8750_find_pll_bits() and wm8850_find_pll_bits():

warning: 'best_div2' may be used uninitialized in this function
warning: 'best_div1' may be used uninitialized in this function
warning: 'best_mul' may be used uninitialized in this function

These warnings are false positives, the variables are controlled
by checking the value of the variable 'best_err' which is -1 by
default. It is safe to initialize all these variables to zero.

Fixes: 090341b0a95d ("clk: vt8500: fix sign of possible PLL values")
Signed-off-by: Roman Volkov <rvolkov@v1ros.org>
---
 drivers/clk/clk-vt8500.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-vt8500.c b/drivers/clk/clk-vt8500.c
index 77650f19a9b6..7c970d7c0a6a 100644
--- a/drivers/clk/clk-vt8500.c
+++ b/drivers/clk/clk-vt8500.c
@@ -461,7 +461,7 @@ static int wm8750_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 {
 	u32 mul;
 	int div1, div2;
-	u32 best_mul, best_div1, best_div2;
+	u32 best_mul = 0, best_div1 = 0, best_div2 = 0;
 	unsigned long tclk, rate_err, best_err;
 
 	best_err = (unsigned long)-1;
@@ -513,7 +513,7 @@ static int wm8850_find_pll_bits(unsigned long rate, unsigned long parent_rate,
 {
 	u32 mul;
 	int div1, div2;
-	u32 best_mul, best_div1, best_div2;
+	u32 best_mul = 0, best_div1 = 0, best_div2 = 0;
 	unsigned long tclk, rate_err, best_err;
 
 	best_err = (unsigned long)-1;
-- 
2.8.0
