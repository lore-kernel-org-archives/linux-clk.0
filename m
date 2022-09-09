Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054BCECAAA1
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 09:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbiIIJ1P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbiIIJ0v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 05:26:51 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF7DC04D1
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 02:25:23 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:91db:705e:cfbc:a001])
        by michel.telenet-ops.be with bizsmtp
        id HlRM2800a0sKggw06lRM2V; Fri, 09 Sep 2022 11:25:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWaGH-004bet-G7; Fri, 09 Sep 2022 11:25:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWaGH-004On9-3a; Fri, 09 Sep 2022 11:25:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] clk: renesas: r8a779g0: Add I2C clocks
Date:   Fri,  9 Sep 2022 11:25:13 +0200
Message-Id: <f4b94f37950f6e976b68d0b32c324fb026d8b696.1662714852.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662714852.git.geert+renesas@glider.be>
References: <cover.1662714852.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the module clocks used by the I2C Bus Interfaces on the Renesas
R-Car V4H (R8A779G0) SoC.

Extracted from a larger patch in the BSP by Kazuya Mizuguchi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 2afad6171fc3c138..77c119c2aece203c 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -154,6 +154,12 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("hscif1",	515,	R8A779G0_CLK_S0D3_PER),
 	DEF_MOD("hscif2",	516,	R8A779G0_CLK_S0D3_PER),
 	DEF_MOD("hscif3",	517,	R8A779G0_CLK_S0D3_PER),
+	DEF_MOD("i2c0",		518,	R8A779G0_CLK_S0D6_PER),
+	DEF_MOD("i2c1",		519,	R8A779G0_CLK_S0D6_PER),
+	DEF_MOD("i2c2",		520,	R8A779G0_CLK_S0D6_PER),
+	DEF_MOD("i2c3",		521,	R8A779G0_CLK_S0D6_PER),
+	DEF_MOD("i2c4",		522,	R8A779G0_CLK_S0D6_PER),
+	DEF_MOD("i2c5",		523,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779G0_CLK_R),
 };
 
-- 
2.25.1

