Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 8/8] clk: nomadik: Delete error messages for a failed memory
 allocation in two functions
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Wolfram Sang <wsa@the-dreams.de>
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Message-ID: <fd5dc7a7-2ab0-b39f-248b-7191984c6666@users.sourceforge.net>
Date: Thu, 20 Apr 2017 10:32:18 +0200
MIME-Version: 1.0
In-Reply-To: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 10:04:00 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus remove such statements here.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-nomadik.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-nomadik.c b/drivers/clk/clk-nomadik.c
index 8d57ab8d6ed8..13ad6d1e5090 100644
--- a/drivers/clk/clk-nomadik.c
+++ b/drivers/clk/clk-nomadik.c
@@ -267,10 +267,8 @@ pll_clk_register(struct device *dev, const char *name,
 	}
 
 	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
-	if (!pll) {
-		pr_err("%s: could not allocate PLL clk\n", __func__);
+	if (!pll)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	init.ops = &pll_clk_ops;
@@ -356,11 +354,9 @@ src_clk_register(struct device *dev, const char *name,
 	struct clk_init_data init;
 
 	sclk = kzalloc(sizeof(*sclk), GFP_KERNEL);
-	if (!sclk) {
-		pr_err("could not allocate SRC clock %s\n",
-			name);
+	if (!sclk)
 		return ERR_PTR(-ENOMEM);
-	}
+
 	init.name = name;
 	init.ops = &src_clk_ops;
 	/* Do not force-disable the static SDRAM controller */
-- 
2.12.2
