Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E92C433EF
	for <linux-clk@archiver.kernel.org>; Mon,  2 May 2022 12:35:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384845AbiEBMik (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 May 2022 08:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238129AbiEBMij (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 May 2022 08:38:39 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E6412AA7
        for <linux-clk@vger.kernel.org>; Mon,  2 May 2022 05:35:08 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:194e:5782:c420:7f87])
        by albert.telenet-ops.be with bizsmtp
        id Rob52700H28fWK506ob5an; Mon, 02 May 2022 14:35:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nlVGb-002mfz-22; Mon, 02 May 2022 14:35:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nlVGa-002hgV-2G; Mon, 02 May 2022 14:35:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r9a07g044: Fix OSTM1 module clock name.
Date:   Mon,  2 May 2022 14:35:02 +0200
Message-Id: <e0eff1f57378ec29d0d3f1a7bdd7e380583f736b.1651494871.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix a typo in the name of the "ostm1_pclk" clock.
This change has no run-time impact.

Fixes: 161450134ae9bab3 ("clk: renesas: r9a07g044: Add OSTM clock and reset entries")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v5.19.
---
 drivers/clk/renesas/r9a07g044-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index bdfabb992a20782d..df9d5d91e065fdb8 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -180,7 +180,7 @@ static const struct {
 					0x52c, 1),
 		DEF_MOD("ostm0_pclk",	R9A07G044_OSTM0_PCLK, R9A07G044_CLK_P0,
 					0x534, 0),
-		DEF_MOD("ostm1_clk",	R9A07G044_OSTM1_PCLK, R9A07G044_CLK_P0,
+		DEF_MOD("ostm1_pclk",	R9A07G044_OSTM1_PCLK, R9A07G044_CLK_P0,
 					0x534, 1),
 		DEF_MOD("ostm2_pclk",	R9A07G044_OSTM2_PCLK, R9A07G044_CLK_P0,
 					0x534, 2),
-- 
2.25.1

