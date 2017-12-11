Return-Path: <digetx@gmail.com>
Return-Path: <digetx@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: tegra20: Add 216 MHz entry for PLL_X
Date: Mon, 11 Dec 2017 21:50:09 +0300
Message-Id: <adc15215591018b4a35a7d64e065f81bb09e214e.1513018125.git.digetx@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

The cpufreq driver uses 216 MHz as the lowest CPU clock frequency, but
clock driver doesn't provide that rate, so the requested clock is rounded
up to 312 MHz. Let's add entry for 216 MHz to match with cpufreq.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index cbd5a2e5c569..e33d7548a4e9 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -269,6 +269,11 @@ static struct tegra_clk_pll_freq_table pll_x_freq_table[] = {
 	{ 13000000,  312000000,  312, 13, 1, 12 },
 	{ 19200000,  312000000,  260, 16, 1,  8 },
 	{ 26000000,  312000000,  312, 26, 1, 12 },
+	/* 216 MHz */
+	{ 12000000, 216000000,  216,  12, 1, 12 },
+	{ 13000000, 216000000,  216,  13, 1, 12 },
+	{ 19200000, 216000000,  180,  16, 1,  8 },
+	{ 26000000, 216000000,  216,  26, 1, 12 },
 	{        0,          0,    0,  0, 0,  0 },
 };
 
-- 
2.15.1
