Return-Path: <SRS0=O2Di=ZJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1105C432C0
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:27:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD3DD20857
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:27:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfKQM1b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:27:31 -0500
Received: from inva021.nxp.com ([92.121.34.21]:60284 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfKQM1b (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 17 Nov 2019 07:27:31 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F2DF52000E4;
        Sun, 17 Nov 2019 13:27:29 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B1F1A20012E;
        Sun, 17 Nov 2019 13:27:25 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2175D402AD;
        Sun, 17 Nov 2019 20:27:20 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH RESEND v5 04/11] clk: imx: scu: bypass cpu power domains
Date:   Sun, 17 Nov 2019 20:25:12 +0800
Message-Id: <1573993519-14308-5-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
References: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Bypass cpu power domains which are owned by ATF.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v5:
 * remove unnecessary ()
v4: no changes
v3: new patch
---
 drivers/clk/imx/clk-scu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 5b1bec4a8576..8bd059b96538 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -481,6 +481,10 @@ static int imx_clk_scu_attach_pd(struct device *dev, u32 rsrc_id)
 		.args[0] = rsrc_id,
 	};
 
+	if (rsrc_id == IMX_SC_R_A35 || rsrc_id == IMX_SC_R_A53 ||
+	    rsrc_id == IMX_SC_R_A72)
+		return 0;
+
 	return of_genpd_add_device(&genpdspec, dev);
 }
 
-- 
2.23.0

