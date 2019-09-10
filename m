Return-Path: <SRS0=VG/9=XE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DATE_IN_FUTURE_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0F6C49ED6
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 14:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19AA72196E
	for <linux-clk@archiver.kernel.org>; Mon,  9 Sep 2019 14:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405170AbfIIOLi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Sep 2019 10:11:38 -0400
Received: from inva020.nxp.com ([92.121.34.13]:55574 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405242AbfIIOLi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Sep 2019 10:11:38 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 409441A0EB7;
        Mon,  9 Sep 2019 16:11:36 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 13A211A03DA;
        Mon,  9 Sep 2019 16:11:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 6A3CF402AF;
        Mon,  9 Sep 2019 22:11:25 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V5 10/11] clk: imx: clk-imx8qxp-lpcg: add runtime pm support
Date:   Mon,  9 Sep 2019 22:10:07 -0400
Message-Id: <1568081408-26800-11-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
References: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
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
 * no changes
v3->v4:
 * disable rpm when error out
v3: new patch
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index 31efc7a..f395eb5 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -12,6 +12,7 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "clk-scu.h"
@@ -231,26 +232,45 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
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
 			dev_warn(&pdev->dev, "invalid bit offset of clock %d\n",
 				 i);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
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
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
 		}
 	}
 
-	return devm_of_clk_add_hw_provider(&pdev->dev, imx_lpcg_of_clk_src_get,
-					   clk_data);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, imx_lpcg_of_clk_src_get,
+					  clk_data);
+	if (ret)
+		goto out;
+
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
+	return 0;
+
+out:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
 }
 
 static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
-- 
2.7.4

