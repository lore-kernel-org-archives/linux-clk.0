Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105A5C001B0
	for <linux-clk@archiver.kernel.org>; Wed, 16 Aug 2023 03:51:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236360AbjHPDvT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 23:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241713AbjHPDvL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 23:51:11 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B42A1980
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 20:51:09 -0700 (PDT)
Received: from dggpemm500003.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RQYz266XBzVjd9;
        Wed, 16 Aug 2023 11:49:02 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500003.china.huawei.com (7.185.36.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 16 Aug 2023 11:51:07 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 16 Aug
 2023 11:51:07 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-clk@vger.kernel.org>
CC:     <abelvesa@kernel.org>, <peng.fan@nxp.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <shengjiu.wang@nxp.com>, <yangyingliang@huawei.com>
Subject: [PATCH -next] clk: imx: imx8: fix some error handles
Date:   Wed, 16 Aug 2023 11:48:00 +0800
Message-ID: <20230816034800.4081842-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

device_link_add() returns NULL pointer not PTR_ERR() when it fails,
so replace the IS_ERR() check with NULL pointer check and set the
error code to -EINVAL.

Set error code in the error path in imx8_acm_clk_probe().

Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/imx/clk-imx8-acm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-acm.c
index 1e82f72b75c6..550ceac45ff2 100644
--- a/drivers/clk/imx/clk-imx8-acm.c
+++ b/drivers/clk/imx/clk-imx8-acm.c
@@ -287,9 +287,9 @@ static int clk_imx_acm_attach_pm_domains(struct device *dev,
 							 DL_FLAG_STATELESS |
 							 DL_FLAG_PM_RUNTIME |
 							 DL_FLAG_RPM_ACTIVE);
-		if (IS_ERR(dev_pm->pd_dev_link[i])) {
+		if (!dev_pm->pd_dev_link[i]) {
 			dev_pm_domain_detach(dev_pm->pd_dev[i], false);
-			ret = PTR_ERR(dev_pm->pd_dev_link[i]);
+			ret = -EINVAL;
 			goto detach_pm;
 		}
 	}
@@ -372,6 +372,7 @@ static int imx8_acm_clk_probe(struct platform_device *pdev)
 										0, NULL, NULL);
 		if (IS_ERR(hws[sels[i].clkid])) {
 			pm_runtime_disable(&pdev->dev);
+			ret = PTR_ERR(hws[sels[i].clkid]);
 			goto err_clk_register;
 		}
 	}
-- 
2.25.1

