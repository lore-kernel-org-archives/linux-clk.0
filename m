Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: bulk: silently error out on EPROBE_DEFER
Date: Mon,  9 Apr 2018 16:13:03 +0200
Message-Id: <20180409141303.14537-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

In clk_bulk_get(), if we fail to get the clock due to probe deferal, we
shouldn't print an error message. Just be silent in this case.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk-bulk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-bulk.c b/drivers/clk/clk-bulk.c
index 4c10456f8a32..6904ed6da504 100644
--- a/drivers/clk/clk-bulk.c
+++ b/drivers/clk/clk-bulk.c
@@ -42,8 +42,9 @@ int __must_check clk_bulk_get(struct device *dev, int num_clks,
 		clks[i].clk = clk_get(dev, clks[i].id);
 		if (IS_ERR(clks[i].clk)) {
 			ret = PTR_ERR(clks[i].clk);
-			dev_err(dev, "Failed to get clk '%s': %d\n",
-				clks[i].id, ret);
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "Failed to get clk '%s': %d\n",
+					clks[i].id, ret);
 			clks[i].clk = NULL;
 			goto err;
 		}
-- 
2.14.3
