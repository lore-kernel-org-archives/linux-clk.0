Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 15/41] clk: spear: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:00 -0800
Message-Id: <1456858826-28541-16-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/spear/spear1310_clock.c | 21 ++++++++-------------
 drivers/clk/spear/spear1340_clock.c | 16 ++++++----------
 drivers/clk/spear/spear3xx_clock.c  |  8 +++-----
 drivers/clk/spear/spear6xx_clock.c  |  6 ++----
 4 files changed, 19 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/spear/spear1310_clock.c b/drivers/clk/spear/spear1310_clock.c
index 009bd1410cfa..2f86e3f94efa 100644
--- a/drivers/clk/spear/spear1310_clock.c
+++ b/drivers/clk/spear/spear1310_clock.c
@@ -386,24 +386,20 @@ void __init spear1310_clk_init(void __iomem *misc_base, void __iomem *ras_base)
 {
 	struct clk *clk, *clk1;
 
-	clk = clk_register_fixed_rate(NULL, "osc_32k_clk", NULL, CLK_IS_ROOT,
-			32000);
+	clk = clk_register_fixed_rate(NULL, "osc_32k_clk", NULL, 0, 32000);
 	clk_register_clkdev(clk, "osc_32k_clk", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "osc_24m_clk", NULL, CLK_IS_ROOT,
-			24000000);
+	clk = clk_register_fixed_rate(NULL, "osc_24m_clk", NULL, 0, 24000000);
 	clk_register_clkdev(clk, "osc_24m_clk", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "osc_25m_clk", NULL, CLK_IS_ROOT,
-			25000000);
+	clk = clk_register_fixed_rate(NULL, "osc_25m_clk", NULL, 0, 25000000);
 	clk_register_clkdev(clk, "osc_25m_clk", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "gmii_pad_clk", NULL, CLK_IS_ROOT,
-			125000000);
+	clk = clk_register_fixed_rate(NULL, "gmii_pad_clk", NULL, 0, 125000000);
 	clk_register_clkdev(clk, "gmii_pad_clk", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "i2s_src_pad_clk", NULL,
-			CLK_IS_ROOT, 12288000);
+	clk = clk_register_fixed_rate(NULL, "i2s_src_pad_clk", NULL, 0,
+				      12288000);
 	clk_register_clkdev(clk, "i2s_src_pad_clk", NULL);
 
 	/* clock derived from 32 KHz osc clk */
@@ -897,11 +893,10 @@ void __init spear1310_clk_init(void __iomem *misc_base, void __iomem *ras_base)
 			&_lock);
 	clk_register_clkdev(clk, "ras_apb_clk", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "ras_plclk0_clk", NULL, CLK_IS_ROOT,
+	clk = clk_register_fixed_rate(NULL, "ras_plclk0_clk", NULL, 0,
 			50000000);
 
-	clk = clk_register_fixed_rate(NULL, "ras_tx50_clk", NULL, CLK_IS_ROOT,
-			50000000);
+	clk = clk_register_fixed_rate(NULL, "ras_tx50_clk", NULL, 0, 50000000);
 
 	clk = clk_register_gate(NULL, "can0_clk", "apb_clk", 0,
 			SPEAR1310_RAS_SW_CLK_CTRL, SPEAR1310_CAN0_CLK_ENB, 0,
diff --git a/drivers/clk/spear/spear1340_clock.c b/drivers/clk/spear/spear1340_clock.c
index 9c7abfd951ba..cbb19a90f2d6 100644
--- a/drivers/clk/spear/spear1340_clock.c
+++ b/drivers/clk/spear/spear1340_clock.c
@@ -443,24 +443,20 @@ void __init spear1340_clk_init(void __iomem *misc_base)
 {
 	struct clk *clk, *clk1;
 
-	clk = clk_register_fixed_rate(NULL, "osc_32k_clk", NULL, CLK_IS_ROOT,
-			32000);
+	clk = clk_register_fixed_rate(NULL, "osc_32k_clk", NULL, 0, 32000);
 	clk_register_clkdev(clk, "osc_32k_clk", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "osc_24m_clk", NULL, CLK_IS_ROOT,
-			24000000);
+	clk = clk_register_fixed_rate(NULL, "osc_24m_clk", NULL, 0, 24000000);
 	clk_register_clkdev(clk, "osc_24m_clk", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "osc_25m_clk", NULL, CLK_IS_ROOT,
-			25000000);
+	clk = clk_register_fixed_rate(NULL, "osc_25m_clk", NULL, 0, 25000000);
 	clk_register_clkdev(clk, "osc_25m_clk", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "gmii_pad_clk", NULL, CLK_IS_ROOT,
-			125000000);
+	clk = clk_register_fixed_rate(NULL, "gmii_pad_clk", NULL, 0, 125000000);
 	clk_register_clkdev(clk, "gmii_pad_clk", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "i2s_src_pad_clk", NULL,
-			CLK_IS_ROOT, 12288000);
+	clk = clk_register_fixed_rate(NULL, "i2s_src_pad_clk", NULL, 0,
+				      12288000);
 	clk_register_clkdev(clk, "i2s_src_pad_clk", NULL);
 
 	/* clock derived from 32 KHz osc clk */
diff --git a/drivers/clk/spear/spear3xx_clock.c b/drivers/clk/spear/spear3xx_clock.c
index 404a55edd613..c403c66b6583 100644
--- a/drivers/clk/spear/spear3xx_clock.c
+++ b/drivers/clk/spear/spear3xx_clock.c
@@ -251,7 +251,7 @@ static void __init spear320_clk_init(void __iomem *soc_config_base,
 	struct clk *clk;
 
 	clk = clk_register_fixed_rate(NULL, "smii_125m_pad_clk", NULL,
-			CLK_IS_ROOT, 125000000);
+			0, 125000000);
 	clk_register_clkdev(clk, "smii_125m_pad", NULL);
 
 	clk = clk_register_fixed_factor(NULL, "clcd_clk", "ras_pll3_clk", 0,
@@ -391,12 +391,10 @@ void __init spear3xx_clk_init(void __iomem *misc_base, void __iomem *soc_config_
 {
 	struct clk *clk, *clk1, *ras_apb_clk;
 
-	clk = clk_register_fixed_rate(NULL, "osc_32k_clk", NULL, CLK_IS_ROOT,
-			32000);
+	clk = clk_register_fixed_rate(NULL, "osc_32k_clk", NULL, 0, 32000);
 	clk_register_clkdev(clk, "osc_32k_clk", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "osc_24m_clk", NULL, CLK_IS_ROOT,
-			24000000);
+	clk = clk_register_fixed_rate(NULL, "osc_24m_clk", NULL, 0, 24000000);
 	clk_register_clkdev(clk, "osc_24m_clk", NULL);
 
 	/* clock derived from 32 KHz osc clk */
diff --git a/drivers/clk/spear/spear6xx_clock.c b/drivers/clk/spear/spear6xx_clock.c
index e24f85cd4300..7c9383c3c2c6 100644
--- a/drivers/clk/spear/spear6xx_clock.c
+++ b/drivers/clk/spear/spear6xx_clock.c
@@ -117,12 +117,10 @@ void __init spear6xx_clk_init(void __iomem *misc_base)
 {
 	struct clk *clk, *clk1;
 
-	clk = clk_register_fixed_rate(NULL, "osc_32k_clk", NULL, CLK_IS_ROOT,
-			32000);
+	clk = clk_register_fixed_rate(NULL, "osc_32k_clk", NULL, 0, 32000);
 	clk_register_clkdev(clk, "osc_32k_clk", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "osc_30m_clk", NULL, CLK_IS_ROOT,
-			30000000);
+	clk = clk_register_fixed_rate(NULL, "osc_30m_clk", NULL, 0, 30000000);
 	clk_register_clkdev(clk, "osc_30m_clk", NULL);
 
 	/* clock derived from 32 KHz osc clk */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
