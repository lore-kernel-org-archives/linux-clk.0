Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/11] clk: renesas: r8a77980: Add RCLK for watchdog timer
Date: Wed, 11 Jul 2018 16:21:00 +0200
Message-Id: <20180711142100.3765-12-geert+renesas@glider.be>
In-Reply-To: <20180711142100.3765-1-geert+renesas@glider.be>
References: <20180711142100.3765-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On R-Car V3H, RCLK can be switched between EXTALR and the On-Chip
Oscillator using mode pin MD19.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
As Figure 8.1e "Block Diagram of CPG (R-Car V3H)" does not show any
divider after the On-Chip Oscillator, I assume the OCO runs at 32768 Hz.
---
 drivers/clk/renesas/r8a77980-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
index 093677b8927800fa..122d722aca2db7d4 100644
--- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -41,6 +41,7 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
+	CLK_OCO,
 
 	/* Module Clocks */
 	MOD_CLK_BASE
@@ -98,6 +99,8 @@ static const struct cpg_core_clk r8a77980_core_clks[] __initconst = {
 	DEF_DIV6P1("mso",	R8A77980_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
 
 	DEF_GEN3_OSC("osc",	R8A77980_CLK_OSC,   CLK_EXTAL,     8),
+	DEF_RATE("oco",		CLK_OCO,            32768),
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
