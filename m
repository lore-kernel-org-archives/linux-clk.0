Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F056C54EE9
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 13:42:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbiI0NmO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232861AbiI0NmM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 09:42:12 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92D5E3EC2
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 06:42:10 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4McLJy0LKczHtgR;
        Tue, 27 Sep 2022 21:37:22 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 21:42:08 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <avifishman70@gmail.com>, <tmaimon77@gmail.com>,
        <tali.perry1@gmail.com>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <openbmc@lists.ozlabs.org>,
        <linux-clk@vger.kernel.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH] clk: clk-npcm7xx: Remove unused struct npcm7xx_clk_gate_data and npcm7xx_clk_div_fixed_data
Date:   Tue, 27 Sep 2022 13:39:31 +0000
Message-ID: <20220927133931.104060-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After commit 6a5898411159("clk: clk-npcm7xx: Remove unused static const tables
'npcm7xx_gates' and 'npcm7xx_divs_fx'"), no one use struct
npcm7xx_clk_gate_data and struct npcm7xx_clk_div_fixed_data, so remove them.

Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/clk/clk-npcm7xx.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index e677bb5a784b..e319cfa51a8a 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -129,20 +129,6 @@ npcm7xx_clk_register_pll(void __iomem *pllcon, const char *name,
 #define NPCM7XX_SECCNT          (0x68)
 #define NPCM7XX_CNTR25M         (0x6C)
 
-struct npcm7xx_clk_gate_data {
-	u32 reg;
-	u8 bit_idx;
-	const char *name;
-	const char *parent_name;
-	unsigned long flags;
-	/*
-	 * If this clock is exported via DT, set onecell_idx to constant
-	 * defined in include/dt-bindings/clock/nuvoton, NPCM7XX-clock.h for
-	 * this specific clock.  Otherwise, set to -1.
-	 */
-	int onecell_idx;
-};
-
 struct npcm7xx_clk_mux_data {
 	u8 shift;
 	u8 mask;
@@ -160,21 +146,6 @@ struct npcm7xx_clk_mux_data {
 
 };
 
-struct npcm7xx_clk_div_fixed_data {
-	u8 mult;
-	u8 div;
-	const char *name;
-	const char *parent_name;
-	u8 clk_divider_flags;
-	/*
-	 * If this clock is exported via DT, set onecell_idx to constant
-	 * defined in include/dt-bindings/clock/nuvoton, NPCM7XX-clock.h for
-	 * this specific clock.  Otherwise, set to -1.
-	 */
-	int onecell_idx;
-};
-
-
 struct npcm7xx_clk_div_data {
 	u32 reg;
 	u8 shift;
-- 
2.17.1

