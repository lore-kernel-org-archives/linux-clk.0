Return-Path: <nicoleotsuka@gmail.com>
Return-Path: <nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	sboyd@codeaurora.org,
	pdeschrijver@nvidia.com
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jonathanh@nvidia.com,
	mturquette@baylibre.com,
	pgaikwad@nvidia.com
Subject: [PATCH v2] clk: tegra: Use readl_relaxed_poll_timeout_atomic in tegra210_clock_init
Date: Fri, 15 Sep 2017 12:10:13 -0700
Message-Id: <1505502613-11801-1-git-send-email-nicoleotsuka@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Below is the call trace of tegra210_init_pllu() function:
  start_kernel()
  -> time_init()
  --> of_clk_init()
  ---> tegra210_clock_init()
  ----> tegra210_pll_init()
  -----> tegra210_init_pllu()

Because the preemption is disabled in the start_kernel before calling
time_init, tegra210_init_pllu is actually in an atomic context while
it includes a readl_relaxed_poll_timeout that might sleep.

So this patch just changes this readl_relaxed_poll_timeout() to its
atomic version.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>
---
Changelog
v2:
 * Corrected a typo in the commit log
 * Added Peter's Acked-by.

 drivers/clk/tegra/clk-tegra210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 0b9789a..ea695c4 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2587,8 +2587,8 @@ static int tegra210_enable_pllu(void)
 	reg |= PLL_ENABLE;
 	writel(reg, clk_base + PLLU_BASE);
 
-	readl_relaxed_poll_timeout(clk_base + PLLU_BASE, reg,
-				   reg & PLL_BASE_LOCK, 2, 1000);
+	readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
+					  reg & PLL_BASE_LOCK, 2, 1000);
 	if (!(reg & PLL_BASE_LOCK)) {
 		pr_err("Timed out waiting for PLL_U to lock\n");
 		return -ETIMEDOUT;
-- 
2.1.4
