Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:52247 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752150AbdFUJBR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Jun 2017 05:01:17 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a7796: Add HDMI clocks
Date: Wed, 21 Jun 2017 12:01:50 +0300
Message-Id: <20170621090150.3868-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add the HDMI and HDMI0 clocks to the R8A7796 CPG/MSSR driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

Hi Geert,

I'd like to upstream HDMI output support on M3-W in v4.14. To ease dependency
handling, it would be great if this patch could already make it to v4.13.

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 9d114b31b073..1d8c5c2b6174 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -106,6 +106,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_DIV6P1("canfd",     R8A7796_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
 	DEF_DIV6P1("csi0",      R8A7796_CLK_CSI0,  CLK_PLL1_DIV4, 0x00c),
 	DEF_DIV6P1("mso",       R8A7796_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
+	DEF_DIV6P1("hdmi",      R8A7796_CLK_HDMI,  CLK_PLL1_DIV4, 0x250),
 
 	DEF_DIV6_RO("osc",      R8A7796_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
 	DEF_DIV6_RO("r_int",    CLK_RINT,          CLK_EXTAL, CPG_RCKCR, 32),
@@ -170,6 +171,7 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("du1",			 723,	R8A7796_CLK_S2D1),
 	DEF_MOD("du0",			 724,	R8A7796_CLK_S2D1),
 	DEF_MOD("lvds",			 727,	R8A7796_CLK_S2D1),
+	DEF_MOD("hdmi0",		 729,	R8A7796_CLK_HDMI),
 	DEF_MOD("vin7",			 804,	R8A7796_CLK_S0D2),
 	DEF_MOD("vin6",			 805,	R8A7796_CLK_S0D2),
 	DEF_MOD("vin5",			 806,	R8A7796_CLK_S0D2),
-- 
Regards,

Laurent Pinchart

