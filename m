Return-Path: <Vladimir_Zapolskiy@mentor.com>
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>
Subject: [PATCH] clk: fix output format of debugfs/clk_dump
Date: Tue, 19 May 2015 18:42:10 +0300
Message-ID: <1432050130-12612-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The output format of $(cat /sys/kernel/debug/clk/clk_dump) was
compliant to JSON and Python dictionary type some time ago, but at the
moment a couple of commas are missing, fix it.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/clk/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 459ce9d..30be5fb 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -233,8 +233,8 @@ static void clk_dump_one(struct seq_file *s, struct clk_core *c, int level)
 	seq_printf(s, "\"%s\": { ", c->name);
 	seq_printf(s, "\"enable_count\": %d,", c->enable_count);
 	seq_printf(s, "\"prepare_count\": %d,", c->prepare_count);
-	seq_printf(s, "\"rate\": %lu", clk_core_get_rate(c));
-	seq_printf(s, "\"accuracy\": %lu", clk_core_get_accuracy(c));
+	seq_printf(s, "\"rate\": %lu,", clk_core_get_rate(c));
+	seq_printf(s, "\"accuracy\": %lu,", clk_core_get_accuracy(c));
 	seq_printf(s, "\"phase\": %d", clk_core_get_phase(c));
 }
 
-- 
2.1.4
