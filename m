Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7794BC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 11 Nov 2021 12:11:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DDC161261
	for <linux-clk@archiver.kernel.org>; Thu, 11 Nov 2021 12:11:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbhKKMOo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Nov 2021 07:14:44 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:32020 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232855AbhKKMOo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Nov 2021 07:14:44 -0500
X-IronPort-AV: E=Sophos;i="5.87,226,1631545200"; 
   d="scan'208";a="99922513"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Nov 2021 21:11:54 +0900
Received: from localhost.localdomain (unknown [10.226.93.91])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8710040083F4;
        Thu, 11 Nov 2021 21:11:52 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] clk: renesas: r9a07g044: Change core clock "I" from DEF_FIXED->DEF_DIV
Date:   Thu, 11 Nov 2021 12:11:42 +0000
Message-Id: <20211111121144.11131-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111121144.11131-1-biju.das.jz@bp.renesas.com>
References: <20211111121144.11131-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Core clock "I" is sourced from CPG_PL1_DDIV divider as per HW manual
Rev.1.00.

This patch adds clock divider table "dtable_1_8" and switches to
DEF_DIV for "I" clock.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 91643b4e1c9c..4893815cddd8 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -56,6 +56,14 @@ enum clk_ids {
 };
 
 /* Divider tables */
+static const struct clk_div_table dtable_1_8[] = {
+	{0, 1},
+	{1, 2},
+	{2, 4},
+	{3, 8},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_1_32[] = {
 	{0, 1},
 	{1, 2},
@@ -110,7 +118,8 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
 	DEF_FIXED(".pll6_250", CLK_PLL6_250, CLK_PLL6, 1, 2),
 
 	/* Core output clk */
-	DEF_FIXED("I", R9A07G044_CLK_I, CLK_PLL1, 1, 1),
+	DEF_DIV("I", R9A07G044_CLK_I, CLK_PLL1, DIVPL1A, dtable_1_8,
+		CLK_DIVIDER_HIWORD_MASK),
 	DEF_DIV("P0", R9A07G044_CLK_P0, CLK_PLL2_DIV2_8, DIVPL2A,
 		dtable_1_32, CLK_DIVIDER_HIWORD_MASK),
 	DEF_FIXED("P0_DIV2", R9A07G044_CLK_P0_DIV2, R9A07G044_CLK_P0, 1, 2),
-- 
2.17.1

