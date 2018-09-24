Return-Path: <SRS0=Dsg5=MG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DEEECE560
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 16:50:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B82E206B7
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 16:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B82E206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732257AbeIXWxU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Sep 2018 18:53:20 -0400
Received: from relmlor3.renesas.com ([210.160.252.173]:46921 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728006AbeIXWxU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 18:53:20 -0400
Received: from unknown (HELO relmlir2.idc.renesas.com) ([10.200.68.152])
  by relmlie2.idc.renesas.com with ESMTP; 25 Sep 2018 01:50:14 +0900
Received: from relmlii2.idc.renesas.com (relmlii2.idc.renesas.com [10.200.68.66])
        by relmlir2.idc.renesas.com (Postfix) with ESMTP id 64306422DA;
        Tue, 25 Sep 2018 01:50:14 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,298,1534777200"; 
   d="scan'208";a="293339470"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii2.idc.renesas.com with ESMTP; 25 Sep 2018 01:50:13 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.87])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 03B7C225;
        Mon, 24 Sep 2018 16:50:08 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 3/3] clk: renesas: r7s9210: Move table update to separate function
Date:   Mon, 24 Sep 2018 11:49:37 -0500
Message-Id: <20180924164937.36536-4-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180924164937.36536-1-chris.brandt@renesas.com>
References: <20180924164937.36536-1-chris.brandt@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180924164937.8Zlrl2i7ii1IWZTvRY-wYjGfINam_CvTOlGU_g2qVnc@z>

Same functionality, just easier to read.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c | 94 ++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index 7ab9030ef8b9..f9c22b61883b 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -97,6 +97,53 @@ static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
 
 };
 
+/* The clock dividers in the table vary based on DT and register settings */
+static void r7s9210_update_clk_table(struct clk *extal_clk, void __iomem *base)
+{
+	int i;
+	u16 frqcr;
+	u8 index;
+
+	/* If EXTAL is above 12MHz, then we know it is Mode 1 */
+	if (clk_get_rate(extal_clk) > 12000000)
+		cpg_mode = 1;
+
+	frqcr = clk_readl(base + CPG_FRQCR) & 0xFFF;
+	if (frqcr == 0x012)
+		index = 0;
+	else if (frqcr == 0x112)
+		index = 1;
+	else if (frqcr == 0x212)
+		index = 2;
+	else if (frqcr == 0x322)
+		index = 3;
+	else if (frqcr == 0x333)
+		index = 4;
+	else
+		BUG_ON(1);	/* Illegal FRQCR value */
+
+	for (i = 0; i < ARRAY_SIZE(r7s9210_core_clks); i++) {
+		switch (r7s9210_core_clks[i].id) {
+		case R7S9210_CLK_I:
+			r7s9210_core_clks[i].div = ratio_tab[index].i;
+			break;
+		case R7S9210_CLK_G:
+			r7s9210_core_clks[i].div = ratio_tab[index].g;
+			break;
+		case R7S9210_CLK_B:
+			r7s9210_core_clks[i].div = ratio_tab[index].b;
+			break;
+		case R7S9210_CLK_P1:
+		case R7S9210_CLK_P1C:
+			r7s9210_core_clks[i].div = ratio_tab[index].p1;
+			break;
+		case R7S9210_CLK_P0:
+			r7s9210_core_clks[i].div = 32;
+			break;
+		}
+	}
+}
+
 struct clk * __init rza2_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
 	struct clk **clks, void __iomem *base,
@@ -105,9 +152,6 @@ struct clk * __init rza2_cpg_clk_register(struct device *dev,
 	struct clk *parent;
 	unsigned int mult = 1;
 	unsigned int div = 1;
-	u16 frqcr;
-	u8 index;
-	int i;
 
 	parent = clks[core->parent];
 	if (IS_ERR(parent))
@@ -128,48 +172,8 @@ struct clk * __init rza2_cpg_clk_register(struct device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	/* Adjust the dividers based on the current FRQCR setting */
-	if (core->id == CLK_MAIN) {
-
-		/* If EXTAL is above 12MHz, then we know it is Mode 1 */
-		if (clk_get_rate(parent) > 12000000)
-			cpg_mode = 1;
-
-		frqcr = clk_readl(base + CPG_FRQCR) & 0xFFF;
-		if (frqcr == 0x012)
-			index = 0;
-		else if (frqcr == 0x112)
-			index = 1;
-		else if (frqcr == 0x212)
-			index = 2;
-		else if (frqcr == 0x322)
-			index = 3;
-		else if (frqcr == 0x333)
-			index = 4;
-		else
-			BUG_ON(1);	/* Illegal FRQCR value */
-
-		for (i = 0; i < ARRAY_SIZE(r7s9210_core_clks); i++) {
-			switch (r7s9210_core_clks[i].id) {
-			case R7S9210_CLK_I:
-				r7s9210_core_clks[i].div = ratio_tab[index].i;
-				break;
-			case R7S9210_CLK_G:
-				r7s9210_core_clks[i].div = ratio_tab[index].g;
-				break;
-			case R7S9210_CLK_B:
-				r7s9210_core_clks[i].div = ratio_tab[index].b;
-				break;
-			case R7S9210_CLK_P1:
-			case R7S9210_CLK_P1C:
-				r7s9210_core_clks[i].div = ratio_tab[index].p1;
-				break;
-			case R7S9210_CLK_P0:
-				r7s9210_core_clks[i].div = 32;
-				break;
-			}
-		}
-	}
+	if (core->id == CLK_MAIN)
+		r7s9210_update_clk_table(parent, base);
 
 	return clk_register_fixed_factor(NULL, core->name,
 					 __clk_get_name(parent), 0, mult, div);
-- 
2.16.1

