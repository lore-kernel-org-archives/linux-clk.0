Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 05/11] clk: renesas: r8a77980: Add OSC predivider configuration and clock
Date: Thu, 26 Jul 2018 17:35:11 +0200
Message-Id: <20180726153517.10020-6-geert+renesas@glider.be>
In-Reply-To: <20180726153517.10020-1-geert+renesas@glider.be>
References: <20180726153517.10020-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

R-Car Gen3 Hardware Manual Rev.0.54 documents the relation between the
MD13 and MD14 mode pins, and the OSC EXTAL predivider, as used by the
OSC clock.  Hence augment the configuration structure with all
documented predivider values.

Add the OSC clock using the configured predivider.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
  - Add Reviewed-by,
  - Fix predivider for 27 MHz EXTAL (table under Table 8.2e wrongly
    uses 25 MHz).
---
 drivers/clk/renesas/r8a77980-cpg-mssr.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
index d7ebd9ec00594fc8..a8b8d8613b46dd3c 100644
--- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -96,6 +96,8 @@ static const struct cpg_core_clk r8a77980_core_clks[] __initconst = {
 	DEF_DIV6P1("canfd",	R8A77980_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
 	DEF_DIV6P1("csi0",	R8A77980_CLK_CSI0,  CLK_PLL1_DIV4, 0x00c),
 	DEF_DIV6P1("mso",	R8A77980_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
+
+	DEF_GEN3_OSC("osc",	R8A77980_CLK_OSC,   CLK_EXTAL,     8),
 };
 
 static const struct mssr_mod_clk r8a77980_mod_clks[] __initconst = {
@@ -171,23 +173,23 @@ static const unsigned int r8a77980_crit_mod_clks[] __initconst = {
  */
 
 /*
- *   MD		EXTAL		PLL2	PLL1	PLL3
+ *   MD		EXTAL		PLL2	PLL1	PLL3	OSC
  * 14 13	(MHz)
- * --------------------------------------------------
- * 0  0		16.66 x 1	x240	x192	x192
- * 0  1		20    x 1	x200	x160	x160
- * 1  0		27    x 1	x148	x118	x118
- * 1  1		33.33 / 2	x240	x192	x192
+ * --------------------------------------------------------
+ * 0  0		16.66 x 1	x240	x192	x192	/16
+ * 0  1		20    x 1	x200	x160	x160	/19
+ * 1  0		27    x 1	x148	x118	x118	/26
+ * 1  1		33.33 / 2	x240	x192	x192	/32
  */
 #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
 					 (((md) & BIT(13)) >> 13))
 
 static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[4] __initconst = {
-	/* EXTAL div	PLL1 mult/div	PLL3 mult/div */
-	{ 1,		192,	1,	192,	1,	},
-	{ 1,		160,	1,	160,	1,	},
-	{ 1,		118,	1,	118,	1,	},
-	{ 2,		192,	1,	192,	1,	},
+	/* EXTAL div	PLL1 mult/div	PLL3 mult/div	OSC prediv */
+	{ 1,		192,	1,	192,	1,	16,	},
+	{ 1,		160,	1,	160,	1,	19,	},
+	{ 1,		118,	1,	118,	1,	26,	},
+	{ 2,		192,	1,	192,	1,	32,	},
 };
 
 static int __init r8a77980_cpg_mssr_init(struct device *dev)
-- 
2.17.1
