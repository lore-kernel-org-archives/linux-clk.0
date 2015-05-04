Return-Path: <rklein@nvidia.com>
From: Rhyland Klein <rklein@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
CC: Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bill Huang <bilhuang@nvidia.com>
Subject: [PATCH v4 14/20] clk: tegra: pll: Adjust vco_min if SDM present
Date: Mon, 4 May 2015 12:37:34 -0400
Message-ID: <1430757460-9478-15-git-send-email-rklein@nvidia.com>
In-Reply-To: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

From: Bill Huang <bilhuang@nvidia.com>

This code makes use of the SDM fractional divider if present to
contrain the allowable programming range of the PLL divider register
bitfields to take advantage of higher frequency granularity that can
be induced by the SDM divider.

Based on original work by Aleksandr Frid <afrid@nvidia.com>

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c |   29 ++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h     |    2 ++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index b16263e978d7..94416018e35c 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1635,7 +1635,6 @@ static const struct clk_ops tegra_clk_plle_tegra114_ops = {
 	.recalc_rate = clk_pll_recalc_rate,
 };
 
-
 struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 			  void __iomem *clk_base, void __iomem *pmc,
 			  unsigned long flags,
@@ -1662,6 +1661,10 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
 	if (err)
 		return ERR_PTR(err);
@@ -1700,6 +1703,10 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
@@ -1756,6 +1763,10 @@ struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll_params->flags |= TEGRA_PLLM;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
@@ -2186,6 +2197,10 @@ struct clk *tegra_clk_register_pllc_tegra210(const char *name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
@@ -2224,6 +2239,10 @@ struct clk *tegra_clk_register_pllxc_tegra210(const char *name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
@@ -2271,6 +2290,10 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	/* initialize PLL to minimum rate */
 
 	cfg.m = _pll_fixed_mdiv(pll_params, parent_rate);
@@ -2335,6 +2358,10 @@ struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll_params->flags |= TEGRA_PLLMB;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 4644f43ca100..fb4caa510583 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -248,6 +248,8 @@ struct tegra_clk_pll_params {
 	int	(*calc_rate)(struct clk_hw *hw,
 			struct tegra_clk_pll_freq_table *cfg,
 			unsigned long rate, unsigned long parent_rate);
+	unsigned long	(*adjust_vco)(struct tegra_clk_pll_params *pll_params,
+				unsigned long parent_rate);
 };
 
 #define TEGRA_PLL_USE_LOCK BIT(0)
-- 
1.7.9.5
