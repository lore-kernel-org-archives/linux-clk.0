Return-Path: <sergej@taudac.com>
From: Sergej Sawazki <sergej@taudac.com>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	ce3a@gmx.de,
	Sergej Sawazki <sergej@taudac.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rabeeh Khoury <rabeeh@solid-run.com>
Subject: [PATCH] clk: si5351: Apply PLL soft reset before enabling the outputs
Date: Tue, 25 Jul 2017 21:17:41 +0200
Message-Id: <1501010261-7130-1-git-send-email-sergej@taudac.com>
List-ID: <linux-clk.vger.kernel.org>

The "Si5351A/B/C Data Sheet" states to apply a PLLA and PLLB soft reset
before enabling the outputs [1]. This is required to get a deterministic
phase relationship between the output clocks.

Without the PLL reset, the phase offset beween the clocks is unpredictable.

References:
[1] https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351-B.pdf
    Figure 12 ("I2C Programming Procedure")

Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rabeeh Khoury <rabeeh@solid-run.com>
Signed-off-by: Sergej Sawazki <sergej@taudac.com>
---
 drivers/clk/clk-si5351.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 255d0fe..6cca425 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -905,6 +905,15 @@ static int si5351_clkout_prepare(struct clk_hw *hw)
 
 	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
 			SI5351_CLK_POWERDOWN, 0);
+
+	/*
+	 * Reset the PLLs before enabling the outputs to get a deterministic
+	 * phase relationship between the output clocks. Otherwise, the phase
+	 * offset beween the clocks is unpredictable.
+	 */
+	si5351_reg_write(hwdata->drvdata, SI5351_PLL_RESET,
+			 SI5351_PLL_RESET_A | SI5351_PLL_RESET_B);
+
 	si5351_set_bits(hwdata->drvdata, SI5351_OUTPUT_ENABLE_CTRL,
 			(1 << hwdata->num), 0);
 	return 0;
-- 
2.7.4
