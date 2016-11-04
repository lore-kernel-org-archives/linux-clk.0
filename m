Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46097 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933194AbcKDN6V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2016 09:58:21 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: renesas: r8a7795: Fix HDMI parent clock
Date: Fri,  4 Nov 2016 14:58:07 +0100
Message-Id: <1478267887-30512-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Correct HDMI parent clock so that the rate of the
HDMI clock is 1/4 rather than 1/2 of the rate of PLL1
as per the v0.52 (Jun, 15) manual.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index f255e451e8ca..eec42c249e3a 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -97,7 +97,7 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 	DEF_FIXED("cp",         R8A7795_CLK_CP,    CLK_EXTAL,      2, 1),
 
 	DEF_DIV6P1("mso",       R8A7795_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
-	DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV2, 0x250),
+	DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV4, 0x250),
 	DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
 	DEF_DIV6P1("csi0",      R8A7795_CLK_CSI0,  CLK_PLL1_DIV4, 0x00c),
 
-- 
2.7.0.rc3.207.g0ac5344

