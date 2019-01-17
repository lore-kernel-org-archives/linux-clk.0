Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C4BC43387
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 14:54:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E45F20652
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 14:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbfAQOye (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 09:54:34 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:5344 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727083AbfAQOye (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 09:54:34 -0500
X-IronPort-AV: E=Sophos;i="5.56,489,1539615600"; 
   d="scan'208";a="5463303"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jan 2019 23:54:31 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.37.13])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7262741D99B7;
        Thu, 17 Jan 2019 23:54:26 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/3] clk: renesas: r8a774a1: Add missing CANFD clock
Date:   Thu, 17 Jan 2019 14:54:14 +0000
Message-Id: <1547736856-16539-2-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds the missing CANFD clock to the r8a774a1 specific
clock driver.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c       | 2 ++
 include/dt-bindings/clock/r8a774a1-cpg-mssr.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index 10e8525..e103741 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -102,6 +102,7 @@ static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {
 	DEF_FIXED("cp",         R8A774A1_CLK_CP,    CLK_EXTAL,      2, 1),
 	DEF_FIXED("cpex",       R8A774A1_CLK_CPEX,  CLK_EXTAL,      2, 1),
 
+	DEF_DIV6P1("canfd",     R8A774A1_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
 	DEF_DIV6P1("csi0",      R8A774A1_CLK_CSI0,  CLK_PLL1_DIV4, 0x00c),
 	DEF_DIV6P1("mso",       R8A774A1_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
 	DEF_DIV6P1("hdmi",      R8A774A1_CLK_HDMI,  CLK_PLL1_DIV4, 0x250),
@@ -191,6 +192,7 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
 	DEF_MOD("gpio2",		 910,	R8A774A1_CLK_S3D4),
 	DEF_MOD("gpio1",		 911,	R8A774A1_CLK_S3D4),
 	DEF_MOD("gpio0",		 912,	R8A774A1_CLK_S3D4),
+	DEF_MOD("can-fd",		 914,	R8A774A1_CLK_S3D2),
 	DEF_MOD("can-if1",		 915,	R8A774A1_CLK_S3D4),
 	DEF_MOD("can-if0",		 916,	R8A774A1_CLK_S3D4),
 	DEF_MOD("i2c6",			 918,	R8A774A1_CLK_S0D6),
diff --git a/include/dt-bindings/clock/r8a774a1-cpg-mssr.h b/include/dt-bindings/clock/r8a774a1-cpg-mssr.h
index 9bc5d45..e355363 100644
--- a/include/dt-bindings/clock/r8a774a1-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a774a1-cpg-mssr.h
@@ -54,5 +54,6 @@
 #define R8A774A1_CLK_CPEX		43
 #define R8A774A1_CLK_R			44
 #define R8A774A1_CLK_OSC		45
+#define R8A774A1_CLK_CANFD		46
 
 #endif /* __DT_BINDINGS_CLOCK_R8A774A1_CPG_MSSR_H__ */
-- 
2.7.4

