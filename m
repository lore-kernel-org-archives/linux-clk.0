Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E5CC4708F
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jun 2021 11:37:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B53AE613CB
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jun 2021 11:37:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbhFALjM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Jun 2021 07:39:12 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2930 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbhFALjL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Jun 2021 07:39:11 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FvVS74NLRz658m;
        Tue,  1 Jun 2021 19:34:31 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 1 Jun 2021 19:37:28 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 1 Jun 2021
 19:37:28 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-clk@vger.kernel.org>
CC:     <paul.walmsley@sifive.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>
Subject: [PATCH -next] clk: analogbits: fix doc warning in wrpll-cln28hpc.c
Date:   Tue, 1 Jun 2021 19:41:54 +0800
Message-ID: <20210601114154.3163327-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix the following make W=1 warning:

  drivers/clk/analogbits/wrpll-cln28hpc.c:227: warning: expecting prototype for wrpll_configure(). Prototype was for wrpll_configure_for_rate() instead

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/analogbits/wrpll-cln28hpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/analogbits/wrpll-cln28hpc.c b/drivers/clk/analogbits/wrpll-cln28hpc.c
index 7c64ea52a8d5..09ca82356399 100644
--- a/drivers/clk/analogbits/wrpll-cln28hpc.c
+++ b/drivers/clk/analogbits/wrpll-cln28hpc.c
@@ -202,7 +202,7 @@ static int __wrpll_update_parent_rate(struct wrpll_cfg *c,
 }
 
 /**
- * wrpll_configure() - compute PLL configuration for a target rate
+ * wrpll_configure_for_rate() - compute PLL configuration for a target rate
  * @c: ptr to a struct wrpll_cfg record to write into
  * @target_rate: target PLL output clock rate (post-Q-divider)
  * @parent_rate: PLL input refclk rate (pre-R-divider)
-- 
2.25.1

