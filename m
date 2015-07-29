Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] clk: versatile/impd1: switch order of CLCD clocks
Date: Wed, 29 Jul 2015 14:23:35 +0200
Message-Id: <1438172615-11276-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The CLCD clocks are registered in the wrong order: first the
APB clock, then the pixelclock. This should be the other way
around so the driver gets the pixelclock, not the APB clock,
when it asks for the first clock for the block.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/versatile/clk-impd1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/versatile/clk-impd1.c b/drivers/clk/versatile/clk-impd1.c
index 1cc1330dc570..5e81408e91d6 100644
--- a/drivers/clk/versatile/clk-impd1.c
+++ b/drivers/clk/versatile/clk-impd1.c
@@ -107,8 +107,9 @@ void integrator_impd1_clk_init(void __iomem *base, unsigned int id)
 	clk = icst_clk_register(NULL, &impd1_icst1_desc, imc->vco1name, NULL,
 				base);
 	imc->vco1clk = clk;
-	imc->clks[0] = clkdev_alloc(pclk, "apb_pclk", "lm%x:01000", id);
-	imc->clks[1] = clkdev_alloc(clk, NULL, "lm%x:01000", id);
+	/* CLCD pixel clock */
+	imc->clks[0] = clkdev_alloc(clk, NULL, "lm%x:01000", id);
+	imc->clks[1] = clkdev_alloc(pclk, "apb_pclk", "lm%x:01000", id);
 
 	/* VCO2 is also called "CLK2" */
 	imc->vco2name = kasprintf(GFP_KERNEL, "lm%x-vco2", id);
-- 
2.4.3
