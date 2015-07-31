Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH 22/26] clk: tegra: Convert to clk_hw based provider APIs
Date: Fri, 31 Jul 2015 10:04:02 -0700
Message-Id: <1438362246-6664-23-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We're removing struct clk from the clk provider API, so switch
this code to using the clk_hw based provider APIs.

Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/tegra/clk-emc.c | 10 +++++-----
 drivers/clk/tegra/clk-pll.c | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 08ae518c9950..138a94b99b5b 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -103,7 +103,7 @@ static unsigned long emc_recalc_rate(struct clk_hw *hw,
 	 * CCF wrongly assumes that the parent won't change during set_rate,
 	 * so get the parent rate explicitly.
 	 */
-	parent_rate = __clk_get_rate(__clk_get_parent(hw->clk));
+	parent_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
 
 	val = readl(tegra->clk_regs + CLK_SOURCE_EMC);
 	div = val & CLK_SOURCE_EMC_EMC_2X_CLK_DIVISOR_MASK;
@@ -151,7 +151,7 @@ static int emc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 		return 0;
 	}
 
-	req->rate = __clk_get_rate(hw->clk);
+	req->rate = clk_hw_get_rate(hw);
 	return 0;
 }
 
@@ -314,7 +314,7 @@ static int emc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	tegra = container_of(hw, struct tegra_clk_emc, hw);
 
-	if (__clk_get_rate(hw->clk) == rate)
+	if (clk_hw_get_rate(hw) == rate)
 		return 0;
 
 	/*
@@ -527,8 +527,8 @@ struct clk *tegra_clk_register_emc(void __iomem *base, struct device_node *np,
 	if (IS_ERR(clk))
 		return clk;
 
-	tegra->prev_parent = clk_get_parent_by_index(
-		tegra->hw.clk, emc_get_parent(&tegra->hw));
+	tegra->prev_parent = clk_hw_get_parent_by_index(
+		&tegra->hw, emc_get_parent(&tegra->hw))->clk;
 	tegra->changing_timing = false;
 
 	/* Allow debugging tools to see the EMC clock */
diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 63499c461482..69fea7d08681 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -634,7 +634,7 @@ static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	/* PLLM is used for memory; we do not change rate */
 	if (pll->params->flags & TEGRA_PLLM)
-		return __clk_get_rate(hw->clk);
+		return clk_hw_get_rate(hw);
 
 	if (_get_table_rate(hw, &cfg, rate, *prate) &&
 	    _calc_rate(hw, &cfg, rate, *prate))
@@ -1577,7 +1577,7 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 	if (!pll_params->pdiv_tohw)
 		return ERR_PTR(-EINVAL);
 
-	parent_rate = __clk_get_rate(parent);
+	parent_rate = clk_get_rate(parent);
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
@@ -1674,7 +1674,7 @@ struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
 		return ERR_PTR(-EINVAL);
 	}
 
-	parent_rate = __clk_get_rate(parent);
+	parent_rate = clk_get_rate(parent);
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
@@ -1715,7 +1715,7 @@ struct clk *tegra_clk_register_pllc(const char *name, const char *parent_name,
 		return ERR_PTR(-EINVAL);
 	}
 
-	parent_rate = __clk_get_rate(parent);
+	parent_rate = clk_get_rate(parent);
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
@@ -1848,7 +1848,7 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 	val &= ~PLLSS_REF_SRC_SEL_MASK;
 	pll_writel_base(val, pll);
 
-	parent_rate = __clk_get_rate(parent);
+	parent_rate = clk_get_rate(parent);
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

