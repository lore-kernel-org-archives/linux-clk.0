Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	zhengxing@rock-chips.com,
	zhangqing@rock-chips.com,
	wxt@rock-chips.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 3/3] clk: rockchip: convert manually created factor clocks to the new type
Date: Thu, 28 Jan 2016 01:01:46 +0100
Message-Id: <1453939306-984-4-git-send-email-heiko@sntech.de>
In-Reply-To: <1453939306-984-1-git-send-email-heiko@sntech.de>
References: <1453939306-984-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

Clean up the init code and move the creation of factor clocks to the
appropriate positions coming from the clock architecture diagrams.

This also unifies the artificial separation of the hclk_vcodec etc clocks
again.

We do keep the separate definition of some watchdog and usb480m pseudo
clocks for now, as they're not real factor clocks from the clock-tree
but placeholders for fixes to come (usb480m gets supplied by the
missing driver for the new usbphy type and the watchdog-gate is sitting
somewhere else together which we cannot model currently).

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3036.c | 32 +++++++-------------------------
 drivers/clk/rockchip/clk-rk3188.c | 10 +++-------
 drivers/clk/rockchip/clk-rk3228.c | 33 ++++++---------------------------
 drivers/clk/rockchip/clk-rk3288.c | 23 ++++++-----------------
 drivers/clk/rockchip/clk-rk3368.c | 29 +++++++----------------------
 5 files changed, 29 insertions(+), 98 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 38139dc..eaabb43 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -177,6 +177,9 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	GATE(0, "gpll_armclk", "gpll", CLK_IGNORE_UNUSED,
 			RK2928_CLKGATE_CON(0), 6, GFLAGS),
 
+	/* xin12m is created by a cru-internal divider */
+	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
+
 	/*
 	 * Clock-Architecture Diagram 2
 	 */
@@ -187,6 +190,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 			RK2928_CLKGATE_CON(0), 8, GFLAGS),
 	COMPOSITE_NOGATE(0, "ddrphy2x", mux_ddrphy_p, CLK_IGNORE_UNUSED,
 			RK2928_CLKSEL_CON(26), 8, 1, MFLAGS, 0, 2, DFLAGS | CLK_DIVIDER_POWER_OF_TWO),
+	FACTOR(0, "ddrphy", "ddrphy2x", 0, 1, 2),
 
 	COMPOSITE_NOMUX(0, "pclk_dbg", "armclk", CLK_IGNORE_UNUSED,
 			RK2928_CLKSEL_CON(1), 0, 4, DFLAGS | CLK_DIVIDER_READ_ONLY,
@@ -263,6 +267,8 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	COMPOSITE(0, "aclk_vcodec", mux_pll_src_3plls_p, 0,
 			RK2928_CLKSEL_CON(32), 14, 2, MFLAGS, 8, 5, DFLAGS,
 			RK2928_CLKGATE_CON(3), 11, GFLAGS),
+	FACTOR_GATE(HCLK_VCODEC, "hclk_vcodec", "aclk_vcodec", 0, 1, 4,
+			RK2928_CLKGATE_CON(3), 12, GFLAGS),
 
 	COMPOSITE(0, "aclk_hvec", mux_pll_src_3plls_p, 0,
 			RK2928_CLKSEL_CON(20), 0, 2, MFLAGS, 2, 5, DFLAGS,
@@ -351,6 +357,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	COMPOSITE_NOMUX(SCLK_MAC, "mac_clk", "mac_clk_ref", 0,
 			RK2928_CLKSEL_CON(21), 9, 5, DFLAGS,
 			RK2928_CLKGATE_CON(2), 6, GFLAGS),
+	FACTOR(0, "sclk_macref_out", "hclk_peri_src", 0, 1, 2),
 
 	MUX(SCLK_HDMI, "dclk_hdmi", mux_dclk_p, 0,
 			RK2928_CLKSEL_CON(31), 0, 1, MFLAGS),
@@ -379,8 +386,6 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 	GATE(HCLK_VIO_BUS, "hclk_vio_bus", "hclk_disp_pre", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(6), 12, GFLAGS),
 	GATE(HCLK_LCDC, "hclk_lcdc", "hclk_disp_pre", 0, RK2928_CLKGATE_CON(9), 5, GFLAGS),
 
-	/* hclk_video gates */
-	GATE(HCLK_VCODEC, "hclk_vcodec", "hclk_vcodec_pre", 0, RK2928_CLKGATE_CON(3), 12, GFLAGS),
 
 	/* xin24m gates */
 	GATE(SCLK_PVTM_CORE, "sclk_pvtm_core", "xin24m", 0, RK2928_CLKGATE_CON(10), 0, GFLAGS),
@@ -444,34 +449,11 @@ static void __init rk3036_clk_init(struct device_node *np)
 
 	rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
 
-	/* xin12m is created by an cru-internal divider */
-	clk = clk_register_fixed_factor(NULL, "xin12m", "xin24m", 0, 1, 2);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock xin12m: %ld\n",
-			__func__, PTR_ERR(clk));
-
 	clk = clk_register_fixed_factor(NULL, "usb480m", "xin24m", 0, 20, 1);
 	if (IS_ERR(clk))
 		pr_warn("%s: could not register clock usb480m: %ld\n",
 			__func__, PTR_ERR(clk));
 
-	clk = clk_register_fixed_factor(NULL, "ddrphy", "ddrphy2x", 0, 1, 2);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock ddrphy: %ld\n",
-			__func__, PTR_ERR(clk));
-
-	clk = clk_register_fixed_factor(NULL, "hclk_vcodec_pre",
-					"aclk_vcodec", 0, 1, 4);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock hclk_vcodec_pre: %ld\n",
-			__func__, PTR_ERR(clk));
-
-	clk = clk_register_fixed_factor(NULL, "sclk_macref_out",
-					"hclk_peri_src", 0, 1, 2);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock sclk_macref_out: %ld\n",
-			__func__, PTR_ERR(clk));
-
 	rockchip_clk_register_plls(rk3036_pll_clks,
 				   ARRAY_SIZE(rk3036_pll_clks),
 				   RK3036_GRF_SOC_STATUS0);
diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index cc1d09d..a9900d5 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -339,6 +339,9 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 	INVERTER(0, "pclk_cif0", "pclkin_cif0",
 			RK2928_CLKSEL_CON(30), 8, IFLAGS),
 
+	/* xin12m is created by a cru-internal divider */
+	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
+
 	/*
 	 * the 480m are generated inside the usb block from these clocks,
 	 * but they are also a source for the hsicphy clock.
@@ -754,7 +757,6 @@ static const char *const rk3188_critical_clocks[] __initconst = {
 static void __init rk3188_common_clk_init(struct device_node *np)
 {
 	void __iomem *reg_base;
-	struct clk *clk;
 
 	reg_base = of_iomap(np, 0);
 	if (!reg_base) {
@@ -764,12 +766,6 @@ static void __init rk3188_common_clk_init(struct device_node *np)
 
 	rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
 
-	/* xin12m is created by an cru-internal divider */
-	clk = clk_register_fixed_factor(NULL, "xin12m", "xin24m", 0, 1, 2);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock xin12m: %ld\n",
-			__func__, PTR_ERR(clk));
-
 	rockchip_clk_register_branches(common_clk_branches,
 				  ARRAY_SIZE(common_clk_branches));
 
diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
index 981a502..fb57c94 100644
--- a/drivers/clk/rockchip/clk-rk3228.c
+++ b/drivers/clk/rockchip/clk-rk3228.c
@@ -187,7 +187,7 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
 			RK2928_CLKGATE_CON(7), 1, GFLAGS),
 	GATE(0, "ddrc", "ddrphy_pre", CLK_IGNORE_UNUSED,
 			RK2928_CLKGATE_CON(8), 5, GFLAGS),
