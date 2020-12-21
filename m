Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B07C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2564F22C9C
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgLUPHV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 10:07:21 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42647 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgLUPHV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 10:07:21 -0500
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMlg-0007Vx-AF; Mon, 21 Dec 2020 16:06:36 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMle-003Abd-Uj; Mon, 21 Dec 2020 16:06:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 14/15] soc: xilinx: vcu: fix alignment to open parenthesis
Date:   Mon, 21 Dec 2020 16:06:33 +0100
Message-Id: <20201221150634.755673-15-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221150634.755673-1-m.tretter@pengutronix.de>
References: <20201221150634.755673-1-m.tretter@pengutronix.de>
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
---
Changelog:

v2:
- New patch
---
 drivers/soc/xilinx/xlnx_vcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index 74e667dcf82e..bc1efd22970e 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -618,7 +618,7 @@ static int xvcu_probe(struct platform_device *pdev)
 	}
 
 	xvcu->vcu_slcr_ba = devm_ioremap(&pdev->dev, res->start,
-						 resource_size(res));
+					 resource_size(res));
 	if (!xvcu->vcu_slcr_ba) {
 		dev_err(&pdev->dev, "vcu_slcr register mapping failed.\n");
 		return -ENOMEM;
-- 
2.20.1

