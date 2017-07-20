Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] clk: renesas: rcar-gen3: Add divider support for PLL1 and PLL3
Date: Thu, 20 Jul 2017 14:40:07 +0200
Message-Id: <1500554409-22423-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
References: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On some R-Car Gen3 SoCs (e.g. R-Car D3), PLL1 and PLL3 use a divider
value different from one.  Extend struct rcar_gen3_cpg_pll_config to handle
this.  As all multipliers and dividers are small, table size increase
can be kept limited by storing them in u8s instead of unsigned ints,
which saves ca. 0.5 KiB for a generic kernel.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 34 +++++++++++++++++-----------------
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 34 +++++++++++++++++-----------------
 drivers/clk/renesas/rcar-gen3-cpg.c    |  2 ++
 drivers/clk/renesas/rcar-gen3-cpg.h    |  8 +++++---
 4 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index c091a8e024b88d32..762b2f8824f118de 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -305,23 +305,23 @@ static const unsigned int r8a7795_crit_mod_clks[] __initconst = {
 					 (((md) & BIT(17)) >> 17))
 
 static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
-	/* EXTAL div	PLL1 mult	PLL3 mult */
-	{ 1,		192,		192,	},
-	{ 1,		192,		128,	},
-	{ 0, /* Prohibited setting */		},
-	{ 1,		192,		192,	},
-	{ 1,		160,		160,	},
-	{ 1,		160,		106,	},
-	{ 0, /* Prohibited setting */		},
-	{ 1,		160,		160,	},
-	{ 1,		128,		128,	},
-	{ 1,		128,		84,	},
-	{ 0, /* Prohibited setting */		},
-	{ 1,		128,		128,	},
-	{ 2,		192,		192,	},
-	{ 2,		192,		128,	},
-	{ 0, /* Prohibited setting */		},
-	{ 2,		192,		192,	},
+	/* EXTAL div	PLL1 mult/div	PLL3 mult/div */
+	{ 1,		192,	1,	192,	1,	},
+	{ 1,		192,	1,	128,	1,	},
+	{ 0, /* Prohibited setting */			},
+	{ 1,		192,	1,	192,	1,	},
+	{ 1,		160,	1,	160,	1,	},
+	{ 1,		160,	1,	106,	1,	},
+	{ 0, /* Prohibited setting */			},
+	{ 1,		160,	1,	160,	1,	},
+	{ 1,		128,	1,	128,	1,	},
+	{ 1,		128,	1,	84,	1,	},
+	{ 0, /* Prohibited setting */			},
+	{ 1,		128,	1,	128,	1,	},
+	{ 2,		192,	1,	192,	1,	},
+	{ 2,		192,	1,	128,	1,	},
+	{ 0, /* Prohibited setting */			},
+	{ 2,		192,	1,	192,	1,	},
 };
 
 static const struct soc_device_attribute r8a7795es1[] __initconst = {
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index acc6d0f153e1b233..22ba3c497aba9701 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -277,23 +277,23 @@ static const unsigned int r8a7796_crit_mod_clks[] __initconst = {
 					 (((md) & BIT(17)) >> 17))
 
 static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[16] __initconst = {
-	/* EXTAL div	PLL1 mult	PLL3 mult */
-	{ 1,		192,		192,	},
-	{ 1,		192,		128,	},
-	{ 0, /* Prohibited setting */		},
-	{ 1,		192,		192,	},
-	{ 1,		160,		160,	},
-	{ 1,		160,		106,	},
-	{ 0, /* Prohibited setting */		},
-	{ 1,		160,		160,	},
-	{ 1,		128,		128,	},
-	{ 1,		128,		84,	},
-	{ 0, /* Prohibited setting */		},
-	{ 1,		128,		128,	},
-	{ 2,		192,		192,	},
-	{ 2,		192,		128,	},
-	{ 0, /* Prohibited setting */		},
-	{ 2,		192,		192,	},
+	/* EXTAL div	PLL1 mult/div	PLL3 mult/div */
+	{ 1,		192,	1,	192,	1,	},
+	{ 1,		192,	1,	128,	1,	},
+	{ 0, /* Prohibited setting */			},
+	{ 1,		192,	1,	192,	1,	},
+	{ 1,		160,	1,	160,	1,	},
+	{ 1,		160,	1,	106,	1,	},
+	{ 0, /* Prohibited setting */			},
+	{ 1,		160,	1,	160,	1,	},
+	{ 1,		128,	1,	128,	1,	},
+	{ 1,		128,	1,	84,	1,	},
+	{ 0, /* Prohibited setting */			},
+	{ 1,		128,	1,	128,	1,	},
+	{ 2,		192,	1,	192,	1,	},
+	{ 2,		192,	1,	128,	1,	},
+	{ 0, /* Prohibited setting */			},
+	{ 2,		192,	1,	192,	1,	},
 };
 
 static int __init r8a7796_cpg_mssr_init(struct device *dev)
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index d4d27cf6110d385f..3f922fea9671fb4c 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -296,6 +296,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 
 	case CLK_TYPE_GEN3_PLL1:
 		mult = cpg_pll_config->pll1_mult;
+		div = cpg_pll_config->pll1_div;
 		break;
 
 	case CLK_TYPE_GEN3_PLL2:
@@ -313,6 +314,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 
 	case CLK_TYPE_GEN3_PLL3:
 		mult = cpg_pll_config->pll3_mult;
+		div = cpg_pll_config->pll3_div;
 		break;
 
 	case CLK_TYPE_GEN3_PLL4:
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index 073be54b5d038ae3..4eaf02955580a938 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -26,9 +26,11 @@ enum rcar_gen3_clk_types {
 	DEF_BASE(_name, _id, CLK_TYPE_GEN3_SD, _parent, .offset = _offset)
 
 struct rcar_gen3_cpg_pll_config {
-	unsigned int extal_div;
-	unsigned int pll1_mult;
-	unsigned int pll3_mult;
+	u8 extal_div;
+	u8 pll1_mult;
+	u8 pll1_div;
+	u8 pll3_mult;
+	u8 pll3_div;
 };
 
 #define CPG_RCKCR	0x240
-- 
2.7.4
