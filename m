Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52891 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752631AbdHKPkN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Aug 2017 11:40:13 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] clk: renesas: r8a7796: Add Z clock
Date: Fri, 11 Aug 2017 17:39:59 +0200
Message-Id: <1502466000-20185-2-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1502466000-20185-1-git-send-email-horms+renesas@verge.net.au>
References: <1502466000-20185-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds Z clock for R8A7796 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index acc6d0f153e1..d9a27df96f7a 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -74,6 +74,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
 
 	/* Core Clock Outputs */
+	DEF_BASE("z",           R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0),
 	DEF_FIXED("ztr",        R8A7796_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",      R8A7796_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("zt",         R8A7796_CLK_ZT,    CLK_PLL1_DIV2,  4, 1),
-- 
2.1.4

