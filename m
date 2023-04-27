Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9DCC77B61
	for <linux-clk@archiver.kernel.org>; Thu, 27 Apr 2023 12:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243760AbjD0Mzl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Apr 2023 08:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243276AbjD0Mzk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Apr 2023 08:55:40 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E911B0
        for <linux-clk@vger.kernel.org>; Thu, 27 Apr 2023 05:55:38 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ps19r-0006ST-9F; Thu, 27 Apr 2023 14:55:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ps19q-00E9kb-5t; Thu, 27 Apr 2023 14:55:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ps19p-00Gdya-Fj; Thu, 27 Apr 2023 14:55:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] clk: Switch i2c drivers back to use .probe()
Date:   Thu, 27 Apr 2023 14:55:31 +0200
Message-Id: <20230427125531.622202-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6130; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=TaZKSdJv8tTXh4PTBDg1+27GpanBuBmfDXm/D3/A6xU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkSnDC5aK/SHOgz39sYMPZWOKjypMuXN9qJ5VGZ 5iPNyNTpIuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZEpwwgAKCRCPgPtYfRL+ TqkEB/9ah8YdqYptvG6lFYsrepnsXh6VMHH5Lic9U8AseNf3KNsFaOt8uZwYnlEVS42QnSDHQX9 W3ruQMmBGf+Er9+lUutsSuS3P7zInCabtNZmgPvS2JPzapnJnVov6rI+F9IYd2zTRqtOqXf5I4d /xfSI/FFP4QOEzb5rdaR5pxKAs9qxhX/dn+J/D27rpzUDCQy5u2g29k+bdJYI70CGUf8jud07os XSdH/8phllD2RGb8a1Ghjnj7dzn8o/nfM3O5lPkUVdMYxBPYXTKchPQdS+8OSg6h2CzjoCaUqIa 7LxTQVN/2HmKn+dAg5NzHYarQ/gxNakJqggK74BuIp4AQzCY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/clk-cdce706.c      | 2 +-
 drivers/clk/clk-cdce925.c      | 2 +-
 drivers/clk/clk-cs2000-cp.c    | 2 +-
 drivers/clk/clk-max9485.c      | 2 +-
 drivers/clk/clk-renesas-pcie.c | 2 +-
 drivers/clk/clk-si514.c        | 2 +-
 drivers/clk/clk-si5341.c       | 2 +-
 drivers/clk/clk-si5351.c       | 2 +-
 drivers/clk/clk-si544.c        | 2 +-
 drivers/clk/clk-si570.c        | 2 +-
 drivers/clk/clk-versaclock5.c  | 2 +-
 drivers/clk/clk-versaclock7.c  | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index 1449d0537674..396469c29633 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -690,7 +690,7 @@ static struct i2c_driver cdce706_i2c_driver = {
 		.name	= "cdce706",
 		.of_match_table = of_match_ptr(cdce706_dt_match),
 	},
-	.probe_new	= cdce706_probe,
+	.probe		= cdce706_probe,
 	.remove		= cdce706_remove,
 	.id_table	= cdce706_id,
 };
diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index 6350682f7e6d..e0d22c2fd213 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -824,7 +824,7 @@ static struct i2c_driver cdce925_driver = {
 		.name = "cdce925",
 		.of_match_table = of_match_ptr(clk_cdce925_of_match),
 	},
-	.probe_new	= cdce925_probe,
+	.probe		= cdce925_probe,
 	.id_table	= cdce925_id,
 };
 module_i2c_driver(cdce925_driver);
diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index 320d39922206..b82fee6a3d6f 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -622,7 +622,7 @@ static struct i2c_driver cs2000_driver = {
 		.pm	= &cs2000_pm_ops,
 		.of_match_table = cs2000_of_match,
 	},
-	.probe_new	= cs2000_probe,
+	.probe		= cs2000_probe,
 	.remove		= cs2000_remove,
 	.id_table	= cs2000_id,
 };
diff --git a/drivers/clk/clk-max9485.c b/drivers/clk/clk-max9485.c
index 5f85b0a32872..be9020b6c789 100644
--- a/drivers/clk/clk-max9485.c
+++ b/drivers/clk/clk-max9485.c
@@ -376,7 +376,7 @@ static struct i2c_driver max9485_driver = {
 		.pm		= &max9485_pm_ops,
 		.of_match_table	= max9485_dt_ids,
 	},
