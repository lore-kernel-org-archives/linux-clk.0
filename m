Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF61C6FA99
	for <linux-clk@archiver.kernel.org>; Sun, 12 Mar 2023 16:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjCLQPm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Mar 2023 12:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjCLQPa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Mar 2023 12:15:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6359534C0D
        for <linux-clk@vger.kernel.org>; Sun, 12 Mar 2023 09:15:29 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbOLz-0007pw-4T; Sun, 12 Mar 2023 17:15:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbOLy-003f2c-Ed; Sun, 12 Mar 2023 17:15:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbOLx-004K8w-C4; Sun, 12 Mar 2023 17:15:21 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Cristian Marussi <cristian.marussi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/30] clk: scpi: Convert to platform remove callback returning void
Date:   Sun, 12 Mar 2023 17:14:57 +0100
Message-Id: <20230312161512.2715500-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5MjW7VOTnBQN8nKLLIpeOEnNz12SyhOVFAuyxtqwJh0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkDfpSJ8kZ9YYoZicMME15YLeYOAXzTzoRJd/w9 RbWIYoa46uJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZA36UgAKCRDB/BR4rcrs CcajCACIKTV9216hk4TxgtFgcKybJIbdXSl3GMe5VLuQ7axtMl+Klu0Q7fo9MvpT91uFkZmg3U6 W5WidGSi0mjFJefT8EkBXtargZJR+FcJmGPTPAa9G9Iis5Fu0NRROc4ha52DBddGxSCdsCRuWn3 kaYrg6Aw08UOEAONWa2EmGyxDTfwsm7Z/qpJP56CQxwD/VppH3q+uGUbe1O7iOoOyuxlw52FvNN YupboOkvhmLL/yJBsmNOwH9yEdsSr7zPuaZVa9HhQ0GB6pt0caFZnxGujA6lMwgXmJZmziLOTdm r/S5yxYXPu/qW92WjVhjlXCttm+xnyxyUxJQ9ChzaueomuSW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/clk-scpi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index a39af7616b13..3fb4003453ee 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -246,7 +246,7 @@ static int scpi_clk_add(struct device *dev, struct device_node *np,
 	return of_clk_add_hw_provider(np, scpi_of_clk_src_get, clk_data);
 }
 
-static int scpi_clocks_remove(struct platform_device *pdev)
+static void scpi_clocks_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *child, *np = dev->of_node;
@@ -258,7 +258,6 @@ static int scpi_clocks_remove(struct platform_device *pdev)
 
 	for_each_available_child_of_node(np, child)
 		of_clk_del_provider(np);
-	return 0;
 }
 
 static int scpi_clocks_probe(struct platform_device *pdev)
@@ -305,7 +304,7 @@ static struct platform_driver scpi_clocks_driver = {
 		.of_match_table = scpi_clocks_ids,
 	},
 	.probe = scpi_clocks_probe,
-	.remove = scpi_clocks_remove,
+	.remove_new = scpi_clocks_remove,
 };
 module_platform_driver(scpi_clocks_driver);
 
-- 
2.39.1

