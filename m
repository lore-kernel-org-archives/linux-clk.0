Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544B3C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 15 Mar 2022 15:47:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349730AbiCOPsO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Mar 2022 11:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbiCOPsN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Mar 2022 11:48:13 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8CFC41706E;
        Tue, 15 Mar 2022 08:47:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,184,1643641200"; 
   d="scan'208";a="113587395"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Mar 2022 00:47:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.209])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 46BC54000A83;
        Wed, 16 Mar 2022 00:46:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] clk: renesas: r9a07g043: Add GbEthernet clock/reset
Date:   Tue, 15 Mar 2022 15:46:48 +0000
Message-Id: <20220315154649.22343-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220315154649.22343-1-biju.das.jz@bp.renesas.com>
References: <20220315154649.22343-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add ETH{0,1} clock/reset entries to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index ebd3edbb792d..d8c0900432ff 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -111,6 +111,14 @@ static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 				0x52c, 0),
 	DEF_MOD("dmac_pclk",	R9A07G043_DMAC_PCLK, CLK_P1_DIV2,
 				0x52c, 1),
+	DEF_COUPLED("eth0_axi",	R9A07G043_ETH0_CLK_AXI, R9A07G043_CLK_M0,
+				0x57c, 0),
+	DEF_COUPLED("eth0_chi",	R9A07G043_ETH0_CLK_CHI, R9A07G043_CLK_ZT,
+				0x57c, 0),
+	DEF_COUPLED("eth1_axi",	R9A07G043_ETH1_CLK_AXI, R9A07G043_CLK_M0,
+				0x57c, 1),
+	DEF_COUPLED("eth1_chi",	R9A07G043_ETH1_CLK_CHI, R9A07G043_CLK_ZT,
+				0x57c, 1),
 	DEF_MOD("scif0",	R9A07G043_SCIF0_CLK_PCK, R9A07G043_CLK_P0,
 				0x584, 0),
 	DEF_MOD("scif1",	R9A07G043_SCIF1_CLK_PCK, R9A07G043_CLK_P0,
@@ -135,6 +143,8 @@ static struct rzg2l_reset r9a07g043_resets[] = {
 	DEF_RST(R9A07G043_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A07G043_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A07G043_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A07G043_ETH0_RST_HW_N, 0x87c, 0),
+	DEF_RST(R9A07G043_ETH1_RST_HW_N, 0x87c, 1),
 	DEF_RST(R9A07G043_SCIF0_RST_SYSTEM_N, 0x884, 0),
 	DEF_RST(R9A07G043_SCIF1_RST_SYSTEM_N, 0x884, 1),
 	DEF_RST(R9A07G043_SCIF2_RST_SYSTEM_N, 0x884, 2),
-- 
2.17.1

