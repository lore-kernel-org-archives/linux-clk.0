Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:33198 "EHLO
	mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752162AbcFAXQE (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 1 Jun 2016 19:16:04 -0400
Received: by mail-pf0-f173.google.com with SMTP id b124so23338636pfb.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Jun 2016 16:16:04 -0700 (PDT)
From: Stephen Boyd <stephen.boyd@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>,
	Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 27/34] clk: si514: Migrate to clk_hw based OF and registration APIs
Date: Wed,  1 Jun 2016 16:15:26 -0700
Message-Id: <20160601231533.9354-28-stephen.boyd@linaro.org>
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

Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Sören Brinkmann <soren.brinkmann@xilinx.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
---

See commit 58657d189a2f and it's children for details on this
new registration API.

 drivers/clk/clk-si514.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
index ceef25b0990b..09b6718956bd 100644
--- a/drivers/clk/clk-si514.c
+++ b/drivers/clk/clk-si514.c
@@ -305,7 +305,6 @@ static int si514_probe(struct i2c_client *client,
 {
 	struct clk_si514 *data;
 	struct clk_init_data init;
-	struct clk *clk;
 	int err;
 
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
@@ -330,13 +329,13 @@ static int si514_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, data);
 
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
-- 
2.7.4

