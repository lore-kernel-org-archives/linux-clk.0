Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [RFC 5/7] clk: rollback set_rate_range changes on failure
Date: Tue, 21 Mar 2017 19:33:28 +0100
Message-Id: <20170321183330.26722-6-jbrunet@baylibre.com>
In-Reply-To: <20170321183330.26722-1-jbrunet@baylibre.com>
References: <20170321183330.26722-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 69db8cc15063..50798ef618d1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1759,6 +1759,7 @@ EXPORT_SYMBOL_GPL(clk_set_rate);
 int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 {
 	int ret = 0;
+	unsigned int old_min, old_max;
 
 	if (!clk)
 		return 0;
@@ -1776,9 +1777,16 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 		clk_core_unprotect(clk->core);
 
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
 
 	if (clk->protect_ucount)
-- 
2.9.3
