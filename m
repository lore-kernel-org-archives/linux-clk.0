Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F5EC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 10 May 2022 11:07:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240405AbiEJLLg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 May 2022 07:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240720AbiEJLLE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2022 07:11:04 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 514BB53B7A;
        Tue, 10 May 2022 04:07:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,214,1647270000"; 
   d="scan'208";a="120516040"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 May 2022 20:07:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.112])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DD2CB432529E;
        Tue, 10 May 2022 20:07:03 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] clk: renesas: r9a07g044: Add POEG clock and reset entries
Date:   Tue, 10 May 2022 12:06:53 +0100
Message-Id: <20220510110653.7326-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510110653.7326-1-biju.das.jz@bp.renesas.com>
References: <20220510110653.7326-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add POEG clock and reset entries to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index cd2777abd957..fd7c4eecd398 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -182,7 +182,7 @@ static const struct {
 };
 
 static const struct {
-	struct rzg2l_mod_clk common[72];
+	struct rzg2l_mod_clk common[76];
 #ifdef CONFIG_CLK_R9A07G054
 	struct rzg2l_mod_clk drp[0];
 #endif
@@ -206,6 +206,14 @@ static const struct {
 					0x534, 2),
 		DEF_MOD("gpt_pclk",	R9A07G044_GPT_PCLK, R9A07G044_CLK_P0,
 					0x540, 0),
+		DEF_MOD("poeg_a_clkp",	R9A07G044_POEG_A_CLKP, R9A07G044_CLK_P0,
+					0x544, 0),
+		DEF_MOD("poeg_b_clkp",	R9A07G044_POEG_B_CLKP, R9A07G044_CLK_P0,
+					0x544, 1),
+		DEF_MOD("poeg_c_clkp",	R9A07G044_POEG_C_CLKP, R9A07G044_CLK_P0,
+					0x544, 2),
+		DEF_MOD("poeg_d_clkp",	R9A07G044_POEG_D_CLKP, R9A07G044_CLK_P0,
+					0x544, 3),
 		DEF_MOD("wdt0_pclk",	R9A07G044_WDT0_PCLK, R9A07G044_CLK_P0,
 					0x548, 0),
 		DEF_MOD("wdt0_clk",	R9A07G044_WDT0_CLK, R9A07G044_OSCCLK,
@@ -349,6 +357,10 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_OSTM1_PRESETZ, 0x834, 1),
 	DEF_RST(R9A07G044_OSTM2_PRESETZ, 0x834, 2),
 	DEF_RST(R9A07G044_GPT_RST_C, 0x840, 0),
+	DEF_RST(R9A07G044_POEG_A_RST, 0x844, 0),
+	DEF_RST(R9A07G044_POEG_B_RST, 0x844, 1),
+	DEF_RST(R9A07G044_POEG_C_RST, 0x844, 2),
+	DEF_RST(R9A07G044_POEG_D_RST, 0x844, 3),
 	DEF_RST(R9A07G044_WDT0_PRESETN, 0x848, 0),
 	DEF_RST(R9A07G044_WDT1_PRESETN, 0x848, 1),
 	DEF_RST(R9A07G044_WDT2_PRESETN, 0x848, 2),
-- 
2.25.1

