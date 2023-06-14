Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E07EB64D8
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 01:31:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240951AbjFNBbE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 21:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbjFNBa7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 21:30:59 -0400
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA6D1FD5;
        Tue, 13 Jun 2023 18:30:46 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0Vl4GQ6P_1686706236;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0Vl4GQ6P_1686706236)
          by smtp.aliyun-inc.com;
          Wed, 14 Jun 2023 09:30:43 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] clk: sprd: composite: Fix unsigned comparison with less than zero
Date:   Wed, 14 Jun 2023 09:30:35 +0800
Message-Id: <20230614013035.123796-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The rate is defined as unsigned long type, if(rate<0) is invalid, modify
to int type.

drivers/clk/sprd/composite.c:20 sprd_comp_determine_rate() warn: unsigned 'rate' is never less than zero.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5520
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/clk/sprd/composite.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
index d3a852720c07..1c0390e8342e 100644
--- a/drivers/clk/sprd/composite.c
+++ b/drivers/clk/sprd/composite.c
@@ -13,7 +13,7 @@ static int sprd_comp_determine_rate(struct clk_hw *hw,
 				    struct clk_rate_request *req)
 {
 	struct sprd_comp *cc = hw_to_sprd_comp(hw);
-	unsigned long rate;
+	int rate;
 
 	rate = sprd_div_helper_round_rate(&cc->common, &cc->div,
 					  req->rate, &req->best_parent_rate);
-- 
2.20.1.7.g153144c

