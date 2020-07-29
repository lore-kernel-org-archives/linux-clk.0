Return-Path: <SRS0=BIUh=BI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F2BC433E3
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DB1821744
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgG2IEt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jul 2020 04:04:49 -0400
Received: from inva020.nxp.com ([92.121.34.13]:34466 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727965AbgG2IEs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 29 Jul 2020 04:04:48 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 733451A112E;
        Wed, 29 Jul 2020 10:04:47 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B35931A0F4B;
        Wed, 29 Jul 2020 10:04:43 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E8AA74031D;
        Wed, 29 Jul 2020 10:04:34 +0200 (CEST)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v7 04/11] clk: imx: scu: bypass cpu power domains
Date:   Wed, 29 Jul 2020 16:00:11 +0800
Message-Id: <1596009618-25516-5-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Bypass cpu power domains which are owned by ATF.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v6->v7:
 * no changes
v5:
 * remove unnecessary ()
v4: no changes
v3: new patch
---
 drivers/clk/imx/clk-scu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index e5837e7caa50..dae2529bf64e 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -484,6 +484,10 @@ static int imx_clk_scu_attach_pd(struct device *dev, u32 rsrc_id)
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

