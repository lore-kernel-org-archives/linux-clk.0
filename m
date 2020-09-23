Return-Path: <SRS0=lMr4=DA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04126C4363D
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 03:01:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC14B2084C
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 03:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgIWDBn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 23:01:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14215 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726448AbgIWDBn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 23:01:43 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id EBA57E8C529B61E690BB;
        Wed, 23 Sep 2020 11:01:40 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 23 Sep 2020
 11:01:40 +0800
From:   Qilong Zhang <zhangqilong3@huawei.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-clk@vger.kernel.org>
Subject: [PATCH -next v2] clk: tegra: clk-dfll: indicate correct error reason in tegra_dfll_register
Date:   Wed, 23 Sep 2020 11:08:32 +0800
Message-ID: <20200923030832.79105-1-zhangqilong3@huawei.com>
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

v2: Remove useless dev_err()

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/clk/tegra/clk-dfll.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index cfbaa90c7adb..3866dce054d0 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1991,10 +1991,8 @@ int tegra_dfll_register(struct platform_device *pdev,
 	}
 
 	td->base = devm_ioremap(td->dev, mem->start, resource_size(mem));
-	if (!td->base) {
-		dev_err(td->dev, "couldn't ioremap DFLL control registers\n");
-		return -ENODEV;
-	}
+	if (!td->base)
+		return -ENOMEM;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (!mem) {
@@ -2003,10 +2001,8 @@ int tegra_dfll_register(struct platform_device *pdev,
 	}
 
 	td->i2c_base = devm_ioremap(td->dev, mem->start, resource_size(mem));
-	if (!td->i2c_base) {
-		dev_err(td->dev, "couldn't ioremap i2c_base resource\n");
-		return -ENODEV;
-	}
+	if (!td->i2c_base)
+		return -ENOMEM;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 2);
 	if (!mem) {
@@ -2016,11 +2012,8 @@ int tegra_dfll_register(struct platform_device *pdev,
 
 	td->i2c_controller_base = devm_ioremap(td->dev, mem->start,
 					       resource_size(mem));
-	if (!td->i2c_controller_base) {
-		dev_err(td->dev,
-			"couldn't ioremap i2c_controller_base resource\n");
-		return -ENODEV;
-	}
+	if (!td->i2c_controller_base)
+		return -ENOMEM;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 3);
 	if (!mem) {
@@ -2029,11 +2022,8 @@ int tegra_dfll_register(struct platform_device *pdev,
 	}
 
 	td->lut_base = devm_ioremap(td->dev, mem->start, resource_size(mem));
-	if (!td->lut_base) {
-		dev_err(td->dev,
-			"couldn't ioremap lut_base resource\n");
-		return -ENODEV;
-	}
+	if (!td->lut_base)
+		return -ENOMEM;
 
 	ret = dfll_init_clks(td);
 	if (ret) {
-- 
2.17.1

