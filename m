Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81EAC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jan 2022 17:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355933AbiALRqe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jan 2022 12:46:34 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:21633 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1355931AbiALRqb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jan 2022 12:46:31 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106270344"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BDB134005E1F;
        Thu, 13 Jan 2022 02:46:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 05/28] clk: renesas: r9a07g044: Add {M2, M2_DIV2} Clocks support
Date:   Wed, 12 Jan 2022 17:45:49 +0000
Message-Id: <20220112174612.10773-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for {M2, M2_DIV2} clocks which is sourced from pll3_533.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index d24e3c73b2bd..889bef87114f 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -54,6 +54,7 @@ enum clk_ids {
 	CLK_SD1_DIV4,
 	CLK_SEL_GPU2,
 	CLK_SEL_PLL5_4,
+	CLK_M2_DIV2,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -156,6 +157,8 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_DIV("G", R9A07G044_CLK_G, CLK_SEL_GPU2, DIVGPU, dtable_1_8,
 		CLK_DIVIDER_HIWORD_MASK),
 	DEF_FIXED("M1", R9A07G044_CLK_M1, CLK_PLL5_FOUTPOSTDIV, 1, 1),
+	DEF_FIXED("M2", R9A07G044_CLK_M2, CLK_PLL3_533, 1, 2),
+	DEF_FIXED("M2_DIV2", CLK_M2_DIV2, R9A07G044_CLK_M2, 1, 2),
 };
 
 static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
-- 
2.17.1

