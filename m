Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: pure.logic@nexus-software.ie
Subject: [PATCH 33/33] clk: change handling of round_rate() such that only zero is an error
Date: Sat, 30 Dec 2017 01:13:12 +0000
Message-Id: <1514596392-22270-34-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

Change the handling of clk_ops->round_rate() return values such that only
zero is treated as an error. All implementations of clk_ops->round_rate()
will have previously been updated to match this change.

Using zero as the determinant for an error means its possible to pass an
unsigned long as req->rate to a clk_ops->round_rate() function and return a
rounded clock which is as high as the original req->rate. This allows us on
32 bit systems to return rounded rates of (2^32)-1 Hz or ULONG_MAX Hz -
whereas without this change and the associated clk_ops->round_rate() change
the maximum value that can be returned via clk_ops->round_rate() is
LONG_MAX Hz - after which a higher-frequency clock looks like a negative
error code - due to sign extension.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/clk.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8a1860a..6af2ece 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -909,7 +909,6 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 				      struct clk_rate_request *req)
 {
 	struct clk_core *parent;
-	long rate;
 
 	lockdep_assert_held(&prepare_lock);
 
@@ -928,12 +927,8 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 	if (core->ops->determine_rate) {
 		return core->ops->determine_rate(core->hw, req);
 	} else if (core->ops->round_rate) {
-		rate = core->ops->round_rate(core->hw, req->rate,
+		req->rate = core->ops->round_rate(core->hw, req->rate,
 					     &req->best_parent_rate);
-		if (rate < 0)
-			return rate;
-
-		req->rate = rate;
 	} else if (core->flags & CLK_SET_RATE_PARENT) {
 		return clk_core_round_rate_nolock(parent, req);
 	} else {
@@ -1454,12 +1449,8 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 		new_rate = req.rate;
 		parent = req.best_parent_hw ? req.best_parent_hw->core : NULL;
 	} else if (core->ops->round_rate) {
-		ret = core->ops->round_rate(core->hw, rate,
-					    &best_parent_rate);
-		if (ret < 0)
-			return NULL;
-
-		new_rate = ret;
+		new_rate = core->ops->round_rate(core->hw, rate,
+						 &best_parent_rate);
 		if (new_rate < min_rate || new_rate > max_rate)
 			return NULL;
 	} else if (!parent || !(core->flags & CLK_SET_RATE_PARENT)) {
-- 
2.7.4
