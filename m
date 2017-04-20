Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 2/8] clk: si5351: Delete an error message for a failed memory
 allocation in si5351_i2c_probe()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Message-ID: <2a7dd521-86bb-09b8-d49d-7518b51094ea@users.sourceforge.net>
Date: Thu, 20 Apr 2017 10:23:48 +0200
MIME-Version: 1.0
In-Reply-To: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 07:34:54 +0200

The script "checkpatch.pl" pointed information out like the following.

* CHECK: Comparison to NULL could be written "!drvdata"

  Thus adjust this expression.


* WARNING: Possible unnecessary 'out of memory' message

  Thus remove such a statement here.

  Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-si5351.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index a4c009e1e70d..2492442eea77 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1354,10 +1354,8 @@ static int si5351_i2c_probe(struct i2c_client *client,
 		return -EINVAL;
 
 	drvdata = devm_kzalloc(&client->dev, sizeof(*drvdata), GFP_KERNEL);
-	if (drvdata == NULL) {
-		dev_err(&client->dev, "unable to allocate driver data\n");
+	if (!drvdata)
 		return -ENOMEM;
-	}
 
 	i2c_set_clientdata(client, drvdata);
 	drvdata->client = client;
-- 
2.12.2
