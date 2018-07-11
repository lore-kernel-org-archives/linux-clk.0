Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:55760 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388458AbeGKOZo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jul 2018 10:25:44 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/11] clk: renesas: r8a7795: Add OSC EXTAL predivider configuration
Date: Wed, 11 Jul 2018 16:20:51 +0200
Message-Id: <20180711142100.3765-3-geert+renesas@glider.be>
In-Reply-To: <20180711142100.3765-1-geert+renesas@glider.be>
References: <20180711142100.3765-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

R-Car Gen3 Hardware Manual Rev.0.52 documents the relation between the
MD13 and MD14 mode pins, and the OSC EXTAL predivider, as used by the
OSC and RINT RCLK clocks.  Hence augment the configuration structure
with all documented predivider values.

According to R-Car Gen3 Hardware Manual Rev.0.53, the CPG_RCKCR
register was removed in R-Car H3 ES2.0.  Change the OSC and RINT
clock definitions to use the OSC EXTAL predivider instead, which is
supported on all R-Car H3 SoC revisions.

Inspired by a patch in the BSP by Takeshi Kihara
<takeshi.kihara.df@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 66 +++++++++++++-------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index a85dd50e89110d5d..ea0b33ddcc0ea531 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -111,8 +111,8 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
 	DEF_DIV6P1("mso",       R8A7795_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
 	DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV4, 0x250),
 
-	DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
-	DEF_DIV6_RO("r_int",    CLK_RINT,          CLK_EXTAL, CPG_RCKCR, 32),
+	DEF_GEN3_OSC("osc",     R8A7795_CLK_OSC,   CLK_EXTAL,     8),
+	DEF_GEN3_OSC("r_int",   CLK_RINT,          CLK_EXTAL,     32),
 
 	DEF_BASE("r",           R8A7795_CLK_R,     CLK_TYPE_GEN3_R, CLK_RINT),
 };
@@ -283,25 +283,25 @@ static const unsigned int r8a7795_crit_mod_clks[] __initconst = {
  */
 
 /*
- *   MD		EXTAL		PLL0	PLL1	PLL2	PLL3	PLL4
+ *   MD		EXTAL		PLL0	PLL1	PLL2	PLL3	PLL4	OSC
  * 14 13 19 17	(MHz)
- *-------------------------------------------------------------------
- * 0  0  0  0	16.66 x 1	x180	x192	x144	x192	x144
- * 0  0  0  1	16.66 x 1	x180	x192	x144	x128	x144
+ *-------------------------------------------------------------------------
+ * 0  0  0  0	16.66 x 1	x180	x192	x144	x192	x144	/16
+ * 0  0  0  1	16.66 x 1	x180	x192	x144	x128	x144	/16
  * 0  0  1  0	Prohibited setting
- * 0  0  1  1	16.66 x 1	x180	x192	x144	x192	x144
- * 0  1  0  0	20    x 1	x150	x160	x120	x160	x120
- * 0  1  0  1	20    x 1	x150	x160	x120	x106	x120
+ * 0  0  1  1	16.66 x 1	x180	x192	x144	x192	x144	/16
+ * 0  1  0  0	20    x 1	x150	x160	x120	x160	x120	/19
+ * 0  1  0  1	20    x 1	x150	x160	x120	x106	x120	/19
  * 0  1  1  0	Prohibited setting
- * 0  1  1  1	20    x 1	x150	x160	x120	x160	x120
- * 1  0  0  0	25    x 1	x120	x128	x96	x128	x96
- * 1  0  0  1	25    x 1	x120	x128	x96	x84	x96
+ * 0  1  1  1	20    x 1	x150	x160	x120	x160	x120	/19
+ * 1  0  0  0	25    x 1	x120	x128	x96	x128	x96	/24
+ * 1  0  0  1	25    x 1	x120	x128	x96	x84	x96	/24
  * 1  0  1  0	Prohibited setting
- * 1  0  1  1	25    x 1	x120	x128	x96	x128	x96
- * 1  1  0  0	33.33 / 2	x180	x192	x144	x192	x144
- * 1  1  0  1	33.33 / 2	x180	x192	x144	x128	x144
+ * 1  0  1  1	25    x 1	x120	x128	x96	x128	x96	/24
+ * 1  1  0  0	33.33 / 2	x180	x192	x144	x192	x144	/32
+ * 1  1  0  1	33.33 / 2	x180	x192	x144	x128	x144	/32
  * 1  1  1  0	Prohibited setting
- * 1  1  1  1	33.33 / 2	x180	x192	x144	x192	x144
+ * 1  1  1  1	33.33 / 2	x180	x192	x144	x192	x144	/32
  */
 #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 11) | \
 					 (((md) & BIT(13)) >> 11) | \
@@ -309,23 +309,23 @@ static const unsigned int r8a7795_crit_mod_clks[] __initconst = {
 					 (((md) & BIT(17)) >> 17))
 
 static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
-	/* EXTAL div	PLL1 mult/div	PLL3 mult/div */
-	{ 1,		192,	1,	192,	1,	},
-	{ 1,		192,	1,	128,	1,	},
-	{ 0, /* Prohibited setting */			},
-	{ 1,		192,	1,	192,	1,	},
-	{ 1,		160,	1,	160,	1,	},
-	{ 1,		160,	1,	106,	1,	},
-	{ 0, /* Prohibited setting */			},
-	{ 1,		160,	1,	160,	1,	},
-	{ 1,		128,	1,	128,	1,	},
-	{ 1,		128,	1,	84,	1,	},
-	{ 0, /* Prohibited setting */			},
-	{ 1,		128,	1,	128,	1,	},
-	{ 2,		192,	1,	192,	1,	},
-	{ 2,		192,	1,	128,	1,	},
-	{ 0, /* Prohibited setting */			},
-	{ 2,		192,	1,	192,	1,	},
+	/* EXTAL div	PLL1 mult/div	PLL3 mult/div	OSC prediv */
+	{ 1,		192,	1,	192,	1,	16,	},
+	{ 1,		192,	1,	128,	1,	16,	},
+	{ 0, /* Prohibited setting */				},
+	{ 1,		192,	1,	192,	1,	16,	},
+	{ 1,		160,	1,	160,	1,	19,	},
+	{ 1,		160,	1,	106,	1,	19,	},
+	{ 0, /* Prohibited setting */				},
+	{ 1,		160,	1,	160,	1,	19,	},
+	{ 1,		128,	1,	128,	1,	24,	},
+	{ 1,		128,	1,	84,	1,	24,	},
+	{ 0, /* Prohibited setting */				},
+	{ 1,		128,	1,	128,	1,	24,	},
+	{ 2,		192,	1,	192,	1,	32,	},
+	{ 2,		192,	1,	128,	1,	32,	},
+	{ 0, /* Prohibited setting */				},
+	{ 2,		192,	1,	192,	1,	32,	},
 };
 
 static const struct soc_device_attribute r8a7795es1[] __initconst = {
-- 
2.17.1

