Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0901C2F3A6
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 13:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFEC720870
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 13:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728910AbfAUNOR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 08:14:17 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:45900 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfAUNOQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 08:14:16 -0500
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id T1ED1z00r3XaVaC011EEmG; Mon, 21 Jan 2019 14:14:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1glZP3-0003Gb-Ss; Mon, 21 Jan 2019 14:14:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1glZP3-0005Vj-Qd; Mon, 21 Jan 2019 14:14:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a774c0: Correct parent clock of DU
Date:   Mon, 21 Jan 2019 14:14:10 +0100
Message-Id: <20190121131410.21137-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

According to the RZ/G Series, 2nd Generation Hardware Manual Rev 0.61,
the parent clock of the DU module clocks on RZ/G2 is S1D1.

Fixes: 906e0a4a6d1ef2d3 ("clk: renesas: cpg-mssr: Add r8a774c0 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.1.

 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index 28bcc8105d579611..4f3111b3113ecce8 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -175,8 +175,8 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
 	DEF_MOD("ehci0",		 703,	R8A774C0_CLK_S3D4),
 	DEF_MOD("hsusb",		 704,	R8A774C0_CLK_S3D4),
 	DEF_MOD("csi40",		 716,	R8A774C0_CLK_CSI0),
-	DEF_MOD("du1",			 723,	R8A774C0_CLK_S2D1),
-	DEF_MOD("du0",			 724,	R8A774C0_CLK_S2D1),
+	DEF_MOD("du1",			 723,	R8A774C0_CLK_S1D1),
+	DEF_MOD("du0",			 724,	R8A774C0_CLK_S1D1),
 	DEF_MOD("lvds",			 727,	R8A774C0_CLK_S2D1),
 
 	DEF_MOD("vin5",			 806,	R8A774C0_CLK_S1D2),
-- 
2.17.1

