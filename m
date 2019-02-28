Return-Path: <SRS0=eSXj=RD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25C4C10F00
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 13:52:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 965CD214D8
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 13:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="QNqPX2CN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbfB1Nwy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Feb 2019 08:52:54 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:43906 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbfB1Nwy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Feb 2019 08:52:54 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6EDF725BEC6;
        Fri,  1 Mar 2019 00:52:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551361972; bh=zI0kZG463S82ZzAj8vnPDU2soEyWqPZr+AKTYEQfdho=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QNqPX2CNoJBtboPYQyb6b/jdFjy4ml00T4bH9sRRJwoD8caXAzG5dguxREvzSFpzX
         5EBrpbriK8ZP65E9znEDWfbIRElMSBR4J7cilJrTQYKy/8bJjDi8J9ANNCTnTtMWod
         P4lzGNKOcfoR6mD9vLcw0g/YuJ7dway5BFu0qFn0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 50C959403EF; Thu, 28 Feb 2019 14:52:50 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/4] clk: renesas: r8a77990: Add ZG clock
Date:   Thu, 28 Feb 2019 14:52:44 +0100
Message-Id: <20190228135246.31714-3-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190228135246.31714-1-horms+renesas@verge.net.au>
References: <20190228135246.31714-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Adds support for R-Car E3 (r8a77990) ZG clock.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Tested on Ebisu to the extent that the clock rate is 600MHz on boot
---
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 2 ++
 drivers/clk/renesas/rcar-gen3-cpg.c     | 1 -
 drivers/clk/renesas/rcar-gen3-cpg.h     | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 0e475dcb68b9..d0d29fc942ff 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -83,6 +83,8 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	DEF_FIXED("za8",       R8A77990_CLK_ZA8,   CLK_PLL0D8,     1, 1),
 	DEF_GEN3_Z("z2",       R8A77990_CLK_Z2,    CLK_TYPE_GEN3_Z, CLK_PLL0,
 		   4, CPG_FRQCRC, 8),
+	DEF_GEN3_Z("zg",       R8A77990_CLK_ZG,    CLK_TYPE_GEN3_Z, CLK_PLL0,
+		   8, CPG_FRQCRB, 24),
 	DEF_FIXED("ztr",       R8A77990_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A77990_CLK_ZT,    CLK_PLL1,       4, 1),
 	DEF_FIXED("zx",        R8A77990_CLK_ZX,    CLK_PLL1,       3, 1),
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 14a82c51682e..0d0e698442e2 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -70,7 +70,6 @@ static void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
  * rate - rate is adjustable.  clk->rate = (parent->rate * mult / 32 ) / 2
  * parent - fixed parent.  No clk_set_parent support
  */
-#define CPG_FRQCRB			0x00000004
 #define CPG_FRQCRB_KICK			BIT(31)
 
 struct cpg_z_clk {
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index 02bf3785263c..9525df8a835c 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -68,6 +68,7 @@ struct rcar_gen3_cpg_pll_config {
 	u8 osc_prediv;
 };
 
+#define CPG_FRQCRB	0x004
 #define CPG_FRQCRC	0x0e0
 #define CPG_RCKCR	0x240
 
-- 
2.11.0

