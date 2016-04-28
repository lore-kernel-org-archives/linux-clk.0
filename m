Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 4/7] clk: rockchip: abstract pll get-params and set-params operations
Date: Thu, 28 Apr 2016 15:11:12 +0200
Message-Id: <1461849075-8310-5-git-send-email-heiko@sntech.de>
In-Reply-To: <1461849075-8310-1-git-send-email-heiko@sntech.de>
References: <1461849075-8310-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

This moves the pll-specific get_params and set_params functions into a
per-pll struct that gets associated at init time and will help us reign
in some code duplication we're faced with right now.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-pll.c | 54 ++++++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index e56637d..2c30f52 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -30,6 +30,14 @@
 #define PLL_MODE_NORM		0x1
 #define PLL_MODE_DEEP		0x2
 
+struct rockchip_clk_pll;
+struct rockchip_pll_data {
+	void (*get_params)(struct rockchip_clk_pll *pll,
+			   struct rockchip_pll_rate_table *rate);
+	int (*set_params)(struct rockchip_clk_pll *pll,
+			  const struct rockchip_pll_rate_table *rate);
+};
+
 struct rockchip_clk_pll {
 	struct clk_hw		hw;
 
@@ -48,6 +56,7 @@ struct rockchip_clk_pll {
 	spinlock_t		*lock;
 
 	struct rockchip_clk_provider *ctx;
+	const struct rockchip_pll_data *data;
 };
 
 #define to_rockchip_clk_pll(_hw) container_of(_hw, struct rockchip_clk_pll, hw)
@@ -164,7 +173,7 @@ static unsigned long rockchip_rk3036_pll_recalc_rate(struct clk_hw *hw,
 	struct rockchip_pll_rate_table cur;
 	u64 rate64 = prate;
 
-	rockchip_rk3036_pll_get_params(pll, &cur);
+	pll->data->get_params(pll, &cur);
 
 	rate64 *= cur.fbdiv;
 	do_div(rate64, cur.refdiv);
@@ -259,7 +268,7 @@ static int rockchip_rk3036_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 		return -EINVAL;
 	}
 
-	return rockchip_rk3036_pll_set_params(pll, rate);
+	return pll->data->set_params(pll, rate);
 }
 
 static int rockchip_rk3036_pll_enable(struct clk_hw *hw)
@@ -306,7 +315,7 @@ static void rockchip_rk3036_pll_init(struct clk_hw *hw)
 	if (!rate)
 		return;
 
-	rockchip_rk3036_pll_get_params(pll, &cur);
+	pll->data->get_params(pll, &cur);
 
 	pr_debug("%s: pll %s@%lu: Hz\n", __func__, __clk_get_name(hw->clk),
 		 drate);
@@ -330,10 +339,15 @@ static void rockchip_rk3036_pll_init(struct clk_hw *hw)
 
 		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
 			 __func__, __clk_get_name(hw->clk));
-		rockchip_rk3036_pll_set_params(pll, rate);
+		pll->data->set_params(pll, rate);
 	}
 }
 
+static const struct rockchip_pll_data rockchip_rk3036_pll_data = {
+	.get_params = rockchip_rk3036_pll_get_params,
+	.set_params = rockchip_rk3036_pll_set_params,
+};
+
 static const struct clk_ops rockchip_rk3036_pll_clk_norate_ops = {
 	.recalc_rate = rockchip_rk3036_pll_recalc_rate,
 	.enable = rockchip_rk3036_pll_enable,
@@ -405,7 +419,7 @@ static unsigned long rockchip_rk3066_pll_recalc_rate(struct clk_hw *hw,
 		return prate;
 	}
 
-	rockchip_rk3066_pll_get_params(pll, &cur);
+	pll->data->get_params(pll, &cur);
 
 	rate64 *= cur.nf;
 	do_div(rate64, cur.nr);
@@ -490,7 +504,7 @@ static int rockchip_rk3066_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 		return -EINVAL;
 	}
 
-	return rockchip_rk3066_pll_set_params(pll, rate);
+	return pll->data->set_params(pll, rate);
 }
 
 static int rockchip_rk3066_pll_enable(struct clk_hw *hw)
@@ -537,7 +551,7 @@ static void rockchip_rk3066_pll_init(struct clk_hw *hw)
 	if (!rate)
 		return;
 
