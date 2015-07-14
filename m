Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:34473 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752328AbbGNPML (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 14 Jul 2015 11:12:11 -0400
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 1/6] clk: fractional-divider: fix sparse warnings
Date: Tue, 14 Jul 2015 18:11:58 +0300
Message-Id: <1436886723-111895-2-git-send-email-andriy.shevchenko@linux.intel.com>
In-Reply-To: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Sparse complains about possible imbalance in locking.

drivers/clk/clk-fractional-divider.c:37:9: warning: context imbalance in 'clk_fd_recalc_rate' - different lock contexts for basic block
drivers/clk/clk-fractional-divider.c:61:12: warning: context imbalance in 'clk_fd_set_rate' - different lock contexts for basic block

Let's rewrite code to fix this and make it more straight.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/clk-fractional-divider.c | 44 +++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index 140eb58..ba2fdc1 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -21,17 +21,18 @@ static unsigned long clk_fd_recalc_rate(struct clk_hw *hw,
 					unsigned long parent_rate)
 {
 	struct clk_fractional_divider *fd = to_clk_fd(hw);
-	unsigned long flags = 0;
-	u32 val, m, n;
+	unsigned long flags;
+	unsigned long m, n;
+	u32 val;
 	u64 ret;
 
-	if (fd->lock)
+	if (fd->lock) {
 		spin_lock_irqsave(fd->lock, flags);
-
-	val = clk_readl(fd->reg);
-
-	if (fd->lock)
+		val = clk_readl(fd->reg);
 		spin_unlock_irqrestore(fd->lock, flags);
+	} else {
+		val = clk_readl(fd->reg);
+	}
 
 	m = (val & fd->mmask) >> fd->mshift;
 	n = (val & fd->nmask) >> fd->nshift;
@@ -65,29 +66,36 @@ static long clk_fd_round_rate(struct clk_hw *hw, unsigned long rate,
 	return rate;
 }
 
+static void clk_fd_update(struct clk_fractional_divider *fd,
+			  unsigned long m, unsigned long n)
+{
+	u32 val;
+
+	val = clk_readl(fd->reg);
+	val &= ~(fd->mmask | fd->nmask);
+	val |= (m << fd->mshift) | (n << fd->nshift);
+	clk_writel(val, fd->reg);
+}
+
 static int clk_fd_set_rate(struct clk_hw *hw, unsigned long rate,
 			   unsigned long parent_rate)
 {
 	struct clk_fractional_divider *fd = to_clk_fd(hw);
-	unsigned long flags = 0;
+	unsigned long flags;
 	unsigned long div;
-	unsigned n, m;
-	u32 val;
+	unsigned long m, n;
 
 	div = gcd(parent_rate, rate);
 	m = rate / div;
 	n = parent_rate / div;
 
-	if (fd->lock)
+	if (fd->lock) {
 		spin_lock_irqsave(fd->lock, flags);
-
-	val = clk_readl(fd->reg);
-	val &= ~(fd->mmask | fd->nmask);
-	val |= (m << fd->mshift) | (n << fd->nshift);
-	clk_writel(val, fd->reg);
-
-	if (fd->lock)
+		clk_fd_update(fd, m, n);
 		spin_unlock_irqrestore(fd->lock, flags);
+	} else {
+		clk_fd_update(fd, m, n);
+	}
 
 	return 0;
 }
-- 
2.1.4

