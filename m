Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: fix determine rate error with pass-through clock
Date: Mon, 22 Jan 2018 11:57:59 +0100
Message-Id: <20180122105759.12206-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

If we try to determine the rate of a pass-through clock (a clock which
does not implement .round_rate() nor .determine_rate()),
clk_core_round_rate_nolock() will directly forward the call to the
parent clock. In the particular case where the pass-through actually
does not have a parent, clk_core_round_rate_nolock() will directly
return 0 with the requested rate still set to the initial request
structure. This is interpreted as if the rate could be exactly achieved
while it actually cannot be adjusted.

This become a real problem when this particular pass-through clock is
the parent of a mux with the flag CLK_SET_RATE_PARENT set. The
pass-through clock will always report an exact match, get picked and
finally error when the rate is actually getting set.

This is fixed by setting the rate inside the req to 0 when core is NULL
in clk_core_round_rate_nolock() (same as in __clk_determine_rate() when
hw is NULL)

Fixes: 0f6cc2b8e94d ("clk: rework calls to round and determine rate callbacks")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e24968fa31db..c43d99284290 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1116,8 +1116,10 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 {
 	lockdep_assert_held(&prepare_lock);
 
-	if (!core)
+	if (!core) {
+		req->rate = 0;
 		return 0;
+	}
 
 	clk_core_init_rate_req(core, req);
 
-- 
2.14.3