-	GATE(0, "ddrphy", "ddrphy_pre", CLK_IGNORE_UNUSED,
+	FACTOR_GATE(0, "ddrphy", "ddrphy4x", CLK_IGNORE_UNUSED, 1, 4,
 			RK2928_CLKGATE_CON(7), 0, GFLAGS),
 
 	/* PD_CORE */
@@ -240,13 +240,13 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
 	COMPOSITE(0, "aclk_vpu_pre", mux_pll_src_4plls_p, 0,
 			RK2928_CLKSEL_CON(32), 5, 2, MFLAGS, 0, 5, DFLAGS,
 			RK2928_CLKGATE_CON(3), 11, GFLAGS),
-	GATE(0, "hclk_vpu_src", "aclk_vpu_pre", 0,
+	FACTOR_GATE(0, "hclk_vpu_pre", "aclk_vpu_pre", 0, 1, 4,
 			RK2928_CLKGATE_CON(4), 4, GFLAGS),
 
 	COMPOSITE(0, "aclk_rkvdec_pre", mux_pll_src_4plls_p, 0,
 			RK2928_CLKSEL_CON(28), 6, 2, MFLAGS, 0, 5, DFLAGS,
 			RK2928_CLKGATE_CON(3), 2, GFLAGS),
-	GATE(0, "hclk_rkvdec_src", "aclk_rkvdec_pre", 0,
+	FACTOR_GATE(0, "hclk_rkvdec_pre", "aclk_rkvdec_pre", 0, 1, 4,
 			RK2928_CLKGATE_CON(4), 5, GFLAGS),
 
 	COMPOSITE(0, "sclk_vdec_cabac", mux_pll_src_4plls_p, 0,
@@ -371,6 +371,9 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
 	MUX(0, "dclk_vop", mux_dclk_vop_p, 0,
 			RK2928_CLKSEL_CON(27), 1, 1, MFLAGS),
 
+	/* xin12m is created by a cru-internal divider */
+	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
+
 	COMPOSITE(0, "i2s0_src", mux_pll_src_2plls_p, 0,
 			RK2928_CLKSEL_CON(9), 15, 1, MFLAGS, 0, 7, DFLAGS,
 			RK2928_CLKGATE_CON(0), 3, GFLAGS),
@@ -624,7 +627,6 @@ static const char *const rk3228_critical_clocks[] __initconst = {
 static void __init rk3228_clk_init(struct device_node *np)
 {
 	void __iomem *reg_base;
-	struct clk *clk;
 
 	reg_base = of_iomap(np, 0);
 	if (!reg_base) {
@@ -634,29 +636,6 @@ static void __init rk3228_clk_init(struct device_node *np)
 
 	rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
 
-	/* xin12m is created by an cru-internal divider */
-	clk = clk_register_fixed_factor(NULL, "xin12m", "xin24m", 0, 1, 2);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock xin12m: %ld\n",
-				__func__, PTR_ERR(clk));
-
-	clk = clk_register_fixed_factor(NULL, "ddrphy_pre", "ddrphy4x", 0, 1, 4);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock ddrphy_pre: %ld\n",
-			__func__, PTR_ERR(clk));
-
-	clk = clk_register_fixed_factor(NULL, "hclk_vpu_pre",
-					"hclk_vpu_src", 0, 1, 4);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock hclk_vpu_pre: %ld\n",
-			__func__, PTR_ERR(clk));
-
-	clk = clk_register_fixed_factor(NULL, "hclk_rkvdec_pre",
-					"hclk_rkvdec_src", 0, 1, 4);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock hclk_rkvdec_pre: %ld\n",
-			__func__, PTR_ERR(clk));
-
 	rockchip_clk_register_plls(rk3228_pll_clks,
 				   ARRAY_SIZE(rk3228_pll_clks),
 				   RK3228_GRF_SOC_STATUS0);
diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 0d23937..b4c3c4b 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -333,6 +333,9 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	GATE(0, "aclk_bus_2pmu", "aclk_cpu_pre", CLK_IGNORE_UNUSED,
 			RK3288_CLKGATE_CON(0), 7, GFLAGS),
 
+	/* xin12m is created by a cru-internal divider */
+	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
+
 	COMPOSITE(0, "i2s_src", mux_pll_src_cpll_gpll_p, 0,
 			RK3288_CLKSEL_CON(4), 15, 1, MFLAGS, 0, 7, DFLAGS,
 			RK3288_CLKGATE_CON(4), 1, GFLAGS),
@@ -399,12 +402,10 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	 */
 	GATE(ACLK_VCODEC, "aclk_vcodec", "aclk_vdpu", 0,
 		RK3288_CLKGATE_CON(9), 0, GFLAGS),
-	/*
-	 * We introduce a virtul node of hclk_vodec_pre_v to split one clock
-	 * struct with a gate and a fix divider into two node in software.
-	 */
-	GATE(0, "hclk_vcodec_pre_v", "aclk_vdpu", 0,
+
+	FACTOR_GATE(0, "hclk_vcodec_pre", "aclk_vdpu", 0, 1, 4,
 		RK3288_CLKGATE_CON(3), 10, GFLAGS),
+
 	GATE(HCLK_VCODEC, "hclk_vcodec", "hclk_vcodec_pre", 0,
 		RK3288_CLKGATE_CON(9), 1, GFLAGS),
 
@@ -888,18 +889,6 @@ static void __init rk3288_clk_init(struct device_node *np)
 
 	rockchip_clk_init(np, rk3288_cru_base, CLK_NR_CLKS);
 
-	/* xin12m is created by an cru-internal divider */
-	clk = clk_register_fixed_factor(NULL, "xin12m", "xin24m", 0, 1, 2);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock xin12m: %ld\n",
-			__func__, PTR_ERR(clk));
-
-	clk = clk_register_fixed_factor(NULL, "hclk_vcodec_pre",
-					"hclk_vcodec_pre_v", 0, 1, 4);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock hclk_vcodec_pre: %ld\n",
-			__func__, PTR_ERR(clk));
-
 	/* Watchdog pclk is controlled by RK3288_SGRF_SOC_CON0[1]. */
 	clk = clk_register_fixed_factor(NULL, "pclk_wdt", "pclk_pd_alive", 0, 1, 1);
 	if (IS_ERR(clk))
diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index e90abe8..1065f3e 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -248,6 +248,9 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 	 * Clock-Architecture Diagram 2
 	 */
 
+	/* xin12m is created by an cru-internal divider */
+	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
+
 	MUX(SCLK_USBPHY480M, "usbphy_480m", mux_usbphy480m_p, CLK_SET_RATE_PARENT,
 			RK3368_CLKSEL_CON(13), 8, 1, MFLAGS),
 
@@ -299,7 +302,7 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 	COMPOSITE_NOGATE_DIVTBL(0, "ddrphy_src", mux_ddrphy_p, CLK_IGNORE_UNUSED,
 			RK3368_CLKSEL_CON(13), 4, 1, MFLAGS, 0, 2, DFLAGS, div_ddrphy_t),
 
-	GATE(0, "sclk_ddr", "ddrphy_div4", CLK_IGNORE_UNUSED,
+	FACTOR_GATE(0, "sclk_ddr", "ddrphy_src", CLK_IGNORE_UNUSED, 1, 4,
 			RK3368_CLKGATE_CON(6), 14, GFLAGS),
 	GATE(0, "sclk_ddr4x", "ddrphy_src", CLK_IGNORE_UNUSED,
 			RK3368_CLKGATE_CON(6), 15, GFLAGS),
@@ -392,10 +395,10 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 			RK3368_CLKGATE_CON(4), 7, GFLAGS),
 
 	/*
-	 * We introduce a virtual node of hclk_vodec_pre_v to split one clock
-	 * struct with a gate and a fix divider into two node in software.
+	 * We use aclk_vdpu by default ---GRF_SOC_CON0[7] setting in system,
+	 * so we ignore the mux and make clocks nodes as following,
 	 */
-	GATE(0, "hclk_video_pre_v", "aclk_vdpu", 0,
+	FACTOR_GATE(0, "hclk_video_pre", "aclk_vdpu", 0, 1, 4,
 		RK3368_CLKGATE_CON(4), 8, GFLAGS),
 
 	COMPOSITE(0, "sclk_hevc_cabac_src", mux_pll_src_cpll_gpll_npll_usb_p, 0,
@@ -842,24 +845,6 @@ static void __init rk3368_clk_init(struct device_node *np)
 
 	rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
 
-	/* xin12m is created by a cru-internal divider */
-	clk = clk_register_fixed_factor(NULL, "xin12m", "xin24m", 0, 1, 2);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock xin12m: %ld\n",
-			__func__, PTR_ERR(clk));
-
-	/* ddrphy_div4 is created by a cru-internal divider */
-	clk = clk_register_fixed_factor(NULL, "ddrphy_div4", "ddrphy_src", 0, 1, 4);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock xin12m: %ld\n",
-			__func__, PTR_ERR(clk));
-
-	clk = clk_register_fixed_factor(NULL, "hclk_video_pre",
-					"hclk_video_pre_v", 0, 1, 4);
-	if (IS_ERR(clk))
-		pr_warn("%s: could not register clock hclk_vcodec_pre: %ld\n",
-			__func__, PTR_ERR(clk));
-
 	/* Watchdog pclk is controlled by sgrf_soc_con3[7]. */
 	clk = clk_register_fixed_factor(NULL, "pclk_wdt", "pclk_pd_alive", 0, 1, 1);
 	if (IS_ERR(clk))
-- 
2.6.4
