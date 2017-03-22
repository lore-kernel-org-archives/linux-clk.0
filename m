Return-Path: <pdeschrijver@nvidia.com>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Alex Frid <afrid@nvidia.com>
Subject: [PATCH] clk: Add requested rate to clock summary output
Date: Wed, 22 Mar 2017 15:20:03 +0200
Message-ID: <1490188803-13034-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

From: Alex Frid <afrid@nvidia.com>

Added requested rate to clock summary output and to clock dump. This is
useful for clock tree debugging. Also expand the clock name field in the
clock tree debugfs output to provide room for deep multi-tier trees like
on Tegra.

Signed-off-by: Alex Frid <afrid@nvidia.com>
Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/clk.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0b815d1..3f6ae6d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2007,10 +2007,10 @@ static void clk_summary_show_one(struct seq_file *s, struct clk_core *c,
 	if (!c)
 		return;
 
-	seq_printf(s, "%*s%-*s %11d %12d %11lu %10lu %-3d\n",
+	seq_printf(s, "%*s%-*s %11d %12d %11lu %11lu %10lu %-3d\n",
 		   level * 3 + 1, "",
-		   30 - level * 3, c->name,
-		   c->enable_count, c->prepare_count, clk_core_get_rate(c),
+		   48 - level * 3, c->name, c->enable_count,
+		   c->prepare_count, clk_core_get_rate(c), c->req_rate,
 		   clk_core_get_accuracy(c), clk_core_get_phase(c));
 }
 
@@ -2033,8 +2033,8 @@ static int clk_summary_show(struct seq_file *s, void *data)
 	struct clk_core *c;
 	struct hlist_head **lists = (struct hlist_head **)s->private;
 
-	seq_puts(s, "   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase\n");
-	seq_puts(s, "----------------------------------------------------------------------------------------\n");
+	seq_puts(s, "   clock                                           enable_cnt  prepare_cnt        rate    req_rate   accuracy   phase\n");
+	seq_puts(s, "----------------------------------------------------------------------------------------------------------------------\n");
 
 	clk_prepare_lock();
 
@@ -2070,6 +2070,7 @@ static void clk_dump_one(struct seq_file *s, struct clk_core *c, int level)
 	seq_printf(s, "\"enable_count\": %d,", c->enable_count);
 	seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
 	seq_printf(s, "\"rate\": %lu,", clk_core_get_rate(c));
+	seq_printf(s, "\"req_rate\": %lu,", c->req_rate);
 	seq_printf(s, "\"accuracy\": %lu,", clk_core_get_accuracy(c));
 	seq_printf(s, "\"phase\": %d", clk_core_get_phase(c));
 }
-- 
1.9.1
