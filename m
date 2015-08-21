Return-Path: <jonathanh@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>
CC: linux-clk@vger.kernel.org ,
	linux-tegra@vger.kernel.org ,
	linux-kernel@vger.kernel.org ,
	Vince Hsu <vinceh@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] clk: tegra: remove TEGRA_PLL_USE_LOCK for PLLD/PLLD2
Date: Fri, 21 Aug 2015 16:33:23 +0100
Message-ID: <1440171203-5963-1-git-send-email-jonathanh@nvidia.com>
MIME-Version: 1.0
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Vince Hsu <vinceh@nvidia.com>

Tegra114 has a HW bug where the PLLD/PLLD2 lock bit cannot be asserted
while turning on the Display power domain and before the clamp to this
domain has been removed. This issue causes a timeout and aborts the power
up sequence, even though the PLLD/PLLD2 has already locked. To avoid this,
don't use the lock for PLLD/PLLD2, just wait 1ms and treat the clocks as
locked.

Signed-off-by: Vince Hsu <vinceh@nvidia.com>
[jonathanh@nvidia.com: Updated the changelog description]
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
I had originally sent this as part of the tegra generic power-domain series
[0]. However, given that this is really a standalone fix and the
power-domain work is on-going, I don't see any reason why this should not
be merged now.

[0] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-July/356060.html

 drivers/clk/tegra/clk-tegra114.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index db5871519bf5..6c824e469a1b 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -454,8 +454,7 @@ static struct tegra_clk_pll_params pll_d_params = {
 	.lock_delay = 1000,
 	.div_nmp = &pllp_nmp,
 	.freq_table = pll_d_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON |
-		 TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON,
 };
 
 static struct tegra_clk_pll_params pll_d2_params = {
@@ -472,8 +471,7 @@ static struct tegra_clk_pll_params pll_d2_params = {
 	.lock_delay = 1000,
 	.div_nmp = &pllp_nmp,
 	.freq_table = pll_d_freq_table,
-	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON |
-		 TEGRA_PLL_USE_LOCK,
+	.flags = TEGRA_PLL_HAS_CPCON | TEGRA_PLL_SET_LFCON,
 };
 
 static struct pdiv_map pllu_p[] = {
-- 
2.1.4
