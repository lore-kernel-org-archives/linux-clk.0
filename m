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
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v4 04/10] clk: rework calls to round and determine rate callbacks
Date: Sun, 24 Sep 2017 22:00:24 +0200
Message-Id: <20170924200030.6227-5-jbrunet@baylibre.com>
In-Reply-To: <20170924200030.6227-1-jbrunet@baylibre.com>
References: <20170924200030.6227-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Rework the way the callbacks round_rate() and determine_rate() are called.
The goal is to do this at a single point and make it easier to add
conditions before calling them.

Because of this factorization, rate returned by determine_rate() is also
checked against the min and max rate values

This rework is done to ease the integration of "protected" clock
functionality.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 82 +++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0913688dacb0..0905139a1893 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -833,10 +833,9 @@ static int clk_disable_unused(void)
 }
 late_initcall_sync(clk_disable_unused);
 
-static int clk_core_round_rate_nolock(struct clk_core *core,
-				      struct clk_rate_request *req)
+static int clk_core_determine_round_nolock(struct clk_core *core,
+					   struct clk_rate_request *req)
 {
-	struct clk_core *parent;
 	long rate;
 
 	lockdep_assert_held(&prepare_lock);
@@ -844,15 +843,6 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 	if (!core)
 		return 0;
 
-	parent = core->parent;
-	if (parent) {
-		req->best_parent_hw = parent->hw;
-		req->best_parent_rate = parent->rate;
-	} else {
-		req->best_parent_hw = NULL;
-		req->best_parent_rate = 0;
-	}
-
 	if (core->ops->determine_rate) {
 		return core->ops->determine_rate(core->hw, req);
 	} else if (core->ops->round_rate) {
@@ -862,15 +852,58 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 			return rate;
 
 		req->rate = rate;
-	} else if (core->flags & CLK_SET_RATE_PARENT) {
-		return clk_core_round_rate_nolock(parent, req);
 	} else {
-		req->rate = core->rate;
+		return -EINVAL;
 	}
 
 	return 0;
 }
 
+static void clk_core_init_rate_req(struct clk_core * const core,
+				   struct clk_rate_request *req)
+{
+	struct clk_core *parent;
+
+	if (WARN_ON(!core || !req))
+		return;
+
+	parent = core->parent;
+	if (parent) {
+		req->best_parent_hw = parent->hw;
+		req->best_parent_rate = parent->rate;
+	} else {
+		req->best_parent_hw = NULL;
+		req->best_parent_rate = 0;
+	}
+}
+
+static bool clk_core_can_round(struct clk_core * const core)
+{
+	if (core->ops->determine_rate || core->ops->round_rate)
+		return true;
+
+	return false;
+}
+
+static int clk_core_round_rate_nolock(struct clk_core *core,
+				      struct clk_rate_request *req)
+{
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return 0;
+
+	clk_core_init_rate_req(core, req);
+
+	if (clk_core_can_round(core))
+		return clk_core_determine_round_nolock(core, req);
+	else if (core->flags & CLK_SET_RATE_PARENT)
+		return clk_core_round_rate_nolock(core->parent, req);
+
+	req->rate = core->rate;
+	return 0;
+}
+
 /**
  * __clk_determine_rate - get the closest rate actually supported by a clock
  * @hw: determine the rate of this clock
@@ -1356,34 +1389,23 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 	clk_core_get_boundaries(core, &min_rate, &max_rate);
 
 	/* find the closest rate and parent clk/rate */
-	if (core->ops->determine_rate) {
+	if (clk_core_can_round(core)) {
 		struct clk_rate_request req;
 
 		req.rate = rate;
 		req.min_rate = min_rate;
 		req.max_rate = max_rate;
-		if (parent) {
-			req.best_parent_hw = parent->hw;
-			req.best_parent_rate = parent->rate;
-		} else {
-			req.best_parent_hw = NULL;
-			req.best_parent_rate = 0;
-		}
 
-		ret = core->ops->determine_rate(core->hw, &req);
+		clk_core_init_rate_req(core, &req);
+
+		ret = clk_core_determine_round_nolock(core, &req);
 		if (ret < 0)
 			return NULL;
 
 		best_parent_rate = req.best_parent_rate;
 		new_rate = req.rate;
 		parent = req.best_parent_hw ? req.best_parent_hw->core : NULL;
-	} else if (core->ops->round_rate) {
-		ret = core->ops->round_rate(core->hw, rate,
-					    &best_parent_rate);
-		if (ret < 0)
-			return NULL;
 
-		new_rate = ret;
 		if (new_rate < min_rate || new_rate > max_rate)
 			return NULL;
 	} else if (!parent || !(core->flags & CLK_SET_RATE_PARENT)) {
-- 
2.13.5
