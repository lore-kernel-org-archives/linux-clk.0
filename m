Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:43482 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731758AbeGZQwq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jul 2018 12:52:46 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 11/11] clk: renesas: r8a77980: Add RCLK for watchdog timer
Date: Thu, 26 Jul 2018 17:35:17 +0200
Message-Id: <20180726153517.10020-12-geert+renesas@glider.be>
In-Reply-To: <20180726153517.10020-1-geert+renesas@glider.be>
References: <20180726153517.10020-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On R-Car V3H, RCLK can be switched between EXTALR and the On-Chip
Oscillator using mode pin MD19.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
  - Add Reviewed-by,
  - Rename "oco" to ".oco", as it is an internal clock.

As Figure 8.1e "Block Diagram of CPG (R-Car V3H)" does not show any
divider after the On-Chip Oscillator, I assume the OCO runs at 32768 Hz.
If this turns out to be incorrect, the OCO clock rate and divider can be
updated later without any impact, as the OCO is an internal clock.
---
 drivers/clk/renesas/r8a77980-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
index a8b8d8613b46dd3c..acf2b4dded4c6cf0 100644
--- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -41,6 +41,7 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
+	CLK_OCO,
 
 	/* Module Clocks */
 	MOD_CLK_BASE
@@ -64,6 +65,7 @@ static const struct cpg_core_clk r8a77980_core_clks[] __initconst = {
 	DEF_FIXED(".s2",	CLK_S2,		   CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",	CLK_S3,		   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",	CLK_SDSRC,	   CLK_PLL1_DIV2,  2, 1),
+	DEF_RATE(".oco",	CLK_OCO,           32768),
 
 	/* Core Clock Outputs */
 	DEF_FIXED("ztr",	R8A77980_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
@@ -98,6 +100,7 @@ static const struct cpg_core_clk r8a77980_core_clks[] __initconst = {
 	DEF_DIV6P1("mso",	R8A77980_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
 
 	DEF_GEN3_OSC("osc",	R8A77980_CLK_OSC,   CLK_EXTAL,     8),
+	DEF_GEN3_MDSEL("r",	R8A77980_CLK_R, 29, CLK_EXTALR, 1, CLK_OCO, 1),
 };
 
 static const struct mssr_mod_clk r8a77980_mod_clks[] __initconst = {
@@ -119,6 +122,7 @@ static const struct mssr_mod_clk r8a77980_mod_clks[] __initconst = {
 	DEF_MOD("tpu0",			 304,	R8A77980_CLK_S3D4),
 	DEF_MOD("sdif",			 314,	R8A77980_CLK_SD0),
 	DEF_MOD("pciec0",		 319,	R8A77980_CLK_S2D2),
+	DEF_MOD("rwdt",			 402,	R8A77980_CLK_R),
 	DEF_MOD("intc-ex",		 407,	R8A77980_CLK_CP),
 	DEF_MOD("intc-ap",		 408,	R8A77980_CLK_S0D3),
 	DEF_MOD("hscif3",		 517,	R8A77980_CLK_S3D1),
-- 
2.17.1

