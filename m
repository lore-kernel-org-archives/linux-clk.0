Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:64302 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752791AbcEYPbl (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 25 May 2016 11:31:41 -0400
From: Jens Renner <renner@efe-gmbh.de>
To: sebastian.hesselbarth@gmail.com
Cc: linux-clk@vger.kernel.org, sboyd@codeaurora.org,
	Jens Renner <renner@efe-gmbh.de>
Subject: [PATCH] clk: si5351: Add invert clock output option
Date: Wed, 25 May 2016 17:31:01 +0200
Message-Id: <1464190261-1660-1-git-send-email-renner@efe-gmbh.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch implements the clock invert option for the Silabs Si5351. Clock
output invert can be enabled via DT entry "silabs,clk-invert" for each
clock child node.

The change has been tested with a Si5351A on actual hardware.

Signed-off-by: Jens Renner <renner@efe-gmbh.de>
---
 .../devicetree/bindings/clock/silabs,si5351.txt    |  1 +
 drivers/clk/clk-si5351.c                           | 25 ++++++++++++++++++++++
 include/linux/platform_data/si5351.h               |  1 +
 3 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si5351.txt b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
index 28b2830..2e23cdd 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si5351.txt
+++ b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
@@ -45,6 +45,7 @@ Optional child node properties:
 - silabs,multisynth-source: source pll A(0) or B(1) of corresponding multisynth
   divider.
 - silabs,pll-master: boolean, multisynth can change pll frequency.
+- silabs,clk-invert: boolean, clock output is inverted.
 - silabs,disable-state : clock output disable state, shall be
   0 = clock output is driven LOW when disabled
   1 = clock output is driven HIGH when disabled
diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index b1bc12c..34a9d6f 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -898,6 +898,19 @@ static int _si5351_clkout_set_disable_state(
 	return 0;
 }
 
+static int _si5351_clkout_set_clk_invert(
+	struct si5351_driver_data *drvdata, int num,
+	bool invert)
+{
+	if (num > 8)
+		return -EINVAL;
+
+	si5351_set_bits(drvdata, SI5351_CLK0_CTRL + num,
+			SI5351_CLK_INVERT, (invert) ? SI5351_CLK_INVERT : 0);
+
+	return 0;
+}
+
 static int si5351_clkout_prepare(struct clk_hw *hw)
 {
 	struct si5351_hw_data *hwdata =
@@ -1299,6 +1312,9 @@ static int si5351_dt_parse(struct i2c_client *client,
 
 		pdata->clkout[num].pll_master =
 			of_property_read_bool(child, "silabs,pll-master");
+
+		pdata->clkout[num].clk_invert =
+			of_property_read_bool(child, "silabs,clk-invert");
 	}
 	client->dev.platform_data = pdata;
 
@@ -1420,6 +1436,15 @@ static int si5351_i2c_probe(struct i2c_client *client,
 				n, pdata->clkout[n].disable_state);
 			return ret;
 		}
+
+		ret = _si5351_clkout_set_clk_invert(drvdata, n,
+						pdata->clkout[n].clk_invert);
+		if (ret) {
+			dev_err(&client->dev,
+				"failed set invert of clkout%d to %d\n",
+				n, pdata->clkout[n].clk_invert);
+			return ret;
+		}
 	}
 
 	if (!IS_ERR(drvdata->pxtal))
diff --git a/include/linux/platform_data/si5351.h b/include/linux/platform_data/si5351.h
index 533d980..38ffda5 100644
--- a/include/linux/platform_data/si5351.h
+++ b/include/linux/platform_data/si5351.h
@@ -94,6 +94,7 @@ struct si5351_clkout_config {
 	enum si5351_drive_strength drive;
 	enum si5351_disable_state disable_state;
 	bool pll_master;
+	bool clk_invert;
 	unsigned long rate;
 };
 
-- 
2.8.1

