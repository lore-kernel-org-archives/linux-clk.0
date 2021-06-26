Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F25C49EA6
	for <linux-clk@archiver.kernel.org>; Sat, 26 Jun 2021 08:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDE7E6192F
	for <linux-clk@archiver.kernel.org>; Sat, 26 Jun 2021 08:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhFZIQe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 26 Jun 2021 04:16:34 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:46969 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229635AbhFZIQe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 26 Jun 2021 04:16:34 -0400
X-IronPort-AV: E=Sophos;i="5.83,301,1616425200"; 
   d="scan'208";a="85483292"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2021 17:14:12 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3C08C400389B;
        Sat, 26 Jun 2021 17:14:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 09/10] drivers: clk: renesas: r9a07g044-cpg: Add DMAC clocks/resets
Date:   Sat, 26 Jun 2021 09:13:43 +0100
Message-Id: <20210626081344.5783-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
References: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add DMAC clock and reset entries in CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * No change
v2->v3:
 * Added Geert's Rb tag.
v1->v2:
 * Updated reset entries
---
 drivers/clk/renesas/r9a07g044-cpg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index b39a36b317fd..5d81e59f5cfe 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -37,6 +37,7 @@ enum clk_ids {
 	CLK_PLL5,
 	CLK_PLL5_DIV2,
 	CLK_PLL6,
+	CLK_P1_DIV2,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -79,6 +80,7 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED("TSU", R9A07G044_CLK_TSU, CLK_PLL2_DIV20, 1, 1),
 	DEF_DIV("P1", R9A07G044_CLK_P1, CLK_PLL3_DIV2_4,
 		DIVPL3B, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
+	DEF_FIXED("P1_DIV2", CLK_P1_DIV2, R9A07G044_CLK_P1, 1, 2),
 	DEF_DIV("P2", R9A07G044_CLK_P2, CLK_PLL3_DIV2_4_2,
 		DIVPL3A, dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 };
@@ -90,6 +92,10 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x518, 0),
 	DEF_MOD("ia55_clk",	R9A07G044_IA55_CLK, R9A07G044_CLK_P1,
 				0x518, 1),
+	DEF_MOD("dmac_aclk",	R9A07G044_DMAC_ACLK, R9A07G044_CLK_P1,
+				0x52c, 0),
+	DEF_MOD("dmac_pclk",	R9A07G044_DMAC_PCLK, CLK_P1_DIV2,
+				0x52c, 1),
 	DEF_MOD("i2c0",		R9A07G044_I2C0_PCLK, R9A07G044_CLK_P0,
 				0x580, 0),
 	DEF_MOD("i2c1",		R9A07G044_I2C1_PCLK, R9A07G044_CLK_P0,
@@ -116,6 +122,8 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_GIC600_GICRESET_N, 0x814, 0),
 	DEF_RST(R9A07G044_GIC600_DBG_GICRESET_N, 0x814, 1),
 	DEF_RST(R9A07G044_IA55_RESETN, 0x818, 0),
+	DEF_RST(R9A07G044_DMAC_ARESETN, 0x82c, 0),
+	DEF_RST(R9A07G044_DMAC_RST_ASYNC, 0x82c, 1),
 	DEF_RST(R9A07G044_I2C0_MRST, 0x880, 0),
 	DEF_RST(R9A07G044_I2C1_MRST, 0x880, 1),
 	DEF_RST(R9A07G044_I2C2_MRST, 0x880, 2),
-- 
2.17.1

