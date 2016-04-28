Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 6/7] clk: rockchip: move pll rate-comparison into a callable function
Date: Thu, 28 Apr 2016 15:11:14 +0200
Message-Id: <1461849075-8310-7-git-send-email-heiko@sntech.de>
In-Reply-To: <1461849075-8310-1-git-send-email-heiko@sntech.de>
References: <1461849075-8310-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

The init callback in our pll clk_ops allows us to re-set the same rate
of a pll with different parameters if these became updated with more
suitable values over time.

The init mechanism is similar over all pll types with the exception of
the comparison of old and new parameters. So move these out to callbable
functions to allow us to fold the generic init-handling into one.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-pll.c | 91 ++++++++++++++++++++++++++++--------------
 1 file changed, 61 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 081713c..5bd0545 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -36,6 +36,9 @@ struct rockchip_pll_data {
 			   struct rockchip_pll_rate_table *rate);
 	int (*set_params)(struct rockchip_clk_pll *pll,
 			  const struct rockchip_pll_rate_table *rate);
+	int (*compare_params)(struct rockchip_clk_pll *pll,
+			const struct rockchip_pll_rate_table *rate,
+			const struct rockchip_pll_rate_table *cur);
 };
 
 struct rockchip_clk_pll {
@@ -271,6 +274,25 @@ static int rockchip_rk3036_pll_set_params(struct rockchip_clk_pll *pll,
 	return ret;
 }
 
+static int rockchip_rk3036_pll_compare_params(struct rockchip_clk_pll *pll,
+				const struct rockchip_pll_rate_table *rate,
+				const struct rockchip_pll_rate_table *cur)
+{
+	const struct clk_hw *hw = &pll->hw;
+
+	pr_debug("%s: pll %s\n", __func__, clk_hw_get_name(hw));
+	pr_debug("old - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
+		 cur->fbdiv, cur->postdiv1, cur->refdiv, cur->postdiv2,
+		 cur->dsmpd, cur->frac);
+	pr_debug("new - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
+		 rate->fbdiv, rate->postdiv1, rate->refdiv, rate->postdiv2,
+		 rate->dsmpd, rate->frac);
+
+	return (rate->fbdiv == cur->fbdiv && rate->postdiv1 == cur->postdiv1 &&
+		rate->refdiv == cur->refdiv && rate->postdiv2 == cur->postdiv2 &&
+		rate->dsmpd == cur->dsmpd && rate->frac == cur->frac);
+}
+
 static int rockchip_rk3036_pll_enable(struct clk_hw *hw)
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
@@ -316,19 +338,7 @@ static void rockchip_rk3036_pll_init(struct clk_hw *hw)
 		return;
 
 	pll->data->get_params(pll, &cur);
-
-	pr_debug("%s: pll %s@%lu: Hz\n", __func__, __clk_get_name(hw->clk),
-		 drate);
-	pr_debug("old - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
-		 cur.fbdiv, cur.postdiv1, cur.refdiv, cur.postdiv2,
-		 cur.dsmpd, cur.frac);
-	pr_debug("new - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
-		 rate->fbdiv, rate->postdiv1, rate->refdiv, rate->postdiv2,
-		 rate->dsmpd, rate->frac);
-
-	if (rate->fbdiv != cur.fbdiv || rate->postdiv1 != cur.postdiv1 ||
-		rate->refdiv != cur.refdiv || rate->postdiv2 != cur.postdiv2 ||
-		rate->dsmpd != cur.dsmpd || rate->frac != cur.frac) {
+	if (!pll->data->compare_params(pll, rate, &cur)) {
 		struct clk *parent = clk_get_parent(hw->clk);
 
 		if (!parent) {
@@ -346,6 +356,7 @@ static void rockchip_rk3036_pll_init(struct clk_hw *hw)
 static const struct rockchip_pll_data rockchip_rk3036_pll_data = {
 	.get_params = rockchip_rk3036_pll_get_params,
 	.set_params = rockchip_rk3036_pll_set_params,
+	.compare_params = rockchip_rk3036_pll_compare_params,
 };
 
 static const struct clk_ops rockchip_rk3036_pll_clk_norate_ops = {
@@ -487,6 +498,20 @@ static int rockchip_rk3066_pll_set_params(struct rockchip_clk_pll *pll,
 	return ret;
 }
 
+static int rockchip_rk3066_pll_compare_params(struct rockchip_clk_pll *pll,
+				const struct rockchip_pll_rate_table *rate,
+				const struct rockchip_pll_rate_table *cur)
+{
+	const struct clk_hw *hw = &pll->hw;
+
+	pr_debug("%s: pll %s: nr (%d:%d); no (%d:%d); nf(%d:%d), nb(%d:%d)\n",
+		 __func__, clk_hw_get_name(hw), rate->nr, cur->nr,
+		 rate->no, cur->no, rate->nf, cur->nf, rate->nb, cur->nb);
+
+	return (rate->nr == cur->nr && rate->no == cur->no &&
+				 rate->nf == cur->nf && rate->nb == cur->nb);
+}
+
 static int rockchip_rk3066_pll_enable(struct clk_hw *hw)
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
@@ -533,11 +558,7 @@ static void rockchip_rk3066_pll_init(struct clk_hw *hw)
 
 	pll->data->get_params(pll, &cur);
 
-	pr_debug("%s: pll %s@%lu: nr (%d:%d); no (%d:%d); nf(%d:%d), nb(%d:%d)\n",
-		 __func__, clk_hw_get_name(hw), drate, rate->nr, cur.nr,
-		 rate->no, cur.no, rate->nf, cur.nf, rate->nb, cur.nb);
-	if (rate->nr != cur.nr || rate->no != cur.no || rate->nf != cur.nf
-						     || rate->nb != cur.nb) {
+	if (!pll->data->compare_params(pll, rate, &cur)) {
 		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
 			 __func__, clk_hw_get_name(hw));
 		pll->data->set_params(pll, rate);
@@ -547,6 +568,7 @@ static void rockchip_rk3066_pll_init(struct clk_hw *hw)
 static const struct rockchip_pll_data rockchip_rk3066_pll_data = {
 	.get_params = rockchip_rk3066_pll_get_params,
 	.set_params = rockchip_rk3066_pll_set_params,
+	.compare_params = rockchip_rk3066_pll_compare_params,
 };
 
 static const struct clk_ops rockchip_rk3066_pll_clk_norate_ops = {
@@ -717,6 +739,25 @@ static int rockchip_rk3399_pll_set_params(struct rockchip_clk_pll *pll,
 	return ret;
 }
 
+static int rockchip_rk3399_pll_compare_params(struct rockchip_clk_pll *pll,
+				const struct rockchip_pll_rate_table *rate,
+				const struct rockchip_pll_rate_table *cur)
+{
+	const struct clk_hw *hw = &pll->hw;
+
+	pr_debug("%s: pll %s: Hz\n", __func__, __clk_get_name(hw->clk));
+	pr_debug("old - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
+		 cur->fbdiv, cur->postdiv1, cur->refdiv, cur->postdiv2,
+		 cur->dsmpd, cur->frac);
+	pr_debug("new - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
+		 rate->fbdiv, rate->postdiv1, rate->refdiv, rate->postdiv2,
+		 rate->dsmpd, rate->frac);
+
+	return (rate->fbdiv == cur->fbdiv && rate->postdiv1 == cur->postdiv1 &&
+		rate->refdiv == cur->refdiv && rate->postdiv2 == cur->postdiv2 &&
+		rate->dsmpd == cur->dsmpd && rate->frac == cur->frac);
+}
+
 static int rockchip_rk3399_pll_enable(struct clk_hw *hw)
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
@@ -763,18 +804,7 @@ static void rockchip_rk3399_pll_init(struct clk_hw *hw)
 
 	pll->data->get_params(pll, &cur);
 
-	pr_debug("%s: pll %s@%lu: Hz\n", __func__, __clk_get_name(hw->clk),
-		 drate);
-	pr_debug("old - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
-		 cur.fbdiv, cur.postdiv1, cur.refdiv, cur.postdiv2,
-		 cur.dsmpd, cur.frac);
-	pr_debug("new - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
-		 rate->fbdiv, rate->postdiv1, rate->refdiv, rate->postdiv2,
-		 rate->dsmpd, rate->frac);
-
-	if (rate->fbdiv != cur.fbdiv || rate->postdiv1 != cur.postdiv1 ||
-		rate->refdiv != cur.refdiv || rate->postdiv2 != cur.postdiv2 ||
-		rate->dsmpd != cur.dsmpd || rate->frac != cur.frac) {
+	if (!pll->data->compare_params(pll, rate, &cur)) {
 		struct clk *parent = clk_get_parent(hw->clk);
 
 		if (!parent) {
@@ -792,6 +822,7 @@ static void rockchip_rk3399_pll_init(struct clk_hw *hw)
 static const struct rockchip_pll_data rockchip_rk3399_pll_data = {
 	.get_params = rockchip_rk3399_pll_get_params,
 	.set_params = rockchip_rk3399_pll_set_params,
+	.compare_params = rockchip_rk3399_pll_compare_params,
 };
 
 static const struct clk_ops rockchip_rk3399_pll_clk_norate_ops = {
-- 
2.6.4
