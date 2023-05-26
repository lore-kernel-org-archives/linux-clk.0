Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B88C7EE23
	for <linux-clk@archiver.kernel.org>; Fri, 26 May 2023 06:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjEZGKF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 May 2023 02:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjEZGKE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 May 2023 02:10:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5879125
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 23:10:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2QeH-0002tx-Ev; Fri, 26 May 2023 08:10:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2QeG-002tQx-KJ; Fri, 26 May 2023 08:10:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2QeF-0084Og-QJ; Fri, 26 May 2023 08:09:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] clk: si521xx: Switch i2c driver back to use .probe()
Date:   Fri, 26 May 2023 08:09:55 +0200
Message-Id: <20230526060955.1130253-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OgzMZ5mzpl19ti/WkLxfE3/gh0u0Xj/JY/cJkaPCoX8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkcE0vQMrKZzlwFj99sizL92iEgfWlZifw4/SHT jMHohzVoFGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHBNLwAKCRCPgPtYfRL+ Tg26CACiYSpiOymSzyy7jaTQs9oLSpAfCYmEnbl5ZH80wRWsYVHX5dTD0mEnTbHj74fffgIWNoo BqS8Zq+Xtr9WCNV4OD2rcNKlOMECj/+MrwoEnqEfh3x4UWXZCWf+TG3BsmLsMQdufjB4m2SudLt XnNSVhX1Vzm/FieZlomH/mhYGbWZ7Y2GClXg0KVHbg6XydjvWsDPh05xfw/XB2fqjYu48EN+jl2 /P4bVlIydY2oLA9fceq8v3/fo2d3ktZCfMfvjaanYnH75Jn+F8P0LftXp7EegRGFhiJFfzGGFEm 3fJUfPbZeKZiy/NlTV4KOgBEXmot87BlVNIoLC3JaOc5hNoI
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
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
convert back to (the new) .probe() to be able to eventually drop
.probe_new() from struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

since I sent a patch converting all of drivers/clk back to .probe() this
driver was added. If you prefer, squash this patch into 

	62279db5a323 clk: Switch i2c drivers back to use .probe()

Best regards
Uwe

 drivers/clk/clk-si521xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index ac8d4c59cd3d..4eaf1b53f06b 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -385,7 +385,7 @@ static struct i2c_driver si521xx_driver = {
 		.pm	= &si521xx_pm_ops,
 		.of_match_table = clk_si521xx_of_match,
 	},
-	.probe_new	= si521xx_probe,
+	.probe		= si521xx_probe,
 	.id_table	= si521xx_id,
 };
 module_i2c_driver(si521xx_driver);

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

