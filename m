Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E4DC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 27 Apr 2022 09:57:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiD0KA2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Apr 2022 06:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiD0KA1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Apr 2022 06:00:27 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 743F82A7417;
        Wed, 27 Apr 2022 02:53:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,292,1643641200"; 
   d="scan'208";a="119361587"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Apr 2022 18:48:46 +0900
Received: from localhost.localdomain (unknown [10.226.93.29])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 27C604265645;
        Wed, 27 Apr 2022 18:48:43 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/9] clk: renesas: r9a07g044: Add {M2, M2_DIV2} Clocks support
Date:   Wed, 27 Apr 2022 10:48:19 +0100
Message-Id: <20220427094823.3319-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427094823.3319-1-biju.das.jz@bp.renesas.com>
References: <20220427094823.3319-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for {M2, M2_DIV2} clocks which is sourced from pll3_533.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1->V2:
 * No change
RFC->V1:
 * Added Rb tag from Geert
---
 drivers/clk/renesas/r9a07g044-cpg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 0c9fa1f705af..d350d6dce4b1 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -32,6 +32,7 @@ enum clk_ids {
 	CLK_PLL3,
 	CLK_PLL3_400,
 	CLK_PLL3_533,
+	CLK_M2_DIV2,
 	CLK_PLL3_DIV2,
 	CLK_PLL3_DIV2_2,
 	CLK_PLL3_DIV2_4,
@@ -86,7 +87,7 @@ static const char * const sel_shdi[] = { ".clk_533", ".clk_400", ".clk_266" };
 static const char * const sel_gpu2[] = { ".pll6", ".pll3_div2_2" };
 
 static const struct {
-	struct cpg_core_clk common[48];
+	struct cpg_core_clk common[50];
 #ifdef CONFIG_CLK_R9A07G054
 	struct cpg_core_clk drp[0];
 #endif
@@ -163,6 +164,8 @@ static const struct {
 		DEF_DIV("G", R9A07G044_CLK_G, CLK_SEL_GPU2, DIVGPU, dtable_1_8,
 			CLK_DIVIDER_HIWORD_MASK),
 		DEF_FIXED("M1", R9A07G044_CLK_M1, CLK_PLL5_FOUTPOSTDIV, 1, 1),
+		DEF_FIXED("M2", R9A07G044_CLK_M2, CLK_PLL3_533, 1, 2),
+		DEF_FIXED("M2_DIV2", CLK_M2_DIV2, R9A07G044_CLK_M2, 1, 2),
 	},
 #ifdef CONFIG_CLK_R9A07G054
 	.drp = {
-- 
2.25.1

