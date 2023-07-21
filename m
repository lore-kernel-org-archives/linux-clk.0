Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E969EB64DD
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jul 2023 07:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjGUHS4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jul 2023 03:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjGUHSz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jul 2023 03:18:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0861FC
        for <linux-clk@vger.kernel.org>; Fri, 21 Jul 2023 00:18:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qMkPc-0002tY-Kj; Fri, 21 Jul 2023 09:18:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qMkPb-0010vw-Fw; Fri, 21 Jul 2023 09:18:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qMkPa-006Yy0-Q4; Fri, 21 Jul 2023 09:18:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        kernel@pengutronix.de
Subject: [PATCH] clk: versaclock3: Switch to use i2c_driver's probe callback
Date:   Fri, 21 Jul 2023 09:18:46 +0200
Message-Id: <20230721071846.111663-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=57JQ8/Eigmrm6CnZHFf97UQrR8pgW0Jr5zqYTa5VdHE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkujFVrafQnj4sN/J3X+L/fGZOgRnAn31JeWBB8 Uy93DWzmzGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLoxVQAKCRCPgPtYfRL+ Tm5sB/4/81AKAsvTlQX3IVkTcSq5KW4ZICu/zeM4VBpjaSarU6c0Vned5UTn2V9Pfis2tKC9r0s 9NBgTjg0EH6OVCYSzwuPRkUJgcQ+z8B8j6r8r6QVZsG8+gT3PC0BtclvXsWicMY1ENE+Ndlps50 Dz8oZCHNb/m/BjEL33VdcOxxbNrlnwLfhQDreW5wETInq/Nswi+lhgHCqwaJEGG044GW+lrDWg3 8JT5So+/ZF5fH9cxPFTs3GAXQfJmSLS80/kzljBOVKwrTG89v+aibJdeDnFz45u/pLSE2kU4yhY EEr1HQucZMix4sF6UOPscLvSIpSf/6IaSNBQNRpcBx4WRjau
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The previous mass switch of clk drivers done in commit 62279db5a323
("clk: Switch i2c drivers back to use .probe()") was based on v6.4-rc1
Since then this driver was added which needs to be converted back in the
same way before eventually .probe_new() can be dropped from struct
i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this driver appeared in next today. It would be great if this patch
could be added on top to not interfere with the quest to remove
.probe_new directly after v6.6-rc1.

Thanks
Uwe

 drivers/clk/clk-versaclock3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 4ceb7fcf7fcb..7ab2447bd203 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -1134,7 +1134,7 @@ static struct i2c_driver vc3_driver = {
 		.name = "vc3",
 		.of_match_table = of_match_ptr(dev_ids),
 	},
-	.probe_new = vc3_probe,
+	.probe = vc3_probe,
 };
 module_i2c_driver(vc3_driver);
 

base-commit: 6e9aff555db7b6816076121ac3feebc3006de9ad
-- 
2.39.2

