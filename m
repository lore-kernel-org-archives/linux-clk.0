Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA5EC43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 16:36:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D222D20863
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 16:36:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="XDCqo2Q1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729548AbfCYQg2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 12:36:28 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:42086 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfCYQg2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 12:36:28 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D5B1725BF1A;
        Tue, 26 Mar 2019 03:36:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553531773; bh=VTmfI1RpN8llD9o4cImJwuTvYsif2vel8g6Mje3h3aA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XDCqo2Q1L5IOmt9CFwWWqv0qMq8DpzBaR+3RyQv14+5MuF78NUEx9pU7V28khU6BB
         cHxfw905TVvmd11/hl4n1q3BHzwEijMSdboaAunBmivgNXIM9tq93B3pjaN3Kmg6Vy
         MSge6JcSnSWYIniEMpiigJBhg8kQzvPx9NUp2or4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 224D6940A86; Mon, 25 Mar 2019 17:36:09 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v6 6/7] clk: renesas: r8a77990: Add Z2 clock
Date:   Mon, 25 Mar 2019 17:35:55 +0100
Message-Id: <20190325163556.22025-7-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190325163556.22025-1-horms+renesas@verge.net.au>
References: <20190325163556.22025-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Adds support for R-Car E3 (r8a77990) Z2 clock.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[simon: reworked changelog; rebased]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v6 [Simon Horman]
- Rebase for removal of CLK_TYPE_GEN3_Z2; use CLK_TYPE_GEN3_Z instead

v3 [Simon Horman]
- Pass new offset parameter

v2 [Simon Horman]
- Initialise as programmable clock

v1 [Simon Horman]
- Initialise as fixed clock

v0 [Takeshi Kihara]
- Initialise as programmable clock
---
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 9a278c75c918..99f602cb30a5 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -81,6 +81,7 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 	/* Core Clock Outputs */
 	DEF_FIXED("za2",       R8A77990_CLK_ZA2,   CLK_PLL0D24,    1, 1),
 	DEF_FIXED("za8",       R8A77990_CLK_ZA8,   CLK_PLL0D8,     1, 1),
+	DEF_GEN3_Z("z2",       R8A77990_CLK_Z2,    CLK_TYPE_GEN3_Z, CLK_PLL0, 4, 8),
 	DEF_FIXED("ztr",       R8A77990_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A77990_CLK_ZT,    CLK_PLL1,       4, 1),
 	DEF_FIXED("zx",        R8A77990_CLK_ZX,    CLK_PLL1,       3, 1),
-- 
2.11.0

