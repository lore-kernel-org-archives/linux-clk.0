Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06C5C48BE8
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 09:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8151460C3E
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 09:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhFRKAv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jun 2021 06:00:51 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12869 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233219AbhFRKAu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jun 2021 06:00:50 -0400
X-IronPort-AV: E=Sophos;i="5.83,283,1616425200"; 
   d="scan'208";a="84638769"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Jun 2021 18:58:40 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D2459401A453;
        Fri, 18 Jun 2021 18:58:38 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/7] drivers: clk: renesas: r9a07g044-cpg: Add I2C Clocks
Date:   Fri, 18 Jun 2021 10:58:21 +0100
Message-Id: <20210618095823.19885-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add I2C{0,1,2.3} clock entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 5c215b6c06e0..c7be8ede494d 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -100,6 +100,18 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 	DEF_MOD("ia55_clk",	R9A07G044_IA55_CLK,
 				R9A07G044_CLK_P1,
 				0x518, BIT(1), BIT(0)),
+	DEF_MOD("i2c0",		R9A07G044_I2C0_PCLK,
+				R9A07G044_CLK_P0,
+				0x580, BIT(0), BIT(0)),
+	DEF_MOD("i2c1",		R9A07G044_I2C1_PCLK,
+				R9A07G044_CLK_P0,
+				0x580, BIT(1), BIT(1)),
+	DEF_MOD("i2c2",		R9A07G044_I2C2_PCLK,
+				R9A07G044_CLK_P0,
+				0x580, BIT(2), BIT(2)),
+	DEF_MOD("i2c3",		R9A07G044_I2C3_PCLK,
+				R9A07G044_CLK_P0,
+				0x580, BIT(3), BIT(3)),
 	DEF_MOD("scif0",	R9A07G044_SCIF0_CLK_PCK,
 				R9A07G044_CLK_P0,
 				0x584, BIT(0), BIT(0)),
-- 
2.17.1

