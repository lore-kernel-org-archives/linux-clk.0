Return-Path: <mirza.krak@gmail.com>
Return-Path: <mirza.krak@gmail.com>
From: Mirza Krak <mirza.krak@gmail.com>
To: swarren@wwwdotorg.org,
	thierry.reding@gmail.com,
	gnurou@gmail.com,
	pdeschrijver@nvidia.com,
	pgaikwad@nvidia.com
Cc: robh+dt@kernel.org,
	pawel.moll@arm.com,
	mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org,
	linux@armlinux.org.uk,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Mirza Krak <mirza.krak@gmail.com>
Subject: [PATCH 2/6] clk: tegra: add TEGRA30_CLK_NOR to init table
Date: Sat,  6 Aug 2016 21:40:48 +0200
Message-Id: <1470512452-8322-3-git-send-email-mirza.krak@gmail.com>
In-Reply-To: <1470512452-8322-1-git-send-email-mirza.krak@gmail.com>
References: <1470512452-8322-1-git-send-email-mirza.krak@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Mirza Krak <mirza.krak@gmail.com>

Add TEGRA30_CLK_NOR to init table and set default rate to 127 MHz which
is max rate.

Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 8e2db5e..67f1677 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1252,6 +1252,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_SDMMC1, TEGRA30_CLK_PLL_P, 48000000, 0 },
 	{ TEGRA30_CLK_SDMMC2, TEGRA30_CLK_PLL_P, 48000000, 0 },
 	{ TEGRA30_CLK_SDMMC3, TEGRA30_CLK_PLL_P, 48000000, 0 },
+	{ TEGRA30_CLK_NOR, TEGRA30_CLK_PLL_P, 127000000, 0 },
 	{ TEGRA30_CLK_PLL_M, TEGRA30_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA30_CLK_PCLK, TEGRA30_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA30_CLK_CSITE, TEGRA30_CLK_CLK_MAX, 0, 1 },
--
2.1.4
