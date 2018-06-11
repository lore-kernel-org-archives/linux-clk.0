Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] clk: tegra: Make vic03 a child of pll_c3
Date: Mon, 11 Jun 2018 10:18:53 +0200
Message-Id: <20180611081853.31474-1-thierry.reding@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

By default, the vic03 clock is a child of pll_m but that runs at 924 MHz
which is too fast for VIC. Make vic03 a child of pll_c3 by default so it
will run at a supported frequency.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra124.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 0c69c7970950..f5048f82c0b9 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1290,6 +1290,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
 	{ TEGRA124_CLK_MSELECT, TEGRA124_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA124_CLK_CSITE, TEGRA124_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA124_CLK_TSENSOR, TEGRA124_CLK_CLK_M, 400000, 0 },
+	{ TEGRA124_CLK_VIC03, TEGRA124_CLK_PLL_C3, 0, 0 },
 	/* must be the last entry */
 	{ TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0 },
 };
-- 
2.17.0
