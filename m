Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Purna Chandra Mandal <purna.mandal@microchip.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	linux-mips@linux-mips.org
Subject: [PATCH] clk: microchip: Remove CLK_IS_ROOT
Date: Wed,  1 Jun 2016 14:55:21 -0700
Message-Id: <20160601215521.31309-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now (see commit 47b0eeb3dc8a "clk: Deprecate
CLK_IS_ROOT", 2016-02-02) so remove it.

Cc: Purna Chandra Mandal <purna.mandal@microchip.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: <linux-mips@linux-mips.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

I'm going to send this to Linus tomorrow or Friday so we can finally
remove this flag entirely.

 drivers/clk/microchip/clk-pic32mzda.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/microchip/clk-pic32mzda.c b/drivers/clk/microchip/clk-pic32mzda.c
index 020a29acc5b0..51f54380474b 100644
--- a/drivers/clk/microchip/clk-pic32mzda.c
+++ b/drivers/clk/microchip/clk-pic32mzda.c
@@ -180,15 +180,15 @@ static int pic32mzda_clk_probe(struct platform_device *pdev)
 
 	/* register fixed rate clocks */
 	clks[POSCCLK] = clk_register_fixed_rate(&pdev->dev, "posc_clk", NULL,
-						CLK_IS_ROOT, 24000000);
+						0, 24000000);
 	clks[FRCCLK] =  clk_register_fixed_rate(&pdev->dev, "frc_clk", NULL,
-						CLK_IS_ROOT, 8000000);
+						0, 8000000);
 	clks[BFRCCLK] = clk_register_fixed_rate(&pdev->dev, "bfrc_clk", NULL,
-						CLK_IS_ROOT, 8000000);
+						0, 8000000);
 	clks[LPRCCLK] = clk_register_fixed_rate(&pdev->dev, "lprc_clk", NULL,
-						CLK_IS_ROOT, 32000);
+						0, 32000);
 	clks[UPLLCLK] = clk_register_fixed_rate(&pdev->dev, "usbphy_clk", NULL,
-						CLK_IS_ROOT, 24000000);
+						0, 24000000);
 	/* fixed rate (optional) clock */
 	if (of_find_property(np, "microchip,pic32mzda-sosc", NULL)) {
 		pr_info("pic32-clk: dt requests SOSC.\n");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
