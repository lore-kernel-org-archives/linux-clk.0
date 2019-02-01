Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F26C282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 10:16:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82AC6218A6
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 10:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfBAKQA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 05:16:00 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:9387 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726116AbfBAKQA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 05:16:00 -0500
X-IronPort-AV: E=Sophos;i="5.56,548,1539615600"; 
   d="scan'208";a="6600158"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Feb 2019 19:15:57 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E818943DD872;
        Fri,  1 Feb 2019 19:15:55 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/5] clk: renesas: r8a774c0: Add TMU clock
Date:   Fri,  1 Feb 2019 10:10:39 +0000
Message-Id: <1549015841-33536-4-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549015841-33536-1-git-send-email-biju.das@bp.renesas.com>
References: <1549015841-33536-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds TMU clock to the R8A774C0 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index 10b9689..5953f5c 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -119,6 +119,11 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
+	DEF_MOD("tmu4",			 121,	R8A774C0_CLK_S0D6),
+	DEF_MOD("tmu3",			 122,	R8A774C0_CLK_S3D2),
+	DEF_MOD("tmu2",			 123,	R8A774C0_CLK_S3D2),
+	DEF_MOD("tmu1",			 124,	R8A774C0_CLK_S3D2),
+	DEF_MOD("tmu0",			 125,	R8A774C0_CLK_CP),
 	DEF_MOD("scif5",		 202,	R8A774C0_CLK_S3D4C),
 	DEF_MOD("scif4",		 203,	R8A774C0_CLK_S3D4C),
 	DEF_MOD("scif3",		 204,	R8A774C0_CLK_S3D4C),
-- 
2.7.4

