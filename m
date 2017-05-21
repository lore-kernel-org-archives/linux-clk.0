Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 04/11] clk: use round rate to bail out early in set_rate
Date: Sun, 21 May 2017 23:59:51 +0200
Message-Id: <20170521215958.19743-5-jbrunet@baylibre.com>
In-Reply-To: <20170521215958.19743-1-jbrunet@baylibre.com>
References: <20170521215958.19743-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The current implementation of clk_core_set_rate_nolock bails out early if
the requested rate is exactly the same as the one set. It should bail out
if the request would not result in rate a change.  This important when rate
is not exactly what is requested, which is fairly common with PLLs.

Ex: provider able to give any rate with steps of 100Hz
 - 1st consumer request 48000Hz and gets it.
 - 2nd consumer request 48010Hz as well. If we were to perform the usual
   mechanism, we would get 48000Hz as well. The clock would not change so
   there is no point performing any checks to make sure the clock can
   change, we know it won't.

This is important to prepare the addition of the clock protection mechanism

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 100f72472e10..1a8c0d013238 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1570,15 +1570,34 @@ static void clk_change_rate(struct clk_core *core)
 		clk_change_rate(core->new_child);
 }
 
+static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
+						     unsigned long req_rate)
+{
+	int ret;
+	struct clk_rate_request req;
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
 
 	if (!core)
 		return 0;
 
+	rate = clk_core_req_round_rate_nolock(core, req_rate);
+
 	/* bail early if nothing to do */
 	if (rate == clk_core_get_rate_nolock(core))
 		return 0;
@@ -1587,7 +1606,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 		return -EBUSY;
 
 	/* calculate new rates and get the topmost changed clock */
-	top = clk_calc_new_rates(core, rate);
+	top = clk_calc_new_rates(core, req_rate);
 	if (!top)
 		return -EINVAL;
 
-- 
2.9.4
