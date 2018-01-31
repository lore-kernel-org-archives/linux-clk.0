Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/19] clk: meson: use dev pointer where possible
Date: Wed, 31 Jan 2018 19:09:27 +0100
Message-Id: <20180131180945.18025-2-jbrunet@baylibre.com>
In-Reply-To: <20180131180945.18025-1-jbrunet@baylibre.com>
References: <20180131180945.18025-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The 'dev' pointer is directly available in gxbb and axg clock
controller, so consistently use it instead of going the through the
'pdev' pointer once in while

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c  | 8 ++++----
 drivers/clk/meson/gxbb.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index b5dacfde64bb..0db0fc0762e2 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -804,7 +804,7 @@ static int axg_clkc_probe(struct platform_device *pdev)
 	void __iomem *clk_base;
 	int ret, clkid, i;
 
-	clkc_data = of_device_get_match_data(&pdev->dev);
+	clkc_data = of_device_get_match_data(dev);
 	if (!clkc_data)
 		return -EINVAL;
 
@@ -812,9 +812,9 @@ static int axg_clkc_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -EINVAL;
-	clk_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	clk_base = devm_ioremap(dev, res->start, resource_size(res));
 	if (!clk_base) {
-		dev_err(&pdev->dev, "Unable to map clk base\n");
+		dev_err(dev, "Unable to map clk base\n");
 		return -ENXIO;
 	}
 
@@ -849,7 +849,7 @@ static int axg_clkc_probe(struct platform_device *pdev)
 		ret = devm_clk_hw_register(dev,
 					clkc_data->hw_onecell_data->hws[clkid]);
 		if (ret) {
-			dev_err(&pdev->dev, "Clock registration failed\n");
+			dev_err(dev, "Clock registration failed\n");
 			return ret;
 		}
 	}
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index a5f25cc1944c..423abcb8ef88 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1950,7 +1950,7 @@ static int gxbb_clkc_probe(struct platform_device *pdev)
 	int ret, clkid, i;
 	struct device *dev = &pdev->dev;
 
-	clkc_data = of_device_get_match_data(&pdev->dev);
+	clkc_data = of_device_get_match_data(dev);
 	if (!clkc_data)
 		return -EINVAL;
 
-- 
2.14.3
