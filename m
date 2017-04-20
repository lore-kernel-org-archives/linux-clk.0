Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 7/8] clk: nomadik: Use seq_puts() in nomadik_src_clk_show()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Message-ID: <d3be1f2b-f3c4-0d1b-4fa0-84589bfc3f70@users.sourceforge.net>
Date: Thu, 20 Apr 2017 10:30:46 +0200
MIME-Version: 1.0
In-Reply-To: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 09:45:04 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-nomadik.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-nomadik.c b/drivers/clk/clk-nomadik.c
index 71677eb12565..8d57ab8d6ed8 100644
--- a/drivers/clk/clk-nomadik.c
+++ b/drivers/clk/clk-nomadik.c
@@ -467,7 +467,7 @@ static int nomadik_src_clk_show(struct seq_file *s, void *what)
 	u32 src_pckensr0 = readl(src_base + SRC_PCKENSR0);
 	u32 src_pckensr1 = readl(src_base + SRC_PCKENSR1);
 
-	seq_printf(s, "Clock:      Boot:   Now:    Request: ASKED:\n");
+	seq_puts(s, "Clock:      Boot:   Now:    Request: ASKED:\n");
 	for (i = 0; i < ARRAY_SIZE(src_clk_names); i++) {
 		u32 pcksrb = (i < 0x20) ? src_pcksr0_boot : src_pcksr1_boot;
 		u32 pcksr = (i < 0x20) ? src_pcksr0 : src_pcksr1;
-- 
2.12.2
