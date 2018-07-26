Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 10/11] clk: renesas: rcar-gen3: Add support for mode pin clock selection
Date: Thu, 26 Jul 2018 17:35:16 +0200
Message-Id: <20180726153517.10020-11-geert+renesas@glider.be>
In-Reply-To: <20180726153517.10020-1-geert+renesas@glider.be>
References: <20180726153517.10020-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Make the existing support for selecting between clean and SSCG clocks
using MD12 more generic, to allow using other mode pins for arbitrary
clock selection.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v2:
  - Add Reviewed-by.
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 10 ++++------
 drivers/clk/renesas/rcar-gen3-cpg.h | 13 +++++++++----
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 19a77822757d29de..4346fdeef01bbeae 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -539,16 +539,14 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 			parent = clks[cpg_clk_extalr];
 		break;
 
-	case CLK_TYPE_GEN3_PE:
+	case CLK_TYPE_GEN3_MDSEL:
 		/*
-		 * Peripheral clock with a fixed divider, selectable between
-		 * clean and spread spectrum parents using MD12
+		 * Clock selectable between two parents and two fixed dividers
+		 * using a mode pin
 		 */
-		if (cpg_mode & BIT(12)) {
-			/* Clean */
+		if (cpg_mode & BIT(core->offset)) {
 			div = core->div & 0xffff;
 		} else {
-			/* SCCG */
 			parent = clks[core->parent >> 16];
 			if (IS_ERR(parent))
 				return ERR_CAST(parent);
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index 7c49aebf9dd12490..04dc45d15874abf6 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -20,7 +20,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_PLL4,
 	CLK_TYPE_GEN3_SD,
 	CLK_TYPE_GEN3_R,
-	CLK_TYPE_GEN3_PE,
+	CLK_TYPE_GEN3_MDSEL,	/* Select parent/divider using mode pin */
 	CLK_TYPE_GEN3_Z,
 	CLK_TYPE_GEN3_Z2,
 	CLK_TYPE_GEN3_OSC,	/* OSC EXTAL predivider and fixed divider */
@@ -30,11 +30,16 @@ enum rcar_gen3_clk_types {
 #define DEF_GEN3_SD(_name, _id, _parent, _offset)	\
 	DEF_BASE(_name, _id, CLK_TYPE_GEN3_SD, _parent, .offset = _offset)
 
+#define DEF_GEN3_MDSEL(_name, _id, _md, _parent0, _div0, _parent1, _div1) \
+	DEF_BASE(_name, _id, CLK_TYPE_GEN3_MDSEL,	\
+		 (_parent0) << 16 | (_parent1),		\
+		 .div = (_div0) << 16 | (_div1), .offset = _md)
+
 #define DEF_GEN3_PE(_name, _id, _parent_sscg, _div_sscg, _parent_clean, \
 		    _div_clean) \
-	DEF_BASE(_name, _id, CLK_TYPE_GEN3_PE,			\
-		 (_parent_sscg) << 16 | (_parent_clean),	\
-		 .div = (_div_sscg) << 16 | (_div_clean))
+	DEF_GEN3_MDSEL(_name, _id, 12, _parent_sscg, _div_sscg,	\
+		       _parent_clean, _div_clean)
+
 #define DEF_GEN3_OSC(_name, _id, _parent, _div)		\
 	DEF_BASE(_name, _id, CLK_TYPE_GEN3_OSC, _parent, .div = _div)
 
-- 
2.17.1
