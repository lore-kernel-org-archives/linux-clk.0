Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1E4C4332F
	for <linux-clk@archiver.kernel.org>; Fri,  7 Oct 2022 13:10:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiJGNKT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Oct 2022 09:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiJGNKQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Oct 2022 09:10:16 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58C33F301
        for <linux-clk@vger.kernel.org>; Fri,  7 Oct 2022 06:10:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a4a4:fd15:fba:df3b])
        by michel.telenet-ops.be with bizsmtp
        id V1A6280055Lh0ZK061A6Ph; Fri, 07 Oct 2022 15:10:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogn77-000uNf-PH; Fri, 07 Oct 2022 15:10:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogn77-00CPMk-8U; Fri, 07 Oct 2022 15:10:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] clk: renesas: r8a779g0: Add SCIF clocks
Date:   Fri,  7 Oct 2022 15:10:02 +0200
Message-Id: <a6ab466cfdac377106494c00b811a60151cb1825.1665147497.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665147497.git.geert+renesas@glider.be>
References: <cover.1665147497.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the module clocks used by the Serial Communication Interfaces with
FIFO (SCIF) on the Renesas R-Car V4H (R8A779G0) SoC.

Based on a larger patch in the BSP by Kazuya Mizuguchi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Use R8A779G0_CLK_SASYNCPERD4 instead of R8A779G0_CLK_RCLK, to match
    the R-Car V4H Hardware User's Manual Rev. 0.54.
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index f1f0496f7605f554..c8c143c31b2beac0 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -175,6 +175,10 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("msi3",		621,	R8A779G0_CLK_MSO),
 	DEF_MOD("msi4",		622,	R8A779G0_CLK_MSO),
 	DEF_MOD("msi5",		623,	R8A779G0_CLK_MSO),
+	DEF_MOD("scif0",	702,	R8A779G0_CLK_SASYNCPERD4),
+	DEF_MOD("scif1",	703,	R8A779G0_CLK_SASYNCPERD4),
+	DEF_MOD("scif3",	704,	R8A779G0_CLK_SASYNCPERD4),
+	DEF_MOD("scif4",	705,	R8A779G0_CLK_SASYNCPERD4),
 	DEF_MOD("sydm0",	709,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("sydm1",	710,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779G0_CLK_R),
-- 
2.25.1

