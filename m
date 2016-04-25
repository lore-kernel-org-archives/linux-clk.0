Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:58759 "EHLO
	smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754463AbcDYLsK (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2016 07:48:10 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: linux-clk@vger.kernel.org, geert+renesas@glider.be,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] clk: shmobile: r8a7795: Add CSI2 clocks
Date: Mon, 25 Apr 2016 13:39:19 +0200
Message-Id: <1461584360-32547-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index b2198aef..005b323 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -113,6 +113,7 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 	DEF_DIV6P1("mso",       R8A7795_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
 	DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV2, 0x250),
 	DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
+	DEF_DIV6P1("csi0",      R8A7795_CLK_CSI0,  CLK_PLL1_DIV4, 0x00c),
 };
 
 static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
@@ -176,6 +177,10 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("ehci1",		 702,	R8A7795_CLK_S3D4),
 	DEF_MOD("ehci0",		 703,	R8A7795_CLK_S3D4),
 	DEF_MOD("hsusb",		 704,	R8A7795_CLK_S3D4),
+	DEF_MOD("csi21",		 713,	R8A7795_CLK_CSI0),
+	DEF_MOD("csi20",		 714,	R8A7795_CLK_CSI0),
+	DEF_MOD("csi41",		 715,	R8A7795_CLK_CSI0),
+	DEF_MOD("csi40",		 716,	R8A7795_CLK_CSI0),
 	DEF_MOD("du3",			 721,	R8A7795_CLK_S2D1),
 	DEF_MOD("du2",			 722,	R8A7795_CLK_S2D1),
 	DEF_MOD("du1",			 723,	R8A7795_CLK_S2D1),
-- 
2.7.4

