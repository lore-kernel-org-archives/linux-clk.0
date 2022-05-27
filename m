Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D2BC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 27 May 2022 02:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234284AbiE0CVT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 May 2022 22:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233975AbiE0CVT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 May 2022 22:21:19 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D672F6F494
        for <linux-clk@vger.kernel.org>; Thu, 26 May 2022 19:21:16 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L8T5n5TPqzgYP5;
        Fri, 27 May 2022 10:19:41 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 27 May 2022 10:21:14 +0800
Received: from huawei.com (10.90.53.225) by dggpemm500006.china.huawei.com
 (7.185.36.236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 27 May
 2022 10:21:14 +0800
From:   fengyubo <fengyubo3@huawei.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <weiyongjun1@huawei.com>, <linux-clk@vger.kernel.org>
Subject: [PATCH v2] clk: add missing iounmap in mmp2_clk_init
Date:   Fri, 27 May 2022 10:23:12 +0800
Message-ID: <1653618192-125044-1-git-send-email-fengyubo3@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Yubo Feng <fengyubo3@huawei.com>

the apmu_base and mpmu_base need to be unmapped when meet error

Signed-off-by: Yubo Feng <fengyubo3@huawei.com>
---
 drivers/clk/mmp/clk-mmp2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/mmp/clk-mmp2.c b/drivers/clk/mmp/clk-mmp2.c
index 7460031714da..7ed6cae532f0 100644
--- a/drivers/clk/mmp/clk-mmp2.c
+++ b/drivers/clk/mmp/clk-mmp2.c
@@ -91,12 +91,15 @@ void __init mmp2_clk_init(phys_addr_t mpmu_phys, phys_addr_t apmu_phys,
 	apmu_base = ioremap(apmu_phys, SZ_4K);
 	if (!apmu_base) {
 		pr_err("error to ioremap APMU base\n");
+		iounmap(mpmu_base);
 		return;
 	}
 
 	apbc_base = ioremap(apbc_phys, SZ_4K);
 	if (!apbc_base) {
 		pr_err("error to ioremap APBC base\n");
+		iounmap(apmu_base);
+		iounmap(mpmu_base);
 		return;
 	}
 
-- 
2.25.1

