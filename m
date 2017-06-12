Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 07/10] clk: rollback set_rate_range changes on failure
Date: Mon, 12 Jun 2017 21:44:35 +0200
Message-Id: <20170612194438.12298-8-jbrunet@baylibre.com>
In-Reply-To: <20170612194438.12298-1-jbrunet@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d91236e70a04..253f1d3f0971 100644
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
