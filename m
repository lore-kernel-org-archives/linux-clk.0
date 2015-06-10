Return-Path: <dinguyen@opensource.altera.com>
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>, <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>
Subject: [PATCH 5/6] clk: sunxi: make use of of_clk_parent_fill helper function
Date: Wed, 10 Jun 2015 16:49:24 -0500
Message-ID: <1433972965-24974-6-git-send-email-dinguyen@opensource.altera.com>
In-Reply-To: <1433972965-24974-1-git-send-email-dinguyen@opensource.altera.com>
References: <1433972965-24974-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Use of_clk_parent_fill to fill in the parent clock names' array.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "Emilio López" <emilio@elopez.com.ar>
---
 drivers/clk/sunxi/clk-a20-gmac.c    |  3 +--
 drivers/clk/sunxi/clk-factors.c     |  4 +---
 drivers/clk/sunxi/clk-sun6i-ar100.c |  3 +--
 drivers/clk/sunxi/clk-sunxi.c       | 10 ++--------
 4 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/sunxi/clk-a20-gmac.c b/drivers/clk/sunxi/clk-a20-gmac.c
index 0dcf4f2..a432edd 100644
--- a/drivers/clk/sunxi/clk-a20-gmac.c
+++ b/drivers/clk/sunxi/clk-a20-gmac.c
@@ -80,8 +80,7 @@ static void __init sun7i_a20_gmac_clk_setup(struct device_node *node)
 		goto free_mux;
 
 	/* gmac clock requires exactly 2 parents */
-	parents[0] = of_clk_get_parent_name(node, 0);
-	parents[1] = of_clk_get_parent_name(node, 1);
+	of_clk_parent_fill(node, parents, 2);
 	if (!parents[0] || !parents[1])
 		goto free_gate;
 
diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
index 8c20190..2589457 100644
--- a/drivers/clk/sunxi/clk-factors.c
+++ b/drivers/clk/sunxi/clk-factors.c
@@ -174,9 +174,7 @@ struct clk *sunxi_factors_register(struct device_node *node,
 	int i = 0;
 
 	/* if we have a mux, we will have >1 parents */
-	while (i < FACTORS_MAX_PARENTS &&
-	       (parents[i] = of_clk_get_parent_name(node, i)) != NULL)
-		i++;
+	i = of_clk_parent_fill(node, parents, FACTORS_MAX_PARENTS);
 
 	/*
 	 * some factor clocks, such as pll5 and pll6, may have multiple
diff --git a/drivers/clk/sunxi/clk-sun6i-ar100.c b/drivers/clk/sunxi/clk-sun6i-ar100.c
index 63cf149..6f229ff 100644
--- a/drivers/clk/sunxi/clk-sun6i-ar100.c
+++ b/drivers/clk/sunxi/clk-sun6i-ar100.c
@@ -195,8 +195,7 @@ static int sun6i_a31_ar100_clk_probe(struct platform_device *pdev)
 	if (nparents > SUN6I_AR100_MAX_PARENTS)
 		nparents = SUN6I_AR100_MAX_PARENTS;
 
-	for (i = 0; i < nparents; i++)
-		parents[i] = of_clk_get_parent_name(np, i);
+	of_clk_parent_fill(np, parents, nparents);
 
 	of_property_read_string(np, "clock-output-names", &clk_name);
 
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 7e1e2bd..ebea294 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -200,10 +200,7 @@ static void __init sun6i_ahb1_clk_setup(struct device_node *node)
 	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
 
 	/* we have a mux, we will have >1 parents */
-	while (i < SUN6I_AHB1_MAX_PARENTS &&
-	       (parents[i] = of_clk_get_parent_name(node, i)) != NULL)
-		i++;
-
+	of_clk_parent_fill(node, parents, SUN6I_AHB1_MAX_PARENTS);
 	of_property_read_string(node, "clock-output-names", &clk_name);
 
 	ahb1 = kzalloc(sizeof(struct sun6i_ahb1_clk), GFP_KERNEL);
@@ -788,10 +785,7 @@ static void __init sunxi_mux_clk_setup(struct device_node *node,
 
 	reg = of_iomap(node, 0);
 
-	while (i < SUNXI_MAX_PARENTS &&
-	       (parents[i] = of_clk_get_parent_name(node, i)) != NULL)
-		i++;
-
+	of_clk_parent_fill(node, parents, SUNXI_MAX_PARENTS);
 	of_property_read_string(node, "clock-output-names", &clk_name);
 
 	clk = clk_register_mux(NULL, clk_name, parents, i,
-- 
2.2.1
