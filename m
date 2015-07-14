Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 2/6] clk: fractional-divider: rename prate -> parent_rate
Date: Tue, 14 Jul 2015 18:11:59 +0300
Message-Id: <1436886723-111895-3-git-send-email-andriy.shevchenko@linux.intel.com>
In-Reply-To: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Rename function parameter to be more explicit what it is for. This also makes
it in align with struct clk_ops.

There is no functional change.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/clk-fractional-divider.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index ba2fdc1..7cfcc56 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -47,18 +47,18 @@ static unsigned long clk_fd_recalc_rate(struct clk_hw *hw,
 }
 
 static long clk_fd_round_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *prate)
+			      unsigned long *parent_rate)
 {
 	struct clk_fractional_divider *fd = to_clk_fd(hw);
 	unsigned maxn = (fd->nmask >> fd->nshift) + 1;
 	unsigned div;
 
-	if (!rate || rate >= *prate)
-		return *prate;
+	if (!rate || rate >= *parent_rate)
+		return *parent_rate;
 
-	div = gcd(*prate, rate);
+	div = gcd(*parent_rate, rate);
 
-	while ((*prate / div) > maxn) {
+	while ((*parent_rate / div) > maxn) {
 		div <<= 1;
 		rate <<= 1;
 	}
-- 
2.1.4

