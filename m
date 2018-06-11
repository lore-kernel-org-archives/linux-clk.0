Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] clk: tegra: Make vde a child of pll_c3
Date: Mon, 11 Jun 2018 10:20:37 +0200
Message-Id: <20180611082037.31796-1-thierry.reding@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

The current default is to leave the VDE clock's parent at the default,
which is clk_m. However, that is not a configuration that will allow the
VDE to function. Reparent it to pll_c3 instead to make sure the hardware
can actually decode video content.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra124.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index f5048f82c0b9..b6cf28ca2ed2 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1267,7 +1267,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
 	{ TEGRA124_CLK_I2S2, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S3, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
 	{ TEGRA124_CLK_I2S4, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
-	{ TEGRA124_CLK_VDE, TEGRA124_CLK_CLK_MAX, 600000000, 0 },
+	{ TEGRA124_CLK_VDE, TEGRA124_CLK_PLL_C3, 600000000, 0 },
 	{ TEGRA124_CLK_HOST1X, TEGRA124_CLK_PLL_P, 136000000, 1 },
 	{ TEGRA124_CLK_DSIALP, TEGRA124_CLK_PLL_P, 68000000, 0 },
 	{ TEGRA124_CLK_DSIBLP, TEGRA124_CLK_PLL_P, 68000000, 0 },
-- 
2.17.0
