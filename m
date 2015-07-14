Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 5/6] clk: fractional-divider: switch to rational best approximation
Date: Tue, 14 Jul 2015 18:12:02 +0300
Message-Id: <1436886723-111895-6-git-send-email-andriy.shevchenko@linux.intel.com>
In-Reply-To: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch converts the code to use rational best approximation algorithm which
is much more precise.

Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/Kconfig                  |  1 +
 drivers/clk/clk-fractional-divider.c | 36 +++++++++++++++++++++++-------------
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 42f7120..bd9f312 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -14,6 +14,7 @@ config COMMON_CLK
 	select HAVE_CLK_PREPARE
 	select CLKDEV_LOOKUP
 	select SRCU
+	select RATIONAL
 	---help---
 	  The common clock framework is a single definition of struct
 	  clk, useful across many platforms, as well as an
diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index 16f42ae..9dbe337 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -7,13 +7,14 @@
  *
  * Adjustable fractional divider clock implementation.
  * Output rate = (m / n) * parent_rate.
+ * Uses rational best approximation algorithm.
  */
 
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/slab.h>
-#include <linux/gcd.h>
+#include <linux/rational.h>
 
 #define to_clk_fd(_hw) container_of(_hw, struct clk_fractional_divider, hw)
 
@@ -50,20 +51,30 @@ static long clk_fd_round_rate(struct clk_hw *hw, unsigned long rate,
 			      unsigned long *parent_rate)
 {
 	struct clk_fractional_divider *fd = to_clk_fd(hw);
-	unsigned maxn = (fd->nmask >> fd->nshift) + 1;
-	unsigned div;
+	unsigned long scale;
+	unsigned long m, n;
+	u64 ret;
 
 	if (!rate || rate >= *parent_rate)
 		return *parent_rate;
 
-	div = gcd(*parent_rate, rate);
+	/*
+	 * Get rate closer to *parent_rate to guarantee there is no overflow
+	 * for m and n. In the result it will be the nearest rate left shifted
+	 * by (scale - fd->nwidth) bits.
+	 */
+	scale = fls_long(*parent_rate / rate - 1);
+	if (scale > fd->nwidth)
+		rate <<= scale - fd->nwidth;
 
-	while ((*parent_rate / div) > maxn) {
-		div <<= 1;
-		rate <<= 1;
-	}
+	rational_best_approximation(rate, *parent_rate,
+			GENMASK(fd->mwidth - 1, 0), GENMASK(fd->nwidth - 1, 0),
+			&m, &n);
 
-	return rate;
+	ret = (u64)*parent_rate * m;
+	do_div(ret, n);
+
+	return ret;
 }
 
 static void clk_fd_update(struct clk_fractional_divider *fd,
@@ -82,12 +93,11 @@ static int clk_fd_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_fractional_divider *fd = to_clk_fd(hw);
 	unsigned long flags;
-	unsigned long div;
 	unsigned long m, n;
 
-	div = gcd(parent_rate, rate);
-	m = rate / div;
-	n = parent_rate / div;
+	rational_best_approximation(rate, parent_rate,
+			GENMASK(fd->mwidth - 1, 0), GENMASK(fd->nwidth - 1, 0),
+			&m, &n);
 
 	if (fd->lock) {
 		spin_lock_irqsave(fd->lock, flags);
-- 
2.1.4

