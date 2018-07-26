Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:40422 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731662AbeGZQwp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jul 2018 12:52:45 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 03/11] clk: renesas: r8a7796: Add OSC EXTAL predivider configuration
Date: Thu, 26 Jul 2018 17:35:09 +0200
Message-Id: <20180726153517.10020-4-geert+renesas@glider.be>
In-Reply-To: <20180726153517.10020-1-geert+renesas@glider.be>
References: <20180726153517.10020-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

R-Car Gen3 Hardware Manual Rev.0.52 documents the relation between the
MD13 and MD14 mode pins, and the OSC EXTAL predivider, as used by the
OSC and RINT RCLK clocks.  Hence augment the configuration structure
with all documented predivider values.

According to R-Car Gen3 Hardware Manual Rev.0.53, the CPG_RCKCR
register was removed in R-Car M3-W ES1.1.  Change the OSC and RINT
clock definitions to use the OSC EXTAL predivider instead, which is
supported on all R-Car M3-W SoC revisions.

Inspired by a patch in the BSP by Takeshi Kihara
<takeshi.kihara.df@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
  - Add Reviewed-by,
  - Rebase.
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 66 +++++++++++++-------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 6a4ef3d04aa060bc..7e98fb8b1074c298 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -73,7 +73,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
 
-	DEF_DIV6_RO(".r",       CLK_RINT,          CLK_EXTAL, CPG_RCKCR, 32),
+	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
 	/* Core Clock Outputs */
 	DEF_BASE("z",           R8A7796_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0),
@@ -112,7 +112,7 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
 	DEF_DIV6P1("mso",       R8A7796_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
 	DEF_DIV6P1("hdmi",      R8A7796_CLK_HDMI,  CLK_PLL1_DIV4, 0x250),
 
-	DEF_DIV6_RO("osc",      R8A7796_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
+	DEF_GEN3_OSC("osc",     R8A7796_CLK_OSC,   CLK_EXTAL,     8),
 
 	DEF_BASE("r",           R8A7796_CLK_R,     CLK_TYPE_GEN3_R, CLK_RINT),
 };
@@ -256,25 +256,25 @@ static const unsigned int r8a7796_crit_mod_clks[] __initconst = {
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
@@ -282,23 +282,23 @@ static const unsigned int r8a7796_crit_mod_clks[] __initconst = {
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
 
 static int __init r8a7796_cpg_mssr_init(struct device *dev)
-- 
2.17.1

