Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 08/19] clk: samsung: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:45 -0700
Message-Id: <1430897996-11597-9-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/samsung/clk-exynos5260.c:138:40: warning: Using plain integer as NULL pointer
drivers/clk/samsung/clk-exynos5260.c:328:40: warning: Using plain integer as NULL pointer
drivers/clk/samsung/clk-exynos5260.c:392:40: warning: Using plain integer as NULL pointer
drivers/clk/samsung/clk-exynos5260.c:494:40: warning: Using plain integer as NULL pointer
drivers/clk/samsung/clk-exynos5260.c:583:40: warning: Using plain integer as NULL pointer
drivers/clk/samsung/clk-exynos5260.c:644:40: warning: Using plain integer as NULL pointer
drivers/clk/samsung/clk-exynos5260.c:779:40: warning: Using plain integer as NULL pointer
drivers/clk/samsung/clk-exynos5260.c:898:40: warning: Using plain integer as NULL pointer
drivers/clk/samsung/clk-exynos5260.c:962:40: warning: Using plain integer as NULL pointer
drivers/clk/samsung/clk-exynos5260.c:1018:40: warning: Using plain integer as NULL pointer
drivers/clk/samsung/clk-exynos5260.c:1165:40: warning: Using plain integer as NULL pointer
drivers/clk/samsung/clk-exynos5260.c:1373:40: warning: Using plain integer as NULL pointer
drivers/clk/samsung/clk-exynos5260.c:1829:40: warning: Using plain integer as NULL pointer

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/samsung/clk-exynos5260.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5260.c b/drivers/clk/samsung/clk-exynos5260.c
index df1d83c45554..06f96eb7cf93 100644
--- a/drivers/clk/samsung/clk-exynos5260.c
+++ b/drivers/clk/samsung/clk-exynos5260.c
@@ -135,7 +135,7 @@ static struct samsung_gate_clock aud_gate_clks[] __initdata = {
 
 static void __init exynos5260_clk_aud_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.mux_clks = aud_mux_clks;
 	cmu.nr_mux_clks = ARRAY_SIZE(aud_mux_clks);
@@ -325,7 +325,7 @@ static struct samsung_gate_clock disp_gate_clks[] __initdata = {
 
 static void __init exynos5260_clk_disp_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.mux_clks = disp_mux_clks;
 	cmu.nr_mux_clks = ARRAY_SIZE(disp_mux_clks);
@@ -389,7 +389,7 @@ static struct samsung_pll_clock egl_pll_clks[] __initdata = {
 
 static void __init exynos5260_clk_egl_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.pll_clks = egl_pll_clks;
 	cmu.nr_pll_clks =  ARRAY_SIZE(egl_pll_clks);
@@ -491,7 +491,7 @@ static struct samsung_gate_clock fsys_gate_clks[] __initdata = {
 
 static void __init exynos5260_clk_fsys_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.mux_clks = fsys_mux_clks;
 	cmu.nr_mux_clks = ARRAY_SIZE(fsys_mux_clks);
@@ -580,7 +580,7 @@ static struct samsung_gate_clock g2d_gate_clks[] __initdata = {
 
 static void __init exynos5260_clk_g2d_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.mux_clks = g2d_mux_clks;
 	cmu.nr_mux_clks = ARRAY_SIZE(g2d_mux_clks);
@@ -641,7 +641,7 @@ static struct samsung_pll_clock g3d_pll_clks[] __initdata = {
 
 static void __init exynos5260_clk_g3d_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.pll_clks = g3d_pll_clks;
 	cmu.nr_pll_clks =  ARRAY_SIZE(g3d_pll_clks);
@@ -776,7 +776,7 @@ static struct samsung_gate_clock gscl_gate_clks[] __initdata = {
 
 static void __init exynos5260_clk_gscl_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.mux_clks = gscl_mux_clks;
 	cmu.nr_mux_clks = ARRAY_SIZE(gscl_mux_clks);
@@ -895,7 +895,7 @@ static struct samsung_gate_clock isp_gate_clks[] __initdata = {
 
 static void __init exynos5260_clk_isp_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.mux_clks = isp_mux_clks;
 	cmu.nr_mux_clks = ARRAY_SIZE(isp_mux_clks);
@@ -959,7 +959,7 @@ static struct samsung_pll_clock kfc_pll_clks[] __initdata = {
 
 static void __init exynos5260_clk_kfc_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.pll_clks = kfc_pll_clks;
 	cmu.nr_pll_clks =  ARRAY_SIZE(kfc_pll_clks);
@@ -1015,7 +1015,7 @@ static struct samsung_gate_clock mfc_gate_clks[] __initdata = {
 
 static void __init exynos5260_clk_mfc_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.mux_clks = mfc_mux_clks;
 	cmu.nr_mux_clks = ARRAY_SIZE(mfc_mux_clks);
@@ -1162,7 +1162,7 @@ static struct samsung_pll_clock mif_pll_clks[] __initdata = {
 
 static void __init exynos5260_clk_mif_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.pll_clks = mif_pll_clks;
 	cmu.nr_pll_clks =  ARRAY_SIZE(mif_pll_clks);
@@ -1370,7 +1370,7 @@ static struct samsung_gate_clock peri_gate_clks[] __initdata = {
 
 static void __init exynos5260_clk_peri_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.mux_clks = peri_mux_clks;
 	cmu.nr_mux_clks = ARRAY_SIZE(peri_mux_clks);
@@ -1826,7 +1826,7 @@ static struct samsung_pll_clock top_pll_clks[] __initdata = {
 
 static void __init exynos5260_clk_top_init(struct device_node *np)
 {
-	struct samsung_cmu_info cmu = {0};
+	struct samsung_cmu_info cmu = { NULL };
 
 	cmu.pll_clks = top_pll_clks;
 	cmu.nr_pll_clks =  ARRAY_SIZE(top_pll_clks);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
