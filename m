Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AE0C48BDF
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 09:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63FE560C3E
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 09:58:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbhFRKAx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jun 2021 06:00:53 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:33508 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232796AbhFRKAx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jun 2021 06:00:53 -0400
X-IronPort-AV: E=Sophos;i="5.83,283,1616425200"; 
   d="scan'208";a="84638776"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Jun 2021 18:58:43 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4E09A401BC16;
        Fri, 18 Jun 2021 18:58:41 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/7] drivers: clk: renesas: r9a07g044-cpg: Add DMAC clocks
Date:   Fri, 18 Jun 2021 10:58:22 +0100
Message-Id: <20210618095823.19885-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add DMAC clock entry in CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index c7be8ede494d..bdede1d28086 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -37,6 +37,7 @@ enum clk_ids {
 	CLK_PLL5,
 	CLK_PLL5_DIV2,
 	CLK_PLL6,
+	CLK_P1_DIV2,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -86,6 +87,7 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK_PLL2_DIV20, 1, 1),
 	DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV8,
 		DIVPL3B, dtable_3b, CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G044_CLK_P1, 1, 2),
 	DEF_DIV("P2", R9A07G044_CLK_P2, CLK_PLL3_DIV16,
 		DIVPL3A, dtable_3a, CLK_DIVIDER_HIWORD_MASK),
 };
@@ -100,6 +102,12 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 	DEF_MOD("ia55_clk",	R9A07G044_IA55_CLK,
 				R9A07G044_CLK_P1,
 				0x518, BIT(1), BIT(0)),
+	DEF_MOD("dmac_aclk",	R9A07G044_DMAC_ACLK,
+				R9A07G044_CLK_P1,
+				0x52c, BIT(0), BIT(0)),
+	DEF_MOD("dmac_pclk",	R9A07G044_DMAC_PCLK,
+				CLK_P1_DIV2,
+				0x52c, BIT(1), BIT(1)),
 	DEF_MOD("i2c0",		R9A07G044_I2C0_PCLK,
 				R9A07G044_CLK_P0,
 				0x580, BIT(0), BIT(0)),
-- 
2.17.1

