Return-Path: <ce3a@gmx.de>
From: Sergej Sawazki <ce3a@gmx.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	Sergej Sawazki <ce3a@gmx.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH] clk: si5351: Do not enable parent clocks on probe
Date: Sat,  4 Feb 2017 21:17:57 +0100
Message-Id: <1486239477-24720-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

The si5351 driver should not, by default, enable other clocks in
the tree. Let the clients decide when to enable the clocks.

Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
---
 drivers/clk/clk-si5351.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index b051db4..f9eb590 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1442,9 +1442,9 @@ static int si5351_i2c_probe(struct i2c_client *client,
 	}
 
 	if (!IS_ERR(drvdata->pxtal))
-		clk_prepare_enable(drvdata->pxtal);
+		clk_prepare(drvdata->pxtal);
 	if (!IS_ERR(drvdata->pclkin))
-		clk_prepare_enable(drvdata->pclkin);
+		clk_prepare(drvdata->pclkin);
 
 	/* register xtal input clock gate */
 	memset(&init, 0, sizeof(init));
@@ -1617,9 +1617,9 @@ static int si5351_i2c_probe(struct i2c_client *client,
 
 err_clk:
 	if (!IS_ERR(drvdata->pxtal))
-		clk_disable_unprepare(drvdata->pxtal);
+		clk_unprepare(drvdata->pxtal);
 	if (!IS_ERR(drvdata->pclkin))
-		clk_disable_unprepare(drvdata->pclkin);
+		clk_unprepare(drvdata->pclkin);
 	return ret;
 }
 
-- 
2.7.4
