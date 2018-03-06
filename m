Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46330 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753752AbeCFOd1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Mar 2018 09:33:27 -0500
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v3 3/6] clk: samsung: exynos5420: Move PD-dependent clocks
 to Exynos5 sub-CMU driver
Date: Tue, 06 Mar 2018 15:33:09 +0100
Message-id: <20180306143312.21035-4-m.szyprowski@samsung.com>
In-reply-to: <20180306143312.21035-1-m.szyprowski@samsung.com>
References: <20180306143312.21035-1-m.szyprowski@samsung.com>
        <CGME20180306143324eucas1p192653a37b36bf3bac2db20247fc0b1f3@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clocks related to DISP, GSC and MFC blocks require special handling for
power domain turn on/off sequences. Till now this was handled by Exynos
power domain driver, but that approach was limited only to some special
cases. This patch moves handling of those operations to clock controller
driver. This gives more flexibility and allows fine tune values of some
clock-specific registers. This patch moves handling of those mentioned
clocks to Exynos5 sub-CMU driver instantiated from Exynos5420 driver.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/Makefile             |   1 +
 drivers/clk/samsung/clk-exynos5-subcmu.c |   2 +
 drivers/clk/samsung/clk-exynos5420.c     | 121 ++++++++++++++++++++++++-------
 drivers/soc/samsung/pm_domains.c         |   2 +
 4 files changed, 100 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index ef8900bc077f..b23d6cfac723 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SOC_EXYNOS5250)	+= clk-exynos5250.o
 obj-$(CONFIG_SOC_EXYNOS5260)	+= clk-exynos5260.o
 obj-$(CONFIG_SOC_EXYNOS5410)	+= clk-exynos5410.o
 obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5420.o
+obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5-subcmu.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
 obj-$(CONFIG_SOC_EXYNOS5440)	+= clk-exynos5440.o
 obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsung/clk-exynos5-subcmu.c
index ac3983c8adf2..bea10f4b3ee2 100644
--- a/drivers/clk/samsung/clk-exynos5-subcmu.c
+++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
@@ -165,6 +165,8 @@ static int __init exynos5_clk_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id exynos5_clk_of_match[] = {
+	{ .compatible = "samsung,exynos5420-clock", },
+	{ .compatible = "samsung,exynos5800-clock", },
 	{ },
 };
 
diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 6b10b70f7d72..c7b0f55dfbb6 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -19,6 +19,7 @@
 
 #include "clk.h"
 #include "clk-cpu.h"
+#include "clk-exynos5-subcmu.h"
 
 #define APLL_LOCK		0x0
 #define APLL_CON0		0x100
