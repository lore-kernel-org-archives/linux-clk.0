Return-Path: <sergej@taudac.com>
From: Sergej Sawazki <sergej@taudac.com>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com,
	sebastian.hesselbarth@gmail.com
Cc: linux@armlinux.org.uk,
	linux-clk@vger.kernel.org,
	ce3a@gmx.de,
	Sergej Sawazki <sergej@taudac.com>,
	Rabeeh Khoury <rabeeh@solid-run.com>
Subject: [PATCH v2 2/2] clk: si5351: Apply PLL soft reset before enabling the outputs
Date: Sat, 16 Sep 2017 13:44:42 +0200
Message-Id: <1505562282-9111-3-git-send-email-sergej@taudac.com>
In-Reply-To: <1505562282-9111-1-git-send-email-sergej@taudac.com>
References: <1505562282-9111-1-git-send-email-sergej@taudac.com>
List-ID: <linux-clk.vger.kernel.org>

The "Si5351A/B/C Data Sheet" states to apply a PLL soft reset before
enabling the output clocks [1]. This is required to get a deterministic
phase relationship between the output clocks.

Without resetting the PLL, the phase relationship between the clocks is
unpredictable. Fix this by resetting the PLL in si5351_clkout_prepare().

References:
[1] https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351-B.pdf
    Figure 12 ("I2C Programming Procedure")

Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rabeeh Khoury <rabeeh@solid-run.com>
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Sergej Sawazki <sergej@taudac.com>
---
 drivers/clk/clk-si5351.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index aba2895..9c4cc5d 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -903,13 +903,42 @@ static int _si5351_clkout_set_disable_state(
 	return 0;
 }
 
+void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
+{
+	u8 val = si5351_reg_read(drvdata, SI5351_CLK0_CTRL + num);
+
+	switch (val & SI5351_CLK_INPUT_MASK) {
+	case SI5351_CLK_INPUT_XTAL:
+	case SI5351_CLK_INPUT_CLKIN:
+		return;  /* pll not used, no need to reset */
+	}
+
+	si5351_reg_write(drvdata, SI5351_PLL_RESET,
+			 val & SI5351_CLK_PLL_SELECT ? SI5351_PLL_RESET_B :
+						       SI5351_PLL_RESET_A);
+
+	dev_dbg(&drvdata->client->dev, "%s - %s: pll = %d\n",
+		__func__, clk_hw_get_name(&drvdata->clkout[num].hw),
+		(val & SI5351_CLK_PLL_SELECT) ? 1 : 0);
+}
+
 static int si5351_clkout_prepare(struct clk_hw *hw)
 {
 	struct si5351_hw_data *hwdata =
 		container_of(hw, struct si5351_hw_data, hw);
+	struct si5351_platform_data *pdata =
+		hwdata->drvdata->client->dev.platform_data;
 
 	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
 			SI5351_CLK_POWERDOWN, 0);
+
+	/*
+	 * Do a pll soft reset on the parent pll -- needed to get a
+	 * deterministic phase relationship between the output clocks.
+	 */
+	if (pdata->clkout[hwdata->num].pll_reset)
+		_si5351_clkout_reset_pll(hwdata->drvdata, hwdata->num);
+
 	si5351_set_bits(hwdata->drvdata, SI5351_OUTPUT_ENABLE_CTRL,
 			(1 << hwdata->num), 0);
 	return 0;
-- 
2.7.4
