Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41755C4360F
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 16:36:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 123DF2087C
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 16:36:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="i6shlfcV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728991AbfCYQgR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 12:36:17 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42086 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfCYQgR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 12:36:17 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 77CE725BF11;
        Tue, 26 Mar 2019 03:36:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553531770; bh=hTBOP4/q8S38Fvveefu/jLfh/8DqZvlAyVPGzLc5Ud4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i6shlfcV8yhiI7R231np1KUhUH9xLSpvhqDh+JCQTu/QBwmFVITybhu2GkAeFmXL3
         Bz4/3Gbed/m4r/Ch1rzdev57NDPLu275M5IwsPnkfeZWzgXooYmBV1BeI7fF7hWo+g
         1uEtMUTdPHzsRjTjfomXinDAMVn0lsfaxaUxsjPU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B3DB19405D8; Mon, 25 Mar 2019 17:36:08 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v6 2/7] clk: renesas: rcar-gen3: Parameterise Z and Z2 clock offset
Date:   Mon, 25 Mar 2019 17:35:51 +0100
Message-Id: <20190325163556.22025-3-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190325163556.22025-1-horms+renesas@verge.net.au>
References: <20190325163556.22025-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Parameterise the offset of control bits within the FRQCRC register
for Z and Z2 clocks.

This is in preparation for supporting the Z2 clock on the R-Car E3
(r8a77990) SoC which uses a different offset for control bits to
other, already, supported SoCs.

As suggested by Geert Uytterhoeven.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v6
- Revise changelog

v3
- New patch
---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  4 ++--
 drivers/clk/renesas/r8a7795-cpg-mssr.c  |  4 ++--
 drivers/clk/renesas/r8a7796-cpg-mssr.c  |  4 ++--
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  2 +-
 drivers/clk/renesas/rcar-gen3-cpg.c     | 15 ++++-----------
 drivers/clk/renesas/rcar-gen3-cpg.h     |  4 ++--
 6 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index 99bcb7c8022f..8e7bb43b6848 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -71,8 +71,8 @@ static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
 	/* Core Clock Outputs */
-	DEF_GEN3_Z("z",		R8A774A1_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0, 2),
-	DEF_GEN3_Z("z2",	R8A774A1_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2, 2),
+	DEF_GEN3_Z("z",		R8A774A1_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
+	DEF_GEN3_Z("z2",	R8A774A1_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2, 2, 0),
 	DEF_FIXED("ztr",        R8A774A1_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A774A1_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A774A1_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index d4cf1c91533e..d09c0abb032d 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -74,8 +74,8 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
 	/* Core Clock Outputs */
-	DEF_GEN3_Z("z",         R8A7795_CLK_Z,	   CLK_TYPE_GEN3_Z,  CLK_PLL0, 2),
-	DEF_GEN3_Z("z2",        R8A7795_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2, 2),
+	DEF_GEN3_Z("z",         R8A7795_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
+	DEF_GEN3_Z("z2",        R8A7795_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2, 2, 0),
 	DEF_FIXED("ztr",        R8A7795_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A7795_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A7795_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 77254f2b4519..7efd0311dcbd 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -74,8 +74,8 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
 	/* Core Clock Outputs */
-	DEF_GEN3_Z("z",         R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2),
-	DEF_GEN3_Z("z2",        R8A7796_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2, 2),
+	DEF_GEN3_Z("z",         R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
+	DEF_GEN3_Z("z2",        R8A7796_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2, 2, 0),
 	DEF_FIXED("ztr",        R8A7796_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A7796_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A7796_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index f8f73558c1ec..fefa26a1a797 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -71,7 +71,7 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 	DEF_GEN3_OSC(".r",	CLK_RINT,		CLK_EXTAL,	32),
 
 	/* Core Clock Outputs */
-	DEF_GEN3_Z("z",		R8A77965_CLK_Z,		CLK_TYPE_GEN3_Z,  CLK_PLL0, 2),
+	DEF_GEN3_Z("z",		R8A77965_CLK_Z,		CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
 	DEF_FIXED("ztr",	R8A77965_CLK_ZTR,	CLK_PLL1_DIV2,	6, 1),
 	DEF_FIXED("ztrd2",	R8A77965_CLK_ZTRD2,	CLK_PLL1_DIV2,	12, 1),
 	DEF_FIXED("zt",		R8A77965_CLK_ZT,	CLK_PLL1_DIV2,	4, 1),
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index be0940c8103c..9af3e1ece81a 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -88,8 +88,6 @@ static void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
 #define CPG_FRQCRB			0x00000004
 #define CPG_FRQCRB_KICK			BIT(31)
 #define CPG_FRQCRC			0x000000e0
-#define CPG_FRQCRC_ZFC_MASK		GENMASK(12, 8)
-#define CPG_FRQCRC_Z2FC_MASK		GENMASK(4, 0)
 
 struct cpg_z_clk {
 	struct clk_hw hw;
@@ -180,8 +178,8 @@ static const struct clk_ops cpg_z_clk_ops = {
 static struct clk * __init cpg_z_clk_register(const char *name,
 					      const char *parent_name,
 					      void __iomem *reg,
-					      unsigned long mask,
-					      unsigned int div)
+					      unsigned int div,
+					      unsigned int offset)
 {
 	struct clk_init_data init;
 	struct cpg_z_clk *zclk;
@@ -200,7 +198,7 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 	zclk->reg = reg + CPG_FRQCRC;
 	zclk->kick_reg = reg + CPG_FRQCRB;
 	zclk->hw.init = &init;
-	zclk->mask = mask;
+	zclk->mask = GENMASK(offset + 4, offset);
 	zclk->fixed_div = div; /* PLLVCO x 1/div x SYS-CPU divider */
 
 	clk = clk_register(NULL, &zclk->hw);
@@ -661,14 +659,9 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		break;
 
 	case CLK_TYPE_GEN3_Z:
-		return cpg_z_clk_register(core->name, __clk_get_name(parent),
-					  base, CPG_FRQCRC_ZFC_MASK,
-					  core->div);
-
 	case CLK_TYPE_GEN3_Z2:
 		return cpg_z_clk_register(core->name, __clk_get_name(parent),
-					  base, CPG_FRQCRC_Z2FC_MASK,
-					  core->div);
+					  base, core->div, core->offset);
 
 	case CLK_TYPE_GEN3_OSC:
 		/*
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index 802936625330..9b4bb763f599 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -52,8 +52,8 @@ enum rcar_gen3_clk_types {
 	DEF_BASE(_name, _id, CLK_TYPE_GEN3_RCKSEL,	\
 		 (_parent0) << 16 | (_parent1),	.div = (_div0) << 16 | (_div1))
 
-#define DEF_GEN3_Z(_name, _id, _type, _parent, _div)	\
-	DEF_BASE(_name, _id, _type, _parent, .div = _div)
+#define DEF_GEN3_Z(_name, _id, _type, _parent, _div, _offset)	\
+	DEF_BASE(_name, _id, _type, _parent, .div = _div, .offset = _offset)
 
 struct rcar_gen3_cpg_pll_config {
 	u8 extal_div;
-- 
2.11.0

