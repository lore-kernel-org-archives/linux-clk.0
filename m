Return-Path: <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] clk: at91: Use kcalloc() in
 of_at91_clk_pll_get_characteristics()
Message-ID: <2b5c3954-dc45-4f1b-5d94-397f688b23cb@users.sourceforge.net>
Date: Wed, 19 Apr 2017 19:54:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2017 19:43:03 +0200

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/at91/clk-pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/at91/clk-pll.c b/drivers/clk/at91/clk-pll.c
index 45ad168e1496..7d3223fc7161 100644
--- a/drivers/clk/at91/clk-pll.c
+++ b/drivers/clk/at91/clk-pll.c
@@ -399,18 +399,18 @@ of_at91_clk_pll_get_characteristics(struct device_node *np)
 	if (!characteristics)
 		return NULL;
 
-	output = kzalloc(sizeof(*output) * num_output, GFP_KERNEL);
+	output = kcalloc(num_output, sizeof(*output), GFP_KERNEL);
 	if (!output)
 		goto out_free_characteristics;
 
 	if (num_cells > 2) {
-		out = kzalloc(sizeof(*out) * num_output, GFP_KERNEL);
+		out = kcalloc(num_output, sizeof(*out), GFP_KERNEL);
 		if (!out)
 			goto out_free_output;
 	}
 
 	if (num_cells > 3) {
-		icpll = kzalloc(sizeof(*icpll) * num_output, GFP_KERNEL);
+		icpll = kcalloc(num_output, sizeof(*icpll), GFP_KERNEL);
 		if (!icpll)
 			goto out_free_output;
 	}
-- 
2.12.2
