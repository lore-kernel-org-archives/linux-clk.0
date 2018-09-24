Return-Path: <SRS0=Dsg5=MG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C0EECE560
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 16:50:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 260F1206B7
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 16:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 260F1206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730507AbeIXWxT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Sep 2018 18:53:19 -0400
Received: from relmlor3.renesas.com ([210.160.252.173]:46921 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728006AbeIXWxT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 18:53:19 -0400
Received: from unknown (HELO relmlir1.idc.renesas.com) ([10.200.68.151])
  by relmlie2.idc.renesas.com with ESMTP; 25 Sep 2018 01:50:14 +0900
Received: from relmlii1.idc.renesas.com (relmlii1.idc.renesas.com [10.200.68.65])
        by relmlir1.idc.renesas.com (Postfix) with ESMTP id 64A9644848;
        Tue, 25 Sep 2018 01:50:14 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,298,1534777200"; 
   d="scan'208";a="291770688"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii1.idc.renesas.com with ESMTP; 25 Sep 2018 01:50:13 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.87])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 367EB224;
        Mon, 24 Sep 2018 16:50:08 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 2/3] clk: renesas: r7s9210: Convert some clocks to early
Date:   Mon, 24 Sep 2018 11:49:36 -0500
Message-Id: <20180924164937.36536-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180924164937.36536-1-chris.brandt@renesas.com>
References: <20180924164937.36536-1-chris.brandt@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180924164936.dDhReDFo-w1eanty5vXX1GrSfbgPmYCNcC8pXVgy4j0@z>

The OSTM timer driver for RZ/A2 uses TIMER_OF_DECLARE which requires the
ostm module clocks to be registers early in boot.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * List early clocks first
 * Remove unnecessary comments
 * Removed new function r7s9210_update_clk_table (to be included in a
   separate patch)
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index bd1dd4ff2051..7ab9030ef8b9 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -53,7 +53,7 @@ enum clk_ids {
 	MOD_CLK_BASE
 };
 
-static struct cpg_core_clk r7s9210_core_clks[] = {
+static struct cpg_core_clk r7s9210_early_core_clks[] = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal",     CLK_EXTAL),
 
@@ -61,20 +61,26 @@ static struct cpg_core_clk r7s9210_core_clks[] = {
 	DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_RZA_MAIN, CLK_EXTAL),
 	DEF_BASE(".pll",       CLK_PLL, CLK_TYPE_RZA_PLL, CLK_MAIN),
 
+	/* Core Clock Outputs */
+	DEF_FIXED("p1c",    R7S9210_CLK_P1C,   CLK_PLL,         16, 1),
+};
+
+static const struct mssr_mod_clk r7s9210_early_mod_clks[] __initconst = {
+	DEF_MOD_STB("ostm2",	 34,	R7S9210_CLK_P1C),
+	DEF_MOD_STB("ostm1",	 35,	R7S9210_CLK_P1C),
+	DEF_MOD_STB("ostm0",	 36,	R7S9210_CLK_P1C),
+};
+
+static struct cpg_core_clk r7s9210_core_clks[] = {
 	/* Core Clock Outputs */
 	DEF_FIXED("i",      R7S9210_CLK_I,     CLK_PLL,          2, 1),
 	DEF_FIXED("g",      R7S9210_CLK_G,     CLK_PLL,          4, 1),
 	DEF_FIXED("b",      R7S9210_CLK_B,     CLK_PLL,          8, 1),
 	DEF_FIXED("p1",     R7S9210_CLK_P1,    CLK_PLL,         16, 1),
-	DEF_FIXED("p1c",    R7S9210_CLK_P1C,   CLK_PLL,         16, 1),
 	DEF_FIXED("p0",     R7S9210_CLK_P0,    CLK_PLL,         32, 1),
 };
 
 static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
-	DEF_MOD_STB("ostm2",	 34,	R7S9210_CLK_P1C),
-	DEF_MOD_STB("ostm1",	 35,	R7S9210_CLK_P1C),
-	DEF_MOD_STB("ostm0",	 36,	R7S9210_CLK_P1C),
-
 	DEF_MOD_STB("scif4",	 43,	R7S9210_CLK_P1C),
 	DEF_MOD_STB("scif3",	 44,	R7S9210_CLK_P1C),
 	DEF_MOD_STB("scif2",	 45,	R7S9210_CLK_P1C),
@@ -170,6 +176,12 @@ struct clk * __init rza2_cpg_clk_register(struct device *dev,
 }
 
 const struct cpg_mssr_info r7s9210_cpg_mssr_info __initconst = {
+	/* Early Clocks */
+	.early_core_clks = r7s9210_early_core_clks,
+	.num_early_core_clks = ARRAY_SIZE(r7s9210_early_core_clks),
+	.early_mod_clks = r7s9210_early_mod_clks,
+	.num_early_mod_clks = ARRAY_SIZE(r7s9210_early_mod_clks),
+
 	/* Core Clocks */
 	.core_clks = r7s9210_core_clks,
 	.num_core_clks = ARRAY_SIZE(r7s9210_core_clks),
@@ -187,3 +199,11 @@ const struct cpg_mssr_info r7s9210_cpg_mssr_info __initconst = {
 	/* RZ/A2 has Standby Control Registers */
 	.stbyctrl = true,
 };
+
+static void __init r7s9210_cpg_mssr_early_init(struct device_node *np)
+{
+	cpg_mssr_early_init(np, &r7s9210_cpg_mssr_info);
+}
+
+CLK_OF_DECLARE_DRIVER(cpg_mstp_clks, "renesas,r7s9210-cpg-mssr",
+		      r7s9210_cpg_mssr_early_init);
-- 
2.16.1

