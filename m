Return-Path: <SRS0=PWff=RB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A13C43381
	for <linux-clk@archiver.kernel.org>; Tue, 26 Feb 2019 01:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7E13213A2
	for <linux-clk@archiver.kernel.org>; Tue, 26 Feb 2019 01:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfBZBoU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Feb 2019 20:44:20 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:48696 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725842AbfBZBoU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Feb 2019 20:44:20 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 053D9C26909BF8F070C8;
        Tue, 26 Feb 2019 09:44:18 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.408.0; Tue, 26 Feb 2019 09:44:09 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>
CC:     YueHaibing <yuehaibing@huawei.com>, <linux-clk@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] clk: ingenic: Remove set but not used variable 'enable'
Date:   Tue, 26 Feb 2019 01:57:32 +0000
Message-ID: <20190226015732.183552-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/clk/ingenic/cgu.c: In function 'ingenic_pll_recalc_rate':
drivers/clk/ingenic/cgu.c:86:15: warning:
 variable 'enable' set but not used [-Wunused-but-set-variable]

It's not used after commit ab27eb4bc365 ("clk: ingenic: Add code to
enable/disable PLLs")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/ingenic/cgu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index b40160eb3372..510b685212d3 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -83,7 +83,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	const struct ingenic_cgu_clk_info *clk_info;
 	const struct ingenic_cgu_pll_info *pll_info;
 	unsigned m, n, od_enc, od;
-	bool bypass, enable;
+	bool bypass;
 	unsigned long flags;
 	u32 ctl;
 
@@ -103,7 +103,6 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	od_enc &= GENMASK(pll_info->od_bits - 1, 0);
 	bypass = !pll_info->no_bypass_bit &&
 		 !!(ctl & BIT(pll_info->bypass_bit));
-	enable = !!(ctl & BIT(pll_info->enable_bit));
 
 	if (bypass)
 		return parent_rate;



