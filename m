Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH 3/3 v3] clk: versatile/icst: support for AP baseboard clocks
Date: Sat, 27 Aug 2016 14:01:19 +0200
Message-Id: <1472299279-27560-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This adds support for the two ICST525-based clocks on the
Integrator/AP baseboard, as documented in the board manual
"Integrator/AP ASIC Development Motherboard", ARM DUI0098 B,
pages 3-15 thru 3-18.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Delete a remnant val &= 0xff mask that was just dangling and
  generating warnings.
- Resending only 3/3 since 1, 2 are applied.
ChangeLog v1->v2:
- Drop DTS patch hunk that need to go into a separate patch.
---
 drivers/clk/versatile/clk-icst.c | 136 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index 8f06473b72ff..b74a69ecbf08 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -29,15 +29,20 @@
 
 #define VERSATILE_AUX_OSC_BITS 0x7FFFF
 #define INTEGRATOR_AP_CM_BITS 0xFF
+#define INTEGRATOR_AP_SYS_BITS 0xFF
 #define INTEGRATOR_CP_CM_CORE_BITS 0x7FF
 #define INTEGRATOR_CP_CM_MEM_BITS 0x7FF000
 
+#define INTEGRATOR_AP_PCI_25_33_MHZ BIT(8)
+
 /**
  * enum icst_control_type - the type of ICST control register
  */
 enum icst_control_type {
 	ICST_VERSATILE, /* The standard type, all control bits available */
 	ICST_INTEGRATOR_AP_CM, /* Only 8 bits of VDW available */
+	ICST_INTEGRATOR_AP_SYS, /* Only 8 bits of VDW available */
+	ICST_INTEGRATOR_AP_PCI, /* Odd bit pattern storage */
 	ICST_INTEGRATOR_CP_CM_CORE, /* Only 8 bits of VDW and 3 bits of OD */
 	ICST_INTEGRATOR_CP_CM_MEM, /* Only 8 bits of VDW and 3 bits of OD */
 };
@@ -93,6 +98,38 @@ static int vco_get(struct clk_icst *icst, struct icst_vco *vco)
 	}
 
 	/*
+	 * The Integrator/AP system clock on the base board can only
+	 * access the low eight bits of the v PLL divider. Bit 8 is tied low
+	 * and always zero, r is hardwired to 46, and the output divider is
+	 * hardwired to 3 (divide by 4) according to the document
+	 * "Integrator AP ASIC Development Motherboard" ARM DUI 0098B,
+	 * page 3-16.
+	 */
+	if (icst->ctype == ICST_INTEGRATOR_AP_SYS) {
+		vco->v = val & INTEGRATOR_AP_SYS_BITS;
+		vco->r = 46;
+		vco->s = 3;
+		return 0;
+	}
+
+	/*
+	 * The Integrator/AP PCI clock is using an odd pattern to create
+	 * the child clock, basically a single bit called DIVX/Y is used
+	 * to select between two different hardwired values: setting the
+	 * bit to 0 yields v = 17, r = 22 and OD = 1, whereas setting the
+	 * bit to 1 yields v = 14, r = 14 and OD = 1 giving the frequencies
+	 * 33 or 25 MHz respectively.
+	 */
+	if (icst->ctype == ICST_INTEGRATOR_AP_PCI) {
+		bool divxy = !!(val & INTEGRATOR_AP_PCI_25_33_MHZ);
+
+		vco->v = divxy ? 17 : 14;
+		vco->r = divxy ? 22 : 14;
+		vco->s = 1;
+		return 0;
+	}
+
+	/*
 	 * The Integrator/CP core clock can access the low eight bits
 	 * of the v PLL divider. Bit 8 is tied low and always zero,
 	 * r is hardwired to 22 and the output divider s is accessible
@@ -143,6 +180,16 @@ static int vco_set(struct clk_icst *icst, struct icst_vco vco)
 		if (vco.r != 22)
 			pr_err("ICST error: tried to use RDW != 22\n");
 		break;
+	case ICST_INTEGRATOR_AP_SYS:
+		mask = INTEGRATOR_AP_SYS_BITS;
+		val |= vco.v & 0xFF;
+		if (vco.v & 0x100)
+			pr_err("ICST error: tried to set bit 8 of VDW\n");
+		if (vco.s != 3)
+			pr_err("ICST error: tried to use VOD != 1\n");
+		if (vco.r != 46)
+			pr_err("ICST error: tried to use RDW != 22\n");
+		break;
 	case ICST_INTEGRATOR_CP_CM_CORE:
 		mask = INTEGRATOR_CP_CM_CORE_BITS; /* Uses 12 bits */
 		val = (vco.v & 0xFF) | vco.s << 8;
@@ -225,6 +272,27 @@ static long icst_round_rate(struct clk_hw *hw, unsigned long rate,
 		return DIV_ROUND_CLOSEST(rate, 500000) * 500000;
 	}
 
