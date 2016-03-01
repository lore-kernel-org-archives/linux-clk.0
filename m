Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Pawel Moll <pawel.moll@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 20/41] clk: versatile: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:05 -0800
Message-Id: <1456858826-28541-21-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/versatile/clk-icst.c         | 2 +-
 drivers/clk/versatile/clk-impd1.c        | 3 +--
 drivers/clk/versatile/clk-realview.c     | 8 +++-----
 drivers/clk/versatile/clk-vexpress-osc.c | 2 +-
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index 3bca438ecd19..5e9b65278e4c 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -170,7 +170,7 @@ static struct clk *icst_clk_setup(struct device *dev,
 
 	init.name = name;
 	init.ops = &icst_ops;
-	init.flags = CLK_IS_ROOT;
+	init.flags = 0;
 	init.parent_names = (parent_name ? &parent_name : NULL);
 	init.num_parents = (parent_name ? 1 : 0);
 	icst->map = map;
diff --git a/drivers/clk/versatile/clk-impd1.c b/drivers/clk/versatile/clk-impd1.c
index 65c842a21c62..74c3216dbb00 100644
--- a/drivers/clk/versatile/clk-impd1.c
+++ b/drivers/clk/versatile/clk-impd1.c
@@ -98,8 +98,7 @@ void integrator_impd1_clk_init(void __iomem *base, unsigned int id)
 
 	/* Register the fixed rate PCLK */
 	imc->pclkname = kasprintf(GFP_KERNEL, "lm%x-pclk", id);
-	pclk = clk_register_fixed_rate(NULL, imc->pclkname, NULL,
-				      CLK_IS_ROOT, 0);
+	pclk = clk_register_fixed_rate(NULL, imc->pclkname, NULL, 0, 0);
 	imc->pclk = pclk;
 
 	imc->vco1name = kasprintf(GFP_KERNEL, "lm%x-vco1", id);
diff --git a/drivers/clk/versatile/clk-realview.c b/drivers/clk/versatile/clk-realview.c
index bd4dd2463e23..c56efc70ac16 100644
--- a/drivers/clk/versatile/clk-realview.c
+++ b/drivers/clk/versatile/clk-realview.c
@@ -56,12 +56,11 @@ void __init realview_clk_init(void __iomem *sysbase, bool is_pb1176)
 	struct clk *clk;
 
 	/* APB clock dummy */
-	clk = clk_register_fixed_rate(NULL, "apb_pclk", NULL, CLK_IS_ROOT, 0);
+	clk = clk_register_fixed_rate(NULL, "apb_pclk", NULL, 0, 0);
 	clk_register_clkdev(clk, "apb_pclk", NULL);
 
 	/* 24 MHz clock */
-	clk = clk_register_fixed_rate(NULL, "clk24mhz", NULL, CLK_IS_ROOT,
-				24000000);
+	clk = clk_register_fixed_rate(NULL, "clk24mhz", NULL, 0, 24000000);
 	clk_register_clkdev(clk, NULL, "dev:uart0");
 	clk_register_clkdev(clk, NULL, "dev:uart1");
 	clk_register_clkdev(clk, NULL, "dev:uart2");
@@ -81,8 +80,7 @@ void __init realview_clk_init(void __iomem *sysbase, bool is_pb1176)
 
 
 	/* 1 MHz clock */
-	clk = clk_register_fixed_rate(NULL, "clk1mhz", NULL, CLK_IS_ROOT,
-				      1000000);
+	clk = clk_register_fixed_rate(NULL, "clk1mhz", NULL, 0, 1000000);
 	clk_register_clkdev(clk, NULL, "sp804");
 
 	/* ICST VCO clock */
diff --git a/drivers/clk/versatile/clk-vexpress-osc.c b/drivers/clk/versatile/clk-vexpress-osc.c
index 89c0609e180b..7e5add7d7752 100644
--- a/drivers/clk/versatile/clk-vexpress-osc.c
+++ b/drivers/clk/versatile/clk-vexpress-osc.c
@@ -94,7 +94,7 @@ static int vexpress_osc_probe(struct platform_device *pdev)
 		init.name = dev_name(&pdev->dev);
 
 	init.ops = &vexpress_osc_ops;
-	init.flags = CLK_IS_ROOT;
+	init.flags = 0;
 	init.num_parents = 0;
 
 	osc->hw.init = &init;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
