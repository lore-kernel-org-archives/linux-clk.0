Return-Path: <biju.das@bp.renesas.com>
From: Biju Das <biju.das@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Simon Horman <horms@verge.net.au>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 08/10] clk: renesas: r8a7743: Add r8a7744 support
Date: Tue, 11 Sep 2018 11:12:49 +0100
Message-Id: <1536660771-32278-9-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
References: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Add RZ/G1N (R8A7744) Clock Pulse Generator / Module Standby and Software
Reset support.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/clk/renesas/Kconfig            |  2 +-
 drivers/clk/renesas/r8a7743-cpg-mssr.c | 13 ++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c |  5 +++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index fd36f18..96e714c 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -5,7 +5,7 @@ config CLK_RENESAS
 	select CLK_RZA1 if ARCH_R7S72100
 	select CLK_R8A73A4 if ARCH_R8A73A4
 	select CLK_R8A7740 if ARCH_R8A7740
-	select CLK_R8A7743 if ARCH_R8A7743
+	select CLK_R8A7743 if ARCH_R8A7743 || ARCH_R8A7744
 	select CLK_R8A7745 if ARCH_R8A7745
 	select CLK_R8A77470 if ARCH_R8A77470
 	select CLK_R8A774A1 if ARCH_R8A774A1
diff --git a/drivers/clk/renesas/r8a7743-cpg-mssr.c b/drivers/clk/renesas/r8a7743-cpg-mssr.c
index 011c170..ab994f4 100644
--- a/drivers/clk/renesas/r8a7743-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7743-cpg-mssr.c
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/soc/renesas/rcar-rst.h>
 
 #include <dt-bindings/clock/r8a7743-cpg-mssr.h>
@@ -37,7 +38,7 @@ enum clk_ids {
 	MOD_CLK_BASE
 };
 
-static const struct cpg_core_clk r8a7743_core_clks[] __initconst = {
+static struct cpg_core_clk r8a7743_core_clks[] __initdata = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal",	CLK_EXTAL),
 	DEF_INPUT("usb_extal",	CLK_USB_EXTAL),
@@ -238,6 +239,8 @@ static const struct rcar_gen2_cpg_pll_config cpg_pll_configs[8] __initconst = {
 static int __init r8a7743_cpg_mssr_init(struct device *dev)
 {
 	const struct rcar_gen2_cpg_pll_config *cpg_pll_config;
+	struct device_node *np = dev->of_node;
+	unsigned int i;
 	u32 cpg_mode;
 	int error;
 
@@ -247,6 +250,14 @@ static int __init r8a7743_cpg_mssr_init(struct device *dev)
 
 	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
 
+	if (of_device_is_compatible(np, "renesas,r8a7744-cpg-mssr")) {
+		/* RZ/G1N uses a 1/5 divider for ZG */
+		for (i = 0; i < ARRAY_SIZE(r8a7743_core_clks); i++)
+			if (r8a7743_core_clks[i].id == R8A7743_CLK_ZG) {
+				r8a7743_core_clks[i].div = 5;
+				break;
+			}
+	}
 	return rcar_gen2_cpg_init(cpg_pll_config, 2, cpg_mode);
 }
 
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index f90b0d0..35a7a72 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -651,6 +651,11 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.compatible = "renesas,r8a7743-cpg-mssr",
 		.data = &r8a7743_cpg_mssr_info,
 	},
+	/* RZ/G1N is (almost) identical to RZ/G1M w.r.t. clocks. */
+	{
+		.compatible = "renesas,r8a7744-cpg-mssr",
+		.data = &r8a7743_cpg_mssr_info,
+	},
 #endif
 #ifdef CONFIG_CLK_R8A7745
 	{
-- 
2.7.4
