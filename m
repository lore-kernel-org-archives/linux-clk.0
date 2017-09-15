Return-Path: <khoroshilov@ispras.ru>
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ldv-project@linuxtesting.org
Subject: [PATCH] clk: si5351: implement remove handler
Date: Sat, 16 Sep 2017 01:30:30 +0300
Message-Id: <1505514630-19874-1-git-send-email-khoroshilov@ispras.ru>
List-ID: <linux-clk.vger.kernel.org>

The driver has no remove function, so it does not cleanup
resources that are not under devm management.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 drivers/clk/clk-si5351.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 20d90769cced..36a15f161dfd 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1619,6 +1619,18 @@ static int si5351_i2c_probe(struct i2c_client *client,
 	return ret;
 }
 
+static int si5351_i2c_remove(struct i2c_client *client)
+{
+	struct si5351_driver_data *drvdata = i2c_get_clientdata(client);
+
+	of_clk_del_provider(client->dev.of_node);
+	if (!IS_ERR(drvdata->pxtal))
+		clk_disable_unprepare(drvdata->pxtal);
+	if (!IS_ERR(drvdata->pclkin))
+		clk_disable_unprepare(drvdata->pclkin);
+	return 0;
+}
+
 static const struct i2c_device_id si5351_i2c_ids[] = {
 	{ "si5351a", SI5351_VARIANT_A },
 	{ "si5351a-msop", SI5351_VARIANT_A3 },
@@ -1634,6 +1646,7 @@ static struct i2c_driver si5351_driver = {
 		.of_match_table = of_match_ptr(si5351_dt_ids),
 	},
 	.probe = si5351_i2c_probe,
+	.remove = si5351_i2c_remove,
 	.id_table = si5351_i2c_ids,
 };
 module_i2c_driver(si5351_driver);
-- 
2.7.4
