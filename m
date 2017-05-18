Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 07/10] clk: cosmetic changes to clk_summary debugfs entry
Date: Thu, 18 May 2017 18:38:01 +0200
Message-Id: <20170518163804.14123-8-jbrunet@baylibre.com>
In-Reply-To: <20170518163804.14123-1-jbrunet@baylibre.com>
References: <20170518163804.14123-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

clk_summary debugfs entry was already well over the traditional 80
characters per line limit but it grew even larger with the addition of
clock protection.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d61218d1f41e..e60d86d7c082 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2234,7 +2234,7 @@ static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
 	if (!c)
 		return;
 
-	seq_printf(s, "%*s%-*s %11d %12d %12d %11lu %10lu %-3d\n",
+	seq_printf(s, "%*s%-*s %7d %8d %8d %11lu %10lu %-3d\n",
 		   level * 3 + 1, "",
 		   30 - level * 3, c->name,
 		   c->enable_count, c->prepare_count, c->protect_count,
@@ -2261,8 +2261,9 @@ static int clk_summary_show(struct seq_file *s, void *data)
 	struct clk_core *c;
 	struct hlist_head **lists = (struct hlist_head **)s->private;
 
-	seq_puts(s, "   clock                         enable_cnt  prepare_cnt  protect_cnt        rate   accuracy   phase\n");
-	seq_puts(s, "----------------------------------------------------------------------------------------------------\n");
+	seq_puts(s, "                                 enable  prepare  protect                               \n");
+	seq_puts(s, "   clock                          count    count    count        rate   accuracy   phase\n");
+	seq_puts(s, "----------------------------------------------------------------------------------------\n");
 
 	clk_prepare_lock();
 
-- 
2.9.4
