Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B5CC63777
	for <linux-clk@archiver.kernel.org>; Fri, 20 Nov 2020 13:21:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2256B22277
	for <linux-clk@archiver.kernel.org>; Fri, 20 Nov 2020 13:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbgKTNVa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Nov 2020 08:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbgKTNVa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Nov 2020 08:21:30 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3DAC0613CF
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2020 05:21:30 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kg6Lt-0004yi-Py; Fri, 20 Nov 2020 14:21:25 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kg6Ls-0004Ig-MM; Fri, 20 Nov 2020 14:21:24 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH] clk: bcm: dvp: drop a variable that is assigned to only
Date:   Fri, 20 Nov 2020 14:21:21 +0100
Message-Id: <20201120132121.2678997-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The third parameter to devm_platform_get_and_ioremap_resource() is used
only to provide the used resource. As this variable isn't used
afterwards, switch to the function devm_platform_ioremap_resource()
which doesn't provide this output parameter.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/bcm/clk-bcm2711-dvp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2711-dvp.c b/drivers/clk/bcm/clk-bcm2711-dvp.c
index 8333e20dc9d2..6696200ecf7e 100644
--- a/drivers/clk/bcm/clk-bcm2711-dvp.c
+++ b/drivers/clk/bcm/clk-bcm2711-dvp.c
@@ -25,7 +25,6 @@ static const struct clk_parent_data clk_dvp_parent = {
 static int clk_dvp_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *data;
-	struct resource *res;
 	struct clk_dvp *dvp;
 	void __iomem *base;
 	int ret;
@@ -42,7 +41,7 @@ static int clk_dvp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	data = dvp->data;
 
-	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.28.0

