Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 4/8] clk: Replace four seq_printf() calls by seq_putc()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Message-ID: <3f7979fe-3dc0-e6d1-b13b-ea3d990ecf91@users.sourceforge.net>
Date: Thu, 20 Apr 2017 10:27:29 +0200
MIME-Version: 1.0
In-Reply-To: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 08:45:43 +0200

Four single characters should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 67201f67a14a..4c72a10a9a33 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2081,11 +2081,11 @@ static void clk_dump_subtree(struct seq_file *s, struct clk_core *c, int level)
 	clk_dump_one(s, c, level);
 
 	hlist_for_each_entry(child, &c->children, child_node) {
-		seq_printf(s, ",");
+		seq_putc(s, ',');
 		clk_dump_subtree(s, child, level + 1);
 	}
 
-	seq_printf(s, "}");
+	seq_putc(s, '}');
 }
 
 static int clk_dump(struct seq_file *s, void *data)
@@ -2094,14 +2094,13 @@ static int clk_dump(struct seq_file *s, void *data)
 	bool first_node = true;
 	struct hlist_head **lists = (struct hlist_head **)s->private;
 
-	seq_printf(s, "{");
-
+	seq_putc(s, '{');
 	clk_prepare_lock();
 
 	for (; *lists; lists++) {
 		hlist_for_each_entry(c, *lists, child_node) {
 			if (!first_node)
-				seq_puts(s, ",");
+				seq_putc(s, ',');
 			first_node = false;
 			clk_dump_subtree(s, c, 0);
 		}
-- 
2.12.2
