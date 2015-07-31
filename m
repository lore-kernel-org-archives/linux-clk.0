Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 17/26] clk: rockchip: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:03:57 -0700
Message-Id: <1438362246-6664-18-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/rockchip/clk-pll.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 96903ae8b192..198261e001fa 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -136,7 +136,7 @@ static unsigned long rockchip_rk3066_pll_recalc_rate(struct clk_hw *hw,
 	pllcon = readl_relaxed(pll->reg_base + RK3066_PLLCON(3));
 	if (pllcon & RK3066_PLLCON3_BYPASS) {
 		pr_debug("%s: pll %s is bypassed\n", __func__,
-			__clk_get_name(hw->clk));
+			clk_hw_get_name(hw));
 		return prate;
 	}
 
@@ -174,13 +174,13 @@ static int rockchip_rk3066_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	}
 
 	pr_debug("%s: changing %s from %lu to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), old_rate, drate, prate);
+		 __func__, clk_hw_get_name(hw), old_rate, drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
 	if (!rate) {
 		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, __clk_get_name(hw->clk));
+			drate, clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 
@@ -268,7 +268,7 @@ static void rockchip_rk3066_pll_init(struct clk_hw *hw)
 	if (!(pll->flags & ROCKCHIP_PLL_SYNC_RATE))
 		return;
 
-	drate = __clk_get_rate(hw->clk);
+	drate = clk_hw_get_rate(hw);
 	rate = rockchip_get_pll_settings(pll, drate);
 
 	/* when no rate setting for the current rate, rely on clk_set_rate */
@@ -286,22 +286,22 @@ static void rockchip_rk3066_pll_init(struct clk_hw *hw)
 	nb = ((pllcon >> RK3066_PLLCON2_NB_SHIFT) & RK3066_PLLCON2_NB_MASK) + 1;
 
 	pr_debug("%s: pll %s@%lu: nr (%d:%d); no (%d:%d); nf(%d:%d), nb(%d:%d)\n",
-		 __func__, __clk_get_name(hw->clk), drate, rate->nr, nr,
+		 __func__, clk_hw_get_name(hw), drate, rate->nr, nr,
 		rate->no, no, rate->nf, nf, rate->nb, nb);
 	if (rate->nr != nr || rate->no != no || rate->nf != nf
 					     || rate->nb != nb) {
-		struct clk *parent = __clk_get_parent(hw->clk);
+		struct clk_hw *parent = clk_hw_get_parent(hw);
 		unsigned long prate;
 
 		if (!parent) {
 			pr_warn("%s: parent of %s not available\n",
-				__func__, __clk_get_name(hw->clk));
+				__func__, clk_hw_get_parent(hw));
 			return;
 		}
 
 		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
-			 __func__, __clk_get_name(hw->clk));
-		prate = __clk_get_rate(parent);
+			 __func__, clk_hw_get_name(hw));
+		prate = clk_hw_get_rate(parent);
 		rockchip_rk3066_pll_set_rate(hw, drate, prate);
 	}
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

