Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:34164 "EHLO
	mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752343AbcFAXQL (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 1 Jun 2016 19:16:11 -0400
Received: by mail-pf0-f174.google.com with SMTP id 62so23303531pfd.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Jun 2016 16:16:06 -0700 (PDT)
From: Stephen Boyd <stephen.boyd@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>
Subject: [PATCH 29/34] clk: si570: Migrate to clk_hw based OF and registration APIs
Date: Wed,  1 Jun 2016 16:15:28 -0700
Message-Id: <20160601231533.9354-30-stephen.boyd@linaro.org>
In-Reply-To: <20160601231533.9354-1-stephen.boyd@linaro.org>
References: <20160601231533.9354-1-stephen.boyd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Now that we have clk_hw based provider APIs to register clks, we
can get rid of struct clk pointers while registering clks in
these drivers, allowing us to move closer to a clear split of
consumer and provider clk APIs.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Sören Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
---

See commit 58657d189a2f and it's children for details on this
new registration API.

 drivers/clk/clk-si570.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
index d56648521a95..646af1d1898d 100644
--- a/drivers/clk/clk-si570.c
+++ b/drivers/clk/clk-si570.c
@@ -408,7 +408,6 @@ static int si570_probe(struct i2c_client *client,
 {
 	struct clk_si570 *data;
 	struct clk_init_data init;
-	struct clk *clk;
 	u32 initial_fout, factory_fout, stability;
 	int err;
 	enum clk_si570_variant variant = id->driver_data;
@@ -462,13 +461,13 @@ static int si570_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	clk = devm_clk_register(&client->dev, &data->hw);
-	if (IS_ERR(clk)) {
+	err = devm_clk_hw_register(&client->dev, &data->hw);
+	if (err) {
 		dev_err(&client->dev, "clock registration failed\n");
-		return PTR_ERR(clk);
+		return err;
 	}
-	err = of_clk_add_provider(client->dev.of_node, of_clk_src_simple_get,
-			clk);
+	err = of_clk_add_hw_provider(client->dev.of_node, of_clk_hw_simple_get,
+				     &data->hw);
 	if (err) {
 		dev_err(&client->dev, "unable to add clk provider\n");
 		return err;
@@ -477,7 +476,7 @@ static int si570_probe(struct i2c_client *client,
 	/* Read the requested initial output frequency from device tree */
 	if (!of_property_read_u32(client->dev.of_node, "clock-frequency",
 				&initial_fout)) {
-		err = clk_set_rate(clk, initial_fout);
+		err = clk_set_rate(data->hw.clk, initial_fout);
 		if (err) {
 			of_clk_del_provider(client->dev.of_node);
 			return err;
-- 
2.7.4

