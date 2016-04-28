Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 7/7] clk: rockchip: fold pll init functions into a common one
Date: Thu, 28 Apr 2016 15:11:15 +0200
Message-Id: <1461849075-8310-8-git-send-email-heiko@sntech.de>
In-Reply-To: <1461849075-8310-1-git-send-email-heiko@sntech.de>
References: <1461849075-8310-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

The pll init functions are now all the same, so we can generalize them
into one common function used by all to save some duplication.

The parent-check in the original functions does not do anything useful
at all, as we're not doing any real rate-handling at this point anymore,
so can just go away.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-pll.c | 125 ++++++++++-------------------------------
 1 file changed, 29 insertions(+), 96 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 5bd0545..1223eee 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -117,6 +117,32 @@ static int rockchip_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	return pll->data->set_params(pll, rate);
 }
 
+static void rockchip_pll_init(struct clk_hw *hw)
+{
+	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
+	const struct rockchip_pll_rate_table *rate;
+	struct rockchip_pll_rate_table cur;
+	unsigned long drate;
+
+	if (!(pll->flags & ROCKCHIP_PLL_SYNC_RATE))
+		return;
+
+	drate = clk_hw_get_rate(hw);
+	rate = rockchip_get_pll_settings(pll, drate);
+
+	/* when no rate setting for the current rate, rely on clk_set_rate */
+	if (!rate)
+		return;
+
+	pll->data->get_params(pll, &cur);
+
+	if (!pll->data->compare_params(pll, rate, &cur)) {
+		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
+			 __func__, clk_hw_get_name(hw));
+		pll->data->set_params(pll, rate);
+	}
+}
+
 /*
  * Wait for the pll to reach the locked state.
  * The calling set_rate function is responsible for making sure the
@@ -320,39 +346,6 @@ static int rockchip_rk3036_pll_is_enabled(struct clk_hw *hw)
 	return !(pllcon & RK3036_PLLCON1_PWRDOWN);
 }
 
-static void rockchip_rk3036_pll_init(struct clk_hw *hw)
-{
-	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
-	const struct rockchip_pll_rate_table *rate;
-	struct rockchip_pll_rate_table cur;
-	unsigned long drate;
-
-	if (!(pll->flags & ROCKCHIP_PLL_SYNC_RATE))
-		return;
-
-	drate = clk_hw_get_rate(hw);
-	rate = rockchip_get_pll_settings(pll, drate);
-
-	/* when no rate setting for the current rate, rely on clk_set_rate */
-	if (!rate)
-		return;
-
-	pll->data->get_params(pll, &cur);
-	if (!pll->data->compare_params(pll, rate, &cur)) {
-		struct clk *parent = clk_get_parent(hw->clk);
-
-		if (!parent) {
-			pr_warn("%s: parent of %s not available\n",
-				__func__, __clk_get_name(hw->clk));
-			return;
-		}
-
-		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
-			 __func__, __clk_get_name(hw->clk));
-		pll->data->set_params(pll, rate);
-	}
-}
-
 static const struct rockchip_pll_data rockchip_rk3036_pll_data = {
 	.get_params = rockchip_rk3036_pll_get_params,
 	.set_params = rockchip_rk3036_pll_set_params,
@@ -373,7 +366,7 @@ static const struct clk_ops rockchip_rk3036_pll_clk_ops = {
 	.enable = rockchip_rk3036_pll_enable,
 	.disable = rockchip_rk3036_pll_disable,
 	.is_enabled = rockchip_rk3036_pll_is_enabled,
-	.init = rockchip_rk3036_pll_init,
+	.init = rockchip_pll_init,
 };
 
 /**
@@ -539,32 +532,6 @@ static int rockchip_rk3066_pll_is_enabled(struct clk_hw *hw)
 	return !(pllcon & RK3066_PLLCON3_PWRDOWN);
 }
 
-static void rockchip_rk3066_pll_init(struct clk_hw *hw)
-{
-	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
-	const struct rockchip_pll_rate_table *rate;
-	struct rockchip_pll_rate_table cur;
-	unsigned long drate;
-
-	if (!(pll->flags & ROCKCHIP_PLL_SYNC_RATE))
-		return;
-
-	drate = clk_hw_get_rate(hw);
-	rate = rockchip_get_pll_settings(pll, drate);
-
-	/* when no rate setting for the current rate, rely on clk_set_rate */
-	if (!rate)
-		return;
-
-	pll->data->get_params(pll, &cur);
-
-	if (!pll->data->compare_params(pll, rate, &cur)) {
-		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
-			 __func__, clk_hw_get_name(hw));
-		pll->data->set_params(pll, rate);
-	}
-}
-
 static const struct rockchip_pll_data rockchip_rk3066_pll_data = {
 	.get_params = rockchip_rk3066_pll_get_params,
 	.set_params = rockchip_rk3066_pll_set_params,
@@ -585,7 +552,7 @@ static const struct clk_ops rockchip_rk3066_pll_clk_ops = {
 	.enable = rockchip_rk3066_pll_enable,
 	.disable = rockchip_rk3066_pll_disable,
 	.is_enabled = rockchip_rk3066_pll_is_enabled,
-	.init = rockchip_rk3066_pll_init,
+	.init = rockchip_pll_init,
 };
 
 /**
@@ -785,40 +752,6 @@ static int rockchip_rk3399_pll_is_enabled(struct clk_hw *hw)
 	return !(pllcon & RK3399_PLLCON3_PWRDOWN);
 }
 
-static void rockchip_rk3399_pll_init(struct clk_hw *hw)
-{
-	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
-	const struct rockchip_pll_rate_table *rate;
-	struct rockchip_pll_rate_table cur;
-	unsigned long drate;
-
-	if (!(pll->flags & ROCKCHIP_PLL_SYNC_RATE))
-		return;
-
-	drate = clk_hw_get_rate(hw);
-	rate = rockchip_get_pll_settings(pll, drate);
-
-	/* when no rate setting for the current rate, rely on clk_set_rate */
-	if (!rate)
-		return;
-
-	pll->data->get_params(pll, &cur);
-
-	if (!pll->data->compare_params(pll, rate, &cur)) {
-		struct clk *parent = clk_get_parent(hw->clk);
-
-		if (!parent) {
-			pr_warn("%s: parent of %s not available\n",
-				__func__, __clk_get_name(hw->clk));
-			return;
-		}
-
-		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
-			 __func__, __clk_get_name(hw->clk));
-		pll->data->set_params(pll, rate);
-	}
-}
-
 static const struct rockchip_pll_data rockchip_rk3399_pll_data = {
 	.get_params = rockchip_rk3399_pll_get_params,
 	.set_params = rockchip_rk3399_pll_set_params,
@@ -839,7 +772,7 @@ static const struct clk_ops rockchip_rk3399_pll_clk_ops = {
 	.enable = rockchip_rk3399_pll_enable,
 	.disable = rockchip_rk3399_pll_disable,
 	.is_enabled = rockchip_rk3399_pll_is_enabled,
-	.init = rockchip_rk3399_pll_init,
+	.init = rockchip_pll_init,
 };
 
 /*
-- 
2.6.4
