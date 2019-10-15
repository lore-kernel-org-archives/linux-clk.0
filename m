Return-Path: <SRS0=UHQz=YI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4B0ECE588
	for <linux-clk@archiver.kernel.org>; Tue, 15 Oct 2019 11:51:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 726972067B
	for <linux-clk@archiver.kernel.org>; Tue, 15 Oct 2019 11:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbfJOLvm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Oct 2019 07:51:42 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:52556 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725790AbfJOLvl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 15 Oct 2019 07:51:41 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id CFFBD993B51D221195F6;
        Tue, 15 Oct 2019 19:51:39 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Tue, 15 Oct 2019
 19:51:29 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] clk: ast2600: remove unused variable 'eclk_parent_names'
Date:   Tue, 15 Oct 2019 19:51:17 +0800
Message-ID: <20191015115117.23504-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

drivers/clk/clk-ast2600.c:119:27: warning:
 eclk_parent_names defined but not used [-Wunused-const-variable=]

It is never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/clk-ast2600.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 1c1bb39..ebaafb5 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -116,8 +116,6 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
 	[ASPEED_CLK_GATE_FSICLK]	= { 62,  59, "fsiclk-gate",	NULL,	 0 },	/* FSI */
 };
 
-static const char * const eclk_parent_names[] = { "mpll", "hpll", "dpll" };
-
 static const struct clk_div_table ast2600_eclk_div_table[] = {
 	{ 0x0, 2 },
 	{ 0x1, 2 },
-- 
2.7.4


