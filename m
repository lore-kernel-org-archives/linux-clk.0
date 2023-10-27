Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F83EC25B47
	for <linux-clk@archiver.kernel.org>; Fri, 27 Oct 2023 08:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345601AbjJ0I7A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Oct 2023 04:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345710AbjJ0I65 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Oct 2023 04:58:57 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A14418F
        for <linux-clk@vger.kernel.org>; Fri, 27 Oct 2023 01:58:54 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3536E871F8;
        Fri, 27 Oct 2023 10:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1698397131;
        bh=SSLWnbfXBw3dSnXzzWGSP4fBF3N07pMY9vx5Ksakq8o=;
        h=From:To:Cc:Subject:Date:From;
        b=OIcdKrGjKsBelQxQvYernzP7nwWtPWyN7UT6aRMUgYyCfRhKXiE5p+a/tQPcXOWb1
         7IuicJaHXiLrQFSdXzT79OLqq+RvjvgPtvS5HzCk+/sne8gEnFahmsbCdwYr0ua/9i
         CpG625D4jHR4rAolbu83OnYM83pR9mANqkSI9OyfxMtivjiinLZqSMtY9vpMMYZqrI
         i1bdpgwYwwXEl02Io8Z2nVVb+7Hc4OqqZHeAbSg5j7rUxBqSUCwAEAm+CFzhRbP3Qs
         LyLMU61DfXbCwR7ussrpNQj2vh2rJkhJQpQQTGgVUqS96DLpG9t8wx+NtKy5+95N6F
         NIG+w7HBBdJwg==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, kernel test robot <lkp@intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk: si521xx: Increase stack based print buffer size in probe
Date:   Fri, 27 Oct 2023 10:58:24 +0200
Message-ID: <20231027085840.30098-1-marex@denx.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Increase the size of temporary print buffer on stack to fix the
following warnings reported by LKP.

Since all the input parameters of snprintf() are under control
of this driver, it is not possible to trigger and overflow here,
but since the print buffer is on stack and discarded once driver
probe() finishes, it is not an issue to increase it by 10 bytes
and fix the warning in the process. Make it so.

"
   drivers/clk/clk-si521xx.c: In function 'si521xx_probe':
>> drivers/clk/clk-si521xx.c:318:26: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(name, 6, "DIFF%d", i);
                             ^~
   drivers/clk/clk-si521xx.c:318:21: note: directive argument in the range [0, 2147483647]
      snprintf(name, 6, "DIFF%d", i);
                        ^~~~~~~~
   drivers/clk/clk-si521xx.c:318:3: note: 'snprintf' output between 6 and 15 bytes into a destination of size 6
      snprintf(name, 6, "DIFF%d", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"

Fixes: edc12763a3a2 ("clk: si521xx: Clock driver for Skyworks Si521xx I2C PCIe clock generators")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310260412.AGASjFN4-lkp@intel.com/
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/clk-si521xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index 99e6271a4de14..4f7b74f889f1e 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -282,7 +282,7 @@ static int si521xx_probe(struct i2c_client *client)
 	const u16 chip_info = (u16)(uintptr_t)i2c_get_match_data(client);
 	const struct clk_parent_data clk_parent_data = { .index = 0 };
 	const u8 data[3] = { SI521XX_REG_BC, 1, 1 };
-	unsigned char name[6] = "DIFF0";
+	unsigned char name[16] = "DIFF0";
 	struct clk_init_data init = {};
 	struct si521xx *si;
 	int i, ret;
@@ -316,7 +316,7 @@ static int si521xx_probe(struct i2c_client *client)
 	/* Register clock */
 	for (i = 0; i < hweight16(chip_info); i++) {
 		memset(&init, 0, sizeof(init));
-		snprintf(name, 6, "DIFF%d", i);
+		snprintf(name, sizeof(name), "DIFF%d", i);
 		init.name = name;
 		init.ops = &si521xx_diff_clk_ops;
 		init.parent_data = &clk_parent_data;
-- 
2.42.0

