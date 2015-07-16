Return-Path: <axel.lin@ingics.com>
Return-Path: <axel.lin@ingics.com>
Message-ID: <1437055183.7087.1.camel@ingics.com>
Subject: [PATCH RESEND] clk: s2mps11: Simplify s2mps11_clk_probe unwind paths
From: Axel Lin <axel.lin@ingics.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	 <mturquette@baylibre.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-clk@vger.kernel.org
Date: Thu, 16 Jul 2015 21:59:43 +0800
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

The devm_clk_unregister() in .probe error case is not necessary as it will
be automatically called when probe fails.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
This patch was sent on https://lkml.org/lkml/2014/5/18/96 with Krzysztof's
review.

 drivers/clk/clk-s2mps11.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 9b13a30..ba7fb1b 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -246,7 +246,7 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 					s2mps11_name(s2mps11_clk), NULL);
 		if (!s2mps11_clk->lookup) {
 			ret = -ENOMEM;
-			goto err_lup;
+			goto err_reg;
 		}
 	}
 
@@ -265,16 +265,10 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, s2mps11_clks);
 
 	return ret;
-err_lup:
-	devm_clk_unregister(&pdev->dev, s2mps11_clk->clk);
+
 err_reg:
-	while (s2mps11_clk > s2mps11_clks) {
-		if (s2mps11_clk->lookup) {
-			clkdev_drop(s2mps11_clk->lookup);
-			devm_clk_unregister(&pdev->dev, s2mps11_clk->clk);
-		}
-		s2mps11_clk--;
-	}
+	while (--i >= 0)
+		clkdev_drop(s2mps11_clks[i].lookup);
 
 	return ret;
 }
-- 
2.1.0
