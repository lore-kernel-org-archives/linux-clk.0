Return-Path: <SRS0=eSXj=RD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0024BC43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 13:53:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B18EF2083D
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 13:53:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="LW36OHz+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731258AbfB1NxB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Feb 2019 08:53:01 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:43912 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbfB1NxB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Feb 2019 08:53:01 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7175625BECA;
        Fri,  1 Mar 2019 00:52:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551361972; bh=fKae+Uh/TyHN7AcNAWrWDoqQWeMpRbkxoOSMIl2iU4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LW36OHz+7zxdrUU/wvDk8yKQ5o9sSu3vEFkHoYeDF9tO3rWxK+/Tsx9ntfC4lvLa2
         FZxnJpTdtt5qKWz3x1l6oOUTHYynorD/2OHy5fY4k+YuEtXYzzeQXIOUVbZqwWkN5L
         KDTgnWai20AJduiLRvocFF+E2N+v8EuEivbJNWOc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 68EBA9404AC; Thu, 28 Feb 2019 14:52:50 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/4] [RFT] clk: renesas: r8a774c0: Add ZG clock
Date:   Thu, 28 Feb 2019 14:52:45 +0100
Message-Id: <20190228135246.31714-4-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190228135246.31714-1-horms+renesas@verge.net.au>
References: <20190228135246.31714-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Adds support for R-Car RZ/G2E (r8a774c0) ZG clock.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Tested-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
Compile tested only
---
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index d9130723d6c8..2c12bfddca95 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -81,6 +81,8 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
 	DEF_FIXED("za8",       R8A774C0_CLK_ZA8,   CLK_PLL0D8,     1, 1),
 	DEF_GEN3_Z("z2",       R8A774C0_CLK_Z2,    CLK_TYPE_GEN3_Z,
 		   CLK_PLL0, 4, CPG_FRQCRC, 8),
+	DEF_GEN3_Z("zg",       R8A774C0_CLK_ZG,    CLK_TYPE_GEN3_Z,
+		   CLK_PLL0, 8, CPG_FRQCRB, 24),
 	DEF_FIXED("ztr",       R8A774C0_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A774C0_CLK_ZT,    CLK_PLL1,       4, 1),
 	DEF_FIXED("zx",        R8A774C0_CLK_ZX,    CLK_PLL1,       3, 1),
-- 
2.11.0

