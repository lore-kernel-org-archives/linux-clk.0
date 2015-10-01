Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH] clk: rockchip: don't use clk_ APIs in the pll init-callback
Date: Thu, 01 Oct 2015 11:38:35 +0200
Message-ID: <2341478.8ucNaho7mA@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Separate the update of pll registers from the actual set_rate function
so that the init callback does not need to access clk-API functions.

As we now have separated the getting and setting of the pll parameters
we can also directly use these new functions in other places too.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-pll.c | 135 ++++++++++++++++++++++-------------------
 1 file changed, 74 insertions(+), 61 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 7737a1d..4881eb8 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -126,11 +126,32 @@ static int rockchip_pll_wait_lock(struct rockchip_clk_pll *pll)
 #define RK3066_PLLCON3_PWRDOWN		(1 << 1)
 #define RK3066_PLLCON3_BYPASS		(1 << 0)
 
+static void rockchip_rk3066_pll_get_params(struct rockchip_clk_pll *pll,
+					struct rockchip_pll_rate_table *rate)
+{
+	u32 pllcon;
+
+	pllcon = readl_relaxed(pll->reg_base + RK3066_PLLCON(0));
+	rate->nr = ((pllcon >> RK3066_PLLCON0_NR_SHIFT)
+				& RK3066_PLLCON0_NR_MASK) + 1;
+	rate->no = ((pllcon >> RK3066_PLLCON0_OD_SHIFT)
+				& RK3066_PLLCON0_OD_MASK) + 1;
+
+	pllcon = readl_relaxed(pll->reg_base + RK3066_PLLCON(1));
+	rate->nf = ((pllcon >> RK3066_PLLCON1_NF_SHIFT)
+				& RK3066_PLLCON1_NF_MASK) + 1;
+
+	pllcon = readl_relaxed(pll->reg_base + RK3066_PLLCON(2));
+	rate->nb = ((pllcon >> RK3066_PLLCON2_NB_SHIFT)
+				& RK3066_PLLCON2_NB_MASK) + 1;
+}
+
 static unsigned long rockchip_rk3066_pll_recalc_rate(struct clk_hw *hw,
 						     unsigned long prate)
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
-	u64 nf, nr, no, rate64 = prate;
+	struct rockchip_pll_rate_table cur;
+	u64 rate64 = prate;
 	u32 pllcon;
 
 	pllcon = readl_relaxed(pll->reg_base + RK3066_PLLCON(3));
@@ -140,53 +161,31 @@ static unsigned long rockchip_rk3066_pll_recalc_rate(struct clk_hw *hw,
 		return prate;
 	}
 
-	pllcon = readl_relaxed(pll->reg_base + RK3066_PLLCON(1));
-	nf = (pllcon >> RK3066_PLLCON1_NF_SHIFT) & RK3066_PLLCON1_NF_MASK;
-
-	pllcon = readl_relaxed(pll->reg_base + RK3066_PLLCON(0));
-	nr = (pllcon >> RK3066_PLLCON0_NR_SHIFT) & RK3066_PLLCON0_NR_MASK;
-	no = (pllcon >> RK3066_PLLCON0_OD_SHIFT) & RK3066_PLLCON0_OD_MASK;
+	rockchip_rk3066_pll_get_params(pll, &cur);
 
-	rate64 *= (nf + 1);
-	do_div(rate64, nr + 1);
-	do_div(rate64, no + 1);
+	rate64 *= cur.nf;
+	do_div(rate64, cur.nr);
+	do_div(rate64, cur.no);
 
 	return (unsigned long)rate64;
 }
 
-static int rockchip_rk3066_pll_set_rate(struct clk_hw *hw, unsigned long drate,
-					unsigned long prate)
+static int rockchip_rk3066_pll_set_params(struct rockchip_clk_pll *pll,
+				const struct rockchip_pll_rate_table *rate)
 {
-	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
-	const struct rockchip_pll_rate_table *rate;
-	unsigned long old_rate = rockchip_rk3066_pll_recalc_rate(hw, prate);
-	struct regmap *grf = rockchip_clk_get_grf();
-	struct clk_mux *pll_mux = &pll->pll_mux;
 	const struct clk_ops *pll_mux_ops = pll->pll_mux_ops;
+	struct clk_mux *pll_mux = &pll->pll_mux;
+	struct rockchip_pll_rate_table cur;
 	int rate_change_remuxed = 0;
 	int cur_parent;
 	int ret;
 
-	if (IS_ERR(grf)) {
-		pr_debug("%s: grf regmap not available, aborting rate change\n",
-			 __func__);
-		return PTR_ERR(grf);
-	}
-
-	pr_debug("%s: changing %s from %lu to %lu with a parent rate of %lu\n",
-		 __func__, clk_hw_get_name(hw), old_rate, drate, prate);
-
-	/* Get required rate settings from table */
-	rate = rockchip_get_pll_settings(pll, drate);
-	if (!rate) {
-		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, clk_hw_get_name(hw));
-		return -EINVAL;
-	}
-
 	pr_debug("%s: rate settings for %lu (nr, no, nf): (%d, %d, %d)\n",
 		 __func__, rate->rate, rate->nr, rate->no, rate->nf);
 
