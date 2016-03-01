Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chao Xie <chao.xie@marvell.com>
Subject: [PATCH 07/41] clk: mmp: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 10:59:52 -0800
Message-Id: <1456858826-28541-8-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Chao Xie <chao.xie@marvell.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/mmp/clk-mmp2.c       | 14 +++++---------
 drivers/clk/mmp/clk-of-mmp2.c    | 10 +++++-----
 drivers/clk/mmp/clk-of-pxa168.c  |  8 ++++----
 drivers/clk/mmp/clk-of-pxa1928.c | 12 ++++++------
 drivers/clk/mmp/clk-of-pxa910.c  |  8 ++++----
 drivers/clk/mmp/clk-pxa168.c     |  8 +++-----
 drivers/clk/mmp/clk-pxa910.c     |  8 +++-----
 7 files changed, 30 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/mmp/clk-mmp2.c b/drivers/clk/mmp/clk-mmp2.c
index 38931dbd1eff..383f6a4f64f0 100644
--- a/drivers/clk/mmp/clk-mmp2.c
+++ b/drivers/clk/mmp/clk-mmp2.c
@@ -99,23 +99,19 @@ void __init mmp2_clk_init(phys_addr_t mpmu_phys, phys_addr_t apmu_phys,
 		return;
 	}
 
-	clk = clk_register_fixed_rate(NULL, "clk32", NULL, CLK_IS_ROOT, 3200);
+	clk = clk_register_fixed_rate(NULL, "clk32", NULL, 0, 3200);
 	clk_register_clkdev(clk, "clk32", NULL);
 
