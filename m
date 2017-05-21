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
Subject: [PATCH v2 07/11] clk: rollback set_rate_range changes on failure
Date: Sun, 21 May 2017 23:59:54 +0200
Message-Id: <20170521215958.19743-8-jbrunet@baylibre.com>
In-Reply-To: <20170521215958.19743-1-jbrunet@baylibre.com>
References: <20170521215958.19743-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 33ec990b2e97..71b0480a152b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1864,6 +1864,7 @@ EXPORT_SYMBOL_GPL(clk_set_rate_protect);
 int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 {
 	int ret = 0;
+	unsigned int old_min, old_max;
 
 	if (!clk)
 		return 0;
@@ -1881,9 +1882,16 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 		clk_core_rate_unprotect(clk->core);
 
 	if (min != clk->min_rate || max != clk->max_rate) {
+		old_min = clk->min_rate;
+		old_max = clk->max_rate;
 		clk->min_rate = min;
 		clk->max_rate = max;
 		ret = clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
+		if (ret) {
+			/* undo changes */
+			clk->min_rate = old_min;
+			clk->max_rate = old_max;
+		}
 	}
 
 	if (clk->protect_count)
-- 
2.9.4
