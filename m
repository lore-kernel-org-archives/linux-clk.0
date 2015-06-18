Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Rhyland Klein <rklein@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>
CC: Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>,
	Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v6 24/25] clk: tegra: read correct iddq register in PLL_SS registration
Date: Thu, 18 Jun 2015 17:28:39 -0400
Message-ID: <1434662920-21469-25-git-send-email-rklein@nvidia.com>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Bill Huang <bilhuang@nvidia.com>

This fixes bug in tegra_clk_register_pllss() which mistakenly assume the
iddq register is the PLL base address.

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 932a18ce821f..82f04a60649c 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1921,7 +1921,7 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 	struct clk *clk, *parent;
 	struct tegra_clk_pll_freq_table cfg;
 	unsigned long parent_rate;
-	u32 val;
+	u32 val, val_iddq;
 	int i;
 
 	if (!pll_params->div_nmp)
@@ -1968,14 +1968,17 @@ struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
 	pll_writel(PLLSS_CTRL1_DEFAULT, pll_params->ext_misc_reg[2], pll);
 
 	val = pll_readl_base(pll);
+	val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);
 	if (val & PLL_BASE_ENABLE) {
-		if (val & BIT(pll_params->iddq_bit_idx)) {
+		if (val_iddq & BIT(pll_params->iddq_bit_idx)) {
 			WARN(1, "%s is on but IDDQ set\n", name);
 			kfree(pll);
 			return ERR_PTR(-EINVAL);
 		}
-	} else
-		val |= BIT(pll_params->iddq_bit_idx);
+	} else {
+		val_iddq |= BIT(pll_params->iddq_bit_idx);
+		writel_relaxed(val_iddq, clk_base + pll_params->iddq_reg);
+	}
 
 	val &= ~PLLSS_LOCK_OVERRIDE;
 	pll_writel_base(val, pll);
-- 
1.7.9.5

