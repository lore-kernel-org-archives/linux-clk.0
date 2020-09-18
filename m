Return-Path: <SRS0=+/+o=C3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B62CC43463
	for <linux-clk@archiver.kernel.org>; Fri, 18 Sep 2020 09:39:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD62721973
	for <linux-clk@archiver.kernel.org>; Fri, 18 Sep 2020 09:39:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgIRJj4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Sep 2020 05:39:56 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13300 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726109AbgIRJj4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 18 Sep 2020 05:39:56 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 08A9883A1F34AC7756F9;
        Fri, 18 Sep 2020 17:39:55 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 18 Sep 2020
 17:39:50 +0800
From:   Qilong Zhang <zhangqilong3@huawei.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-clk@vger.kernel.org>
Subject: [PATCH -next] clk: tegra: clk-dfll: indicate correct error reason in tegra_dfll_register
Date:   Fri, 18 Sep 2020 17:46:42 +0800
Message-ID: <20200918094642.108070-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Zhang Qilong <zhangqilong3@huawei.com>

Calling devm_ioremap means getting devices resource have been
successful. When remap operation failed, we should return '-ENOMEM'
instead of '-ENODEV' to differentiate between getting resource and
mapping memory for reminding callers. Moreover, it is not consistent
with devm_kzalloc operation.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/clk/tegra/clk-dfll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index cfbaa90c7adb..6637b73be9f1 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1993,7 +1993,7 @@ int tegra_dfll_register(struct platform_device *pdev,
 	td->base = devm_ioremap(td->dev, mem->start, resource_size(mem));
 	if (!td->base) {
 		dev_err(td->dev, "couldn't ioremap DFLL control registers\n");
-		return -ENODEV;
+		return -ENOMEM;
 	}
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
@@ -2005,7 +2005,7 @@ int tegra_dfll_register(struct platform_device *pdev,
 	td->i2c_base = devm_ioremap(td->dev, mem->start, resource_size(mem));
 	if (!td->i2c_base) {
 		dev_err(td->dev, "couldn't ioremap i2c_base resource\n");
-		return -ENODEV;
+		return -ENOMEM;
 	}
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 2);
@@ -2019,7 +2019,7 @@ int tegra_dfll_register(struct platform_device *pdev,
 	if (!td->i2c_controller_base) {
 		dev_err(td->dev,
 			"couldn't ioremap i2c_controller_base resource\n");
-		return -ENODEV;
+		return -ENOMEM;
 	}
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 3);
@@ -2032,7 +2032,7 @@ int tegra_dfll_register(struct platform_device *pdev,
 	if (!td->lut_base) {
 		dev_err(td->dev,
 			"couldn't ioremap lut_base resource\n");
-		return -ENODEV;
+		return -ENOMEM;
 	}
 
 	ret = dfll_init_clks(td);
-- 
2.17.1

