Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 3/8] clk: si5351: Adjust a null pointer check in
 si5351_dt_parse()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Message-ID: <faed4e9c-ebd0-8c00-77f4-72820ba464f3@users.sourceforge.net>
Date: Thu, 20 Apr 2017 10:26:01 +0200
MIME-Version: 1.0
In-Reply-To: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 07:47:04 +0200

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written "!np".

Thus adjust this expression.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-si5351.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 2492442eea77..a0acea67b571 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1140,7 +1140,7 @@ static int si5351_dt_parse(struct i2c_client *client,
 	int num = 0;
 	u32 val;
 
-	if (np == NULL)
+	if (!np)
 		return 0;
 
 	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
-- 
2.12.2
