Return-Path: <sergej@taudac.com>
From: Sergej Sawazki <sergej@taudac.com>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: sebastian.hesselbarth@gmail.com,
	rabeeh@solid-run.com,
	linux@armlinux.org.uk,
	linux-clk@vger.kernel.org,
	Sergej Sawazki <sergej@taudac.com>
Subject: [PATCH 3/3] clk: si5351: Add a debug message for PLL reset
Date: Sat, 12 Aug 2017 16:23:03 +0200
Message-Id: <1502547783-24685-4-git-send-email-sergej@taudac.com>
In-Reply-To: <1502547783-24685-1-git-send-email-sergej@taudac.com>
References: <1502547783-24685-1-git-send-email-sergej@taudac.com>
List-ID: <linux-clk.vger.kernel.org>

Print a debug message when resetting a PLL. It is useful to figure out
what PLL is resetted and when.

Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rabeeh Khoury <rabeeh@solid-run.com>
Signed-off-by: Sergej Sawazki <sergej@taudac.com>
---
 drivers/clk/clk-si5351.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index aa8d8d9..7a122c7 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -917,6 +917,10 @@ void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
 	si5351_reg_write(drvdata, SI5351_PLL_RESET,
 			 (val & SI5351_CLK_PLL_SELECT) ? SI5351_PLL_RESET_B :
 			 SI5351_PLL_RESET_A);
+
+	dev_dbg(&drvdata->client->dev, "%s - %s: pll = %d\n",
+		__func__, clk_hw_get_name(&drvdata->clkout[num].hw),
+		(val & SI5351_CLK_PLL_SELECT) ? 1 : 0);
 }
 
 static int si5351_clkout_prepare(struct clk_hw *hw)
-- 
2.7.4
