Return-Path: <colin.king@canonical.com>
From: Colin King <colin.king@canonical.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: cdce925: remove redundant check for non-null parent_name
Date: Tue,  5 Sep 2017 16:03:48 +0100
Message-Id: <20170905150348.20041-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

From: Colin Ian King <colin.king@canonical.com>

The check for a non-null parent_name is always true as there is an
earlier check for a null parent_name that returns -ENODEV. Remove this
redundant check and always set init.num_parents to 1.

Detected by CoverityScan CID#1309477 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/clk-cdce925.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index c933be01c7db..0a7e7d5a7506 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -665,7 +665,7 @@ static int cdce925_probe(struct i2c_client *client,
 	init.ops = &cdce925_pll_ops;
 	init.flags = 0;
 	init.parent_names = &parent_name;
-	init.num_parents = parent_name ? 1 : 0;
+	init.num_parents = 1;
 
 	/* Register PLL clocks */
 	for (i = 0; i < data->chip_info->num_plls; ++i) {
-- 
2.14.1
