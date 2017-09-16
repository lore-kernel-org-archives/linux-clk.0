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
Subject: [PATCH v2 1/2] clk: si5351: Add DT property to enable PLL reset
Date: Sat, 16 Sep 2017 13:44:41 +0200
Message-Id: <1505562282-9111-2-git-send-email-sergej@taudac.com>
In-Reply-To: <1505562282-9111-1-git-send-email-sergej@taudac.com>
References: <1505562282-9111-1-git-send-email-sergej@taudac.com>
List-ID: <linux-clk.vger.kernel.org>

Add optional output clock DT property to enable PLL reset when a clock
output is enabled.

Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rabeeh Khoury <rabeeh@solid-run.com>
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Sergej Sawazki <sergej@taudac.com>
---
 Documentation/devicetree/bindings/clock/silabs,si5351.txt | 1 +
 drivers/clk/clk-si5351.c                                  | 3 +++
 include/linux/platform_data/si5351.h                      | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si5351.txt b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
index 28b2830..157ee02 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si5351.txt
+++ b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
@@ -45,6 +45,7 @@ Optional child node properties:
 - silabs,multisynth-source: source pll A(0) or B(1) of corresponding multisynth
   divider.
 - silabs,pll-master: boolean, multisynth can change pll frequency.
+- silabs,pll-reset: boolean, clock output can reset its pll.
 - silabs,disable-state : clock output disable state, shall be
   0 = clock output is driven LOW when disabled
   1 = clock output is driven HIGH when disabled
diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 20d9076..aba2895 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1297,6 +1297,9 @@ static int si5351_dt_parse(struct i2c_client *client,
 
 		pdata->clkout[num].pll_master =
 			of_property_read_bool(child, "silabs,pll-master");
+
+		pdata->clkout[num].pll_reset =
+			of_property_read_bool(child, "silabs,pll-reset");
 	}
 	client->dev.platform_data = pdata;
 
diff --git a/include/linux/platform_data/si5351.h b/include/linux/platform_data/si5351.h
index 533d980..da346f22 100644
--- a/include/linux/platform_data/si5351.h
+++ b/include/linux/platform_data/si5351.h
@@ -85,6 +85,7 @@ enum si5351_disable_state {
  * @multisynth_src: multisynth source clock
  * @clkout_src: clkout source clock
  * @pll_master: if true, clkout can also change pll rate
+ * @pll_reset: if true, clkout can reset its pll
  * @drive: output drive strength
  * @rate: initial clkout rate, or default if 0
  */
@@ -94,6 +95,7 @@ struct si5351_clkout_config {
 	enum si5351_drive_strength drive;
 	enum si5351_disable_state disable_state;
 	bool pll_master;
+	bool pll_reset;
 	unsigned long rate;
 };
 
-- 
2.7.4
