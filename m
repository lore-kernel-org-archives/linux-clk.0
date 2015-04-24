Return-Path: <rklein@nvidia.com>
From: Rhyland Klein <rklein@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
CC: Mike Turquette <mturquette@linaro.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Bill Huang <bilhuang@nvidia.com>,
	Paul Walmsley <pwalmsley@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 03/19] clk: tegra: pll: add tegra_pll_wait_for_lock to clk header
Date: Fri, 24 Apr 2015 12:47:43 -0400
Message-ID: <1429894079-25052-4-git-send-email-rklein@nvidia.com>
In-Reply-To: <1429894079-25052-1-git-send-email-rklein@nvidia.com>
References: <1429894079-25052-1-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

Create a wrapper interface to make use of the existing
clk_pll_wait_for_lock. This will be useful for implementations
of callbacks in Tegra SoC specific clock drivers.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c |    5 +++++
 drivers/clk/tegra/clk.h     |    1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 05c6d08a6695..b9a739ce4b98 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -269,6 +269,11 @@ static int clk_pll_wait_for_lock(struct tegra_clk_pll *pll)
 	return -1;
 }
 
+int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll)
+{
+	return clk_pll_wait_for_lock(pll);
+}
+
 static int clk_pll_is_enabled(struct clk_hw *hw)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 2abb6e1b7d93..4ea8b5b089cd 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -659,5 +659,6 @@ void tegra114_clock_deassert_dfll_dvco_reset(void);
 
 typedef void (*tegra_clk_apply_init_table_func)(void);
 extern tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
+int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll);
 
 #endif /* TEGRA_CLK_H */
-- 
1.7.9.5
