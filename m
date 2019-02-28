Return-Path: <SRS0=eSXj=RD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36630C10F00
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 13:52:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05CD1214D8
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 13:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="KubqoJ/Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731009AbfB1Nw6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Feb 2019 08:52:58 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:43912 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbfB1Nw6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Feb 2019 08:52:58 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7749325BEDF;
        Fri,  1 Mar 2019 00:52:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551361972; bh=DojpPcu0E5YDb08jzcAkU7iZleQEN0lBQhdlwRn7dRo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KubqoJ/ZKluKD1YC4jStvR3ZFp0pcP8GC1/no7YpTC06iEY2DiACSDNRalsbbN/ko
         0mEEeR8lWrYcfm4s/fM6kOT+XCeDk/UT2wsfi7Dc9uSNCMHu06tRsnhkLZw+2FuVao
         tve24cTxbs/igBtq18kUUTwisdniEEhNIDla/APk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4039D94030D; Thu, 28 Feb 2019 14:52:50 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/4] clk: renesas: rcar-gen3: Parameterise Z and Z2 clock register offset
Date:   Thu, 28 Feb 2019 14:52:43 +0100
Message-Id: <20190228135246.31714-2-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190228135246.31714-1-horms+renesas@verge.net.au>
References: <20190228135246.31714-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Parameterise the offset of the control register for
for Z and Z2 clocks.

This is in preparation for supporting the ZG clock on the R-Car E3
(r8a77990), D3 (r8a7795) and RZ/G2E (r8a774c0) SoCs which uses a different
control register to existing support for Z and Z2 clocks.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Tested for regressions on Ebisu by using CPUFreq to alter Z and Z2 clock rates
---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  6 ++++--
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  3 ++-
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  6 ++++--
 drivers/clk/renesas/r8a7796-cpg-mssr.c  |  6 ++++--
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  3 ++-
 drivers/clk/renesas/r8a77990-cpg-mssr.c |  3 ++-
 drivers/clk/renesas/rcar-gen3-cpg.c     | 10 +++++-----
 drivers/clk/renesas/rcar-gen3-cpg.h     | 13 +++++++++++--
 8 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index d93eb4da152b..9ac61fae993a 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -71,8 +71,10 @@ static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
 	/* Core Clock Outputs */
