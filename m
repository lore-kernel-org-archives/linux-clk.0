Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Rhyland Klein <rklein@nvidia.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH 17/41] clk: tegra: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:02 -0800
Message-Id: <1456858826-28541-18-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Rhyland Klein <rklein@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/tegra/clk-audio-sync.c  |  2 +-
 drivers/clk/tegra/clk-dfll.c        |  1 -
 drivers/clk/tegra/clk-tegra-fixed.c |  6 ++----
 drivers/clk/tegra/clk-tegra114.c    |  3 +--
 drivers/clk/tegra/clk-tegra20.c     | 10 ++++------
 5 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/tegra/clk-audio-sync.c b/drivers/clk/tegra/clk-audio-sync.c
index c0f7843e80e6..92d04ce2dee6 100644
--- a/drivers/clk/tegra/clk-audio-sync.c
+++ b/drivers/clk/tegra/clk-audio-sync.c
@@ -72,7 +72,7 @@ struct clk *tegra_clk_register_sync_source(const char *name,
 
 	init.ops = &tegra_clk_sync_source_ops;
 	init.name = name;
-	init.flags = CLK_IS_ROOT;
+	init.flags = 0;
 	init.parent_names = NULL;
 	init.num_parents = 0;
 
diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 86a307b17eb0..19bfa07e24b1 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -995,7 +995,6 @@ static const struct clk_ops dfll_clk_ops = {
 };
 
 static struct clk_init_data dfll_clk_init_data = {
-	.flags		= CLK_IS_ROOT,
 	.ops		= &dfll_clk_ops,
 	.num_parents	= 0,
 };
diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c
index da0b5941c89f..d64ec7a1b976 100644
--- a/drivers/clk/tegra/clk-tegra-fixed.c
+++ b/drivers/clk/tegra/clk-tegra-fixed.c
@@ -52,8 +52,7 @@ int __init tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 		return -EINVAL;
 	}
 
-	osc = clk_register_fixed_rate(NULL, "osc", NULL, CLK_IS_ROOT,
-				      *osc_freq);
+	osc = clk_register_fixed_rate(NULL, "osc", NULL, 0, *osc_freq);
 
 	dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m, clks);
 	if (!dt_clk)
@@ -88,8 +87,7 @@ void __init tegra_fixed_clk_init(struct tegra_clk *tegra_clks)
 	/* clk_32k */
 	dt_clk = tegra_lookup_dt_id(tegra_clk_clk_32k, tegra_clks);
 	if (dt_clk) {
-		clk = clk_register_fixed_rate(NULL, "clk_32k", NULL,
-					CLK_IS_ROOT, 32768);
+		clk = clk_register_fixed_rate(NULL, "clk_32k", NULL, 0, 32768);
 		*dt_clk = clk;
 	}
 
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 4a24aa4bbdea..df47ec3169c3 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -972,8 +972,7 @@ static void __init tegra114_fixed_clk_init(void __iomem *clk_base)
 	struct clk *clk;
 
 	/* clk_32k */
-	clk = clk_register_fixed_rate(NULL, "clk_32k", NULL, CLK_IS_ROOT,
-				      32768);
+	clk = clk_register_fixed_rate(NULL, "clk_32k", NULL, 0, 32768);
 	clks[TEGRA114_CLK_CLK_32K] = clk;
 
 	/* clk_m_div2 */
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 7a48e986c4c9..7ad63837694f 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -837,15 +837,13 @@ static void __init tegra20_periph_clk_init(void)
 	clks[TEGRA20_CLK_PEX] = clk;
 
 	/* cdev1 */
-	clk = clk_register_fixed_rate(NULL, "cdev1_fixed", NULL, CLK_IS_ROOT,
-				      26000000);
+	clk = clk_register_fixed_rate(NULL, "cdev1_fixed", NULL, 0, 26000000);
 	clk = tegra_clk_register_periph_gate("cdev1", "cdev1_fixed", 0,
 				    clk_base, 0, 94, periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_CDEV1] = clk;
 
 	/* cdev2 */
-	clk = clk_register_fixed_rate(NULL, "cdev2_fixed", NULL, CLK_IS_ROOT,
-				      26000000);
+	clk = clk_register_fixed_rate(NULL, "cdev2_fixed", NULL, 0, 26000000);
 	clk = tegra_clk_register_periph_gate("cdev2", "cdev2_fixed", 0,
 				    clk_base, 0, 93, periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_CDEV2] = clk;
@@ -879,8 +877,8 @@ static void __init tegra20_osc_clk_init(void)
 	input_freq = tegra20_clk_measure_input_freq();
 
 	/* clk_m */
-	clk = clk_register_fixed_rate(NULL, "clk_m", NULL, CLK_IS_ROOT |
-				      CLK_IGNORE_UNUSED, input_freq);
+	clk = clk_register_fixed_rate(NULL, "clk_m", NULL, CLK_IGNORE_UNUSED,
+				      input_freq);
 	clks[TEGRA20_CLK_CLK_M] = clk;
 
 	/* pll_ref */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
