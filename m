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
Subject: [PATCH v5 07/10] clk: cosmetic changes to clk_summary debugfs entry
Date: Fri,  1 Dec 2017 22:51:57 +0100
Message-Id: <20171201215200.23523-8-jbrunet@baylibre.com>
In-Reply-To: <20171201215200.23523-1-jbrunet@baylibre.com>
References: <20171201215200.23523-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

clk_summary debugfs entry was already well over the traditional 80
characters per line limit but it grew even larger with the addition of
clock protection.

   clock                         enable_cnt  prepare_cnt  protect_cnt        rate   accuracy   phase
----------------------------------------------------------------------------------------------------
 wifi32k                                  1            1            0       32768          0 0
 vcpu                                     0            0            0  2016000000          0 0
 xtal                                     5            5            0    24000000          0 0

This patch reduce the width a bit:
                                 enable  prepare  protect
   clock                          count    count    count        rate   accuracy   phase
----------------------------------------------------------------------------------------
 wifi32k                              1        1        0       32768          0 0
 vcpu                                 0        0        0  2016000000          0 0
 xtal                                 5        5        0    24000000          0 0

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f69a2176cde1..f6fe5e5595ca 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2241,7 +2241,7 @@ static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
 	if (!c)
 		return;
 
-	seq_printf(s, "%*s%-*s %11d %12d %12d %11lu %10lu %-3d\n",
+	seq_printf(s, "%*s%-*s %7d %8d %8d %11lu %10lu %-3d\n",
 		   level * 3 + 1, "",
 		   30 - level * 3, c->name,
 		   c->enable_count, c->prepare_count, c->protect_count,
@@ -2268,8 +2268,9 @@ static int clk_summary_show(struct seq_file *s, void *data)
 	struct clk_core *c;
 	struct hlist_head **lists = (struct hlist_head **)s->private;
 
-	seq_puts(s, "   clock                         enable_cnt  prepare_cnt  protect_cnt        rate   accuracy   phase\n");
-	seq_puts(s, "----------------------------------------------------------------------------------------------------\n");
+	seq_puts(s, "                                 enable  prepare  protect                               \n");
+	seq_puts(s, "   clock                          count    count    count        rate   accuracy   phase\n");
+	seq_puts(s, "----------------------------------------------------------------------------------------\n");
 
 	clk_prepare_lock();
 
-- 
2.14.3
