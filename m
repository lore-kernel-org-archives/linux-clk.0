Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792B8C43610
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41F1C2081B
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F1C2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbeK2VzX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 16:55:23 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:48364 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727946AbeK2VzX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 16:55:23 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id 5mqR1z00Q3XaVaC06mqRGh; Thu, 29 Nov 2018 11:50:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002EH-Ak; Thu, 29 Nov 2018 11:50:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002gY-8z; Thu, 29 Nov 2018 11:50:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/13] clk: renesas: r8a77990: Correct parent clock of DU
Date:   Thu, 29 Nov 2018 11:50:03 +0100
Message-Id: <20181129105008.10239-9-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

According to the R-Car Gen3 Hardware Manual Rev 1.00, the parent clock
of the DU module clocks on R-Car E3 is S1D1.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Fixes: 3570a2af473789c5 ("clk: renesas: cpg-mssr: Add support for R-Car E3")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 9eb80180eea0b1a6..9a278c75c918cfa8 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -183,8 +183,8 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
 	DEF_MOD("ehci0",		 703,	R8A77990_CLK_S3D4),
 	DEF_MOD("hsusb",		 704,	R8A77990_CLK_S3D4),
 	DEF_MOD("csi40",		 716,	R8A77990_CLK_CSI0),
-	DEF_MOD("du1",			 723,	R8A77990_CLK_S2D1),
-	DEF_MOD("du0",			 724,	R8A77990_CLK_S2D1),
+	DEF_MOD("du1",			 723,	R8A77990_CLK_S1D1),
+	DEF_MOD("du0",			 724,	R8A77990_CLK_S1D1),
 	DEF_MOD("lvds",			 727,	R8A77990_CLK_S2D1),
 
 	DEF_MOD("vin5",			 806,	R8A77990_CLK_S1D2),
-- 
2.17.1

