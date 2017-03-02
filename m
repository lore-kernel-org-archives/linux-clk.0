Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC 1/2] clk: fix CLK_SET_RATE_GATE on parent clocks
Date: Thu,  2 Mar 2017 18:38:34 +0100
Message-Id: <20170302173835.18313-2-jbrunet@baylibre.com>
In-Reply-To: <20170302173835.18313-1-jbrunet@baylibre.com>
References: <20170302173835.18313-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

CLK_SET_RATE_GATE flag will only prevent a consumer from directly changing
the rate on the clock (if the clock is the leaf when calling clk_set_rate).
However the clock rate can be changed without being gated if it is a parent
of the leaf. In addition, other child clocks depending on the rate of
parent clock might not appreciate.

To address this issue, if the clock is busy, this patch stops the tree walk
while calculating the new rates, and return the current rate as if it was
fixed clock.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 56 +++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0fb39fe217d1..6fe2ea81a9af 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -172,6 +172,14 @@ static bool clk_core_is_enabled(struct clk_core *core)
 	return core->ops->is_enabled(core->hw);
 }
 
+static bool clk_core_rate_can_change(struct clk_core *core)
+{
+	if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
+		return false;
+
+	return true;
+}
+
 /***    helper functions   ***/
 
 const char *__clk_get_name(const struct clk *clk)
@@ -833,11 +841,32 @@ static int clk_disable_unused(void)
 }
 late_initcall_sync(clk_disable_unused);
 
+static int clk_core_round_rate_query(struct clk_core *core,
+				     struct clk_rate_request *req)
+{
+	long rate;
+
+	if (!clk_core_rate_can_change(core)) {
+		req->rate = core->rate;
+	} else if (core->ops->determine_rate) {
+		return core->ops->determine_rate(core->hw, req);
+	} else if (core->ops->round_rate) {
+		rate = core->ops->round_rate(core->hw, req->rate,
+					     &req->best_parent_rate);
+		if (rate < 0)
+			return rate;
+
+		req->rate = rate;
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
 static int clk_core_round_rate_nolock(struct clk_core *core,
 				      struct clk_rate_request *req)
 {
 	struct clk_core *parent;
-	long rate;
 
 	lockdep_assert_held(&prepare_lock);
 
@@ -853,15 +882,8 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 		req->best_parent_rate = 0;
 	}
 
-	if (core->ops->determine_rate) {
-		return core->ops->determine_rate(core->hw, req);
-	} else if (core->ops->round_rate) {
-		rate = core->ops->round_rate(core->hw, req->rate,
-					     &req->best_parent_rate);
-		if (rate < 0)
-			return rate;
-
-		req->rate = rate;
+	if (core->ops->determine_rate || core->ops->round_rate) {
+		return clk_core_round_rate_query(core, req);
 	} else if (core->flags & CLK_SET_RATE_PARENT) {
 		return clk_core_round_rate_nolock(parent, req);
 	} else {
@@ -1353,8 +1375,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 
 	clk_core_get_boundaries(core, &min_rate, &max_rate);
 
-	/* find the closest rate and parent clk/rate */
-	if (core->ops->determine_rate) {
+	if (core->ops->determine_rate || core->ops->round_rate) {
 		struct clk_rate_request req;
 
 		req.rate = rate;
@@ -1368,22 +1389,17 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 			req.best_parent_rate = 0;
 		}
 
-		ret = core->ops->determine_rate(core->hw, &req);
+		ret = clk_core_round_rate_query(core, &req);
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
+
 	} else if (!parent || !(core->flags & CLK_SET_RATE_PARENT)) {
 		/* pass-through clock without adjustable parent */
 		core->new_rate = core->rate;
@@ -1571,7 +1587,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	if (rate == clk_core_get_rate_nolock(core))
 		return 0;
 
-	if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
+	if (!clk_core_rate_can_change(core))
 		return -EBUSY;
 
 	/* calculate new rates and get the topmost changed clock */
-- 
2.9.3
