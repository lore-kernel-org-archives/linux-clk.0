Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] clk: renesas: r8a77970: add SD0H/SD0 clocks for SDHI
To: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-clk@vger.kernel.org
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Message-ID: <d40960df-c7c4-630b-5f53-1a65b550ce8b@cogentembedded.com>
Date: Tue, 21 Aug 2018 19:41:30 +0300
MIME-Version: 1.0
In-Reply-To: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On R-Car V3M (AKA R8A77970), the SD0CKCR is laid out differently than on
the other R-Car gen3 SoCs. In fact, the layout is the same as on R-Car gen2
SoCs, so we'll need to copy the divisor tables from the R-Car gen2 driver.
We'll also need to support the SoC specific clock types, thus we're adding
CLK_TYPE_GEN3_SOC_BASE at the end of 'enum rcar_gen3_clk_types', declare
SD0H/SDH clocks in 'enum r8a77970_clk_types', and handle those clocks in
the overridden cpg_clk_register() method; then, finally, add the SD-IF
module clock (derived from the SD0 clock).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'clk-renesas' branch of Geert's 'renesas-drivers.git'
repo.

 drivers/clk/renesas/r8a77970-cpg-mssr.c |   64 +++++++++++++++++++++++++++++++-
 drivers/clk/renesas/rcar-gen3-cpg.h     |    3 +
 2 files changed, 65 insertions(+), 2 deletions(-)

Index: renesas-drivers/drivers/clk/renesas/r8a77970-cpg-mssr.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ renesas-drivers/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -1,7 +1,7 @@
 /*
  * r8a77970 Clock Pulse Generator / Module Standby and Software Reset
  *
- * Copyright (C) 2017 Cogent Embedded Inc.
+ * Copyright (C) 2017-2018 Cogent Embedded Inc.
  *
  * Based on r8a7795-cpg-mssr.c
  *
@@ -12,6 +12,7 @@
  * the Free Software Foundation; version 2 of the License.
  */
 
+#include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -22,6 +23,11 @@
 #include "renesas-cpg-mssr.h"
 #include "rcar-gen3-cpg.h"
 
+enum r8a77970_clk_types {
+	CLK_TYPE_R8A77970_SD0H = CLK_TYPE_GEN3_SOC_BASE,
+	CLK_TYPE_R8A77970_SD0,
+};
+
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R8A77970_CLK_OSC,
@@ -42,6 +48,20 @@ enum clk_ids {
 	MOD_CLK_BASE
 };
 
+static spinlock_t cpg_lock;
+
+static const struct clk_div_table cpg_sd0h_div_table[] = {
+	{  0,  2 }, {  1,  3 }, {  2,  4 }, {  3,  6 },
+	{  4,  8 }, {  5, 12 }, {  6, 16 }, {  7, 18 },
+	{  8, 24 }, { 10, 36 }, { 11, 48 }, {  0,  0 },
+};
+
+static const struct clk_div_table cpg_sd0_div_table[] = {
+	{  4,  8 }, {  5, 12 }, {  6, 16 }, {  7, 18 },
+	{  8, 24 }, { 10, 36 }, { 11, 48 }, { 12, 10 },
+	{  0,  0 },
+};
+
 static const struct cpg_core_clk r8a77970_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal",	CLK_EXTAL),
@@ -68,6 +88,10 @@ static const struct cpg_core_clk r8a7797
 	DEF_FIXED("s2d2",	R8A77970_CLK_S2D2,  CLK_PLL1_DIV2, 12, 1),
 	DEF_FIXED("s2d4",	R8A77970_CLK_S2D4,  CLK_PLL1_DIV2, 24, 1),
 
+	DEF_BASE("sd0h", R8A77970_CLK_SD0H, CLK_TYPE_R8A77970_SD0H,
+		 CLK_PLL1_DIV2),
+	DEF_BASE("sd0",	R8A77970_CLK_SD0, CLK_TYPE_R8A77970_SD0, CLK_PLL1_DIV2),
+
 	DEF_FIXED("cl",		R8A77970_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",		R8A77970_CLK_CP,    CLK_EXTAL,	    2, 1),
 
@@ -92,6 +116,7 @@ static const struct mssr_mod_clk r8a7797
 	DEF_MOD("mfis",			 213,	R8A77970_CLK_S2D2),
 	DEF_MOD("sys-dmac2",		 217,	R8A77970_CLK_S2D1),
 	DEF_MOD("sys-dmac1",		 218,	R8A77970_CLK_S2D1),
+	DEF_MOD("sd-if",		 314,	R8A77970_CLK_SD0),
 	DEF_MOD("rwdt",			 402,	R8A77970_CLK_R),
 	DEF_MOD("intc-ex",		 407,	R8A77970_CLK_CP),
 	DEF_MOD("intc-ap",		 408,	R8A77970_CLK_S2D1),
@@ -173,11 +198,46 @@ static int __init r8a77970_cpg_mssr_init
 	if (error)
 		return error;
 
+	spin_lock_init(&cpg_lock);
+
 	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
 
 	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
 }
 
+struct clk * __init r8a77970_cpg_clk_register(struct device *dev,
+	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
+	struct clk **clks, void __iomem *base,
+	struct raw_notifier_head *notifiers)
+{
+	const struct clk_div_table *table;
+	const struct clk *parent;
+	unsigned int shift;
+
+	switch (core->type) {
+	case CLK_TYPE_R8A77970_SD0H:
+		table = cpg_sd0h_div_table;
+		shift = 8;
+		break;
+	case CLK_TYPE_R8A77970_SD0:
+		table = cpg_sd0_div_table;
+		shift = 4;
+		break;
+	default:
+		return rcar_gen3_cpg_clk_register(dev, core, info, clks, base,
+						  notifiers);
+	}
+
+	parent = clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	return clk_register_divider_table(NULL, core->name,
+					  __clk_get_name(parent), 0,
+					  base + 0x74, shift, 4, 0, table,
+					  &cpg_lock);
+}
+
 const struct cpg_mssr_info r8a77970_cpg_mssr_info __initconst = {
 	/* Core Clocks */
 	.core_clks = r8a77970_core_clks,
@@ -196,5 +256,5 @@ const struct cpg_mssr_info r8a77970_cpg_
 
 	/* Callbacks */
 	.init = r8a77970_cpg_mssr_init,
-	.cpg_clk_register = rcar_gen3_cpg_clk_register,
+	.cpg_clk_register = r8a77970_cpg_clk_register,
 };
Index: renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.h
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/rcar-gen3-cpg.h
+++ renesas-drivers/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -25,6 +25,9 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_Z2,
 	CLK_TYPE_GEN3_OSC,	/* OSC EXTAL predivider and fixed divider */
 	CLK_TYPE_GEN3_RCKSEL,	/* Select parent/divider using RCKCR.CKSEL */
+
+	/* SoC specific definitions start here */
+	CLK_TYPE_GEN3_SOC_BASE,
 };
 
 #define DEF_GEN3_SD(_name, _id, _parent, _offset)	\
