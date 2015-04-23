Return-Path: <stefan.wahren@i2se.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] clk: Fix JSON output in debugfs
Date: Thu, 23 Apr 2015 20:29:02 +0000
Message-Id: <1429820942-32332-1-git-send-email-stefan.wahren@i2se.com>
List-ID: <linux-clk.vger.kernel.org>

Key/value pairs in a JSON object must be separated by a comma.
After adding the properties "accuracy" and "phase" the JSON output
of /sys/kernel/debug/clk/clk_dump is invalid.

So add the missing commas to fix it.

Fixes: 5279fc4 ("clk: add clk accuracy retrieval support")
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/clk/clk.c |    4 ++--
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
1.7.9.5
