Return-Path: <SRS0=zIv1=EM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DATE_IN_FUTURE_06_12,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A116CC2D0A3
	for <linux-clk@archiver.kernel.org>; Fri,  6 Nov 2020 12:11:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BD0720728
	for <linux-clk@archiver.kernel.org>; Fri,  6 Nov 2020 12:11:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbgKFMK7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Nov 2020 07:10:59 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:7417 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgKFMK7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Nov 2020 07:10:59 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CSK3c5572z73Tn;
        Fri,  6 Nov 2020 20:10:52 +0800 (CST)
Received: from huawei.com (10.151.151.249) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Fri, 6 Nov 2020
 20:10:48 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH] clk: hisilicon: Fix the memory leak issues
Date:   Fri, 6 Nov 2020 20:35:25 +0000
Message-ID: <20201106203525.9991-1-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.249]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When return errors, the clock driver does not unmap
the mapped memory, so fix this issue.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 drivers/clk/hisilicon/clk-hi3620.c | 8 ++++++--
 drivers/clk/hisilicon/clk.c        | 5 ++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3620.c b/drivers/clk/hisilicon/clk-hi3620.c
index a3d04c7c3da8..d5f1a8df4b1c 100644
--- a/drivers/clk/hisilicon/clk-hi3620.c
+++ b/drivers/clk/hisilicon/clk-hi3620.c
@@ -463,12 +463,16 @@ static void __init hi3620_mmc_clk_init(struct device_node *node)
 	}
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
-	if (WARN_ON(!clk_data))
+	if (WARN_ON(!clk_data)) {
+		iounmap(base);
 		return;
+	}
 
 	clk_data->clks = kcalloc(num, sizeof(*clk_data->clks), GFP_KERNEL);
-	if (!clk_data->clks)
+	if (!clk_data->clks) {
+		iounmap(base);
 		return;
+	}
 
 	for (i = 0; i < num; i++) {
 		struct hisi_mmc_clock *mmc_clk = &hi3620_mmc_clks[i];
diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 54d9fdc93599..53acaff32934 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -69,8 +69,10 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
 	}
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
-	if (!clk_data)
+	if (!clk_data) {
+		iounmap(base);
 		goto err;
+	}
 
 	clk_data->base = base;
 	clk_table = kcalloc(nr_clks, sizeof(*clk_table), GFP_KERNEL);
@@ -82,6 +84,7 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data->clk_data);
 	return clk_data;
 err_data:
+	iounmap(base);
 	kfree(clk_data);
 err:
 	return NULL;
-- 
2.17.1

