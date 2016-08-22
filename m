Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH 2/3 v2] clk: versatile/icst: add Integrator core module clocks
Date: Mon, 22 Aug 2016 11:19:33 +0200
Message-Id: <1471857574-13125-2-git-send-email-linus.walleij@linaro.org>
In-Reply-To: <1471857574-13125-1-git-send-email-linus.walleij@linaro.org>
References: <1471857574-13125-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The Integrator/AP and Integrator/CP have special derivatives
of the ICST525 control registers, where some bits have been
hardwired but others are possible to adjust, resulting in a
control register that makes it possible to set an even,
desired megahertz value.

The Integrator/AP and Integrator/CP have slightly different
layout so we support them using different compatible
strings.

After adding these clocks, the Integrator-specific cpufreq
driver can be switched over to use the generic operating
point device tree cpufreq driver.

Instead of simply writing a value to the oscillator control
register we switch to the more elaborate method of providing
a bitmask and use regmap_update_bits() to poke the right bits
for the desired frequency, this is needed since these control
registers sometimes control more than one clock.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Restore a pr_debug() from pr_info() that was used during
  development.
---
 drivers/clk/versatile/clk-icst.c | 174 +++++++++++++++++++++++++++++++++++----
 1 file changed, 160 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index 5e9b65278e4c..8f06473b72ff 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -27,6 +27,21 @@
 /* Magic unlocking token used on all Versatile boards */
 #define VERSATILE_LOCK_VAL	0xA05F
 
