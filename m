Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5252C10F03
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 16:36:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85F4320863
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 16:36:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="iqlZTCof"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbfCYQgT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 12:36:19 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42086 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfCYQgT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 12:36:19 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A022825BF14;
        Tue, 26 Mar 2019 03:36:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553531770; bh=IQE8WE3zl0IXtAYgkk87m+oHFzh5mtrQqjbXc+ZriKE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iqlZTCofEg82klZTBKRmz+AJCGYMG6R0WC7jtEeqXCI59dpl/+Kg11deVV9r5VMWG
         MfeXcR6l2Io2ezEnviacGBDP6JWvYU471Y6WHpuQ+wr6joGjxyZcAJc20GAc2IspSH
         lOzDxj6E7rUpLNwB9aU334rF13XsebH0P2YjSlvU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CA9F19406BB; Mon, 25 Mar 2019 17:36:08 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v6 3/7] clk: renesas: rcar-gen3: Remove CLK_TYPE_GEN3_Z2
Date:   Mon, 25 Mar 2019 17:35:52 +0100
Message-Id: <20190325163556.22025-4-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190325163556.22025-1-horms+renesas@verge.net.au>
References: <20190325163556.22025-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After recent reworking of Z and Z2 clk handling
CLK_TYPE_GEN3_Z and CLK_TYPE_GEN3_Z2 have come to have precisely
the same meaning. Remove this redundancy by eliminating the latter.

This is not expected to have any run-time effect.

As suggested by Geert Uytterhoeven.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v6
- New patch
---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/rcar-gen3-cpg.c     | 1 -
 drivers/clk/renesas/rcar-gen3-cpg.h     | 1 -
 5 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index 8e7bb43b6848..44161fd0a09c 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -72,7 +72,7 @@ static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {
 
 	/* Core Clock Outputs */
 	DEF_GEN3_Z("z",		R8A774A1_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
-	DEF_GEN3_Z("z2",	R8A774A1_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2, 2, 0),
+	DEF_GEN3_Z("z2",	R8A774A1_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2, 2, 0),
 	DEF_FIXED("ztr",        R8A774A1_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A774A1_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A774A1_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index d09c0abb032d..8287816523c3 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -75,7 +75,7 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 
 	/* Core Clock Outputs */
 	DEF_GEN3_Z("z",         R8A7795_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
-	DEF_GEN3_Z("z2",        R8A7795_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2, 2, 0),
+	DEF_GEN3_Z("z2",        R8A7795_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2, 2, 0),
 	DEF_FIXED("ztr",        R8A7795_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A7795_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A7795_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 7efd0311dcbd..5cde1bff8923 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -75,7 +75,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 
 	/* Core Clock Outputs */
 	DEF_GEN3_Z("z",         R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
-	DEF_GEN3_Z("z2",        R8A7796_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL2, 2, 0),
+	DEF_GEN3_Z("z2",        R8A7796_CLK_Z2,    CLK_TYPE_GEN3_Z,  CLK_PLL2, 2, 0),
 	DEF_FIXED("ztr",        R8A7796_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A7796_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A7796_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 9af3e1ece81a..a46c5dffbc24 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -659,7 +659,6 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		break;
 
 	case CLK_TYPE_GEN3_Z:
-	case CLK_TYPE_GEN3_Z2:
 		return cpg_z_clk_register(core->name, __clk_get_name(parent),
 					  base, core->div, core->offset);
 
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index 9b4bb763f599..15700d219a05 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -21,7 +21,6 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_R,
 	CLK_TYPE_GEN3_MDSEL,	/* Select parent/divider using mode pin */
 	CLK_TYPE_GEN3_Z,
-	CLK_TYPE_GEN3_Z2,
 	CLK_TYPE_GEN3_OSC,	/* OSC EXTAL predivider and fixed divider */
 	CLK_TYPE_GEN3_RCKSEL,	/* Select parent/divider using RCKCR.CKSEL */
 	CLK_TYPE_GEN3_RPCSRC,
-- 
2.11.0

