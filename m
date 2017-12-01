Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v5 10/10] clk: fix set_rate_range when current rate is out of range
Date: Fri,  1 Dec 2017 22:52:00 +0100
Message-Id: <20171201215200.23523-11-jbrunet@baylibre.com>
In-Reply-To: <20171201215200.23523-1-jbrunet@baylibre.com>
References: <20171201215200.23523-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Calling clk_core_set_rate() with core->req_rate is basically a no-op
because of the early bail-out mechanism.

This may leave the clock in inconsistent state if the rate is out the
requested range. Calling clk_core_set_rate() with the closest rate
limit could solve the problem but:
- The underlying determine_rate() callback needs to account for this
  corner case (rounding within the range, if possible)
- if only round_rate() is available, we rely on luck unfortunately.

Fixes: 1c8e600440c7 ("clk: Add rate constraints to clocks")
Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index edd965d8f41d..369933831705 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2010,6 +2010,7 @@ EXPORT_SYMBOL_GPL(clk_set_rate_exclusive);
 int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 {
 	int ret = 0;
+	unsigned long old_min, old_max, rate;
 
 	if (!clk)
 		return 0;
@@ -2026,10 +2027,38 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 	if (clk->exclusive_count)
 		clk_core_rate_unprotect(clk->core);
 
-	if (min != clk->min_rate || max != clk->max_rate) {
-		clk->min_rate = min;
-		clk->max_rate = max;
-		ret = clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
+	/* Save the current values in case we need to rollback the change */
+	old_min = clk->min_rate;
+	old_max = clk->max_rate;
+	clk->min_rate = min;
+	clk->max_rate = max;
+
+	rate = clk_core_get_rate_nolock(clk->core);
+	if (rate < min || rate > max) {
+		/*
+		 * FIXME:
+		 * We are in bit of trouble here, current rate is outside the
+		 * the requested range. We are going try to request appropriate
+		 * range boundary but there is a catch. It may fail for the
+		 * usual reason (clock broken, clock protected, etc) but also
+		 * because:
+		 * - round_rate() was not favorable and fell on the wrong
+		 *   side of the boundary
+		 * - the determine_rate() callback does not really check for
+		 *   this corner case when determining the rate
+		 */
+
+		if (rate < min)
+			rate = min;
+		else
+			rate = max;
+
+		ret = clk_core_set_rate_nolock(clk->core, rate);
+		if (ret) {
+			/* rollback the changes */
+			clk->min_rate = old_min;
+			clk->max_rate = old_max;
+		}
 	}
 
 	if (clk->exclusive_count)
-- 
2.14.3
