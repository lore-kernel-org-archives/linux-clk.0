Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E91CC05027
	for <linux-clk@archiver.kernel.org>; Tue, 14 Feb 2023 10:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbjBNKEI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Feb 2023 05:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbjBNKDx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Feb 2023 05:03:53 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DA424CA6
        for <linux-clk@vger.kernel.org>; Tue, 14 Feb 2023 02:02:14 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:5d34:d0af:a884:130e])
        by laurent.telenet-ops.be with bizsmtp
        id Ly2B2900k3vMoCy01y2BYB; Tue, 14 Feb 2023 11:02:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pRs8E-008ztw-SN;
        Tue, 14 Feb 2023 11:02:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pRs8Z-003PLK-J9;
        Tue, 14 Feb 2023 11:02:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a77995: Fix VIN parent clock
Date:   Tue, 14 Feb 2023 11:02:07 +0100
Message-Id: <9b655843a260e06fa6f3349cdafac180e2bf38a5.1676368776.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

According to the R-Car Series, 3rd Generation Hardware User’s Manual
Rev. 2.30, the parent clock of the Video Input Module (VIN) on R-Car D3
is S3D1.  Update the driver to match the documentation.

This has no functional impact, as both S1D2 and S3D1 have the same clock
rate, and are always-on clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk-for-v6.4.

 drivers/clk/renesas/r8a77995-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 24ba9093a72f7341..3a73f6f911dd5160 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -167,7 +167,7 @@ static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
 	DEF_MOD("du0",			 724,	R8A77995_CLK_S1D1),
 	DEF_MOD("lvds",			 727,	R8A77995_CLK_S2D1),
 	DEF_MOD("mlp",			 802,	R8A77995_CLK_S2D1),
-	DEF_MOD("vin4",			 807,	R8A77995_CLK_S1D2),
+	DEF_MOD("vin4",			 807,	R8A77995_CLK_S3D1),
 	DEF_MOD("etheravb",		 812,	R8A77995_CLK_S3D2),
 	DEF_MOD("imr0",			 823,	R8A77995_CLK_S1D2),
 	DEF_MOD("gpio6",		 906,	R8A77995_CLK_S3D4),
-- 
2.34.1

