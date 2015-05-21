Return-Path: <axel.lin@ingics.com>
Return-Path: <axel.lin@ingics.com>
Message-ID: <1432218373.27793.0.camel@ingics.com>
Subject: [PATCH] clk: cdce706: Add missing of_clk_del_provider call in
 cdce706_remove
From: Axel Lin <axel.lin@ingics.com>
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Max Filippov <jcmvbkbc@gmail.com>,
	linux-clk@vger.kernel.org
Date: Thu, 21 May 2015 22:26:13 +0800
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Remove a previously registered clock provider when unload the module.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/clk/clk-cdce706.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index 8a2dfd0..f01164f 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -666,6 +666,7 @@ static int cdce706_probe(struct i2c_client *client,
 
 static int cdce706_remove(struct i2c_client *client)
 {
+	of_clk_del_provider(client->dev.of_node);
 	return 0;
 }
 
-- 
2.1.0
