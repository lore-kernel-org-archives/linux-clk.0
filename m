Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 5/7] clk: rockchip: generalize pll set-rate operation
Date: Thu, 28 Apr 2016 15:11:13 +0200
Message-Id: <1461849075-8310-6-git-send-email-heiko@sntech.de>
In-Reply-To: <1461849075-8310-1-git-send-email-heiko@sntech.de>
References: <1461849075-8310-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

The currently pll-specific set_rate operations are now identical,
and with the actual register access already being abstracted away
will also stay that way.

Therefore merge them into one function used by each PLL.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-pll.c | 86 +++++++++++-------------------------------
 1 file changed, 23 insertions(+), 63 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 2c30f52..081713c 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -94,6 +94,26 @@ static long rockchip_pll_round_rate(struct clk_hw *hw,
 	return rate_table[i - 1].rate;
 }
 
+static int rockchip_pll_set_rate(struct clk_hw *hw, unsigned long drate,
+				 unsigned long prate)
+{
+	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
+	const struct rockchip_pll_rate_table *rate;
+
+	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
+		 __func__, clk_hw_get_name(hw), drate, prate);
+
+	/* Get required rate settings from table */
+	rate = rockchip_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+			drate, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	return pll->data->set_params(pll, rate);
+}
+
 /*
  * Wait for the pll to reach the locked state.
  * The calling set_rate function is responsible for making sure the
@@ -251,26 +271,6 @@ static int rockchip_rk3036_pll_set_params(struct rockchip_clk_pll *pll,
 	return ret;
 }
 
-static int rockchip_rk3036_pll_set_rate(struct clk_hw *hw, unsigned long drate,
-					unsigned long prate)
-{
-	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
-	const struct rockchip_pll_rate_table *rate;
-
-	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), drate, prate);
-
-	/* Get required rate settings from table */
-	rate = rockchip_get_pll_settings(pll, drate);
-	if (!rate) {
-		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, __clk_get_name(hw->clk));
-		return -EINVAL;
-	}
-
-	return pll->data->set_params(pll, rate);
-}
-
 static int rockchip_rk3036_pll_enable(struct clk_hw *hw)
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
@@ -358,7 +358,7 @@ static const struct clk_ops rockchip_rk3036_pll_clk_norate_ops = {
 static const struct clk_ops rockchip_rk3036_pll_clk_ops = {
 	.recalc_rate = rockchip_rk3036_pll_recalc_rate,
 	.round_rate = rockchip_pll_round_rate,
-	.set_rate = rockchip_rk3036_pll_set_rate,
+	.set_rate = rockchip_pll_set_rate,
 	.enable = rockchip_rk3036_pll_enable,
 	.disable = rockchip_rk3036_pll_disable,
 	.is_enabled = rockchip_rk3036_pll_is_enabled,
@@ -487,26 +487,6 @@ static int rockchip_rk3066_pll_set_params(struct rockchip_clk_pll *pll,
 	return ret;
 }
 
-static int rockchip_rk3066_pll_set_rate(struct clk_hw *hw, unsigned long drate,
-					unsigned long prate)
-{
-	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
-	const struct rockchip_pll_rate_table *rate;
-
-	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
-		 __func__, clk_hw_get_name(hw), drate, prate);
-
-	/* Get required rate settings from table */
-	rate = rockchip_get_pll_settings(pll, drate);
-	if (!rate) {
-		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, clk_hw_get_name(hw));
-		return -EINVAL;
-	}
-
-	return pll->data->set_params(pll, rate);
-}
-
 static int rockchip_rk3066_pll_enable(struct clk_hw *hw)
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
@@ -579,7 +559,7 @@ static const struct clk_ops rockchip_rk3066_pll_clk_norate_ops = {
 static const struct clk_ops rockchip_rk3066_pll_clk_ops = {
 	.recalc_rate = rockchip_rk3066_pll_recalc_rate,
 	.round_rate = rockchip_pll_round_rate,
-	.set_rate = rockchip_rk3066_pll_set_rate,
+	.set_rate = rockchip_pll_set_rate,
 	.enable = rockchip_rk3066_pll_enable,
 	.disable = rockchip_rk3066_pll_disable,
 	.is_enabled = rockchip_rk3066_pll_is_enabled,
@@ -737,26 +717,6 @@ static int rockchip_rk3399_pll_set_params(struct rockchip_clk_pll *pll,
 	return ret;
 }
 
-static int rockchip_rk3399_pll_set_rate(struct clk_hw *hw, unsigned long drate,
-					unsigned long prate)
-{
-	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
-	const struct rockchip_pll_rate_table *rate;
-
-	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), drate, prate);
-
-	/* Get required rate settings from table */
-	rate = rockchip_get_pll_settings(pll, drate);
-	if (!rate) {
-		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, __clk_get_name(hw->clk));
-		return -EINVAL;
-	}
-
-	return pll->data->set_params(pll, rate);
-}
-
 static int rockchip_rk3399_pll_enable(struct clk_hw *hw)
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
@@ -844,7 +804,7 @@ static const struct clk_ops rockchip_rk3399_pll_clk_norate_ops = {
 static const struct clk_ops rockchip_rk3399_pll_clk_ops = {
 	.recalc_rate = rockchip_rk3399_pll_recalc_rate,
 	.round_rate = rockchip_pll_round_rate,
-	.set_rate = rockchip_rk3399_pll_set_rate,
+	.set_rate = rockchip_pll_set_rate,
 	.enable = rockchip_rk3399_pll_enable,
 	.disable = rockchip_rk3399_pll_disable,
 	.is_enabled = rockchip_rk3399_pll_is_enabled,
-- 
2.6.4
