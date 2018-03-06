Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46332 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753768AbeCFOd1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Mar 2018 09:33:27 -0500
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v3 4/6] clk: samsung: exynos5250: Move PD-dependent clocks
 to Exynos5 sub-CMU driver
Date: Tue, 06 Mar 2018 15:33:10 +0100
Message-id: <20180306143312.21035-5-m.szyprowski@samsung.com>
In-reply-to: <20180306143312.21035-1-m.szyprowski@samsung.com>
References: <20180306143312.21035-1-m.szyprowski@samsung.com>
        <CGME20180306143324eucas1p2ab3484f3e05f3bea06e0be51e0d4791c@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clocks related to DISP1 block require special handling for power domain
turn on/off sequences. Till now this was handled by Exynos power domain
driver, but that approach was limited only to some special cases. This
patch moves handling of those operations to clock controller driver.
This gives more flexibility and allows fine tune values of some
clock-specific registers. This patch moves handling of those mentioned
clocks to Exynos5 sub-CMU driver instantiated from Exynos5250 driver.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/Makefile             |  1 +
 drivers/clk/samsung/clk-exynos5-subcmu.c |  1 +
 drivers/clk/samsung/clk-exynos5250.c     | 51 ++++++++++++++++++++++----------
 drivers/soc/samsung/pm_domains.c         |  1 +
 4 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index b23d6cfac723..513826393158 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SOC_EXYNOS3250)	+= clk-exynos3250.o
 obj-$(CONFIG_ARCH_EXYNOS4)	+= clk-exynos4.o
 obj-$(CONFIG_ARCH_EXYNOS4)	+= clk-exynos4412-isp.o
 obj-$(CONFIG_SOC_EXYNOS5250)	+= clk-exynos5250.o
+obj-$(CONFIG_SOC_EXYNOS5250)	+= clk-exynos5-subcmu.o
 obj-$(CONFIG_SOC_EXYNOS5260)	+= clk-exynos5260.o
 obj-$(CONFIG_SOC_EXYNOS5410)	+= clk-exynos5410.o
 obj-$(CONFIG_SOC_EXYNOS5420)	+= clk-exynos5420.o
diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsung/clk-exynos5-subcmu.c
index bea10f4b3ee2..93306283d764 100644
--- a/drivers/clk/samsung/clk-exynos5-subcmu.c
+++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
@@ -165,6 +165,7 @@ static int __init exynos5_clk_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id exynos5_clk_of_match[] = {
+	{ .compatible = "samsung,exynos5250-clock", },
 	{ .compatible = "samsung,exynos5420-clock", },
 	{ .compatible = "samsung,exynos5800-clock", },
 	{ },
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 1b3a8f9cd519..06e5ddcb30db 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -18,6 +18,7 @@
 
 #include "clk.h"
 #include "clk-cpu.h"
+#include "clk-exynos5-subcmu.h"
 
 #define APLL_LOCK		0x0
 #define APLL_CON0		0x100
@@ -571,17 +572,6 @@ static const struct samsung_gate_clock exynos5250_gate_clks[] __initconst = {
 	GATE(CLK_SMMU_GSCL3, "smmu_gscl3", "mout_aclk266_gscl_sub",
 			GATE_IP_GSCL, 10, 0, 0),
 
-	GATE(CLK_FIMD1, "fimd1", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 0, 0,
-		0),
-	GATE(CLK_MIE1, "mie1", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 1, 0,
-		0),
-	GATE(CLK_DSIM0, "dsim0", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 3, 0,
-		0),
-	GATE(CLK_DP, "dp", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 4, 0, 0),
-	GATE(CLK_MIXER, "mixer", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 5, 0,
-		0),
-	GATE(CLK_HDMI, "hdmi", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 6, 0,
-		0),
 
 	GATE(CLK_MFC, "mfc", "mout_aclk333_sub", GATE_IP_MFC, 0, 0, 0),
 	GATE(CLK_SMMU_MFCR, "smmu_mfcr", "mout_aclk333_sub", GATE_IP_MFC, 1, 0,
@@ -671,10 +661,6 @@ static const struct samsung_gate_clock exynos5250_gate_clks[] __initconst = {
 	GATE(CLK_WDT, "wdt", "div_aclk66", GATE_IP_PERIS, 19, 0, 0),
 	GATE(CLK_RTC, "rtc", "div_aclk66", GATE_IP_PERIS, 20, 0, 0),
 	GATE(CLK_TMU, "tmu", "div_aclk66", GATE_IP_PERIS, 21, 0, 0),
-	GATE(CLK_SMMU_TV, "smmu_tv", "mout_aclk200_disp1_sub",
-			GATE_IP_DISP1, 9, 0, 0),
-	GATE(CLK_SMMU_FIMD1, "smmu_fimd1", "mout_aclk200_disp1_sub",
-			GATE_IP_DISP1, 8, 0, 0),
 	GATE(CLK_SMMU_2D, "smmu_2d", "div_aclk200", GATE_IP_ACP, 7, 0, 0),
 	GATE(CLK_SMMU_FIMC_ISP, "smmu_fimc_isp", "mout_aclk_266_isp_sub",
 			GATE_IP_ISP0, 8, 0, 0),
@@ -698,6 +684,38 @@ static const struct samsung_gate_clock exynos5250_gate_clks[] __initconst = {
 			GATE_IP_ISP1, 7, 0, 0),
 };
 
+static const struct samsung_gate_clock exynos5250_disp_gate_clks[] __initconst = {
+	GATE(CLK_FIMD1, "fimd1", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 0, 0,
+		0),
+	GATE(CLK_MIE1, "mie1", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 1, 0,
+		0),
+	GATE(CLK_DSIM0, "dsim0", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 3, 0,
+		0),
+	GATE(CLK_DP, "dp", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 4, 0, 0),
+	GATE(CLK_MIXER, "mixer", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 5, 0,
+		0),
+	GATE(CLK_HDMI, "hdmi", "mout_aclk200_disp1_sub", GATE_IP_DISP1, 6, 0,
+		0),
+	GATE(CLK_SMMU_TV, "smmu_tv", "mout_aclk200_disp1_sub",
+			GATE_IP_DISP1, 9, 0, 0),
+	GATE(CLK_SMMU_FIMD1, "smmu_fimd1", "mout_aclk200_disp1_sub",
+			GATE_IP_DISP1, 8, 0, 0),
+};
+
+static struct exynos5_subcmu_reg_dump exynos5250_disp_suspend_regs[] = {
+	{ GATE_IP_DISP1, 0xffffffff, 0xffffffff }, /* DISP1 gates */
+	{ SRC_TOP3, 0, BIT(4) },	/* MUX mout_aclk200_disp1_sub */
+	{ SRC_TOP3, 0, BIT(6) },	/* MUX mout_aclk300_disp1_sub */
+};
+
+static const struct exynos5_subcmu_info exynos5250_disp_subcmu = {
+	.gate_clks	= exynos5250_disp_gate_clks,
+	.nr_gate_clks	= ARRAY_SIZE(exynos5250_disp_gate_clks),
+	.suspend_regs	= exynos5250_disp_suspend_regs,
+	.nr_suspend_regs = ARRAY_SIZE(exynos5250_disp_suspend_regs),
+	.pd_name	= "DISP1",
+};
+
 static const struct samsung_pll_rate_table vpll_24mhz_tbl[] __initconst = {
 	/* sorted in descending order */
 	/* PLL_36XX_RATE(rate, m, p, s, k) */
@@ -859,10 +877,11 @@ static void __init exynos5250_clk_init(struct device_node *np)
 	__raw_writel(tmp, reg_base + PWR_CTRL2);
 
 	exynos5250_clk_sleep_init();
+	exynos5_subcmus_init(ctx, 1, &exynos5250_disp_subcmu);
 
 	samsung_clk_of_add_provider(np, ctx);
 
 	pr_info("Exynos5250: clock setup completed, armclk=%ld\n",
 			_get_rate("div_arm2"));
 }
-CLK_OF_DECLARE(exynos5250_clk, "samsung,exynos5250-clock", exynos5250_clk_init);
+CLK_OF_DECLARE_DRIVER(exynos5250_clk, "samsung,exynos5250-clock", exynos5250_clk_init);
diff --git a/drivers/soc/samsung/pm_domains.c b/drivers/soc/samsung/pm_domains.c
index f2d6d7a09c16..caf45cf7aa8e 100644
--- a/drivers/soc/samsung/pm_domains.c
+++ b/drivers/soc/samsung/pm_domains.c
@@ -148,6 +148,7 @@ static __init const char *exynos_get_domain_name(struct device_node *node)
 }
 
 static const char *soc_force_no_clk[] = {
+	"samsung,exynos5250-clock",
 	"samsung,exynos5420-clock",
 	"samsung,exynos5800-clock",
 };
-- 
2.15.0