@@ -863,7 +864,6 @@ static const struct samsung_div_clock exynos5x_div_clks[] __initconst = {
 	DIV(0, "dout_mipi1", "mout_mipi1", DIV_DISP10, 16, 8),
 	DIV(0, "dout_dp1", "mout_dp1", DIV_DISP10, 24, 4),
 	DIV(CLK_DOUT_PIXEL, "dout_hdmi_pixel", "mout_pixel", DIV_DISP10, 28, 4),
-	DIV(0, "dout_disp1_blk", "aclk200_disp1", DIV2_RATIO0, 16, 2),
 	DIV(CLK_DOUT_ACLK400_DISP1, "dout_aclk400_disp1",
 			"mout_aclk400_disp1", DIV_TOP2, 4, 3),
 
@@ -912,8 +912,6 @@ static const struct samsung_div_clock exynos5x_div_clks[] __initconst = {
 	DIV(0, "dout_spi1", "mout_spi1", DIV_PERIC1, 24, 4),
 	DIV(0, "dout_spi2", "mout_spi2", DIV_PERIC1, 28, 4),
 
-	/* Mfc Block */
-	DIV(0, "dout_mfc_blk", "mout_user_aclk333", DIV4_RATIO, 0, 2),
 
 	/* PCM */
 	DIV(0, "dout_pcm1", "dout_audio1", DIV_PERIC2, 16, 8),
@@ -932,8 +930,6 @@ static const struct samsung_div_clock exynos5x_div_clks[] __initconst = {
 	DIV(0, "dout_spi2_pre", "dout_spi2", DIV_PERIC4, 24, 8),
 
 	/* GSCL Block */
-	DIV(0, "dout_gscl_blk_300", "mout_user_aclk300_gscl",
-			DIV2_RATIO0, 4, 2),
 	DIV(0, "dout_gscl_blk_333", "aclk333_432_gscl", DIV2_RATIO0, 6, 2),
 
 	/* MSCL Block */
@@ -1190,8 +1186,6 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
 	GATE(CLK_SCLK_GSCL_WB, "sclk_gscl_wb", "mout_user_aclk333_432_gscl",
 			GATE_TOP_SCLK_GSCL, 7, 0, 0),
 
-	GATE(CLK_GSCL0, "gscl0", "aclk300_gscl", GATE_IP_GSCL0, 0, 0, 0),
-	GATE(CLK_GSCL1, "gscl1", "aclk300_gscl", GATE_IP_GSCL0, 1, 0, 0),
 	GATE(CLK_FIMC_3AA, "fimc_3aa", "aclk333_432_gscl",
 			GATE_IP_GSCL0, 4, 0, 0),
 	GATE(CLK_FIMC_LITE0, "fimc_lite0", "aclk333_432_gscl",
@@ -1205,10 +1199,6 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
 			GATE_IP_GSCL1, 3, 0, 0),
 	GATE(CLK_SMMU_FIMCL1, "smmu_fimcl1", "dout_gscl_blk_333",
 			GATE_IP_GSCL1, 4, 0, 0),
-	GATE(CLK_SMMU_GSCL0, "smmu_gscl0", "dout_gscl_blk_300",
-			GATE_IP_GSCL1, 6, 0, 0),
-	GATE(CLK_SMMU_GSCL1, "smmu_gscl1", "dout_gscl_blk_300",
-			GATE_IP_GSCL1, 7, 0, 0),
 	GATE(CLK_GSCL_WA, "gscl_wa", "sclk_gscl_wa", GATE_IP_GSCL1, 12, 0, 0),
 	GATE(CLK_GSCL_WB, "gscl_wb", "sclk_gscl_wb", GATE_IP_GSCL1, 13, 0, 0),
 	GATE(CLK_SMMU_FIMCL3, "smmu_fimcl3,", "dout_gscl_blk_333",
@@ -1227,18 +1217,6 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
 	GATE(CLK_SMMU_MSCL2, "smmu_mscl2", "dout_mscl_blk",
 			GATE_IP_MSCL, 10, 0, 0),
 
-	GATE(CLK_FIMD1, "fimd1", "aclk300_disp1", GATE_IP_DISP1, 0, 0, 0),
-	GATE(CLK_DSIM1, "dsim1", "aclk200_disp1", GATE_IP_DISP1, 3, 0, 0),
-	GATE(CLK_DP1, "dp1", "aclk200_disp1", GATE_IP_DISP1, 4, 0, 0),
-	GATE(CLK_MIXER, "mixer", "aclk200_disp1", GATE_IP_DISP1, 5, 0, 0),
-	GATE(CLK_HDMI, "hdmi", "aclk200_disp1", GATE_IP_DISP1, 6, 0, 0),
-	GATE(CLK_SMMU_FIMD1M0, "smmu_fimd1m0", "dout_disp1_blk",
-			GATE_IP_DISP1, 7, 0, 0),
-	GATE(CLK_SMMU_FIMD1M1, "smmu_fimd1m1", "dout_disp1_blk",
-			GATE_IP_DISP1, 8, 0, 0),
-	GATE(CLK_SMMU_MIXER, "smmu_mixer", "aclk200_disp1",
-			GATE_IP_DISP1, 9, 0, 0),
-
 	/* ISP */
 	GATE(CLK_SCLK_UART_ISP, "sclk_uart_isp", "dout_uart_isp",
 			GATE_TOP_SCLK_ISP, 0, CLK_SET_RATE_PARENT, 0),
@@ -1255,11 +1233,98 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
 	GATE(CLK_SCLK_ISP_SENSOR2, "sclk_isp_sensor2", "dout_isp_sensor2",
 			GATE_TOP_SCLK_ISP, 12, CLK_SET_RATE_PARENT, 0),
 
+	GATE(CLK_G3D, "g3d", "mout_user_aclk_g3d", GATE_IP_G3D, 9, 0, 0),
+};
+
+static const struct samsung_div_clock exynos5x_disp_div_clks[] __initconst = {
+	DIV(0, "dout_disp1_blk", "aclk200_disp1", DIV2_RATIO0, 16, 2),
+};
+
+static const struct samsung_gate_clock exynos5x_disp_gate_clks[] __initconst = {
+	GATE(CLK_FIMD1, "fimd1", "aclk300_disp1", GATE_IP_DISP1, 0, 0, 0),
+	GATE(CLK_DSIM1, "dsim1", "aclk200_disp1", GATE_IP_DISP1, 3, 0, 0),
+	GATE(CLK_DP1, "dp1", "aclk200_disp1", GATE_IP_DISP1, 4, 0, 0),
+	GATE(CLK_MIXER, "mixer", "aclk200_disp1", GATE_IP_DISP1, 5, 0, 0),
+	GATE(CLK_HDMI, "hdmi", "aclk200_disp1", GATE_IP_DISP1, 6, 0, 0),
+	GATE(CLK_SMMU_FIMD1M0, "smmu_fimd1m0", "dout_disp1_blk",
+			GATE_IP_DISP1, 7, 0, 0),
+	GATE(CLK_SMMU_FIMD1M1, "smmu_fimd1m1", "dout_disp1_blk",
+			GATE_IP_DISP1, 8, 0, 0),
+	GATE(CLK_SMMU_MIXER, "smmu_mixer", "aclk200_disp1",
+			GATE_IP_DISP1, 9, 0, 0),
+};
+
+static struct exynos5_subcmu_reg_dump exynos5x_disp_suspend_regs[] = {
+	{ GATE_IP_DISP1, 0xffffffff, 0xffffffff }, /* DISP1 gates */
+	{ SRC_TOP5, 0, BIT(0) },	/* MUX mout_user_aclk400_disp1 */
+	{ SRC_TOP5, 0, BIT(24) },	/* MUX mout_user_aclk300_disp1 */
+	{ SRC_TOP3, 0, BIT(8) },	/* MUX mout_user_aclk200_disp1 */
+	{ DIV2_RATIO0, 0, 0x30000 },		/* DIV dout_disp1_blk */
+};
+
+static const struct samsung_div_clock exynos5x_gsc_div_clks[] __initconst = {
+	DIV(0, "dout_gscl_blk_300", "mout_user_aclk300_gscl",
+			DIV2_RATIO0, 4, 2),
+};
+
+static const struct samsung_gate_clock exynos5x_gsc_gate_clks[] __initconst = {
+	GATE(CLK_GSCL0, "gscl0", "aclk300_gscl", GATE_IP_GSCL0, 0, 0, 0),
+	GATE(CLK_GSCL1, "gscl1", "aclk300_gscl", GATE_IP_GSCL0, 1, 0, 0),
+	GATE(CLK_SMMU_GSCL0, "smmu_gscl0", "dout_gscl_blk_300",
+			GATE_IP_GSCL1, 6, 0, 0),
+	GATE(CLK_SMMU_GSCL1, "smmu_gscl1", "dout_gscl_blk_300",
+			GATE_IP_GSCL1, 7, 0, 0),
+};
+
+static struct exynos5_subcmu_reg_dump exynos5x_gsc_suspend_regs[] = {
+	{ GATE_IP_GSCL0, 0x3, 0x3 },	/* GSC gates */
+	{ GATE_IP_GSCL1, 0xc0, 0xc0 },	/* GSC gates */
+	{ SRC_TOP5, 0, BIT(28) },	/* MUX mout_user_aclk300_gscl */
+	{ DIV2_RATIO0, 0, 0x30 },	/* DIV dout_gscl_blk_300 */
+};
+
+static const struct samsung_div_clock exynos5x_mfc_div_clks[] __initconst = {
+	DIV(0, "dout_mfc_blk", "mout_user_aclk333", DIV4_RATIO, 0, 2),
+};
+
+static const struct samsung_gate_clock exynos5x_mfc_gate_clks[] __initconst = {
 	GATE(CLK_MFC, "mfc", "aclk333", GATE_IP_MFC, 0, 0, 0),
 	GATE(CLK_SMMU_MFCL, "smmu_mfcl", "dout_mfc_blk", GATE_IP_MFC, 1, 0, 0),
 	GATE(CLK_SMMU_MFCR, "smmu_mfcr", "dout_mfc_blk", GATE_IP_MFC, 2, 0, 0),
+};
 
-	GATE(CLK_G3D, "g3d", "mout_user_aclk_g3d", GATE_IP_G3D, 9, 0, 0),
+static struct exynos5_subcmu_reg_dump exynos5x_mfc_suspend_regs[] = {
+	{ GATE_IP_MFC, 0xffffffff, 0xffffffff }, /* MFC gates */
+	{ SRC_TOP4, 0, BIT(28) },		/* MUX mout_user_aclk333 */
+	{ DIV4_RATIO, 0, 0x3 },			/* DIV dout_mfc_blk */
+};
+
+static const struct exynos5_subcmu_info exynos5x_subcmus[] = {
+	{
+		.div_clks	= exynos5x_disp_div_clks,
+		.nr_div_clks	= ARRAY_SIZE(exynos5x_disp_div_clks),
+		.gate_clks	= exynos5x_disp_gate_clks,
+		.nr_gate_clks	= ARRAY_SIZE(exynos5x_disp_gate_clks),
+		.suspend_regs	= exynos5x_disp_suspend_regs,
+		.nr_suspend_regs = ARRAY_SIZE(exynos5x_disp_suspend_regs),
+		.pd_name	= "DISP",
+	}, {
+		.div_clks	= exynos5x_gsc_div_clks,
+		.nr_div_clks	= ARRAY_SIZE(exynos5x_gsc_div_clks),
+		.gate_clks	= exynos5x_gsc_gate_clks,
+		.nr_gate_clks	= ARRAY_SIZE(exynos5x_gsc_gate_clks),
+		.suspend_regs	= exynos5x_gsc_suspend_regs,
+		.nr_suspend_regs = ARRAY_SIZE(exynos5x_gsc_suspend_regs),
+		.pd_name	= "GSC",
+	}, {
+		.div_clks	= exynos5x_mfc_div_clks,
+		.nr_div_clks	= ARRAY_SIZE(exynos5x_mfc_div_clks),
+		.gate_clks	= exynos5x_mfc_gate_clks,
+		.nr_gate_clks	= ARRAY_SIZE(exynos5x_mfc_gate_clks),
+		.suspend_regs	= exynos5x_mfc_suspend_regs,
+		.nr_suspend_regs = ARRAY_SIZE(exynos5x_mfc_suspend_regs),
+		.pd_name	= "MFC",
+	},
 };
 
 static const struct samsung_pll_rate_table exynos5420_pll2550x_24mhz_tbl[] __initconst = {
@@ -1472,6 +1537,8 @@ static void __init exynos5x_clk_init(struct device_node *np,
 		exynos5420_kfcclk_d, ARRAY_SIZE(exynos5420_kfcclk_d), 0);
 
 	exynos5420_clk_sleep_init();
+	exynos5_subcmus_init(ctx, ARRAY_SIZE(exynos5x_subcmus),
+			     exynos5x_subcmus);
 
 	samsung_clk_of_add_provider(np, ctx);
 }
@@ -1480,10 +1547,12 @@ static void __init exynos5420_clk_init(struct device_node *np)
 {
 	exynos5x_clk_init(np, EXYNOS5420);
 }
-CLK_OF_DECLARE(exynos5420_clk, "samsung,exynos5420-clock", exynos5420_clk_init);
+CLK_OF_DECLARE_DRIVER(exynos5420_clk, "samsung,exynos5420-clock",
+		      exynos5420_clk_init);
 
 static void __init exynos5800_clk_init(struct device_node *np)
 {
 	exynos5x_clk_init(np, EXYNOS5800);
 }
-CLK_OF_DECLARE(exynos5800_clk, "samsung,exynos5800-clock", exynos5800_clk_init);
+CLK_OF_DECLARE_DRIVER(exynos5800_clk, "samsung,exynos5800-clock",
+		      exynos5800_clk_init);
diff --git a/drivers/soc/samsung/pm_domains.c b/drivers/soc/samsung/pm_domains.c
index cef30bdf19b1..f2d6d7a09c16 100644
--- a/drivers/soc/samsung/pm_domains.c
+++ b/drivers/soc/samsung/pm_domains.c
@@ -148,6 +148,8 @@ static __init const char *exynos_get_domain_name(struct device_node *node)
 }
 
 static const char *soc_force_no_clk[] = {
+	"samsung,exynos5420-clock",
+	"samsung,exynos5800-clock",
 };
 
 static __init int exynos4_pm_init_power_domain(void)
-- 
2.15.0