+	if (icst->ctype == ICST_INTEGRATOR_AP_SYS) {
+		/* Divides between 3 and 50 MHz in steps of 0.25 MHz */
+		if (rate <= 3000000)
+			return 3000000;
+		if (rate >= 50000000)
+			return 5000000;
+		/* Slam to closest 0.25 MHz */
+		return DIV_ROUND_CLOSEST(rate, 250000) * 250000;
+	}
+
+	if (icst->ctype == ICST_INTEGRATOR_AP_PCI) {
+		/*
+		 * If we're below or less than halfway from 25 to 33 MHz
+		 * select 25 MHz
+		 */
+		if (rate <= 25000000 || rate < 29000000)
+			return 25000000;
+		/* Else just return the default frequency */
+		return 33000000;
+	}
+
 	vco = icst_hz_to_vco(icst->params, rate);
 	return icst_hz(icst->params, vco);
 }
@@ -235,6 +303,36 @@ static int icst_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_icst *icst = to_icst(hw);
 	struct icst_vco vco;
 
+	if (icst->ctype == ICST_INTEGRATOR_AP_PCI) {
+		/* This clock is especially primitive */
+		unsigned int val;
+		int ret;
+
+		if (rate == 25000000) {
+			val = 0;
+		} else if (rate == 33000000) {
+			val = INTEGRATOR_AP_PCI_25_33_MHZ;
+		} else {
+			pr_err("ICST: cannot set PCI frequency %lu\n",
+			       rate);
+			return -EINVAL;
+		}
+		ret = regmap_write(icst->map, icst->lockreg_off,
+				   VERSATILE_LOCK_VAL);
+		if (ret)
+			return ret;
+		ret = regmap_update_bits(icst->map, icst->vcoreg_off,
+					 INTEGRATOR_AP_PCI_25_33_MHZ,
+					 val);
+		if (ret)
+			return ret;
+		/* This locks the VCO again */
+		ret = regmap_write(icst->map, icst->lockreg_off, 0);
+		if (ret)
+			return ret;
+		return 0;
+	}
+
 	if (parent_rate)
 		icst->params->ref = parent_rate;
 	vco = icst_hz_to_vco(icst->params, rate);
@@ -368,6 +466,34 @@ static const struct icst_params icst525_apcp_cm_params = {
 	.idx2s		= icst525_idx2s,
 };
 
+static const struct icst_params icst525_ap_sys_params = {
+	.vco_max	= ICST525_VCO_MAX_5V,
+	.vco_min	= ICST525_VCO_MIN,
+	/* Minimum 3 MHz, VDW = 4 */
+	.vd_min		= 3,
+	/* Maximum 50 MHz, VDW = 192 */
+	.vd_max		= 50,
+	/* r is hardcoded to 46 and this is the actual divisor, +2 */
+	.rd_min		= 48,
+	.rd_max		= 48,
+	.s2div		= icst525_s2div,
+	.idx2s		= icst525_idx2s,
+};
+
+static const struct icst_params icst525_ap_pci_params = {
+	.vco_max	= ICST525_VCO_MAX_5V,
+	.vco_min	= ICST525_VCO_MIN,
+	/* Minimum 25 MHz */
+	.vd_min		= 25,
+	/* Maximum 33 MHz */
+	.vd_max		= 33,
+	/* r is hardcoded to 14 or 22 and this is the actual divisors +2 */
+	.rd_min		= 16,
+	.rd_max		= 24,
+	.s2div		= icst525_s2div,
+	.idx2s		= icst525_idx2s,
+};
+
 static void __init of_syscon_icst_setup(struct device_node *np)
 {
 	struct device_node *parent;
@@ -408,6 +534,12 @@ static void __init of_syscon_icst_setup(struct device_node *np)
 	} else if (of_device_is_compatible(np, "arm,syscon-icst525-integratorap-cm")) {
 		icst_desc.params = &icst525_apcp_cm_params;
 		ctype = ICST_INTEGRATOR_AP_CM;
+	} else if (of_device_is_compatible(np, "arm,syscon-icst525-integratorap-sys")) {
+		icst_desc.params = &icst525_ap_sys_params;
+		ctype = ICST_INTEGRATOR_AP_SYS;
+	} else if (of_device_is_compatible(np, "arm,syscon-icst525-integratorap-pci")) {
+		icst_desc.params = &icst525_ap_pci_params;
+		ctype = ICST_INTEGRATOR_AP_PCI;
 	} else if (of_device_is_compatible(np, "arm,syscon-icst525-integratorcp-cm-core")) {
 		icst_desc.params = &icst525_apcp_cm_params;
 		ctype = ICST_INTEGRATOR_CP_CM_CORE;
@@ -437,6 +569,10 @@ CLK_OF_DECLARE(arm_syscon_icst307_clk,
 	       "arm,syscon-icst307", of_syscon_icst_setup);
 CLK_OF_DECLARE(arm_syscon_integratorap_cm_clk,
 	       "arm,syscon-icst525-integratorap-cm", of_syscon_icst_setup);
+CLK_OF_DECLARE(arm_syscon_integratorap_sys_clk,
+	       "arm,syscon-icst525-integratorap-sys", of_syscon_icst_setup);
+CLK_OF_DECLARE(arm_syscon_integratorap_pci_clk,
+	       "arm,syscon-icst525-integratorap-pci", of_syscon_icst_setup);
 CLK_OF_DECLARE(arm_syscon_integratorcp_cm_core_clk,
 	       "arm,syscon-icst525-integratorcp-cm-core", of_syscon_icst_setup);
 CLK_OF_DECLARE(arm_syscon_integratorcp_cm_mem_clk,
-- 
2.7.4
