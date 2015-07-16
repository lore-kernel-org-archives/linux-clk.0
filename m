Return-Path: <axel.lin@ingics.com>
Return-Path: <axel.lin@ingics.com>
Message-ID: <1437056153.15220.1.camel@ingics.com>
Subject: [PATCH RESEND] clk: twl6040: Convert to use devm_clk_register
From: Axel Lin <axel.lin@ingics.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	 <mturquette@baylibre.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-clk@vger.kernel.org
Date: Thu, 16 Jul 2015 22:15:53 +0800
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Use devm_clk_register() to simplify the code by removing
twl6040_clk_remove().

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
This patch was sent on https://lkml.org/lkml/2014/5/18/75 with Peter's Ack.

 drivers/clk/clk-twl6040.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/clk/clk-twl6040.c b/drivers/clk/clk-twl6040.c
index 3094b10..8e5ed64 100644
--- a/drivers/clk/clk-twl6040.c
+++ b/drivers/clk/clk-twl6040.c
@@ -90,7 +90,7 @@ static int twl6040_clk_probe(struct platform_device *pdev)
 	clkdata->twl6040 = twl6040;
 
 	clkdata->mcpdm_fclk.init = &wm831x_clkout_init;
-	clkdata->clk = clk_register(&pdev->dev, &clkdata->mcpdm_fclk);
+	clkdata->clk = devm_clk_register(&pdev->dev, &clkdata->mcpdm_fclk);
 	if (IS_ERR(clkdata->clk))
 		return PTR_ERR(clkdata->clk);
 
@@ -99,21 +99,11 @@ static int twl6040_clk_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int twl6040_clk_remove(struct platform_device *pdev)
-{
-	struct twl6040_clk *clkdata = platform_get_drvdata(pdev);
-
-	clk_unregister(clkdata->clk);
-
-	return 0;
-}
-
 static struct platform_driver twl6040_clk_driver = {
 	.driver = {
 		.name = "twl6040-clk",
 	},
 	.probe = twl6040_clk_probe,
-	.remove = twl6040_clk_remove,
 };
 
 module_platform_driver(twl6040_clk_driver);
-- 
2.1.0
