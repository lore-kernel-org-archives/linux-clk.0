Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965CBECAAD3
	for <linux-clk@archiver.kernel.org>; Wed, 14 Sep 2022 03:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiINDfo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Sep 2022 23:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiINDfn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 23:35:43 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173D15F11C;
        Tue, 13 Sep 2022 20:35:41 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MS5VL3M53zcn4n;
        Wed, 14 Sep 2022 11:31:54 +0800 (CST)
Received: from dggpeml500010.china.huawei.com (7.185.36.155) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 11:35:39 +0800
Received: from huawei.com (10.67.175.33) by dggpeml500010.china.huawei.com
 (7.185.36.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 14 Sep
 2022 11:35:39 +0800
From:   Lin Yujun <linyujun809@huawei.com>
To:     <abelvesa@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <linux-imx@nxp.com>, <aisheng.dong@nxp.com>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] clk: imx: scu: fix memleak on platform_device_add() fails
Date:   Wed, 14 Sep 2022 11:32:06 +0800
Message-ID: <20220914033206.98046-1-linyujun809@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.33]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500010.china.huawei.com (7.185.36.155)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

No error handling is performed when platform_device_add()
fails. Add error processing before return, and modified
the return value.

Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Signed-off-by: Lin Yujun <linyujun809@huawei.com>
---
 drivers/clk/imx/clk-scu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index c56e406138db..1e6870f3671f 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -695,7 +695,11 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 		pr_warn("%s: failed to attached the power domain %d\n",
 			name, ret);
 
-	platform_device_add(pdev);
+	ret = platform_device_add(pdev);
+	if (ret) {
+		platform_device_put(pdev);
+		return ERR_PTR(ret);
+	}
 
 	/* For API backwards compatiblilty, simply return NULL for success */
 	return NULL;
-- 
2.17.1

