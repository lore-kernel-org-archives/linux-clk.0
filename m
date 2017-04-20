Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 1/8] clk: si5351: Use devm_kcalloc() in si5351_i2c_probe()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Message-ID: <b72a7329-0920-385d-008d-37dfc258f24d@users.sourceforge.net>
Date: Thu, 20 Apr 2017 10:22:10 +0200
MIME-Version: 1.0
In-Reply-To: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2017 22:37:30 +0200

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "devm_kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-si5351.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index b051db43fae1..a4c009e1e70d 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1535,9 +1535,9 @@ static int si5351_i2c_probe(struct i2c_client *client,
 	else
 		parent_names[1] = si5351_pll_names[1];
 
-	drvdata->msynth = devm_kzalloc(&client->dev, num_clocks *
+	drvdata->msynth = devm_kcalloc(&client->dev, num_clocks,
 				       sizeof(*drvdata->msynth), GFP_KERNEL);
-	drvdata->clkout = devm_kzalloc(&client->dev, num_clocks *
+	drvdata->clkout = devm_kcalloc(&client->dev, num_clocks,
 				       sizeof(*drvdata->clkout), GFP_KERNEL);
 	drvdata->num_clkout = num_clocks;
 
-- 
2.12.2
