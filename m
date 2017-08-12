Return-Path: <sergej@taudac.com>
From: Sergej Sawazki <sergej@taudac.com>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: sebastian.hesselbarth@gmail.com,
	rabeeh@solid-run.com,
	linux@armlinux.org.uk,
	linux-clk@vger.kernel.org,
	Sergej Sawazki <sergej@taudac.com>
Subject: [PATCH 1/3] clk: si5351: Apply PLL soft reset before enabling the outputs
Date: Sat, 12 Aug 2017 16:23:01 +0200
Message-Id: <1502547783-24685-2-git-send-email-sergej@taudac.com>
In-Reply-To: <1502547783-24685-1-git-send-email-sergej@taudac.com>
References: <1502547783-24685-1-git-send-email-sergej@taudac.com>
List-ID: <linux-clk.vger.kernel.org>

The "Si5351A/B/C Data Sheet" states to apply a PLL soft reset before
enabling the output clocks [1]. This is required to get a deterministic
phase relationship between the output clocks.

Without resetting the PLL, the phase relationship between the clocks is
unpredictable. Fix this by resetting the PLL in si5351_clkout_prepare().

It also fixes a regression introduced in commit 6dc669a22c77 ("clk: si5351:
Add PLL soft reset") that causes a disruption on platforms where clocks
derived from different PLLs do different things by resetting only the PLL
which the output clock is derived from.

References:
[1] https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351-B.pdf
    Figure 12 ("I2C Programming Procedure")

Fixes: 6dc669a22c77 ("clk: si5351: Add PLL soft reset")
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rabeeh Khoury <rabeeh@solid-run.com>
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Sergej Sawazki <sergej@taudac.com>
---
 drivers/clk/clk-si5351.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 2492442..46bbc95 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -898,6 +898,21 @@ static int _si5351_clkout_set_disable_state(
 	return 0;
 }
 
+void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
+{
+	u8 val = si5351_reg_read(drvdata, SI5351_CLK0_CTRL + num);
+
+	switch (val & SI5351_CLK_INPUT_MASK) {
+	case SI5351_CLK_INPUT_XTAL:
+	case SI5351_CLK_INPUT_CLKIN:
+		return;  /* PLL not used, no need to reset */
+	}
+
+	si5351_reg_write(drvdata, SI5351_PLL_RESET,
+			 (val & SI5351_CLK_PLL_SELECT) ? SI5351_PLL_RESET_B :
+			 SI5351_PLL_RESET_A);
+}
+
 static int si5351_clkout_prepare(struct clk_hw *hw)
 {
 	struct si5351_hw_data *hwdata =
@@ -905,6 +920,14 @@ static int si5351_clkout_prepare(struct clk_hw *hw)
 
 	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
 			SI5351_CLK_POWERDOWN, 0);
+
+	/*
+	 * Reset the PLLs before enabling the outputs to get a deterministic
+	 * phase relationship between the output clocks. Otherwise, the phase
+	 * offset beween the clocks is unpredictable.
+	 */
+	_si5351_clkout_reset_pll(hwdata->drvdata, hwdata->num);
+
 	si5351_set_bits(hwdata->drvdata, SI5351_OUTPUT_ENABLE_CTRL,
 			(1 << hwdata->num), 0);
 	return 0;
@@ -1095,8 +1118,7 @@ static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * Do a pll soft reset on both plls, needed in some cases to get
 	 * all outputs running.
 	 */
-	si5351_reg_write(hwdata->drvdata, SI5351_PLL_RESET,
-			 SI5351_PLL_RESET_A | SI5351_PLL_RESET_B);
+	_si5351_clkout_reset_pll(hwdata->drvdata, hwdata->num);
 
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: rdiv = %u, parent_rate = %lu, rate = %lu\n",
-- 
2.7.4
