Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5ADC6FA86
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 09:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbiIIJ1M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbiIIJ0t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 05:26:49 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AFD4C04E3
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 02:25:23 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:91db:705e:cfbc:a001])
        by laurent.telenet-ops.be with bizsmtp
        id HlRN2800E0sKggw01lRNcn; Fri, 09 Sep 2022 11:25:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWaGH-004bev-O0; Fri, 09 Sep 2022 11:25:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWaGH-004OnP-4p; Fri, 09 Sep 2022 11:25:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] clk: renesas: r8a779g0: Add EtherAVB clocks
Date:   Fri,  9 Sep 2022 11:25:15 +0200
Message-Id: <e9382b0d9acc84acc2357a6921a1459f3a32240e.1662714852.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662714852.git.geert+renesas@glider.be>
References: <cover.1662714852.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the module clocks used by the Ethernet AVB (EtherAVB-IF) blocks on
the Renesas R-Car V4H (R8A779G0) SoC.

Based on a larger patch in the BSP by Kazuya Mizuguchi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Use S0D4_HSC instead of S0D8_HSC.
    While the EtherAVB section in the R-Car V4H Hardware User's Manual
    Rev. 0.51 says the HP clock input is S0D8, the latter is not
    documented in the Clock Pulse Generator section.
    As the RAVB driver doesn't use any clock properties, the actual
    clock doesn't matter much, though.
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index d40ad40e4b76863d..9641122133b54f9a 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -150,6 +150,9 @@ static const struct cpg_core_clk r8a779g0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
+	DEF_MOD("avb0",		211,	R8A779G0_CLK_S0D4_HSC),
+	DEF_MOD("avb1",		212,	R8A779G0_CLK_S0D4_HSC),
+	DEF_MOD("avb2",		213,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("hscif0",	514,	R8A779G0_CLK_S0D3_PER),
 	DEF_MOD("hscif1",	515,	R8A779G0_CLK_S0D3_PER),
 	DEF_MOD("hscif2",	516,	R8A779G0_CLK_S0D3_PER),
-- 
2.25.1

