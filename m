Return-Path: <SRS0=Gp7K=VN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333ECC76192
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jul 2019 15:23:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1689920665
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jul 2019 15:23:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387781AbfGPPXO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Jul 2019 11:23:14 -0400
Received: from inva021.nxp.com ([92.121.34.21]:32922 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387758AbfGPPXO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Jul 2019 11:23:14 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 49320200092;
        Tue, 16 Jul 2019 17:23:13 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 751CD200060;
        Tue, 16 Jul 2019 17:23:08 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 49529402ED;
        Tue, 16 Jul 2019 23:23:02 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v3 04/11] clk: imx: scu: bypass cpu power domains
Date:   Tue, 16 Jul 2019 23:00:58 +0800
Message-Id: <1563289265-10977-5-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Bypass cpu power domains which are owned by ATF.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
    v3: new patch
---
 drivers/clk/imx/clk-scu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 48bfb08..5f935b1 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -479,6 +479,10 @@ static int imx_clk_scu_attach_pd(struct device *dev, u32 rsrc_id)
 		.args[0] = rsrc_id,
 	};
 
+	if ((rsrc_id == IMX_SC_R_A35) || (rsrc_id == IMX_SC_R_A53) ||
+	    (rsrc_id == IMX_SC_R_A72))
+		return 0;
+
 	return of_genpd_add_device(&genpdspec, dev);
 }
 
-- 
2.7.4

