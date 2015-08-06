Return-Path: <Govindraj.Raja@imgtec.com>
From: Govindraj Raja <govindraj.raja@imgtec.com>
To: <linux-mips@linux-mips.org>, <linux-clk@vger.kernel.org>, Mike Turquette
	<mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "Michael
 Turquette" <mturquette@baylibre.com>
CC: Zdenko Pulitika <zdenko.pulitika@imgtec.com>, Kevin Cernekee
	<cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>, "Andrew
 Bresticker" <abrestic@chromium.org>, James Hartley
	<James.Hartley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>,
	Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan
	<James.Hogan@imgtec.com>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
	Govindraj Raja <govindraj.raja@imgtec.com>
Subject: [PATCH 3/6] clk: pistachio: Fix pll rate calculation in integer mode
Date: Thu, 6 Aug 2015 14:43:31 +0100
Message-ID: <1438868614-7672-4-git-send-email-govindraj.raja@imgtec.com>
In-Reply-To: <1438868614-7672-1-git-send-email-govindraj.raja@imgtec.com>
References: <1438868614-7672-1-git-send-email-govindraj.raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>

.recalc_rate callback for the fractional pll doesn't take operating
mode into account when calculating pll rate. This results in
the incorrect pll rates when pll is operating in integer mode.

This commit fixes this by checking the operating mode before
calculating pll rate.

Signed-off-by: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
---
 drivers/clk/pistachio/clk-pll.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/pistachio/clk-pll.c b/drivers/clk/pistachio/clk-pll.c
index 9a38a2b..8802b2e 100644
--- a/drivers/clk/pistachio/clk-pll.c
+++ b/drivers/clk/pistachio/clk-pll.c
@@ -65,6 +65,10 @@
 #define MIN_OUTPUT_FRAC			12000000UL
 #define MAX_OUTPUT_FRAC			1600000000UL
 
+/* Fractional PLL operating modes */
+#define PLL_MODE_INT			1
+#define PLL_MODE_FRAC			0
+
 struct pistachio_clk_pll {
 	struct clk_hw hw;
 	void __iomem *base;
@@ -99,6 +103,15 @@ static inline struct pistachio_clk_pll *to_pistachio_pll(struct clk_hw *hw)
 	return container_of(hw, struct pistachio_clk_pll, hw);
 }
 
+static inline u32 pll_frac_get_mode(struct clk_hw *hw)
+{
+	struct pistachio_clk_pll *pll = to_pistachio_pll(hw);
+	u32 val;
+
+	val = pll_readl(pll, PLL_CTRL3) & PLL_FRAC_CTRL3_DSMPD;
+	return val ? PLL_MODE_INT : PLL_MODE_FRAC;
+}
+
 static struct pistachio_pll_rate_table *
 pll_get_params(struct pistachio_clk_pll *pll, unsigned long fref,
 	       unsigned long fout)
@@ -180,7 +193,15 @@ static int pll_gf40lp_frac_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (!params || !params->refdiv)
 		return -EINVAL;
 
-	vco = div64_u64(params->fref * params->fbdiv, params->refdiv);
+	/* get operating mode and calculate vco accordingly */
+	vco = params->fref;
+	if (pll_frac_get_mode(hw) == PLL_MODE_INT)
+		vco *= params->fbdiv << 24;
+	else
+		vco *= (params->fbdiv << 24) + params->frac;
+
+	vco = div64_u64(vco, params->refdiv << 24);
+
 	if (vco < MIN_VCO_FRAC_FRAC || vco > MAX_VCO_FRAC_FRAC)
 		pr_warn("%s: VCO %llu is out of range %lu..%lu\n", name, vco,
 			MIN_VCO_FRAC_FRAC, MAX_VCO_FRAC_FRAC);
@@ -247,8 +268,13 @@ static unsigned long pll_gf40lp_frac_recalc_rate(struct clk_hw *hw,
 		PLL_FRAC_CTRL2_POSTDIV2_MASK;
 	frac = (val >> PLL_FRAC_CTRL2_FRAC_SHIFT) & PLL_FRAC_CTRL2_FRAC_MASK;
 
+	/* get operating mode (int/frac) and calculate rate accordingly */
 	rate = parent_rate;
-	rate *= (fbdiv << 24) + frac;
+	if (pll_frac_get_mode(hw) == PLL_MODE_FRAC)
+		rate *= (fbdiv << 24) + frac;
+	else
+		rate *= (fbdiv << 24);
+
 	rate = do_div_round_closest(rate, (prediv * postdiv1 * postdiv2) << 24);
 
 	return rate;
-- 
1.9.1