+#define VERSATILE_AUX_OSC_BITS 0x7FFFF
+#define INTEGRATOR_AP_CM_BITS 0xFF
+#define INTEGRATOR_CP_CM_CORE_BITS 0x7FF
+#define INTEGRATOR_CP_CM_MEM_BITS 0x7FF000
+
+/**
+ * enum icst_control_type - the type of ICST control register
+ */
+enum icst_control_type {
+	ICST_VERSATILE, /* The standard type, all control bits available */
+	ICST_INTEGRATOR_AP_CM, /* Only 8 bits of VDW available */
+	ICST_INTEGRATOR_CP_CM_CORE, /* Only 8 bits of VDW and 3 bits of OD */
+	ICST_INTEGRATOR_CP_CM_MEM, /* Only 8 bits of VDW and 3 bits of OD */
+};
+
 /**
  * struct clk_icst - ICST VCO clock wrapper
  * @hw: corresponding clock hardware entry
@@ -34,6 +49,7 @@
  * @lockreg: VCO lock register address
  * @params: parameters for this ICST instance
  * @rate: current rate
+ * @ctype: the type of control register for the ICST
  */
 struct clk_icst {
 	struct clk_hw hw;
@@ -42,6 +58,7 @@ struct clk_icst {
 	u32 lockreg_off;
 	struct icst_params *params;
 	unsigned long rate;
+	enum icst_control_type ctype;
 };
 
 #define to_icst(_hw) container_of(_hw, struct clk_icst, hw)
@@ -59,6 +76,44 @@ static int vco_get(struct clk_icst *icst, struct icst_vco *vco)
 	ret = regmap_read(icst->map, icst->vcoreg_off, &val);
 	if (ret)
 		return ret;
+
+	/*
+	 * The Integrator/AP core clock can only access the low eight
+	 * bits of the v PLL divider. Bit 8 is tied low and always zero,
+	 * r is hardwired to 22 and output divider s is hardwired to 1
+	 * (divide by 2) according to the document
+	 * "Integrator CM926EJ-S, CM946E-S, CM966E-S, CM1026EJ-S and
+	 * CM1136JF-S User Guide" ARM DUI 0138E, page 3-13 thru 3-14.
+	 */
+	if (icst->ctype == ICST_INTEGRATOR_AP_CM) {
+		vco->v = val & INTEGRATOR_AP_CM_BITS;
+		vco->r = 22;
+		vco->s = 1;
+		return 0;
+	}
+
+	/*
+	 * The Integrator/CP core clock can access the low eight bits
+	 * of the v PLL divider. Bit 8 is tied low and always zero,
+	 * r is hardwired to 22 and the output divider s is accessible
+	 * in bits 8 thru 10 according to the document
+	 * "Integrator/CM940T, CM920T, CM740T, and CM720T User Guide"
+	 * ARM DUI 0157A, page 3-20 thru 3-23 and 4-10.
+	 */
+	if (icst->ctype == ICST_INTEGRATOR_CP_CM_CORE) {
+		vco->v = val & 0xFF;
+		vco->r = 22;
+		vco->s = (val >> 8) & 7;
+		return 0;
+	}
+
+	if (icst->ctype == ICST_INTEGRATOR_CP_CM_MEM) {
+		vco->v = (val >> 12) & 0xFF;
+		vco->r = 22;
+		vco->s = (val >> 20) & 7;
+		return 0;
+	}
+
 	vco->v = val & 0x1ff;
 	vco->r = (val >> 9) & 0x7f;
 	vco->s = (val >> 16) & 03;
@@ -72,22 +127,52 @@ static int vco_get(struct clk_icst *icst, struct icst_vco *vco)
  */
 static int vco_set(struct clk_icst *icst, struct icst_vco vco)
 {
+	u32 mask;
 	u32 val;
 	int ret;
 
-	ret = regmap_read(icst->map, icst->vcoreg_off, &val);
-	if (ret)
-		return ret;
+	/* Mask the bits used by the VCO */
+	switch (icst->ctype) {
+	case ICST_INTEGRATOR_AP_CM:
+		mask = INTEGRATOR_AP_CM_BITS;
+		val = vco.v & 0xFF;
+		if (vco.v & 0x100)
+			pr_err("ICST error: tried to set bit 8 of VDW\n");
+		if (vco.s != 1)
+			pr_err("ICST error: tried to use VOD != 1\n");
+		if (vco.r != 22)
+			pr_err("ICST error: tried to use RDW != 22\n");
+		break;
+	case ICST_INTEGRATOR_CP_CM_CORE:
+		mask = INTEGRATOR_CP_CM_CORE_BITS; /* Uses 12 bits */
+		val = (vco.v & 0xFF) | vco.s << 8;
+		if (vco.v & 0x100)
+			pr_err("ICST error: tried to set bit 8 of VDW\n");
+		if (vco.r != 22)
+			pr_err("ICST error: tried to use RDW != 22\n");
+		break;
+	case ICST_INTEGRATOR_CP_CM_MEM:
+		mask = INTEGRATOR_CP_CM_MEM_BITS; /* Uses 12 bits */
+		val = ((vco.v & 0xFF) << 12) | (vco.s << 20);
+		if (vco.v & 0x100)
+			pr_err("ICST error: tried to set bit 8 of VDW\n");
+		if (vco.r != 22)
+			pr_err("ICST error: tried to use RDW != 22\n");
+		break;
+	default:
+		/* Regular auxilary oscillator */
+		mask = VERSATILE_AUX_OSC_BITS;
+		val = vco.v | (vco.r << 9) | (vco.s << 16);
+		break;
+	}
 
-	/* Mask the 18 bits used by the VCO */
-	val &= ~0x7ffff;
-	val |= vco.v | (vco.r << 9) | (vco.s << 16);
+	pr_debug("ICST: new val = 0x%08x\n", val);
 
 	/* This magic unlocks the VCO so it can be controlled */
 	ret = regmap_write(icst->map, icst->lockreg_off, VERSATILE_LOCK_VAL);
 	if (ret)
 		return ret;
-	ret = regmap_write(icst->map, icst->vcoreg_off, val);
+	ret = regmap_update_bits(icst->map, icst->vcoreg_off, mask, val);
 	if (ret)
 		return ret;
 	/* This locks the VCO again */
@@ -121,6 +206,25 @@ static long icst_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_icst *icst = to_icst(hw);
 	struct icst_vco vco;
 
+	if (icst->ctype == ICST_INTEGRATOR_AP_CM ||
+	    icst->ctype == ICST_INTEGRATOR_CP_CM_CORE) {
+		if (rate <= 12000000)
+			return 12000000;
+		if (rate >= 160000000)
+			return 160000000;
+		/* Slam to closest megahertz */
+		return DIV_ROUND_CLOSEST(rate, 1000000) * 1000000;
+	}
+
+	if (icst->ctype == ICST_INTEGRATOR_CP_CM_MEM) {
+		if (rate <= 6000000)
+			return 6000000;
+		if (rate >= 66000000)
+			return 66000000;
+		/* Slam to closest 0.5 megahertz */
+		return DIV_ROUND_CLOSEST(rate, 500000) * 500000;
+	}
+
 	vco = icst_hz_to_vco(icst->params, rate);
 	return icst_hz(icst->params, vco);
 }
@@ -148,7 +252,8 @@ static struct clk *icst_clk_setup(struct device *dev,
 				  const struct clk_icst_desc *desc,
 				  const char *name,
 				  const char *parent_name,
-				  struct regmap *map)
+				  struct regmap *map,
+				  enum icst_control_type ctype)
 {
 	struct clk *clk;
 	struct clk_icst *icst;
@@ -178,6 +283,7 @@ static struct clk *icst_clk_setup(struct device *dev,
 	icst->params = pclone;
 	icst->vcoreg_off = desc->vco_offset;
 	icst->lockreg_off = desc->lock_offset;
+	icst->ctype = ctype;
 
 	clk = clk_register(dev, &icst->hw);
 	if (IS_ERR(clk)) {
@@ -206,7 +312,8 @@ struct clk *icst_clk_register(struct device *dev,
 		pr_err("could not initialize ICST regmap\n");
 		return ERR_CAST(map);
 	}
-	return icst_clk_setup(dev, desc, name, parent_name, map);
+	return icst_clk_setup(dev, desc, name, parent_name, map,
+			      ICST_VERSATILE);
 }
 EXPORT_SYMBOL_GPL(icst_clk_register);
 
@@ -239,6 +346,28 @@ static const struct icst_params icst307_params = {
 	.idx2s		= icst307_idx2s,
 };
 
+/**
+ * The core modules on the Integrator/AP and Integrator/CP have
+ * especially crippled ICST525 control.
+ */
+static const struct icst_params icst525_apcp_cm_params = {
+	.vco_max	= ICST525_VCO_MAX_5V,
+	.vco_min	= ICST525_VCO_MIN,
+	/* Minimum 12 MHz, VDW = 4 */
+	.vd_min		= 12,
+	/*
+	 * Maximum 160 MHz, VDW = 152 for all core modules, but
+	 * CM926EJ-S, CM1026EJ-S and CM1136JF-S can actually
+	 * go to 200 MHz (max VDW = 192).
+	 */
+	.vd_max		= 192,
+	/* r is hardcoded to 22 and this is the actual divisor, +2 */
+	.rd_min		= 24,
+	.rd_max		= 24,
+	.s2div		= icst525_s2div,
+	.idx2s		= icst525_idx2s,
+};
+
 static void __init of_syscon_icst_setup(struct device_node *np)
 {
 	struct device_node *parent;
@@ -247,6 +376,7 @@ static void __init of_syscon_icst_setup(struct device_node *np)
 	const char *name = np->name;
 	const char *parent_name;
 	struct clk *regclk;
+	enum icst_control_type ctype;
 
 	/* We do not release this reference, we are using it perpetually */
 	parent = of_get_parent(np);
@@ -269,11 +399,22 @@ static void __init of_syscon_icst_setup(struct device_node *np)
 		return;
 	}
 
-	if (of_device_is_compatible(np, "arm,syscon-icst525"))
+	if (of_device_is_compatible(np, "arm,syscon-icst525")) {
 		icst_desc.params = &icst525_params;
-	else if (of_device_is_compatible(np, "arm,syscon-icst307"))
+		ctype = ICST_VERSATILE;
+	} else if (of_device_is_compatible(np, "arm,syscon-icst307")) {
 		icst_desc.params = &icst307_params;
-	else {
+		ctype = ICST_VERSATILE;
+	} else if (of_device_is_compatible(np, "arm,syscon-icst525-integratorap-cm")) {
+		icst_desc.params = &icst525_apcp_cm_params;
+		ctype = ICST_INTEGRATOR_AP_CM;
+	} else if (of_device_is_compatible(np, "arm,syscon-icst525-integratorcp-cm-core")) {
+		icst_desc.params = &icst525_apcp_cm_params;
+		ctype = ICST_INTEGRATOR_CP_CM_CORE;
+	} else if (of_device_is_compatible(np, "arm,syscon-icst525-integratorcp-cm-mem")) {
+		icst_desc.params = &icst525_apcp_cm_params;
+		ctype = ICST_INTEGRATOR_CP_CM_MEM;
+	} else {
 		pr_err("unknown ICST clock %s\n", name);
 		return;
 	}
@@ -281,7 +422,7 @@ static void __init of_syscon_icst_setup(struct device_node *np)
 	/* Parent clock name is not the same as node parent */
 	parent_name = of_clk_get_parent_name(np, 0);
 
-	regclk = icst_clk_setup(NULL, &icst_desc, name, parent_name, map);
+	regclk = icst_clk_setup(NULL, &icst_desc, name, parent_name, map, ctype);
 	if (IS_ERR(regclk)) {
 		pr_err("error setting up syscon ICST clock %s\n", name);
 		return;
@@ -294,5 +435,10 @@ CLK_OF_DECLARE(arm_syscon_icst525_clk,
 	       "arm,syscon-icst525", of_syscon_icst_setup);
 CLK_OF_DECLARE(arm_syscon_icst307_clk,
 	       "arm,syscon-icst307", of_syscon_icst_setup);
-
+CLK_OF_DECLARE(arm_syscon_integratorap_cm_clk,
+	       "arm,syscon-icst525-integratorap-cm", of_syscon_icst_setup);
+CLK_OF_DECLARE(arm_syscon_integratorcp_cm_core_clk,
+	       "arm,syscon-icst525-integratorcp-cm-core", of_syscon_icst_setup);
+CLK_OF_DECLARE(arm_syscon_integratorcp_cm_mem_clk,
+	       "arm,syscon-icst525-integratorcp-cm-mem", of_syscon_icst_setup);
 #endif
-- 
2.7.4
