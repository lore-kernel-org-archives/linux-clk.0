Return-Path: <SRS0=Gp7K=VN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D71C76192
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jul 2019 15:23:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7BBA20665
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jul 2019 15:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387878AbfGPPXY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Jul 2019 11:23:24 -0400
Received: from inva020.nxp.com ([92.121.34.13]:44612 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387880AbfGPPXY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Jul 2019 11:23:24 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 77A881A004C;
        Tue, 16 Jul 2019 17:23:22 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A224B1A0177;
        Tue, 16 Jul 2019 17:23:17 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 11D2F40326;
        Tue, 16 Jul 2019 23:23:08 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v3 10/11] clk: imx: clk-imx8qxp-lpcg: add runtime pm support
Date:   Tue, 16 Jul 2019 23:01:04 +0800
Message-Id: <1563289265-10977-11-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

add runtime pm support

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v3: new patch
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index dbb8960..0043639 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -12,6 +12,7 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "clk-scu.h"
@@ -214,6 +215,12 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 
 	autogate = of_property_read_bool(np, "hw-autogate");
 
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
 	for (i = 0; i < clk_data->num; i++) {
 		if (bit_offset[i] > 31) {
 			dev_warn(&pdev->dev, "invalid bit offset of clock %d\n",
@@ -221,9 +228,9 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 			return -EINVAL;
 		}
 
-		clk_hws[i] = imx_clk_lpcg_scu(output_names[i],
-					      parent_names[i], 0, base,
-					      bit_offset[i], autogate);
+		clk_hws[i] = imx_clk_lpcg_scu_dev(&pdev->dev, output_names[i],
+						  parent_names[i], 0, base,
+						  bit_offset[i], autogate);
 		if (IS_ERR(clk_hws[i])) {
 			dev_warn(&pdev->dev, "failed to register clock %d\n",
 				 i);
@@ -231,8 +238,13 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 		}
 	}
 
-	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
-					   clk_data);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
+					  clk_data);
+
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
+	return ret;
 }
 
 static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
-- 
2.7.4

