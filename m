Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: sboyd@codeaurora.org,
	lee.jones@linaro.org,
	maxime.ripard@free-electrons.com,
	s.hauer@pengutronix.de,
	geert@linux-m68k.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH RFC RFT 1/3] clk: per-user clk prepare & enable ref counts
Date: Fri,  7 Aug 2015 12:09:28 -0700
Message-Id: <1438974570-20812-2-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This patch adds prepare and enable reference counts for the per-user
handles that clock consumers have for a clock node. This patch warns if
an imbalance occurs while trying to disable or unprepare a clock and
aborts, leaving the hardware unaffected.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/clk.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 898052e..72feee9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -84,6 +84,8 @@ struct clk {
 	unsigned long min_rate;
 	unsigned long max_rate;
 	struct hlist_node clks_node;
+	unsigned int enable_count;
+	unsigned int prepare_count;
 };
 
 /***           locking             ***/
@@ -600,6 +602,9 @@ void clk_unprepare(struct clk *clk)
 		return;
 
 	clk_prepare_lock();
+	if (WARN_ON(clk->prepare_count == 0))
+		return;
+	clk->prepare_count--;
 	clk_core_unprepare(clk->core);
 	clk_prepare_unlock();
 }
@@ -657,6 +662,7 @@ int clk_prepare(struct clk *clk)
 		return 0;
 
 	clk_prepare_lock();
+	clk->prepare_count++;
 	ret = clk_core_prepare(clk->core);
 	clk_prepare_unlock();
 
@@ -707,6 +713,9 @@ void clk_disable(struct clk *clk)
 		return;
 
 	flags = clk_enable_lock();
+	if (WARN_ON(clk->enable_count == 0))
+		return;
+	clk->enable_count--;
 	clk_core_disable(clk->core);
 	clk_enable_unlock(flags);
 }
@@ -769,6 +778,7 @@ int clk_enable(struct clk *clk)
 		return 0;
 
 	flags = clk_enable_lock();
+	clk->enable_count++;
 	ret = clk_core_enable(clk->core);
 	clk_enable_unlock(flags);
 
-- 
1.9.1
