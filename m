Return-Path: <rklein@nvidia.com>
From: Rhyland Klein <rklein@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>
CC: Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Bill Huang <bilhuang@nvidia.com>,
	Jim Lin <jilin@nvidia.com>,
	Benson Leung <bleung@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v6 15/25] clk: tegra: pll: Adjust vco_min if SDM present
Date: Thu, 18 Jun 2015 17:28:30 -0400
Message-ID: <1434662920-21469-16-git-send-email-rklein@nvidia.com>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

From: Bill Huang <bilhuang@nvidia.com>

This code makes use of the SDM fractional divider if present to
constrain the allowable programming range of the PLL divider register
bitfields to take advantage of higher frequency granularity that can
be induced by the SDM divider.

Based on original work by Aleksandr Frid <afrid@nvidia.com>

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v6:
  - Added kerneldoc

v5:
  - Removed whitespace change

 drivers/clk/tegra/clk-pll.c |   28 ++++++++++++++++++++++++++++
 drivers/clk/tegra/clk.h     |    4 ++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 1f70c356bdd7..3c348c96f9da 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1612,6 +1612,10 @@ struct clk *tegra_clk_register_pllxc(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	err = _setup_dynamic_ramp(pll_params, clk_base, parent_rate);
 	if (err)
 		return ERR_PTR(err);
@@ -1650,6 +1654,10 @@ struct clk *tegra_clk_register_pllre(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
@@ -1706,6 +1714,10 @@ struct clk *tegra_clk_register_pllm(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll_params->flags |= TEGRA_PLLM;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
@@ -2112,6 +2124,10 @@ struct clk *tegra_clk_register_pllc_tegra210(const char *name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
@@ -2149,6 +2165,10 @@ struct clk *tegra_clk_register_pllxc_tegra210(const char *name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
 	if (IS_ERR(pll))
 		return ERR_CAST(pll);
@@ -2196,6 +2216,10 @@ struct clk *tegra_clk_register_pllss_tegra210(const char *name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	/* initialize PLL to minimum rate */
 
 	cfg.m = _pll_fixed_mdiv(pll_params, parent_rate);
@@ -2260,6 +2284,10 @@ struct clk *tegra_clk_register_pllmb(const char *name, const char *parent_name,
 
 	pll_params->vco_min = _clip_vco_min(pll_params->vco_min, parent_rate);
 
+	if (pll_params->adjust_vco)
+		pll_params->vco_min = pll_params->adjust_vco(pll_params,
+							     parent_rate);
+
 	pll_params->flags |= TEGRA_PLL_BYPASS;
 	pll_params->flags |= TEGRA_PLLMB;
 	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 6170fcef7c33..72bf25525bd6 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -202,6 +202,8 @@ struct div_nmp {
  *				PLL's based on fractional divider value.
  * @calc_rate:			Callback used to change how out of table
  *				rates (dividers and multipler) are calculated.
+ * @adjust_vco:			Callback to adjust the programming range of the
+ *				divider range (if SDM is present)
  *
  * Flags:
  * TEGRA_PLL_USE_LOCK - This flag indicated to use lock bits for
@@ -269,6 +271,8 @@ struct tegra_clk_pll_params {
 	int	(*calc_rate)(struct clk_hw *hw,
 			struct tegra_clk_pll_freq_table *cfg,
 			unsigned long rate, unsigned long parent_rate);
+	unsigned long	(*adjust_vco)(struct tegra_clk_pll_params *pll_params,
+				unsigned long parent_rate);
 };
 
 #define TEGRA_PLL_USE_LOCK BIT(0)
-- 
1.7.9.5
