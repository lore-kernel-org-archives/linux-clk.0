Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	zhengxing@rock-chips.com,
	zhangqing@rock-chips.com,
	tomeu.vizoso@collabora.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [RFC PATCH 1/3] clk: fix inconsistent use of req_rate
Date: Mon,  2 May 2016 18:36:20 +0200
Message-Id: <1462206982-10444-2-git-send-email-heiko@sntech.de>
In-Reply-To: <1462206982-10444-1-git-send-email-heiko@sntech.de>
References: <1462206982-10444-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

The req_rate property seems to be made to hold the rate requested through
clk_set_rate. Currently it gets initialized in clk_init to the clocks
current rate and then adapted in clk_set_rate calls. Orphan clocks and
their children get initialized to a rate of 0 and req_rate never gets
re-set when these lose their orphan-status.

Initializing req_rate to the clocks rate also is unintuitive as it just
copies the value that is already in the rate property and also looses the
information if a component actually requested a specific rate.

So separate the requested rate and only set it in clk_core_set_rate_nolock
when a real rate gets requested. The users of the req_rate __clk_put and
clk_set_rate_range that adjust a clock based on that value use req_rate
at first and fall back to rate if no rate had been requested now.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/clk.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f079ea4..65e0aad 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1507,8 +1507,10 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 		return 0;
 
 	/* bail early if nothing to do */
-	if (rate == clk_core_get_rate_nolock(core))
+	if (rate == clk_core_get_rate_nolock(core)) {
+		core->req_rate = req_rate;
 		return 0;
+	}
 
 	if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
 		return -EBUSY;
@@ -1599,9 +1601,14 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 	clk_prepare_lock();
 
 	if (min != clk->min_rate || max != clk->max_rate) {
+		unsigned long rate = clk->core->req_rate;
+
+		if (!rate)
+			rate = clk->core->rate;
+
 		clk->min_rate = min;
 		clk->max_rate = max;
-		ret = clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
+		ret = clk_core_set_rate_nolock(clk->core, rate);
 	}
 
 	clk_prepare_unlock();
@@ -2379,7 +2386,7 @@ static int __clk_core_init(struct clk_core *core)
 		rate = core->parent->rate;
 	else
 		rate = 0;
-	core->rate = core->req_rate = rate;
+	core->rate = rate;
 
 	/*
 	 * walk the list of orphan clocks and reparent any that newly finds a
@@ -2809,6 +2816,7 @@ int __clk_get(struct clk *clk)
 
 void __clk_put(struct clk *clk)
 {
+	unsigned long rate;
 	struct module *owner;
 
 	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
@@ -2817,9 +2825,13 @@ void __clk_put(struct clk *clk)
 	clk_prepare_lock();
 
 	hlist_del(&clk->clks_node);
-	if (clk->min_rate > clk->core->req_rate ||
-	    clk->max_rate < clk->core->req_rate)
-		clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
+
+	rate = clk->core->req_rate;
+	if (!rate)
+		rate = clk->core->rate;
+
+	if (clk->min_rate > rate || clk->max_rate < rate)
+		clk_core_set_rate_nolock(clk->core, rate);
 
 	owner = clk->core->owner;
 	kref_put(&clk->core->ref, __clk_release);
-- 
2.8.0.rc3