+	rockchip_rk3066_pll_get_params(pll, &cur);
+	cur.rate = 0;
+
 	cur_parent = pll_mux_ops->get_parent(&pll_mux->hw);
 	if (cur_parent == PLL_MODE_NORM) {
 		pll_mux_ops->set_parent(&pll_mux->hw, PLL_MODE_SLOW);
@@ -219,9 +218,9 @@ static int rockchip_rk3066_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	/* wait for the pll to lock */
 	ret = rockchip_pll_wait_lock(pll);
 	if (ret) {
-		pr_warn("%s: pll did not lock, trying to restore old rate %lu\n",
-			__func__, old_rate);
-		rockchip_rk3066_pll_set_rate(hw, old_rate, prate);
+		pr_warn("%s: pll update unsucessful, trying to restore old params\n",
+			__func__);
+		rockchip_rk3066_pll_set_params(pll, &cur);
 	}
 
 	if (rate_change_remuxed)
@@ -230,6 +229,34 @@ static int rockchip_rk3066_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	return ret;
 }
 
+static int rockchip_rk3066_pll_set_rate(struct clk_hw *hw, unsigned long drate,
+					unsigned long prate)
+{
+	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
+	const struct rockchip_pll_rate_table *rate;
+	unsigned long old_rate = rockchip_rk3066_pll_recalc_rate(hw, prate);
+	struct regmap *grf = rockchip_clk_get_grf();
+
+	if (IS_ERR(grf)) {
+		pr_debug("%s: grf regmap not available, aborting rate change\n",
+			 __func__);
+		return PTR_ERR(grf);
+	}
+
+	pr_debug("%s: changing %s from %lu to %lu with a parent rate of %lu\n",
+		 __func__, clk_hw_get_name(hw), old_rate, drate, prate);
+
+	/* Get required rate settings from table */
+	rate = rockchip_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+			drate, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	return rockchip_rk3066_pll_set_params(pll, rate);
+}
+
 static int rockchip_rk3066_pll_enable(struct clk_hw *hw)
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
@@ -261,9 +288,8 @@ static void rockchip_rk3066_pll_init(struct clk_hw *hw)
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
 	const struct rockchip_pll_rate_table *rate;
-	unsigned int nf, nr, no, nb;
+	struct rockchip_pll_rate_table cur;
 	unsigned long drate;
-	u32 pllcon;
 
 	if (!(pll->flags & ROCKCHIP_PLL_SYNC_RATE))
 		return;
@@ -275,34 +301,21 @@ static void rockchip_rk3066_pll_init(struct clk_hw *hw)
 	if (!rate)
 		return;
 
-	pllcon = readl_relaxed(pll->reg_base + RK3066_PLLCON(0));
-	nr = ((pllcon >> RK3066_PLLCON0_NR_SHIFT) & RK3066_PLLCON0_NR_MASK) + 1;
-	no = ((pllcon >> RK3066_PLLCON0_OD_SHIFT) & RK3066_PLLCON0_OD_MASK) + 1;
-
-	pllcon = readl_relaxed(pll->reg_base + RK3066_PLLCON(1));
-	nf = ((pllcon >> RK3066_PLLCON1_NF_SHIFT) & RK3066_PLLCON1_NF_MASK) + 1;
-
-	pllcon = readl_relaxed(pll->reg_base + RK3066_PLLCON(2));
-	nb = ((pllcon >> RK3066_PLLCON2_NB_SHIFT) & RK3066_PLLCON2_NB_MASK) + 1;
+	rockchip_rk3066_pll_get_params(pll, &cur);
 
 	pr_debug("%s: pll %s@%lu: nr (%d:%d); no (%d:%d); nf(%d:%d), nb(%d:%d)\n",
-		 __func__, clk_hw_get_name(hw), drate, rate->nr, nr,
-		rate->no, no, rate->nf, nf, rate->nb, nb);
-	if (rate->nr != nr || rate->no != no || rate->nf != nf
-					     || rate->nb != nb) {
-		struct clk_hw *parent = clk_hw_get_parent(hw);
-		unsigned long prate;
-
-		if (!parent) {
-			pr_warn("%s: parent of %s not available\n",
-				__func__, clk_hw_get_name(hw));
+		 __func__, clk_hw_get_name(hw), drate, rate->nr, cur.nr,
+		 rate->no, cur.no, rate->nf, cur.nf, rate->nb, cur.nb);
+	if (rate->nr != cur.nr || rate->no != cur.no || rate->nf != cur.nf
+						     || rate->nb != cur.nb) {
+		struct regmap *grf = rockchip_clk_get_grf();
+
+		if (IS_ERR(grf))
 			return;
-		}
 
 		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
 			 __func__, clk_hw_get_name(hw));
-		prate = clk_hw_get_rate(parent);
-		rockchip_rk3066_pll_set_rate(hw, drate, prate);
+		rockchip_rk3066_pll_set_params(pll, rate);
 	}
 }
 
-- 
2.5.3
