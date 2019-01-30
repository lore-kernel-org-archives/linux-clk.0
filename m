Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFD3C282D9
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:40:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E584420989
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:40:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="j1cvUH9T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730411AbfA3Jk5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 04:40:57 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38534 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfA3Jk5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 04:40:57 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5C69325BEE4;
        Wed, 30 Jan 2019 20:40:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548841247; bh=nopU2/9+aKGh2eK7pnutWvSUEQ+2keJfLiSpR7qnVTE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j1cvUH9Te/tPMwqHDcxbR0+cmDSnYIAAVBFP88SSlbEB26Ix7qDor/r2Plmi323+C
         VxXOZzhplAXYfP1dfuB8QXrd45rf+aCfUNMnIPnZdptnS9geUNruF5E2/L0i24PMFd
         XUvxtXr4hl2yIFpp9qnaNhxowB/12R+RRgGoBK0o=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8FEB7940790; Wed, 30 Jan 2019 10:40:43 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFT v2 6/6] clk: renesas: r8a7745: Implement Z2 as a variable clock
Date:   Wed, 30 Jan 2019 10:40:29 +0100
Message-Id: <20190130094029.9604-7-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190130094029.9604-1-horms+renesas@verge.net.au>
References: <20190130094029.9604-1-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On the RZ/G2E (r8a7745) SoC the Z2 clock is not a fixed clock.
Rather it is a clock with:

* A parent of CLK_PLL0 running at 4.8GHz
* A fixed divider of 4
* A variable divider controlled by the Z2FC bits of the RFQCRC register

This can be described using the DEF_GEN3_Z with a clock type of
CLK_TYPE_GEN3_Z2.

This change is made with reference to the User's Manual v0.61.

Fixes: 9127d54bb894 ("clk: renesas: cpg-mssr: Add R8A7745 support")
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/clk/renesas/r8a7745-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a7745-cpg-mssr.c b/drivers/clk/renesas/r8a7745-cpg-mssr.c
index 493874e5ebee..f2ea72d9d663 100644
--- a/drivers/clk/renesas/r8a7745-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7745-cpg-mssr.c
@@ -53,7 +53,7 @@ static const struct cpg_core_clk r8a7745_core_clks[] __initconst = {
 	DEF_BASE("qspi", R8A7745_CLK_QSPI, CLK_TYPE_GEN2_QSPI,	CLK_PLL1_DIV2),
 	DEF_BASE("rcan", R8A7745_CLK_RCAN, CLK_TYPE_GEN2_RCAN,	CLK_USB_EXTAL),
 
-	DEF_FIXED("z2",    R8A7745_CLK_Z2,	CLK_PLL0,	    1, 1),
+	DEF_GEN3_Z("z2",   R8A77990_CLK_Z2,     CLK_TYPE_GEN3_Z2, CLK_PLL0, 4),
 	DEF_FIXED("zg",    R8A7745_CLK_ZG,	CLK_PLL1,	    6, 1),
 	DEF_FIXED("zx",    R8A7745_CLK_ZX,	CLK_PLL1,	    3, 1),
 	DEF_FIXED("zs",    R8A7745_CLK_ZS,	CLK_PLL1,	    6, 1),
-- 
2.11.0