-	.probe_new = max9485_i2c_probe,
+	.probe = max9485_i2c_probe,
 	.id_table = max9485_i2c_ids,
 };
 module_i2c_driver(max9485_driver);
diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index ff3a52d48479..c6181fd76fe6 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -371,7 +371,7 @@ static struct i2c_driver rs9_driver = {
 		.pm	= &rs9_pm_ops,
 		.of_match_table = clk_rs9_of_match,
 	},
-	.probe_new	= rs9_probe,
+	.probe		= rs9_probe,
 	.id_table	= rs9_id,
 };
 module_i2c_driver(rs9_driver);
diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
index c028fa103bed..18242382301a 100644
--- a/drivers/clk/clk-si514.c
+++ b/drivers/clk/clk-si514.c
@@ -392,7 +392,7 @@ static struct i2c_driver si514_driver = {
 		.name = "si514",
 		.of_match_table = clk_si514_of_match,
 	},
-	.probe_new	= si514_probe,
+	.probe		= si514_probe,
 	.remove		= si514_remove,
 	.id_table	= si514_id,
 };
diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 0e528d7ba656..dbd21e658a3e 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -1834,7 +1834,7 @@ static struct i2c_driver si5341_driver = {
 		.name = "si5341",
 		.of_match_table = clk_si5341_of_match,
 	},
-	.probe_new	= si5341_probe,
+	.probe		= si5341_probe,
 	.remove		= si5341_remove,
 	.id_table	= si5341_id,
 };
diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 9e939c98a455..f17c1ae0a65f 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1661,7 +1661,7 @@ static struct i2c_driver si5351_driver = {
 		.name = "si5351",
 		.of_match_table = of_match_ptr(si5351_dt_ids),
 	},
-	.probe_new = si5351_i2c_probe,
+	.probe = si5351_i2c_probe,
 	.remove = si5351_i2c_remove,
 	.id_table = si5351_i2c_ids,
 };
diff --git a/drivers/clk/clk-si544.c b/drivers/clk/clk-si544.c
index 089786907641..22925968aa35 100644
--- a/drivers/clk/clk-si544.c
+++ b/drivers/clk/clk-si544.c
@@ -520,7 +520,7 @@ static struct i2c_driver si544_driver = {
 		.name = "si544",
 		.of_match_table = clk_si544_of_match,
 	},
-	.probe_new	= si544_probe,
+	.probe		= si544_probe,
 	.id_table	= si544_id,
 };
 module_i2c_driver(si544_driver);
diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
index 0a6d70c49726..4616945ca97f 100644
--- a/drivers/clk/clk-si570.c
+++ b/drivers/clk/clk-si570.c
@@ -517,7 +517,7 @@ static struct i2c_driver si570_driver = {
 		.name = "si570",
 		.of_match_table = clk_si570_of_match,
 	},
-	.probe_new	= si570_probe,
+	.probe		= si570_probe,
 	.remove		= si570_remove,
 	.id_table	= si570_id,
 };
diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index fa71a57875ce..b1586f4f16fa 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -1304,7 +1304,7 @@ static struct i2c_driver vc5_driver = {
 		.pm	= &vc5_pm_ops,
 		.of_match_table = clk_vc5_of_match,
 	},
-	.probe_new	= vc5_probe,
+	.probe		= vc5_probe,
 	.remove		= vc5_remove,
 	.id_table	= vc5_id,
 };
diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
index 8e4f86e852aa..056513a46167 100644
--- a/drivers/clk/clk-versaclock7.c
+++ b/drivers/clk/clk-versaclock7.c
@@ -1298,7 +1298,7 @@ static struct i2c_driver vc7_i2c_driver = {
 		.name = "vc7",
 		.of_match_table = vc7_of_match,
 	},
-	.probe_new = vc7_probe,
+	.probe = vc7_probe,
 	.remove = vc7_remove,
 	.id_table = vc7_i2c_id,
 };
-- 
2.39.2

