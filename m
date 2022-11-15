Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D079C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 15 Nov 2022 08:34:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbiKOIeX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Nov 2022 03:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiKOIeW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Nov 2022 03:34:22 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA1ABA5
        for <linux-clk@vger.kernel.org>; Tue, 15 Nov 2022 00:34:20 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:8c33:62a1:bd29:7c58])
        by xavier.telenet-ops.be with bizsmtp
        id kYaH280070JF8f801YaHwE; Tue, 15 Nov 2022 09:34:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ourOa-000XlC-QW; Tue, 15 Nov 2022 09:34:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ourOa-004HxP-FF; Tue, 15 Nov 2022 09:34:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] clk: renesas: r8a779f0: Fix Ethernet Switch clocks
Date:   Tue, 15 Nov 2022 09:34:14 +0100
Message-Id: <99b8b41bd2c5043c9e457862ef4bc144869eca58.1668501212.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The RSwitch2 and EtherTSN-IF clocks were accidentally mixed up.
While at it, rename them to better match the (future) documentation.

Fixes: a3b4137a4d4023e6 ("clk: renesas: r8a779f0: Add Ethernet Switch clocks")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Tested-by,
  - s/ethertsn-if/ether-serdes/ to match future documentation.

To be queued in renesas-clk for v6.2.
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 800fdc104edd657f..f721835c7e21248b 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -163,8 +163,8 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("cmt3",		913,	R8A779F0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779F0_CLK_CL16M),
 	DEF_MOD("tsc",		919,	R8A779F0_CLK_CL16M),
-	DEF_MOD("tsn",		1505,	R8A779F0_CLK_S0D2_HSC),
-	DEF_MOD("rsw",		1506,	R8A779F0_CLK_RSW2),
+	DEF_MOD("rswitch2",	1505,	R8A779F0_CLK_RSW2),
+	DEF_MOD("ether-serdes",	1506,	R8A779F0_CLK_S0D2_HSC),
 	DEF_MOD("ufs",		1514,	R8A779F0_CLK_S0D4_HSC),
 };
 
-- 
2.25.1

