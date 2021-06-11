Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698E8C48BE5
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 11:36:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 546F261287
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 11:36:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbhFKLiv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jun 2021 07:38:51 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:42669 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230514AbhFKLiv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Jun 2021 07:38:51 -0400
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="83950424"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2021 20:36:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DA133401BBFD;
        Fri, 11 Jun 2021 20:36:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/5] drivers: clk: renesas: r9a07g044-cpg: Add DMAC clocks
Date:   Fri, 11 Jun 2021 12:36:39 +0100
Message-Id: <20210611113642.18457-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210611113642.18457-1-biju.das.jz@bp.renesas.com>
References: <20210611113642.18457-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add DMAC clock entry in CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
This patch series is depend on [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210609153230.6967-10-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/clk/renesas/r9a07g044-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 50b5269586a4..04123908511c 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -85,6 +85,9 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 	DEF_MOD("ia55",		R9A07G044_CLK_IA55,
 				R9A07G044_CLK_P1,
 				0x518, (BIT(0) | BIT(1)), BIT(0)),
+	DEF_MOD("dmac",		R9A07G044_CLK_DMAC,
+				R9A07G044_CLK_P1,
+				0x52c, (BIT(0) | BIT(1)), (BIT(0) | BIT(1))),
 	DEF_MOD("scif0",	R9A07G044_CLK_SCIF0,
 				R9A07G044_CLK_P0,
 				0x584, BIT(0), BIT(0)),
-- 
2.17.1

