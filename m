Return-Path: <SRS0=je5o=EJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B1AC2D0A3
	for <linux-clk@archiver.kernel.org>; Tue,  3 Nov 2020 11:20:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A91952071A
	for <linux-clk@archiver.kernel.org>; Tue,  3 Nov 2020 11:20:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgKCLUb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Nov 2020 06:20:31 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7041 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728437AbgKCLUa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Nov 2020 06:20:30 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CQS4p3lZ5zhbPq;
        Tue,  3 Nov 2020 19:20:26 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 19:20:22 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] clk: imx: gate2: Remove unused variable ret
Date:   Tue, 3 Nov 2020 19:32:14 +0800
Message-ID: <1604403134-32814-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch fixes below warning reported by coccicheck:

./clk-gate2.c:57:5-8: Unneeded variable: "ret". Return "0" on line 68

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/clk/imx/clk-gate2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-gate2.c b/drivers/clk/imx/clk-gate2.c
index 480a184..f16c401 100644
--- a/drivers/clk/imx/clk-gate2.c
+++ b/drivers/clk/imx/clk-gate2.c
@@ -54,7 +54,6 @@ static int clk_gate2_enable(struct clk_hw *hw)
 {
 	struct clk_gate2 *gate = to_clk_gate2(hw);
 	unsigned long flags;
-	int ret = 0;
 
 	spin_lock_irqsave(gate->lock, flags);
 
@@ -65,7 +64,7 @@ static int clk_gate2_enable(struct clk_hw *hw)
 out:
 	spin_unlock_irqrestore(gate->lock, flags);
 
-	return ret;
+	return 0;
 }
 
 static void clk_gate2_disable(struct clk_hw *hw)
-- 
2.6.2

