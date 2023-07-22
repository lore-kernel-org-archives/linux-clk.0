Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35D5EB64DA
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jul 2023 07:30:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjGVHah (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jul 2023 03:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjGVHah (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jul 2023 03:30:37 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF6F26B5;
        Sat, 22 Jul 2023 00:30:28 -0700 (PDT)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R7J2J3ncnzVjD4;
        Sat, 22 Jul 2023 15:28:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 22 Jul
 2023 15:30:24 +0800
From:   Zhang Jianhua <chris.zjh@huawei.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>, <wens@csie.org>,
        <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
        <ulf.hansson@linaro.org>, <mripard@kernel.org>
CC:     <chris.zjh@huawei.com>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] clk: sunxi-ng: Modify mismatched function name
Date:   Sat, 22 Jul 2023 15:31:07 +0000
Message-ID: <20230722153107.2078179-1-chris.zjh@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

No functional modification involved.

drivers/clk/sunxi-ng/ccu_mmc_timing.c:54: warning: expecting prototype for sunxi_ccu_set_mmc_timing_mode(). Prototype was for sunxi_ccu_get_mmc_timing_mode() instead

Fixes: f6f64ed868d3 ("clk: sunxi-ng: Add interface to query or configure MMC timing modes.")
Signed-off-by: Zhang Jianhua <chris.zjh@huawei.com>
---
 drivers/clk/sunxi-ng/ccu_mmc_timing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mmc_timing.c b/drivers/clk/sunxi-ng/ccu_mmc_timing.c
index 23a8d44e2449..78919d7843be 100644
--- a/drivers/clk/sunxi-ng/ccu_mmc_timing.c
+++ b/drivers/clk/sunxi-ng/ccu_mmc_timing.c
@@ -43,7 +43,7 @@ int sunxi_ccu_set_mmc_timing_mode(struct clk *clk, bool new_mode)
 EXPORT_SYMBOL_GPL(sunxi_ccu_set_mmc_timing_mode);
 
 /**
- * sunxi_ccu_set_mmc_timing_mode: Get the current MMC clock timing mode
+ * sunxi_ccu_get_mmc_timing_mode: Get the current MMC clock timing mode
  * @clk: clock to query
  *
  * Return: %0 if the clock is in old timing mode, > %0 if it is in
-- 
2.34.1

