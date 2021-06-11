Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3411C48BE5
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 16:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D17F260FDB
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 16:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhFKQ6f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jun 2021 12:58:35 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:14102 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229548AbhFKQ6f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Jun 2021 12:58:35 -0400
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="84115100"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Jun 2021 01:56:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A3AD7400C4C6;
        Sat, 12 Jun 2021 01:56:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/5] drivers: clk: renesas: r9a07g044-cpg: Add I2C Clocks
Date:   Fri, 11 Jun 2021 17:56:21 +0100
Message-Id: <20210611165624.30749-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210611165624.30749-1-biju.das.jz@bp.renesas.com>
References: <20210611165624.30749-1-biju.das.jz@bp.renesas.com>
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
index 2d2bc78b84a2..c3136da53614 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -94,6 +94,18 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 	DEF_MOD("usb1",		R9A07G044_CLK_USB1,
 				R9A07G044_CLK_P1,
 				0x578, (BIT(1) | BIT(3)), (BIT(1) | BIT(3))),
+	DEF_MOD("i2c0",		R9A07G044_CLK_I2C0,
+				R9A07G044_CLK_P0,
+				0x580, BIT(0), BIT(0)),
+	DEF_MOD("i2c1",		R9A07G044_CLK_I2C1,
+				R9A07G044_CLK_P0,
+				0x580, BIT(1), BIT(1)),
+	DEF_MOD("i2c2",		R9A07G044_CLK_I2C2,
+				R9A07G044_CLK_P0,
+				0x580, BIT(2), BIT(2)),
+	DEF_MOD("i2c3",		R9A07G044_CLK_I2C3,
+				R9A07G044_CLK_P0,
+				0x580, BIT(3), BIT(3)),
 	DEF_MOD("scif0",	R9A07G044_CLK_SCIF0,
 				R9A07G044_CLK_P0,
 				0x584, BIT(0), BIT(0)),
-- 
2.17.1

