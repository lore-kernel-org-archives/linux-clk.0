Return-Path: <SRS0=eU8d=QH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B985C282C7
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 09:40:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB042218D3
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 09:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="nTsJKy5Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731635AbfAaJkg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Jan 2019 04:40:36 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59173 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbfAaJkg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Jan 2019 04:40:36 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 31DDD25BEE5;
        Thu, 31 Jan 2019 20:40:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548927625; bh=KYDSCAZZXFwvUMWiCGJH5u477U5QBYZyDDYnVi4sSd8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nTsJKy5QBU75Qjm5hVdCY1Xu8LGrmQdqvMRCiFs3loJ8haxHZAet4RZsiuPF2r3oh
         YKQvT9gYoXLpd9D/A9Cl8viehBAnNdoZrM06D2+Fij7VQ7F1mMt/yNvBI9d0w2/hRr
         aunKcltT9gSEwnlt7zogKmRCDK/0XsP5ND05svU4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4D97E940796; Thu, 31 Jan 2019 10:40:23 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3 4/5] clk: renesas: r8a77990: Add Z2 clock
Date:   Thu, 31 Jan 2019 10:40:20 +0100
Message-Id: <20190131094021.3092-5-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190131094021.3092-1-horms+renesas@verge.net.au>
References: <20190131094021.3092-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Adds support for R-Car E3 (r8a77990) Z2 clock.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[simon: reworked changelog; rebased]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v3: [Simon Horman]
- Pass new offset parameter

v2: [Simon Horman]
- Initialise as programmable clock

v1: [Simon Horman]
- Initialise as fixed clock

v0: [Takeshi Kihara]
- Initialise as programmable clock
---
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 9a278c75c918..072e4bde6fff 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -81,6 +81,7 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	/* Core Clock Outputs */
 	DEF_FIXED("za2",       R8A77990_CLK_ZA2,   CLK_PLL0D24,    1, 1),
 	DEF_FIXED("za8",       R8A77990_CLK_ZA8,   CLK_PLL0D8,     1, 1),
+	DEF_GEN3_Z("z2",       R8A77990_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL0, 4, 8),
 	DEF_FIXED("ztr",       R8A77990_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A77990_CLK_ZT,    CLK_PLL1,       4, 1),
 	DEF_FIXED("zx",        R8A77990_CLK_ZX,    CLK_PLL1,       3, 1),
-- 
2.11.0