-	rockchip_rk3066_pll_get_params(pll, &cur);
+	pll->data->get_params(pll, &cur);
 
 	pr_debug("%s: pll %s@%lu: nr (%d:%d); no (%d:%d); nf(%d:%d), nb(%d:%d)\n",
 		 __func__, clk_hw_get_name(hw), drate, rate->nr, cur.nr,
@@ -546,10 +560,15 @@ static void rockchip_rk3066_pll_init(struct clk_hw *hw)
 						     || rate->nb != cur.nb) {
 		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
 			 __func__, clk_hw_get_name(hw));
-		rockchip_rk3066_pll_set_params(pll, rate);
+		pll->data->set_params(pll, rate);
 	}
 }
 
+static const struct rockchip_pll_data rockchip_rk3066_pll_data = {
+	.get_params = rockchip_rk3066_pll_get_params,
+	.set_params = rockchip_rk3066_pll_set_params,
+};
+
 static const struct clk_ops rockchip_rk3066_pll_clk_norate_ops = {
 	.recalc_rate = rockchip_rk3066_pll_recalc_rate,
 	.enable = rockchip_rk3066_pll_enable,
@@ -638,7 +657,7 @@ static unsigned long rockchip_rk3399_pll_recalc_rate(struct clk_hw *hw,
 	struct rockchip_pll_rate_table cur;
 	u64 rate64 = prate;
 
-	rockchip_rk3399_pll_get_params(pll, &cur);
+	pll->data->get_params(pll, &cur);
 
 	rate64 *= cur.fbdiv;
 	do_div(rate64, cur.refdiv);
@@ -735,7 +754,7 @@ static int rockchip_rk3399_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 		return -EINVAL;
 	}
 
-	return rockchip_rk3399_pll_set_params(pll, rate);
+	return pll->data->set_params(pll, rate);
 }
 
 static int rockchip_rk3399_pll_enable(struct clk_hw *hw)
@@ -782,7 +801,7 @@ static void rockchip_rk3399_pll_init(struct clk_hw *hw)
 	if (!rate)
 		return;
 
-	rockchip_rk3399_pll_get_params(pll, &cur);
+	pll->data->get_params(pll, &cur);
 
 	pr_debug("%s: pll %s@%lu: Hz\n", __func__, __clk_get_name(hw->clk),
 		 drate);
@@ -806,10 +825,15 @@ static void rockchip_rk3399_pll_init(struct clk_hw *hw)
 
 		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
 			 __func__, __clk_get_name(hw->clk));
-		rockchip_rk3399_pll_set_params(pll, rate);
+		pll->data->set_params(pll, rate);
 	}
 }
 
+static const struct rockchip_pll_data rockchip_rk3399_pll_data = {
+	.get_params = rockchip_rk3399_pll_get_params,
+	.set_params = rockchip_rk3399_pll_set_params,
+};
+
 static const struct clk_ops rockchip_rk3399_pll_clk_norate_ops = {
 	.recalc_rate = rockchip_rk3399_pll_recalc_rate,
 	.enable = rockchip_rk3399_pll_enable,
@@ -916,18 +940,24 @@ struct clk *rockchip_clk_register_pll(struct rockchip_clk_provider *ctx,
 
 	switch (pll_type) {
 	case pll_rk3036:
+		pll->data = &rockchip_rk3036_pll_data;
+
 		if (!pll->rate_table || IS_ERR(ctx->grf))
 			init.ops = &rockchip_rk3036_pll_clk_norate_ops;
 		else
 			init.ops = &rockchip_rk3036_pll_clk_ops;
 		break;
 	case pll_rk3066:
+		pll->data = &rockchip_rk3066_pll_data;
+
 		if (!pll->rate_table || IS_ERR(ctx->grf))
 			init.ops = &rockchip_rk3066_pll_clk_norate_ops;
 		else
 			init.ops = &rockchip_rk3066_pll_clk_ops;
 		break;
 	case pll_rk3399:
+		pll->data = &rockchip_rk3399_pll_data;
+
 		if (!pll->rate_table)
 			init.ops = &rockchip_rk3399_pll_clk_norate_ops;
 		else
-- 
2.6.4
