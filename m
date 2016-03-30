Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:43635 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752953AbcC3O7J (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 30 Mar 2016 10:59:09 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-clk@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/5] clk: renesas: r8a7795: add OSC and RINT clocks
Date: Wed, 30 Mar 2016 16:58:19 +0200
Message-Id: <1459349902-13243-3-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1459349902-13243-1-git-send-email-wsa@the-dreams.de>
References: <1459349902-13243-1-git-send-email-wsa@the-dreams.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Since V1:  * don't export RINT to DT bindings, keep it internal.
	   * also, introduce RCKCR already here to not hardcode address

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 9dc2b735ead85d..08715ca2ebb49d 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -26,6 +26,7 @@
 
 #include "renesas-cpg-mssr.h"
 
+#define CPG_RCKCR	0x240
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
@@ -50,6 +51,7 @@ enum clk_ids {
 	CLK_S3,
 	CLK_SDSRC,
 	CLK_SSPSRC,
+	CLK_RINT,
 
 	/* Module Clocks */
 	MOD_CLK_BASE
@@ -116,6 +118,9 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 	DEF_DIV6P1("mso",       R8A7795_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
 	DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV2, 0x250),
 	DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
+
+	DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, CPG_RCKCR, 8),
+	DEF_DIV6_RO("r_int",    CLK_RINT,          CLK_EXTAL, CPG_RCKCR, 32),
 };
 
 static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
-- 
2.7.0

