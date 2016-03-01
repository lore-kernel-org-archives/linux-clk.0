Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>,
	Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH 38/41] clk: si5{14,351,70}: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:23 -0800
Message-Id: <1456858826-28541-39-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Sören Brinkmann <soren.brinkmann@xilinx.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-si514.c  | 2 +-
 drivers/clk/clk-si5351.c | 2 +-
 drivers/clk/clk-si570.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
index 6af7dce54241..ceef25b0990b 100644
--- a/drivers/clk/clk-si514.c
+++ b/drivers/clk/clk-si514.c
@@ -313,7 +313,7 @@ static int si514_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	init.ops = &si514_clk_ops;
-	init.flags = CLK_IS_ROOT;
+	init.flags = 0;
 	init.num_parents = 0;
 	data->hw.init = &init;
 	data->i2c_client = client;
diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 850316ac8831..b1bc12c045d3 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1495,7 +1495,7 @@ static int si5351_i2c_probe(struct i2c_client *client,
 	if (drvdata->variant == SI5351_VARIANT_B) {
 		init.name = si5351_pll_names[2];
 		init.ops = &si5351_vxco_ops;
-		init.flags = CLK_IS_ROOT;
+		init.flags = 0;
 		init.parent_names = NULL;
 		init.num_parents = 0;
 	} else {
diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
index cf478aa9fa5d..d56648521a95 100644
--- a/drivers/clk/clk-si570.c
+++ b/drivers/clk/clk-si570.c
@@ -418,7 +418,7 @@ static int si570_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	init.ops = &si570_clk_ops;
-	init.flags = CLK_IS_ROOT;
+	init.flags = 0;
 	init.num_parents = 0;
 	data->hw.init = &init;
 	data->i2c_client = client;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
