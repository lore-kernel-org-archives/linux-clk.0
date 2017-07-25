Return-Path: <ce3a@gmx.de>
From: Sergej Sawazki <ce3a@gmx.de>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rabeeh Khoury <rabeeh@solid-run.com>
Subject: [PATCH v2] clk: si5351: Do not enable parent clocks on probe
Date: Tue, 25 Jul 2017 20:32:11 +0200
Message-Id: <1501007531-5521-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

The si5351 driver should not prepare or enable other clocks in the tree on
probe. Let the clients decide when to prepare or enable the clocks.

Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rabeeh Khoury <rabeeh@solid-run.com>
Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
---
Changes in v2:
 * Remove also the prepare

 drivers/clk/clk-si5351.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 2492442..255d0fe 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1439,11 +1439,6 @@ static int si5351_i2c_probe(struct i2c_client *client,
 		}
 	}
 
-	if (!IS_ERR(drvdata->pxtal))
-		clk_prepare_enable(drvdata->pxtal);
-	if (!IS_ERR(drvdata->pclkin))
-		clk_prepare_enable(drvdata->pclkin);
-
 	/* register xtal input clock gate */
 	memset(&init, 0, sizeof(init));
 	init.name = si5351_input_names[0];
@@ -1458,7 +1453,7 @@ static int si5351_i2c_probe(struct i2c_client *client,
 	ret = devm_clk_hw_register(&client->dev, &drvdata->xtal);
 	if (ret) {
 		dev_err(&client->dev, "unable to register %s\n", init.name);
-		goto err_clk;
+		return ret;
 	}
 
 	/* register clkin input clock gate */
@@ -1476,7 +1471,7 @@ static int si5351_i2c_probe(struct i2c_client *client,
 		if (ret) {
 			dev_err(&client->dev, "unable to register %s\n",
 				init.name);
-			goto err_clk;
+			return ret;
 		}
 	}
 
@@ -1498,7 +1493,7 @@ static int si5351_i2c_probe(struct i2c_client *client,
 	ret = devm_clk_hw_register(&client->dev, &drvdata->pll[0].hw);
 	if (ret) {
 		dev_err(&client->dev, "unable to register %s\n", init.name);
-		goto err_clk;
+		return ret;
 	}
 
 	/* register PLLB or VXCO (Si5351B) */
@@ -1522,7 +1517,7 @@ static int si5351_i2c_probe(struct i2c_client *client,
 	ret = devm_clk_hw_register(&client->dev, &drvdata->pll[1].hw);
 	if (ret) {
 		dev_err(&client->dev, "unable to register %s\n", init.name);
-		goto err_clk;
+		return ret;
 	}
 
 	/* register clk multisync and clk out divider */
@@ -1541,7 +1536,7 @@ static int si5351_i2c_probe(struct i2c_client *client,
 
 	if (WARN_ON(!drvdata->msynth || !drvdata->clkout)) {
 		ret = -ENOMEM;
-		goto err_clk;
+		return ret;
 	}
 
 	for (n = 0; n < num_clocks; n++) {
@@ -1561,7 +1556,7 @@ static int si5351_i2c_probe(struct i2c_client *client,
 		if (ret) {
 			dev_err(&client->dev, "unable to register %s\n",
 				init.name);
-			goto err_clk;
+			return ret;
 		}
 	}
 
@@ -1589,7 +1584,7 @@ static int si5351_i2c_probe(struct i2c_client *client,
 		if (ret) {
 			dev_err(&client->dev, "unable to register %s\n",
 				init.name);
-			goto err_clk;
+			return ret;
 		}
 
 		/* set initial clkout rate */
@@ -1608,17 +1603,10 @@ static int si5351_i2c_probe(struct i2c_client *client,
 				     drvdata);
 	if (ret) {
 		dev_err(&client->dev, "unable to add clk provider\n");
-		goto err_clk;
+		return ret;
 	}
 
 	return 0;
-
-err_clk:
-	if (!IS_ERR(drvdata->pxtal))
-		clk_disable_unprepare(drvdata->pxtal);
-	if (!IS_ERR(drvdata->pclkin))
-		clk_disable_unprepare(drvdata->pclkin);
-	return ret;
 }
 
 static const struct i2c_device_id si5351_i2c_ids[] = {
-- 
2.7.4
