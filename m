Return-Path: <SRS0=qW/6=5A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBB7C5ACC0
	for <linux-clk@archiver.kernel.org>; Sun, 15 Mar 2020 13:50:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D8EF20674
	for <linux-clk@archiver.kernel.org>; Sun, 15 Mar 2020 13:50:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgCONuy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 15 Mar 2020 09:50:54 -0400
Received: from inva020.nxp.com ([92.121.34.13]:55426 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728059AbgCONux (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 15 Mar 2020 09:50:53 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E9B0C1A0518;
        Sun, 15 Mar 2020 14:50:51 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2814F1A050F;
        Sun, 15 Mar 2020 14:50:47 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 59FA140326;
        Sun, 15 Mar 2020 21:50:39 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V6 10/12] clk: imx: clk-imx8qxp-lpcg: add runtime pm support
Date:   Sun, 15 Mar 2020 21:43:54 +0800
Message-Id: <1584279836-29825-11-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

add runtime pm support

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
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

