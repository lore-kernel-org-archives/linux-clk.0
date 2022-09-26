Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E90C32771
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 16:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbiIZQOE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Sep 2022 12:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235955AbiIZQNQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Sep 2022 12:13:16 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A778F6110C
        for <linux-clk@vger.kernel.org>; Mon, 26 Sep 2022 08:01:53 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:d95b:5c9b:4085:7c0d])
        by albert.telenet-ops.be with bizsmtp
        id Qf1r280013Qogd106f1rzH; Mon, 26 Sep 2022 17:01:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ocpcE-006Jcn-Ia; Mon, 26 Sep 2022 17:01:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ocpcE-00DO3L-5Q; Mon, 26 Sep 2022 17:01:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] clk: renesas: r8a779g0: Add MSIOF clocks
Date:   Mon, 26 Sep 2022 17:01:49 +0200
Message-Id: <3cb2f1798145099a46134862c6bcbdcc29ca7410.1664204336.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664204336.git.geert+renesas@glider.be>
References: <cover.1664204336.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the module clocks used by the Clock-Synchronized Serial Interfaces
with FIFO (MSIOF) on the Renesas R-Car V4H (R8A779G0) SoC.

Extracted from a larger patch in the BSP by Kazuya Mizuguchi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 4265340a8fce5388..8f43a63de6cf27ea 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -163,6 +163,12 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("i2c3",		521,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("i2c4",		522,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("i2c5",		523,	R8A779G0_CLK_S0D6_PER),
+	DEF_MOD("msi0",		618,	R8A779G0_CLK_MSO),
+	DEF_MOD("msi1",		619,	R8A779G0_CLK_MSO),
+	DEF_MOD("msi2",		620,	R8A779G0_CLK_MSO),
+	DEF_MOD("msi3",		621,	R8A779G0_CLK_MSO),
+	DEF_MOD("msi4",		622,	R8A779G0_CLK_MSO),
+	DEF_MOD("msi5",		623,	R8A779G0_CLK_MSO),
 	DEF_MOD("sydm0",	709,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("sydm1",	710,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779G0_CLK_R),
-- 
2.25.1

