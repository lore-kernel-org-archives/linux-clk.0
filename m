Return-Path: <SRS0=O/eU=PY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0192CC43612
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jan 2019 19:46:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1C1220868
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jan 2019 19:46:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731484AbfAPTp6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jan 2019 14:45:58 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:10113 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731174AbfAPTp6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Jan 2019 14:45:58 -0500
X-IronPort-AV: E=Sophos;i="5.56,487,1539615600"; 
   d="scan'208";a="5357751"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jan 2019 04:45:55 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.37.13])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0EA9E401DD31;
        Thu, 17 Jan 2019 04:45:48 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <treding@nvidia.com>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Lukasz Majewski <lukma@denx.de>,
        Michal Simek <monstr@monstr.eu>,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ben Whitten <ben.whitten@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-can@vger.kernel.org, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>,
        ebiharaml@si-linux.co.jp
Subject: [PATCH v2 08/11] clk: renesas: r8a774c0: Add missing CANFD clock
Date:   Wed, 16 Jan 2019 19:45:45 +0000
Message-Id: <1547667945-5588-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds the missing CANFD clock to the r8a774c0 specific
clock driver.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

---
The relevant documentation should appear in the next version
of the HW User's manual

v1->v2:
* appended R8A774C0_CLK_CANFD as per Geert's comment

 drivers/clk/renesas/r8a774c0-cpg-mssr.c       | 4 ++++
 include/dt-bindings/clock/r8a774c0-cpg-mssr.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index 10b9689..28bcc81 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -33,6 +33,7 @@ enum clk_ids {
 	CLK_PLL1,
 	CLK_PLL3,
 	CLK_PLL0D4,
+	CLK_PLL0D6,
 	CLK_PLL0D8,
 	CLK_PLL0D20,
 	CLK_PLL0D24,
@@ -61,6 +62,7 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
 
 	DEF_FIXED(".pll0",     CLK_PLL0,           CLK_MAIN,	   1, 100),
 	DEF_FIXED(".pll0d4",   CLK_PLL0D4,         CLK_PLL0,       4, 1),
+	DEF_FIXED(".pll0d6",   CLK_PLL0D6,         CLK_PLL0,       6, 1),
 	DEF_FIXED(".pll0d8",   CLK_PLL0D8,         CLK_PLL0,       8, 1),
 	DEF_FIXED(".pll0d20",  CLK_PLL0D20,        CLK_PLL0,      20, 1),
 	DEF_FIXED(".pll0d24",  CLK_PLL0D24,        CLK_PLL0,      24, 1),
@@ -112,6 +114,7 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
 	DEF_GEN3_PE("s3d2c",   R8A774C0_CLK_S3D2C, CLK_S3, 2, CLK_PE, 2),
 	DEF_GEN3_PE("s3d4c",   R8A774C0_CLK_S3D4C, CLK_S3, 4, CLK_PE, 4),
 
+	DEF_DIV6P1("canfd",    R8A774C0_CLK_CANFD, CLK_PLL0D6, 0x244),
 	DEF_DIV6P1("csi0",     R8A774C0_CLK_CSI0,  CLK_PLL1D2, 0x00c),
 	DEF_DIV6P1("mso",      R8A774C0_CLK_MSO,   CLK_PLL1D2, 0x014),
 
@@ -187,6 +190,7 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
 	DEF_MOD("gpio2",		 910,	R8A774C0_CLK_S3D4),
 	DEF_MOD("gpio1",		 911,	R8A774C0_CLK_S3D4),
 	DEF_MOD("gpio0",		 912,	R8A774C0_CLK_S3D4),
+	DEF_MOD("can-fd",		 914,	R8A774C0_CLK_S3D2),
 	DEF_MOD("can-if1",		 915,	R8A774C0_CLK_S3D4),
 	DEF_MOD("can-if0",		 916,	R8A774C0_CLK_S3D4),
 	DEF_MOD("i2c6",			 918,	R8A774C0_CLK_S3D2),
diff --git a/include/dt-bindings/clock/r8a774c0-cpg-mssr.h b/include/dt-bindings/clock/r8a774c0-cpg-mssr.h
index 8fe51b6..8ad9cd6 100644
--- a/include/dt-bindings/clock/r8a774c0-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a774c0-cpg-mssr.h
@@ -56,5 +56,6 @@
 #define R8A774C0_CLK_CSI0		45
 #define R8A774C0_CLK_CP			46
 #define R8A774C0_CLK_CPEX		47
+#define R8A774C0_CLK_CANFD		48
 
 #endif /* __DT_BINDINGS_CLOCK_R8A774C0_CPG_MSSR_H__ */
-- 
2.7.4

