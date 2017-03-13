Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dien Pham <dien.pham.ry@renesas.com>
Subject: [PATCH 7/7] clk: renesas: rcar-gen3: Add workaround for PLL0/2/4 errata on H3 ES1.0
Date: Mon, 13 Mar 2017 17:19:54 +0100
Message-Id: <1489421994-19707-8-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
References: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Add a workaround for errata on R-Car H3 ES1.0, where the PLL0, PLL2, and
PLL4 clock frequencies are off by a factor of two.

Inspired by a patch by Dien Pham in the BSP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Dien Pham <dien.pham.ry@renesas.com>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index d395bb8c22f575cf..e5247e3dc897f9f4 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -20,6 +20,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 
 #include "renesas-cpg-mssr.h"
 #include "rcar-gen3-cpg.h"
@@ -248,6 +249,17 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
 static const struct rcar_gen3_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
 static u32 cpg_mode __initdata;
+static u32 cpg_quirks __initdata;
+
+#define PLL_ERRATA	BIT(0)		/* Missing PLL0/2/4 post-divider */
+
+static const struct soc_device_attribute cpg_quirks_match[] __initconst = {
+	{
+		.soc_id = "r8a7795", .revision = "ES1.0",
+		.data = (void *)PLL_ERRATA,
+	},
+	{ /* sentinel */ }
+};
 
 struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
@@ -276,6 +288,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		 */
 		value = readl(base + CPG_PLL0CR);
 		mult = (((value >> 24) & 0x7f) + 1) * 2;
+		if (cpg_quirks & PLL_ERRATA)
+			mult *= 2;
 		break;
 
 	case CLK_TYPE_GEN3_PLL1:
@@ -291,6 +305,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		 */
 		value = readl(base + CPG_PLL2CR);
 		mult = (((value >> 24) & 0x7f) + 1) * 2;
+		if (cpg_quirks & PLL_ERRATA)
+			mult *= 2;
 		break;
 
 	case CLK_TYPE_GEN3_PLL3:
@@ -306,6 +322,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		 */
 		value = readl(base + CPG_PLL4CR);
 		mult = (((value >> 24) & 0x7f) + 1) * 2;
+		if (cpg_quirks & PLL_ERRATA)
+			mult *= 2;
 		break;
 
 	case CLK_TYPE_GEN3_SD:
@@ -337,8 +355,14 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 int __init rcar_gen3_cpg_init(const struct rcar_gen3_cpg_pll_config *config,
 			      unsigned int clk_extalr, u32 mode)
 {
+	const struct soc_device_attribute *attr;
+
 	cpg_pll_config = config;
 	cpg_clk_extalr = clk_extalr;
 	cpg_mode = mode;
+	attr = soc_device_match(cpg_quirks_match);
+	if (attr)
+		cpg_quirks = (uintptr_t)attr->data;
+	pr_debug("%s: mode = 0x%x quirks = 0x%x\n", __func__, mode, cpg_quirks);
 	return 0;
 }
-- 
2.7.4
