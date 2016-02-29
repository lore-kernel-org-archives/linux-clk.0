Return-Path: <dev@lynxeye.de>
From: Lucas Stach <dev@lynxeye.de>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	linux-clk@vger.kernel.org ,
	linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] clk: tegra30: init PLL_C to sane rate
Date: Mon, 29 Feb 2016 21:46:06 +0100
Message-Id: <1456778767-18413-1-git-send-email-dev@lynxeye.de>
List-ID: <linux-clk.vger.kernel.org>

If the bootloader does not touch PLL_C it will stay in its reset
state, failing to lock when enabled. This leads to consumers of
this clock to fail probing. Fix this by always programming the
PLL with a sane rate, which allows it to lock, at startup.

Signed-off-by: Lucas Stach <dev@lynxeye.de>
---
 drivers/clk/tegra/clk-tegra30.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 0478565..236e2db 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1372,6 +1372,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_SBC4, TEGRA30_CLK_PLL_P, 100000000, 0 },
 	{ TEGRA30_CLK_SBC5, TEGRA30_CLK_PLL_P, 100000000, 0 },
 	{ TEGRA30_CLK_SBC6, TEGRA30_CLK_PLL_P, 100000000, 0 },
+	{ TEGRA30_CLK_PLL_C, TEGRA30_CLK_CLK_MAX, 600000000, 0 },
 	{ TEGRA30_CLK_HOST1X, TEGRA30_CLK_PLL_C, 150000000, 0 },
 	{ TEGRA30_CLK_DISP1, TEGRA30_CLK_PLL_P, 600000000, 0 },
 	{ TEGRA30_CLK_DISP2, TEGRA30_CLK_PLL_P, 600000000, 0 },
-- 
2.5.0
