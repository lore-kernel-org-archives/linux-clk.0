Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] clk: renesas: rcar-gen3: Add support for SCCG/Clean peripheral clocks
Date: Thu, 20 Jul 2017 14:40:08 +0200
Message-Id: <1500554409-22423-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
References: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On R-Car Gen3 SoCs with a Spread Spectrum Clock Generator (e.g. R-Car
D3), a peripheral clock divider has been added, to select between clean
and spread spectrum parents.

Add a new clock type to the R-Car Gen3 driver core to handle this.
To avoid increasing the size of struct cpg_core_clk, both parents and
dividers are stored in the existing parent resp. div fields.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 20 +++++++++++++++++++-
 drivers/clk/renesas/rcar-gen3-cpg.h |  7 +++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 3f922fea9671fb4c..9511058165475dd7 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -272,7 +272,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 	unsigned int div = 1;
 	u32 value;
 
-	parent = clks[core->parent];
+	parent = clks[core->parent & 0xffff];	/* CLK_TYPE_PE uses high bits */
 	if (IS_ERR(parent))
 		return ERR_CAST(parent);
 
@@ -355,6 +355,24 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 			parent = clks[cpg_clk_extalr];
 		break;
 
+	case CLK_TYPE_GEN3_PE:
+		/*
+		 * Peripheral clock with a fixed divider, selectable between
+		 * clean and spread spectrum parents using MD12
+		 */
+		if (cpg_mode & BIT(12)) {
+			/* Clean */
+			div = core->div & 0xffff;
+		} else {
+			/* SCCG */
+			parent = clks[core->parent >> 16];
+			if (IS_ERR(parent))
+				return ERR_CAST(parent);
+			div = core->div >> 16;
+		}
+		mult = 1;
+		break;
+
 	default:
 		return ERR_PTR(-EINVAL);
 	}
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index 4eaf02955580a938..d756ef8b78eb6c02 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -20,11 +20,18 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_PLL4,
 	CLK_TYPE_GEN3_SD,
 	CLK_TYPE_GEN3_R,
+	CLK_TYPE_GEN3_PE,
 };
 
 #define DEF_GEN3_SD(_name, _id, _parent, _offset)	\
 	DEF_BASE(_name, _id, CLK_TYPE_GEN3_SD, _parent, .offset = _offset)
 
+#define DEF_GEN3_PE(_name, _id, _parent_sscg, _div_sscg, _parent_clean, \
+		    _div_clean) \
+	DEF_BASE(_name, _id, CLK_TYPE_GEN3_PE,			\
+		 (_parent_sscg) << 16 | (_parent_clean),	\
+		 .div = (_div_sscg) << 16 | (_div_clean))
+
 struct rcar_gen3_cpg_pll_config {
 	u8 extal_div;
 	u8 pll1_mult;
-- 
2.7.4
