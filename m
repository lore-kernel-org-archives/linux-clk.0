Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D34BECAAD3
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 09:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbiIIJ1L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiIIJ0u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 05:26:50 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B33AC04E6
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 02:25:23 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:91db:705e:cfbc:a001])
        by michel.telenet-ops.be with bizsmtp
        id HlRN280010sKggw06lRN2W; Fri, 09 Sep 2022 11:25:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWaGH-004bes-JX; Fri, 09 Sep 2022 11:25:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWaGH-004On3-30; Fri, 09 Sep 2022 11:25:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] clk: renesas: r8a779g0: Add watchdog clock
Date:   Fri,  9 Sep 2022 11:25:12 +0200
Message-Id: <a012e4449b976efbeaabebb983fa6cfc1b9329d3.1662714852.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662714852.git.geert+renesas@glider.be>
References: <cover.1662714852.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the module clock used by the RCLK Watchdog Timer on the Renesas
R-Car V4H (R8A779G0) SoC.

Extracted from a larger patch in the BSP by Kazuya Mizuguchi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 3fc4233b1ead87c5..2afad6171fc3c138 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -154,6 +154,7 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("hscif1",	515,	R8A779G0_CLK_S0D3_PER),
 	DEF_MOD("hscif2",	516,	R8A779G0_CLK_S0D3_PER),
 	DEF_MOD("hscif3",	517,	R8A779G0_CLK_S0D3_PER),
+	DEF_MOD("wdt1:wdt0",	907,	R8A779G0_CLK_R),
 };
 
 /*
-- 
2.25.1

