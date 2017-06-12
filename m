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
Subject: [PATCH v3 08/10] clk: cosmetic changes to clk_summary debugfs entry
Date: Mon, 12 Jun 2017 21:44:36 +0200
Message-Id: <20170612194438.12298-9-jbrunet@baylibre.com>
In-Reply-To: <20170612194438.12298-1-jbrunet@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

clk_summary debugfs entry was already well over the traditional 80
characters per line limit but it grew even larger with the addition of
clock protection.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 253f1d3f0971..8d57e130c4e0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2262,7 +2262,7 @@ static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
 	if (!c)
 		return;
 
-	seq_printf(s, "%*s%-*s %11d %12d %12d %11lu %10lu %-3d\n",
+	seq_printf(s, "%*s%-*s %7d %8d %8d %11lu %10lu %-3d\n",
 		   level * 3 + 1, "",
 		   30 - level * 3, c->name,
 		   c->enable_count, c->prepare_count, c->protect_count,
@@ -2289,8 +2289,9 @@ static int clk_summary_show(struct seq_file *s, void *data)
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
