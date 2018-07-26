Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 07/11] clk: renesas: rcar-gen3: Add support for RCKSEL clock selection
Date: Thu, 26 Jul 2018 17:35:13 +0200
Message-Id: <20180726153517.10020-8-geert+renesas@glider.be>
In-Reply-To: <20180726153517.10020-1-geert+renesas@glider.be>
References: <20180726153517.10020-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Add a clock type and macro for defining clocks where the parent and
divider are selected based on the value of the RCKCR.CKSEL bit.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
  - Add Reviewed-by,
  - Drop extra blank line.
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 23 ++++++++++++++++++++---
 drivers/clk/renesas/rcar-gen3-cpg.h |  7 ++++++-
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 7533a51c679bfd54..19a77822757d29de 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -1,7 +1,7 @@
 /*
  * R-Car Gen3 Clock Pulse Generator
  *
- * Copyright (C) 2015-2016 Glider bvba
+ * Copyright (C) 2015-2018 Glider bvba
  *
  * Based on clk-rcar-gen3.c
  *
@@ -31,6 +31,8 @@
 #define CPG_PLL2CR		0x002c
 #define CPG_PLL4CR		0x01f4
 
+#define CPG_RCKCR_CKSEL	BIT(15)	/* RCLK Clock Source Select */
+
 struct cpg_simple_notifier {
 	struct notifier_block nb;
 	void __iomem *reg;
@@ -444,7 +446,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 	unsigned int div = 1;
 	u32 value;
 
-	parent = clks[core->parent & 0xffff];	/* CLK_TYPE_PE uses high bits */
+	parent = clks[core->parent & 0xffff];	/* some types use high bits */
 	if (IS_ERR(parent))
 		return ERR_CAST(parent);
 
@@ -524,7 +526,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 
 			if (clk_get_rate(clks[cpg_clk_extalr])) {
 				parent = clks[cpg_clk_extalr];
-				value |= BIT(15);
+				value |= CPG_RCKCR_CKSEL;
 			}
 
 			writel(value, csn->reg);
@@ -570,6 +572,21 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		div = cpg_pll_config->osc_prediv * core->div;
 		break;
 
+	case CLK_TYPE_GEN3_RCKSEL:
+		/*
+		 * Clock selectable between two parents and two fixed dividers
+		 * using RCKCR.CKSEL
+		 */
+		if (readl(base + CPG_RCKCR) & CPG_RCKCR_CKSEL) {
+			div = core->div & 0xffff;
+		} else {
+			parent = clks[core->parent >> 16];
+			if (IS_ERR(parent))
+				return ERR_CAST(parent);
+			div = core->div >> 16;
+		}
+		break;
+
 	default:
 		return ERR_PTR(-EINVAL);
 	}
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index d7d84d9e4a1c9c8b..7c49aebf9dd12490 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -1,7 +1,7 @@
 /*
  * R-Car Gen3 Clock Pulse Generator
  *
- * Copyright (C) 2015-2016 Glider bvba
+ * Copyright (C) 2015-2018 Glider bvba
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -24,6 +24,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_Z,
 	CLK_TYPE_GEN3_Z2,
 	CLK_TYPE_GEN3_OSC,	/* OSC EXTAL predivider and fixed divider */
+	CLK_TYPE_GEN3_RCKSEL,	/* Select parent/divider using RCKCR.CKSEL */
 };
 
 #define DEF_GEN3_SD(_name, _id, _parent, _offset)	\
@@ -37,6 +38,10 @@ enum rcar_gen3_clk_types {
 #define DEF_GEN3_OSC(_name, _id, _parent, _div)		\
 	DEF_BASE(_name, _id, CLK_TYPE_GEN3_OSC, _parent, .div = _div)
 
+#define DEF_GEN3_RCKSEL(_name, _id, _parent0, _div0, _parent1, _div1) \
+	DEF_BASE(_name, _id, CLK_TYPE_GEN3_RCKSEL,	\
+		 (_parent0) << 16 | (_parent1),	.div = (_div0) << 16 | (_div1))
+
 struct rcar_gen3_cpg_pll_config {
 	u8 extal_div;
 	u8 pll1_mult;
-- 
2.17.1
