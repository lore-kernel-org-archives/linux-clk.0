Return-Path: <SRS0=eSXj=RD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04330C10F06
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 13:53:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B9E50214D8
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 13:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="oTnRCKIu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731150AbfB1NxA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Feb 2019 08:53:00 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:43912 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbfB1NxA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Feb 2019 08:53:00 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6D18A25BEB5;
        Fri,  1 Mar 2019 00:52:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551361972; bh=3CHcuMwkcczyvaFGiY62nzRBTrYTNHLM6wOEkkTrrTc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oTnRCKIuy1FJy+Vu7U2FdhZ9hSpb5m/oaii11uQRnf4MS3NhFwHWYC4F4P5fcE4qr
         VXGNSx0FIEI704p4Or8pY0rN1cqlUzOTuFrDyBLDchKyaKV4Y69BTV7LplTL5IXRRq
         /goA0Os8w1DfqzUVdT6BXHWueprfzmyIGz3M8QMg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7E91F94056F; Thu, 28 Feb 2019 14:52:50 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/4] [RFT] clk: renesas: r8a77995: Add ZG clock
Date:   Thu, 28 Feb 2019 14:52:46 +0100
Message-Id: <20190228135246.31714-5-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190228135246.31714-1-horms+renesas@verge.net.au>
References: <20190228135246.31714-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Adds support for R-Car D3 (r8a77995) ZG clock.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Compile tested only
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index eee3874865a9..0a13a1a7a909 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -76,6 +76,8 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 
 	/* Core Clock Outputs */
 	DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
+	DEF_GEN3_Z("zg",       R8A77995_CLK_ZG,    CLK_TYPE_GEN3_Z, CLK_PLL0,
+		   5, CPG_FRQCRB, 24),
 	DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A77995_CLK_ZT,    CLK_PLL1,       4, 1),
 	DEF_FIXED("zx",        R8A77995_CLK_ZX,    CLK_PLL1,       3, 1),
-- 
2.11.0

