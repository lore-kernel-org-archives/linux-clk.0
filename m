Return-Path: <SRS0=BIUh=BI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02999C433E1
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC33021744
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgG2IEw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jul 2020 04:04:52 -0400
Received: from inva021.nxp.com ([92.121.34.21]:52738 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727846AbgG2IEw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 29 Jul 2020 04:04:52 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5DA1720014B;
        Wed, 29 Jul 2020 10:04:50 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9DCAF200E77;
        Wed, 29 Jul 2020 10:04:46 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9C0A64031F;
        Wed, 29 Jul 2020 10:04:40 +0200 (CEST)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v7 10/11] clk: imx: clk-imx8qxp-lpcg: add runtime pm support
Date:   Wed, 29 Jul 2020 16:00:17 +0800
Message-Id: <1596009618-25516-11-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

add runtime pm support

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v5->v7:
 * no changes
v4->v5:
 * minor err check fix
v3->v4:
 * disable rpm when error out
v3: new patch
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index 1881d7f3ccec..3385de76f6c7 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -12,6 +12,7 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "clk-scu.h"
@@ -239,6 +240,12 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
 	for (i = 0; i < count; i++) {
 		idx = bit_offset[i] / 4;
 		if (idx > IMX_LPCG_MAX_CLKS) {
@@ -248,9 +255,9 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 			goto unreg;
 		}
 
-		clk_hws[idx] = imx_clk_lpcg_scu(output_names[i],
-						parent_names[i], 0, base,
-						bit_offset[i], false);
+		clk_hws[idx] = imx_clk_lpcg_scu_dev(&pdev->dev, output_names[i],
+						    parent_names[i], 0, base,
+						    bit_offset[i], false);
 		if (IS_ERR(clk_hws[idx])) {
 			dev_warn(&pdev->dev, "failed to register clock %d\n",
 				 idx);
@@ -261,8 +268,13 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 
 	ret = devm_of_clk_add_hw_provider(&pdev->dev, imx_lpcg_of_clk_src_get,
 					  clk_data);
-	if (!ret)
-		return 0;
+	if (ret)
+		goto unreg;
+
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
+	return 0;
 
 unreg:
 	while (--i >= 0) {
@@ -271,6 +283,8 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 			imx_clk_lpcg_scu_unregister(clk_hws[idx]);
 	}
 
+	pm_runtime_disable(&pdev->dev);
+
 	return ret;
 }
 
-- 
2.23.0

