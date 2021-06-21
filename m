Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484ACC49EA4
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jun 2021 09:39:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26D2D611CC
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jun 2021 09:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhFUJmK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jun 2021 05:42:10 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12185 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230304AbhFUJmK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jun 2021 05:42:10 -0400
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; 
   d="scan'208";a="84924638"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jun 2021 18:39:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 04030400C4C3;
        Mon, 21 Jun 2021 18:39:52 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 02/11] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks
Date:   Mon, 21 Jun 2021 10:39:34 +0100
Message-Id: <20210621093943.12143-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clock entries for USB PHY control, USB2.0 host and device.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
 * Reworked on clock/reset definitions
---
 drivers/clk/renesas/r9a07g044-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index bdede1d28086..0a17cf7cb548 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -108,6 +108,18 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 	DEF_MOD("dmac_pclk",	R9A07G044_DMAC_PCLK,
 				CLK_P1_DIV2,
 				0x52c, BIT(1), BIT(1)),
+	DEF_MOD("usb_pclk",	R9A07G044_USB_PCLK,
+				R9A07G044_CLK_P1,
+				0x578, BIT(3), BIT(3)),
+	DEF_MOD("usb_function",	R9A07G044_USB_U2P_EXR_CPUCLK,
+				R9A07G044_CLK_P1,
+				0x578, BIT(2), BIT(2)),
+	DEF_MOD("usb_host1",	R9A07G044_USB_U2H1_HCLK,
+				R9A07G044_CLK_P1,
+				0x578, BIT(1), BIT(1)),
+	DEF_MOD("usb_host0",	R9A07G044_USB_U2H0_HCLK,
+				R9A07G044_CLK_P1,
+				0x578, BIT(0), BIT(0)),
 	DEF_MOD("i2c0",		R9A07G044_I2C0_PCLK,
 				R9A07G044_CLK_P0,
 				0x580, BIT(0), BIT(0)),
-- 
2.17.1

