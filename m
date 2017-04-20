Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: [PATCH 5/8] clk: Combine two seq_puts() calls into one call in
 clk_summary_show()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Message-ID: <2e58deaf-4279-df4e-5678-df459791708c@users.sourceforge.net>
Date: Thu, 20 Apr 2017 10:28:42 +0200
MIME-Version: 1.0
In-Reply-To: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 09:12:35 +0200

Some text was put into a sequence by two separate function calls.
Print the same data by a single function call instead.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 4c72a10a9a33..684642ab4212 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2030,9 +2030,9 @@ static int clk_summary_show(struct seq_file *s, void *data)
 	struct clk_core *c;
 	struct hlist_head **lists = (struct hlist_head **)s->private;
 
-	seq_puts(s, "   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase\n");
-	seq_puts(s, "----------------------------------------------------------------------------------------\n");
-
+	seq_puts(s,
+		 "   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase\n"
+		 "----------------------------------------------------------------------------------------\n");
 	clk_prepare_lock();
 
 	for (; *lists; lists++)
-- 
2.12.2
