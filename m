Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4163C282D9
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:40:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3C47218A4
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 09:40:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="KlAHQcbW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729519AbfA3Jk7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 04:40:59 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38534 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfA3Jk7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 04:40:59 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5DA6A25BEE5;
        Wed, 30 Jan 2019 20:40:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548841247; bh=eH5xe79FEpbYVrh06cEnNXrarYdO0U71TqiYXYNJeqw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KlAHQcbWtoxqrQHWRZcpcuC5F1UnBUGysRREO4HbSw0ebV1kBhFQNkXOrAJFFujaz
         yJp1COMcfJt681uhpPLk9oSNKTy+V7DCf05op8mPRZU7z2x/GP1iX5ZtjTA4AADOu7
         gPOJz7oLmbiwvfqXR6Mg2rNsHucxJoU0XTDo57mA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7D785940796; Wed, 30 Jan 2019 10:40:43 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH/RFT v2 5/6] clk: renesas: rcar-gen3: Support r8a7745 Z2 clock divider
Date:   Wed, 30 Jan 2019 10:40:28 +0100
Message-Id: <20190130094029.9604-6-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190130094029.9604-1-horms+renesas@verge.net.au>
References: <20190130094029.9604-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On the RZ/G2E (r8a7745) SoC the Z2FC bits of the RFQCRC register,
which control the frequency division ratio for the Z2φ clock are
located at bit[12:8] rather than the more common location bit[4:0].

This change is made with reference to the User's Manual v0.61.

Fixes: 9127d54bb894 ("clk: renesas: cpg-mssr: Add R8A7745 support")
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index d21fdeb520e1..dfd2b9caeaf5 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -450,6 +450,10 @@ static const struct soc_device_attribute cpg_quirks_match[] __initconst = {
 		.soc_id = "r8a77990",
 		.data = (void *)Z2FC_BIT_MASK_SFT_8,
 	},
+	{
+		.soc_id = "r8a7745",
+		.data = (void *)Z2FC_BIT_MASK_SFT_8,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.11.0

