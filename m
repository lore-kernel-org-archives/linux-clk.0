Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01760C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 03:19:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbiKWDT2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Nov 2022 22:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbiKWDT2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Nov 2022 22:19:28 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D758D4B2;
        Tue, 22 Nov 2022 19:19:27 -0800 (PST)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NH5q639FwzqSYX;
        Wed, 23 Nov 2022 11:15:30 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 23 Nov 2022 11:19:25 +0800
From:   Xiu Jianfeng <xiujianfeng@huawei.com>
To:     <dinguyen@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>
CC:     <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: socfpga: Fix memory leak in socfpga_gate_init()
Date:   Wed, 23 Nov 2022 11:16:22 +0800
Message-ID: <20221123031622.63171-1-xiujianfeng@huawei.com>
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

Free @socfpga_clk and @ops on the error path to avoid memory leak issue.

Fixes: a30a67be7b6e ("clk: socfpga: Don't have get_parent for single parent ops")
Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 drivers/clk/socfpga/clk-gate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index 3e347b9e9eff..0c18c55edf8c 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -133,8 +133,10 @@ void __init socfpga_gate_init(struct device_node *node)
 		return;
 
 	ops = kmemdup(&gateclk_ops, sizeof(gateclk_ops), GFP_KERNEL);
-	if (WARN_ON(!ops))
+	if (WARN_ON(!ops)) {
+		kfree(socfpga_clk);
 		return;
+	}
 
 	rc = of_property_read_u32_array(node, "clk-gate", clk_gate, 2);
 	if (rc)
@@ -182,6 +184,7 @@ void __init socfpga_gate_init(struct device_node *node)
 
 	err = clk_hw_register(NULL, hw_clk);
 	if (err) {
+		kfree(ops);
 		kfree(socfpga_clk);
 		return;
 	}
-- 
2.17.1

