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
Subject: [PATCH v5 05/10] clk: use round rate to bail out early in set_rate
Date: Fri,  1 Dec 2017 22:51:55 +0100
Message-Id: <20171201215200.23523-6-jbrunet@baylibre.com>
In-Reply-To: <20171201215200.23523-1-jbrunet@baylibre.com>
References: <20171201215200.23523-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The current implementation of clk_core_set_rate_nolock() bails out early
if the requested rate is exactly the same as the one set. It should bail
out if the request would not result in a rate a change. This is important
when the rate is not exactly what is requested, which is fairly common
with PLLs.

Ex: provider able to give any rate with steps of 100Hz
 - 1st consumer request 48000Hz and gets it.
 - 2nd consumer request 48010Hz as well. If we were to perform the usual
   mechanism, we would get 48000Hz as well. The clock would not change so
   there is no point performing any checks to make sure the clock can
   change, we know it won't.

This is important to prepare the addition of the clock protection
mechanism

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 322d9ba7e5cd..bbe90babdae4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1658,16 +1658,37 @@ static void clk_change_rate(struct clk_core *core)
 		clk_change_rate(core->new_child);
 }
 
+static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
+						     unsigned long req_rate)
+{
+	int ret;
+	struct clk_rate_request req;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return 0;
+
+	clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
+	req.rate = req_rate;
+
+	ret = clk_core_round_rate_nolock(core, &req);
+
+	return ret ? 0 : req.rate;
+}
+
 static int clk_core_set_rate_nolock(struct clk_core *core,
 				    unsigned long req_rate)
 {
 	struct clk_core *top, *fail_clk;
-	unsigned long rate = req_rate;
+	unsigned long rate;
 	int ret = 0;
 
 	if (!core)
 		return 0;
 
+	rate = clk_core_req_round_rate_nolock(core, req_rate);
+
 	/* bail early if nothing to do */
 	if (rate == clk_core_get_rate_nolock(core))
 		return 0;
@@ -1676,7 +1697,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 		return -EBUSY;
 
 	/* calculate new rates and get the topmost changed clock */
-	top = clk_calc_new_rates(core, rate);
+	top = clk_calc_new_rates(core, req_rate);
 	if (!top)
 		return -EINVAL;
 
-- 
2.14.3
