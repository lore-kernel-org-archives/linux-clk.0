Return-Path: <joel.stan@gmail.com>
Return-Path: <joel.stan@gmail.com>
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] clk: gemini: Read status before using the value
Date: Thu, 29 Jun 2017 15:31:07 +0930
Message-Id: <20170629060107.12548-1-joel@jms.id.au>
List-ID: <linux-clk.vger.kernel.org>

The probe does a shift and mask of val without having read it from the hardware.

Fixes: 846423f96721 ("clk: Add Gemini SoC clock controller")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Compile tested only as I don't have access to the hardware. I noticed the bug
while reading the driver.

 drivers/clk/clk-gemini.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-gemini.c b/drivers/clk/clk-gemini.c
index b82db96ce0c7..c391a49aaaff 100644
--- a/drivers/clk/clk-gemini.c
+++ b/drivers/clk/clk-gemini.c
@@ -306,6 +306,7 @@ static int gemini_clk_probe(struct platform_device *pdev)
 	gemini_clk_data->hws[GEMINI_CLK_RTC] = hw;
 
 	/* CPU clock derived as a fixed ratio from the AHB clock */
+	regmap_read(map, GEMINI_GLOBAL_STATUS, &val);
 	val >>= CPU_AHB_RATIO_SHIFT;
 	val &= CPU_AHB_RATIO_MASK;
 	hw = clk_hw_register_fixed_factor(NULL, "cpu", "ahb", 0,
-- 
2.13.2
