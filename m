Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08678C433E6
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 07:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FA5C2396D
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 07:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbhAUHRt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 02:17:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbhAUHRp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 02:17:45 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98256C0613CF
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 23:17:02 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDE-0006UP-CC; Thu, 21 Jan 2021 08:17:00 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDD-00599M-C6; Thu, 21 Jan 2021 08:16:59 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v3 14/15] soc: xilinx: vcu: fix alignment to open parenthesis
Date:   Thu, 21 Jan 2021 08:16:58 +0100
Message-Id: <20210121071659.1226489-15-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121071659.1226489-1-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following checkpatch check:

	CHECK: Alignment should match open parenthesis
	#610: FILE: drivers/soc/xilinx/xlnx_vcu.c:610:
	+       xvcu->vcu_slcr_ba = devm_ioremap(&pdev->dev, res->start,
	+                                                resource_size(res));

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Acked-by: Michal Simek <michal.simek@xilinx.com>
---
Changelog:

v3: none

v2:
- New patch
---
 drivers/soc/xilinx/xlnx_vcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index 74ab305cb403..d66b1315114e 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -619,7 +619,7 @@ static int xvcu_probe(struct platform_device *pdev)
 	}
 
 	xvcu->vcu_slcr_ba = devm_ioremap(&pdev->dev, res->start,
-						 resource_size(res));
+					 resource_size(res));
 	if (!xvcu->vcu_slcr_ba) {
 		dev_err(&pdev->dev, "vcu_slcr register mapping failed.\n");
 		return -ENOMEM;
-- 
2.20.1

