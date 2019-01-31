Return-Path: <SRS0=eU8d=QH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8902C282C7
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 09:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1CE8218D3
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 09:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="f0m1V1I3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730750AbfAaJki (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Jan 2019 04:40:38 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59173 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbfAaJki (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Jan 2019 04:40:38 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3D2CA25B764;
        Thu, 31 Jan 2019 20:40:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548927627; bh=dGCji0G4pQHVjb2ClVIlf1YBmxtyCkNSOVQl0kl30Fw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f0m1V1I3hQ9KKE8qisbIMlsz0v4X+w0zjIPlvyCan+wrgjCACcSFG7O2YlUzPwRyX
         MShTm/kRrA8PkFWKOXzZp1GiIK0mPGHbsv8AiblAFP6MqoaUwrpHxawnzcFUdwJfW7
         AXpMyGlxFpd9uPy0tf48Wwr1hyyKQNO6/QzYi2P0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 663B39407D9; Thu, 31 Jan 2019 10:40:23 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFT v3 5/5] clk: renesas: r8a774c0: Add Z2 clock
Date:   Thu, 31 Jan 2019 10:40:21 +0100
Message-Id: <20190131094021.3092-6-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190131094021.3092-1-horms+renesas@verge.net.au>
References: <20190131094021.3092-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Adds support for R-Car RZ/G2E (r8a774c0) Z2 clock.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v3: New patch
---
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index 10b96895d452..24634ca94f69 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -79,6 +79,7 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
 	/* Core Clock Outputs */
 	DEF_FIXED("za2",       R8A774C0_CLK_ZA2,   CLK_PLL0D24,    1, 1),
 	DEF_FIXED("za8",       R8A774C0_CLK_ZA8,   CLK_PLL0D8,     1, 1),
+	DEF_GEN3_Z("z2",       R8A774C0_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL0, 4, 8),
 	DEF_FIXED("ztr",       R8A774C0_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A774C0_CLK_ZT,    CLK_PLL1,       4, 1),
 	DEF_FIXED("zx",        R8A774C0_CLK_ZX,    CLK_PLL1,       3, 1),
-- 
2.11.0