-	DEF_GEN3_Z("z",		R8A774A1_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
-	DEF_GEN3_Z("z2",	R8A774A1_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2, 2, 0),
+	DEF_GEN3_Z("z",		R8A774A1_CLK_Z,     CLK_TYPE_GEN3_Z,
+		   CLK_PLL0, 2, CPG_FRQCRC, 8),
+	DEF_GEN3_Z("z2",	R8A774A1_CLK_Z2,    CLK_TYPE_GEN3_Z,
+		   CLK_PLL2, 2, CPG_FRQCRC, 0),
 	DEF_FIXED("ztr",        R8A774A1_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A774A1_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A774A1_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index 5ba575242eee..d9130723d6c8 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -79,7 +79,8 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
 	/* Core Clock Outputs */
 	DEF_FIXED("za2",       R8A774C0_CLK_ZA2,   CLK_PLL0D24,    1, 1),
 	DEF_FIXED("za8",       R8A774C0_CLK_ZA8,   CLK_PLL0D8,     1, 1),
-	DEF_GEN3_Z("z2",       R8A774C0_CLK_Z2,    CLK_TYPE_GEN3_Z, CLK_PLL0, 4, 8),
+	DEF_GEN3_Z("z2",       R8A774C0_CLK_Z2,    CLK_TYPE_GEN3_Z,
+		   CLK_PLL0, 4, CPG_FRQCRC, 8),
 	DEF_FIXED("ztr",       R8A774C0_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A774C0_CLK_ZT,    CLK_PLL1,       4, 1),
 	DEF_FIXED("zx",        R8A774C0_CLK_ZX,    CLK_PLL1,       3, 1),
diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 8287816523c3..935085161b47 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -74,8 +74,10 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
 	/* Core Clock Outputs */
-	DEF_GEN3_Z("z",         R8A7795_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
-	DEF_GEN3_Z("z2",        R8A7795_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2, 2, 0),
+	DEF_GEN3_Z("z",         R8A7795_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0,
+		   2, CPG_FRQCRC, 8),
+	DEF_GEN3_Z("z2",        R8A7795_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2,
+		   2, CPG_FRQCRC, 0),
 	DEF_FIXED("ztr",        R8A7795_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A7795_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A7795_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 5cde1bff8923..ca7fcec5bce2 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -74,8 +74,10 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
 	/* Core Clock Outputs */
-	DEF_GEN3_Z("z",         R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
-	DEF_GEN3_Z("z2",        R8A7796_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2, 2, 0),
+	DEF_GEN3_Z("z",         R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0,
+		   2, CPG_FRQCRC, 8),
+	DEF_GEN3_Z("z2",        R8A7796_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2,
+		   2, CPG_FRQCRC, 0),
 	DEF_FIXED("ztr",        R8A7796_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A7796_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A7796_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index fefa26a1a797..fb5de677f828 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -71,7 +71,8 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 	DEF_GEN3_OSC(".r",	CLK_RINT,		CLK_EXTAL,	32),
 
 	/* Core Clock Outputs */
-	DEF_GEN3_Z("z",		R8A77965_CLK_Z,		CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
+	DEF_GEN3_Z("z",		R8A77965_CLK_Z,		CLK_TYPE_GEN3_Z,
+		   CLK_PLL0, 2, CPG_FRQCRC, 8),
 	DEF_FIXED("ztr",	R8A77965_CLK_ZTR,	CLK_PLL1_DIV2,	6, 1),
 	DEF_FIXED("ztrd2",	R8A77965_CLK_ZTRD2,	CLK_PLL1_DIV2,	12, 1),
 	DEF_FIXED("zt",		R8A77965_CLK_ZT,	CLK_PLL1_DIV2,	4, 1),
diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 99f602cb30a5..0e475dcb68b9 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -81,7 +81,8 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	/* Core Clock Outputs */
 	DEF_FIXED("za2",       R8A77990_CLK_ZA2,   CLK_PLL0D24,    1, 1),
 	DEF_FIXED("za8",       R8A77990_CLK_ZA8,   CLK_PLL0D8,     1, 1),
-	DEF_GEN3_Z("z2",       R8A77990_CLK_Z2,    CLK_TYPE_GEN3_Z, CLK_PLL0, 4, 8),
+	DEF_GEN3_Z("z2",       R8A77990_CLK_Z2,    CLK_TYPE_GEN3_Z, CLK_PLL0,
+		   4, CPG_FRQCRC, 8),
 	DEF_FIXED("ztr",       R8A77990_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A77990_CLK_ZT,    CLK_PLL1,       4, 1),
 	DEF_FIXED("zx",        R8A77990_CLK_ZX,    CLK_PLL1,       3, 1),
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index a40ad6d03ece..14a82c51682e 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -72,7 +72,6 @@ static void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
  */
 #define CPG_FRQCRB			0x00000004
 #define CPG_FRQCRB_KICK			BIT(31)
-#define CPG_FRQCRC			0x000000e0
 
 struct cpg_z_clk {
 	struct clk_hw hw;
@@ -166,7 +165,7 @@ static const struct clk_ops cpg_z_clk_ops = {
 
 static struct clk * __init cpg_z_clk_register(const char *name,
 					      const char *parent_name,
-					      void __iomem *reg,
+					      void __iomem *base,
 					      unsigned int div,
 					      unsigned int offset)
 {
@@ -184,10 +183,11 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
-	zclk->reg = reg + CPG_FRQCRC;
-	zclk->kick_reg = reg + CPG_FRQCRB;
+	zclk->reg = base + GEN3_Z_REG_OFFSET(offset);
+	zclk->kick_reg = base + CPG_FRQCRB;
 	zclk->hw.init = &init;
-	zclk->mask = GENMASK(offset + 4, offset);
+	zclk->mask = GENMASK(GEN3_Z_BIT_OFFSET(offset) + 4,
+			     GEN3_Z_BIT_OFFSET(offset));
 	zclk->fixed_div = div; /* PLLVCO x 1/div x SYS-CPU divider */
 
 	clk = clk_register(NULL, &zclk->hw);
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index a0535341b5da..02bf3785263c 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -48,8 +48,16 @@ enum rcar_gen3_clk_types {
 	DEF_BASE(_name, _id, CLK_TYPE_GEN3_RCKSEL,	\
 		 (_parent0) << 16 | (_parent1),	.div = (_div0) << 16 | (_div1))
 
-#define DEF_GEN3_Z(_name, _id, _type, _parent, _div, _offset)	\
-	DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = _offset)
+#define DEF_GEN3_Z_OFFSET(_reg_offset, _bit_offset) \
+	((_reg_offset) << 16 | (_bit_offset) )
+
+#define GEN3_Z_REG_OFFSET(_offset) ((_offset) >> 16)
+
+#define GEN3_Z_BIT_OFFSET(_offset) ((_offset) & 0xffff)
+
+#define DEF_GEN3_Z(_name, _id, _type, _parent, _div, _reg_offset, _bit_offset)\
+	DEF_BASE(_name, _id, _type, _parent, .div = _div, \
+		 .offset = DEF_GEN3_Z_OFFSET(_reg_offset, _bit_offset))
 
 struct rcar_gen3_cpg_pll_config {
 	u8 extal_div;
@@ -60,6 +68,7 @@ struct rcar_gen3_cpg_pll_config {
 	u8 osc_prediv;
 };
 
+#define CPG_FRQCRC	0x0e0
 #define CPG_RCKCR	0x240
 
 struct clk *rcar_gen3_cpg_clk_register(struct device *dev,
-- 
2.11.0

