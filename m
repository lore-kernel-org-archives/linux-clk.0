Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD41C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 22 Nov 2022 15:25:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbiKVPZ1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Nov 2022 10:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiKVPZ0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Nov 2022 10:25:26 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E628B32BB3
        for <linux-clk@vger.kernel.org>; Tue, 22 Nov 2022 07:25:24 -0800 (PST)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NGp392Q72zRpQg;
        Tue, 22 Nov 2022 23:24:53 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 23:25:22 +0800
From:   Xiu Jianfeng <xiujianfeng@huawei.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nobuhiro1.iwamatsu@toshiba.co.jp>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.or>
Subject: [PATCH] clk: visconti: Fix memory leak in visconti_register_pll()
Date:   Tue, 22 Nov 2022 23:22:19 +0800
Message-ID: <20221122152219.203763-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

@pll->rate_table has allocated memory by kmemdup(), if clk_hw_register()
fails, it should be freed, otherwise it will cause memory leak issue,
this patch fixes it.

Fixes: b4cbe606dc36 ("clk: visconti: Add support common clock driver and reset driver")
Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 drivers/clk/visconti/pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/visconti/pll.c b/drivers/clk/visconti/pll.c
index a484cb945d67..1f3234f22667 100644
--- a/drivers/clk/visconti/pll.c
+++ b/drivers/clk/visconti/pll.c
@@ -277,6 +277,7 @@ static struct clk_hw *visconti_register_pll(struct visconti_pll_provider *ctx,
 	ret = clk_hw_register(NULL, &pll->hw);
 	if (ret) {
 		pr_err("failed to register pll clock %s : %d\n", name, ret);
+		kfree(pll->rate_table);
 		kfree(pll);
 		pll_hw_clk = ERR_PTR(ret);
 	}
-- 
2.17.1