-	vctcxo = clk_register_fixed_rate(NULL, "vctcxo", NULL, CLK_IS_ROOT,
-				26000000);
+	vctcxo = clk_register_fixed_rate(NULL, "vctcxo", NULL, 0, 26000000);
 	clk_register_clkdev(vctcxo, "vctcxo", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "pll1", NULL, CLK_IS_ROOT,
-				800000000);
+	clk = clk_register_fixed_rate(NULL, "pll1", NULL, 0, 800000000);
 	clk_register_clkdev(clk, "pll1", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "usb_pll", NULL, CLK_IS_ROOT,
-				480000000);
+	clk = clk_register_fixed_rate(NULL, "usb_pll", NULL, 0, 480000000);
 	clk_register_clkdev(clk, "usb_pll", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "pll2", NULL, CLK_IS_ROOT,
-				960000000);
+	clk = clk_register_fixed_rate(NULL, "pll2", NULL, 0, 960000000);
 	clk_register_clkdev(clk, "pll2", NULL);
 
 	clk = clk_register_fixed_factor(NULL, "pll1_2", "pll1",
diff --git a/drivers/clk/mmp/clk-of-mmp2.c b/drivers/clk/mmp/clk-of-mmp2.c
index 251533d87c65..3a51fff1b0e7 100644
--- a/drivers/clk/mmp/clk-of-mmp2.c
+++ b/drivers/clk/mmp/clk-of-mmp2.c
@@ -63,11 +63,11 @@ struct mmp2_clk_unit {
 };
 
 static struct mmp_param_fixed_rate_clk fixed_rate_clks[] = {
-	{MMP2_CLK_CLK32, "clk32", NULL, CLK_IS_ROOT, 32768},
-	{MMP2_CLK_VCTCXO, "vctcxo", NULL, CLK_IS_ROOT, 26000000},
-	{MMP2_CLK_PLL1, "pll1", NULL, CLK_IS_ROOT, 800000000},
-	{MMP2_CLK_PLL2, "pll2", NULL, CLK_IS_ROOT, 960000000},
-	{MMP2_CLK_USB_PLL, "usb_pll", NULL, CLK_IS_ROOT, 480000000},
+	{MMP2_CLK_CLK32, "clk32", NULL, 0, 32768},
+	{MMP2_CLK_VCTCXO, "vctcxo", NULL, 0, 26000000},
+	{MMP2_CLK_PLL1, "pll1", NULL, 0, 800000000},
+	{MMP2_CLK_PLL2, "pll2", NULL, 0, 960000000},
+	{MMP2_CLK_USB_PLL, "usb_pll", NULL, 0, 480000000},
 };
 
 static struct mmp_param_fixed_factor_clk fixed_factor_clks[] = {
diff --git a/drivers/clk/mmp/clk-of-pxa168.c b/drivers/clk/mmp/clk-of-pxa168.c
index 64eaf4141c69..87f2317b2a00 100644
--- a/drivers/clk/mmp/clk-of-pxa168.c
+++ b/drivers/clk/mmp/clk-of-pxa168.c
@@ -56,10 +56,10 @@ struct pxa168_clk_unit {
 };
 
 static struct mmp_param_fixed_rate_clk fixed_rate_clks[] = {
-	{PXA168_CLK_CLK32, "clk32", NULL, CLK_IS_ROOT, 32768},
-	{PXA168_CLK_VCTCXO, "vctcxo", NULL, CLK_IS_ROOT, 26000000},
-	{PXA168_CLK_PLL1, "pll1", NULL, CLK_IS_ROOT, 624000000},
-	{PXA168_CLK_USB_PLL, "usb_pll", NULL, CLK_IS_ROOT, 480000000},
+	{PXA168_CLK_CLK32, "clk32", NULL, 0, 32768},
+	{PXA168_CLK_VCTCXO, "vctcxo", NULL, 0, 26000000},
+	{PXA168_CLK_PLL1, "pll1", NULL, 0, 624000000},
+	{PXA168_CLK_USB_PLL, "usb_pll", NULL, 0, 480000000},
 };
 
 static struct mmp_param_fixed_factor_clk fixed_factor_clks[] = {
diff --git a/drivers/clk/mmp/clk-of-pxa1928.c b/drivers/clk/mmp/clk-of-pxa1928.c
index 433a5ae1eae0..e478ff44e170 100644
--- a/drivers/clk/mmp/clk-of-pxa1928.c
+++ b/drivers/clk/mmp/clk-of-pxa1928.c
@@ -34,12 +34,12 @@ struct pxa1928_clk_unit {
 };
 
 static struct mmp_param_fixed_rate_clk fixed_rate_clks[] = {
-	{0, "clk32", NULL, CLK_IS_ROOT, 32768},
-	{0, "vctcxo", NULL, CLK_IS_ROOT, 26000000},
-	{0, "pll1_624", NULL, CLK_IS_ROOT, 624000000},
-	{0, "pll5p", NULL, CLK_IS_ROOT, 832000000},
-	{0, "pll5", NULL, CLK_IS_ROOT, 1248000000},
-	{0, "usb_pll", NULL, CLK_IS_ROOT, 480000000},
+	{0, "clk32", NULL, 0, 32768},
+	{0, "vctcxo", NULL, 0, 26000000},
+	{0, "pll1_624", NULL, 0, 624000000},
+	{0, "pll5p", NULL, 0, 832000000},
+	{0, "pll5", NULL, 0, 1248000000},
+	{0, "usb_pll", NULL, 0, 480000000},
 };
 
 static struct mmp_param_fixed_factor_clk fixed_factor_clks[] = {
diff --git a/drivers/clk/mmp/clk-of-pxa910.c b/drivers/clk/mmp/clk-of-pxa910.c
index 13d6173326a4..e22a67f76d93 100644
--- a/drivers/clk/mmp/clk-of-pxa910.c
+++ b/drivers/clk/mmp/clk-of-pxa910.c
@@ -56,10 +56,10 @@ struct pxa910_clk_unit {
 };
 
 static struct mmp_param_fixed_rate_clk fixed_rate_clks[] = {
-	{PXA910_CLK_CLK32, "clk32", NULL, CLK_IS_ROOT, 32768},
-	{PXA910_CLK_VCTCXO, "vctcxo", NULL, CLK_IS_ROOT, 26000000},
-	{PXA910_CLK_PLL1, "pll1", NULL, CLK_IS_ROOT, 624000000},
-	{PXA910_CLK_USB_PLL, "usb_pll", NULL, CLK_IS_ROOT, 480000000},
+	{PXA910_CLK_CLK32, "clk32", NULL, 0, 32768},
+	{PXA910_CLK_VCTCXO, "vctcxo", NULL, 0, 26000000},
+	{PXA910_CLK_PLL1, "pll1", NULL, 0, 624000000},
+	{PXA910_CLK_USB_PLL, "usb_pll", NULL, 0, 480000000},
 };
 
 static struct mmp_param_fixed_factor_clk fixed_factor_clks[] = {
diff --git a/drivers/clk/mmp/clk-pxa168.c b/drivers/clk/mmp/clk-pxa168.c
index 0dd83fb950c9..a9ef9209532a 100644
--- a/drivers/clk/mmp/clk-pxa168.c
+++ b/drivers/clk/mmp/clk-pxa168.c
@@ -92,15 +92,13 @@ void __init pxa168_clk_init(phys_addr_t mpmu_phys, phys_addr_t apmu_phys,
 		return;
 	}
 
-	clk = clk_register_fixed_rate(NULL, "clk32", NULL, CLK_IS_ROOT, 3200);
+	clk = clk_register_fixed_rate(NULL, "clk32", NULL, 0, 3200);
 	clk_register_clkdev(clk, "clk32", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "vctcxo", NULL, CLK_IS_ROOT,
-				26000000);
+	clk = clk_register_fixed_rate(NULL, "vctcxo", NULL, 0, 26000000);
 	clk_register_clkdev(clk, "vctcxo", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "pll1", NULL, CLK_IS_ROOT,
-				624000000);
+	clk = clk_register_fixed_rate(NULL, "pll1", NULL, 0, 624000000);
 	clk_register_clkdev(clk, "pll1", NULL);
 
 	clk = clk_register_fixed_factor(NULL, "pll1_2", "pll1",
diff --git a/drivers/clk/mmp/clk-pxa910.c b/drivers/clk/mmp/clk-pxa910.c
index e1d2ce22cdf1..a520cf7702a1 100644
--- a/drivers/clk/mmp/clk-pxa910.c
+++ b/drivers/clk/mmp/clk-pxa910.c
@@ -97,15 +97,13 @@ void __init pxa910_clk_init(phys_addr_t mpmu_phys, phys_addr_t apmu_phys,
 		return;
 	}
 
-	clk = clk_register_fixed_rate(NULL, "clk32", NULL, CLK_IS_ROOT, 3200);
+	clk = clk_register_fixed_rate(NULL, "clk32", NULL, 0, 3200);
 	clk_register_clkdev(clk, "clk32", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "vctcxo", NULL, CLK_IS_ROOT,
-				26000000);
+	clk = clk_register_fixed_rate(NULL, "vctcxo", NULL, 0, 26000000);
 	clk_register_clkdev(clk, "vctcxo", NULL);
 
-	clk = clk_register_fixed_rate(NULL, "pll1", NULL, CLK_IS_ROOT,
-				624000000);
+	clk = clk_register_fixed_rate(NULL, "pll1", NULL, 0, 624000000);
 	clk_register_clkdev(clk, "pll1", NULL);
 
 	clk = clk_register_fixed_factor(NULL, "pll1_2", "pll1",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
