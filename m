Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAB6C282D8
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:40:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E1A7218A4
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="gT7GPU5m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730386AbfA3Jky (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 04:40:54 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38534 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfA3Jkx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 04:40:53 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0DD9325BE91;
        Wed, 30 Jan 2019 20:40:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548841245; bh=iEhMJruFvmlAneE/4lrBc0v0QceiwLpPvctbdnyfBLA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gT7GPU5mElWCYCYjyg6rwrLayHl1fxF7RM/nGkdHLPiGV1Kgeke+jrM96b3u3wBGC
         27X6N5PhN96JlKX2bpzazkwnrKp7jGhtRkwyxHnvfr4wrrN4/wBV3L0XMg0Pq6nEpi
         IL7lzKd5MOktxVsuIrD0PhpIei1ip/3dAkNQEFbc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3F4EE940461; Wed, 30 Jan 2019 10:40:43 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 2/6] clk: renesas: rcar-gen3: Support r8a77990 Z2 clock divider
Date:   Wed, 30 Jan 2019 10:40:25 +0100
Message-Id: <20190130094029.9604-3-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190130094029.9604-1-horms+renesas@verge.net.au>
References: <20190130094029.9604-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Add support for the Z2 clock divider for the R-Car E3 (r8a77990) SoC.
On this SoC the Z2 clock divider bits of the FRQCRC register are found at
bit[12:8] rather than the more common location bit[4:0].

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[simon: reworked changelog]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index d50dd53121bb..db3b2efb40e9 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -74,6 +74,7 @@ static void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
 #define CPG_FRQCRB_KICK			BIT(31)
 #define CPG_FRQCRC			0x000000e0
 #define CPG_FRQCRC_ZFC_MASK		GENMASK(12, 8)
+#define CPG_FRQCRC_Z2FC_SFT_8_MASK	GENMASK(12, 8)
 #define CPG_FRQCRC_Z2FC_MASK		GENMASK(4, 0)
 
 struct cpg_z_clk {
@@ -365,6 +366,7 @@ static u32 cpg_quirks __initdata;
 #define PLL_ERRATA	BIT(0)		/* Missing PLL0/2/4 post-divider */
 #define RCKCR_CKSEL	BIT(1)		/* Manual RCLK parent selection */
 #define SD_SKIP_FIRST	BIT(2)		/* Skip first clock in SD table */
+#define Z2FC_BIT_MASK_SFT_8	BIT(3)	/* Use Z2FC bit mask range to [12:8] */
 
 static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 	void __iomem *base, const char *parent_name,
@@ -445,6 +447,10 @@ static const struct soc_device_attribute cpg_quirks_match[] __initconst = {
 		.soc_id = "r8a7796", .revision = "ES1.1",
 		.data = (void *)SD_SKIP_FIRST,
 	},
+	{
+		.soc_id = "r8a77990",
+		.data = (void *)Z2FC_BIT_MASK_SFT_8,
+	},
 	{ /* sentinel */ }
 };
 
@@ -572,6 +578,12 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 					  base, CPG_FRQCRC_ZFC_MASK, core->div);
 
 	case CLK_TYPE_GEN3_Z2:
+		if (cpg_quirks & Z2FC_BIT_MASK_SFT_8)
+			return cpg_z_clk_register(core->name,
+						  __clk_get_name(parent), base,
+						  CPG_FRQCRC_Z2FC_SFT_8_MASK,
+						  core->div);
+
 		return cpg_z_clk_register(core->name, __clk_get_name(parent),
 					  base, CPG_FRQCRC_Z2FC_MASK,
 					  core->div);
-- 
2.11.0

