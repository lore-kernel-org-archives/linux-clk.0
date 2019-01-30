Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A370C282DB
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:40:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4E1F218A3
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:40:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="P9i8B2qW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730394AbfA3Jkz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 04:40:55 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38534 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfA3Jkz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 04:40:55 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2D9BF25BED6;
        Wed, 30 Jan 2019 20:40:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548841245; bh=diRwoxuhVvnwarnNhYu7lBRcX76ElJSDh5g8v/SgZ8s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P9i8B2qW5MuB6guQCvDXs9VWzxguNcBBlhRgFl8wmUIVPK7jTuQ/fR8NbYggvqw2a
         xaxWg905IPzoNajN8Be8MtTuzsykjm/eW+qKx50F9koY9wFwha71WZMhy/RjQGZGdh
         JhImm/MiCA4g/b7dtsAYbTUzhvWihlCeD4Q4vm0c=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 51ADB940480; Wed, 30 Jan 2019 10:40:43 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 3/6] clk: renesas: rcar-gen3: Support Z and Z2 clocks with high frequency parents
Date:   Wed, 30 Jan 2019 10:40:26 +0100
Message-Id: <20190130094029.9604-4-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190130094029.9604-1-horms+renesas@verge.net.au>
References: <20190130094029.9604-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Support Z and Z2 clocks with parent frequencies greater than
UINT32_MAX Hz (~4.29GHz).

The DIV_ROUND_CLOSEST_ULL() macro accepts a 64bit numerator and 32bit
denominator. This leads to truncation of the numerator, which is the Z or
Z2 parent clock frequency in HZ, on platforms where frequency of that clock
is greater than UINT32_MAX Hz.

To resolve this problem the DIV_ROUND_CLOSEST() macro, which accepts the
prevailing types of the numerator and denominator, is used. In this case
the type of the numerator is unsigned long long (64 bit) and the type of
the denominator is unsigned long (64bit on 64bit platforms and 32bit on
32bit platforms). This allows parents whose frequency is greater than
UINT32_MAX Hz on 64bit platforms.

This appears to be sufficient as this driver is only intended for use
on 64bit systems. And in particular, the motivation for this change is
to allow a 4.8GHz clock on the R-Car Gen3 E3 (r8a77990) SoC which is
a 64bit platform.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index db3b2efb40e9..d21fdeb520e1 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -123,8 +123,7 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned int i;
 	u32 val, kick;
 
-	mult = DIV_ROUND_CLOSEST_ULL(rate * 32ULL * zclk->fixed_div,
-				     parent_rate);
+	mult = DIV_ROUND_CLOSEST(rate * 32ULL * zclk->fixed_div, parent_rate);
 	mult = clamp(mult, 1U, 32U);
 
 	if (readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
-- 
2.11.0

