Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E4FEB64D7
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 01:29:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241008AbjFNB32 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 21:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240835AbjFNB3Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 21:29:25 -0400
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33F4B8;
        Tue, 13 Jun 2023 18:29:23 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R931e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0Vl4DoIc_1686706158;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vl4DoIc_1686706158)
          by smtp.aliyun-inc.com;
          Wed, 14 Jun 2023 09:29:19 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     sboyd@kernel.org
Cc:     mturquette@baylibre.com, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next 3/3] clk: tegra: Fix unsigned comparison with less than zero
Date:   Wed, 14 Jun 2023 09:29:13 +0800
Message-Id: <20230614012913.122220-3-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20230614012913.122220-1-yang.lee@linux.alibaba.com>
References: <20230614012913.122220-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The return value of the round_rate() is long. However, the
return value is being assigned to an unsigned long variable
'rate', so making 'rate' to long.

silence the warnings:
./drivers/clk/tegra/clk-periph.c:59:5-9: WARNING: Unsigned expression compared with zero: rate < 0
./drivers/clk/tegra/clk-super.c:156:5-9: WARNING: Unsigned expression compared with zero: rate < 0

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5519
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/clk/tegra/clk-periph.c | 2 +-
 drivers/clk/tegra/clk-super.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 0626650a7011..9eaac49facd4 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -51,7 +51,7 @@ static int clk_periph_determine_rate(struct clk_hw *hw,
 	struct tegra_clk_periph *periph = to_clk_periph(hw);
 	const struct clk_ops *div_ops = periph->div_ops;
 	struct clk_hw *div_hw = &periph->divider.hw;
-	unsigned long rate;
+	long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-super.c
index 7ec47942720c..7a121de526c0 100644
--- a/drivers/clk/tegra/clk-super.c
+++ b/drivers/clk/tegra/clk-super.c
@@ -147,7 +147,7 @@ static int clk_super_determine_rate(struct clk_hw *hw,
 {
 	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
 	struct clk_hw *div_hw = &super->frac_div.hw;
-	unsigned long rate;
+	long rate;
 
 	__clk_hw_set_clk(div_hw, hw);
 
-- 
2.20.1.7.g153144c

