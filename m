Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Leo Yan <leo.yan@linaro.org>,
	Bintian Wang <bintian.wang@huawei.com>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: [PATCH 03/41] clk: hisilicon: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 10:59:48 -0800
Message-Id: <1456858826-28541-4-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Leo Yan <leo.yan@linaro.org>
Cc: Bintian Wang <bintian.wang@huawei.com>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/hisilicon/clk-hi3620.c      | 18 +++++-----
 drivers/clk/hisilicon/clk-hi6220-stub.c |  2 +-
 drivers/clk/hisilicon/clk-hi6220.c      | 26 +++++++-------
 drivers/clk/hisilicon/clk-hip04.c       |  6 ++--
 drivers/clk/hisilicon/clk-hix5hd2.c     | 60 ++++++++++++++++-----------------
 5 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3620.c b/drivers/clk/hisilicon/clk-hi3620.c
index 7d03fe17d66f..d04a104ce1b4 100644
--- a/drivers/clk/hisilicon/clk-hi3620.c
+++ b/drivers/clk/hisilicon/clk-hi3620.c
@@ -78,15 +78,15 @@ static const char *const mmc3_mux_p[] __initconst = { "armpll2", "armpll3", };
 
 /* fixed rate clocks */
 static struct hisi_fixed_rate_clock hi3620_fixed_rate_clks[] __initdata = {
-	{ HI3620_OSC32K,   "osc32k",   NULL, CLK_IS_ROOT, 32768, },
-	{ HI3620_OSC26M,   "osc26m",   NULL, CLK_IS_ROOT, 26000000, },
-	{ HI3620_PCLK,     "pclk",     NULL, CLK_IS_ROOT, 26000000, },
-	{ HI3620_PLL_ARM0, "armpll0",  NULL, CLK_IS_ROOT, 1600000000, },
-	{ HI3620_PLL_ARM1, "armpll1",  NULL, CLK_IS_ROOT, 1600000000, },
-	{ HI3620_PLL_PERI, "armpll2",  NULL, CLK_IS_ROOT, 1440000000, },
-	{ HI3620_PLL_USB,  "armpll3",  NULL, CLK_IS_ROOT, 1440000000, },
-	{ HI3620_PLL_HDMI, "armpll4",  NULL, CLK_IS_ROOT, 1188000000, },
-	{ HI3620_PLL_GPU,  "armpll5",  NULL, CLK_IS_ROOT, 1300000000, },
+	{ HI3620_OSC32K,   "osc32k",   NULL, 0, 32768, },
+	{ HI3620_OSC26M,   "osc26m",   NULL, 0, 26000000, },
+	{ HI3620_PCLK,     "pclk",     NULL, 0, 26000000, },
+	{ HI3620_PLL_ARM0, "armpll0",  NULL, 0, 1600000000, },
+	{ HI3620_PLL_ARM1, "armpll1",  NULL, 0, 1600000000, },
+	{ HI3620_PLL_PERI, "armpll2",  NULL, 0, 1440000000, },
+	{ HI3620_PLL_USB,  "armpll3",  NULL, 0, 1440000000, },
+	{ HI3620_PLL_HDMI, "armpll4",  NULL, 0, 1188000000, },
+	{ HI3620_PLL_GPU,  "armpll5",  NULL, 0, 1300000000, },
 };
 
 /* fixed factor clocks */
diff --git a/drivers/clk/hisilicon/clk-hi6220-stub.c b/drivers/clk/hisilicon/clk-hi6220-stub.c
index 8afb40ef40ce..329a09214d12 100644
--- a/drivers/clk/hisilicon/clk-hi6220-stub.c
+++ b/drivers/clk/hisilicon/clk-hi6220-stub.c
@@ -235,7 +235,7 @@ static int hi6220_stub_clk_probe(struct platform_device *pdev)
 	init.name = "acpu0";
 	init.ops = &hi6220_stub_clk_ops;
 	init.num_parents = 0;
-	init.flags = CLK_IS_ROOT;
+	init.flags = 0;
 
 	clk = devm_clk_register(dev, &stub_clk->hw);
 	if (IS_ERR(clk))
diff --git a/drivers/clk/hisilicon/clk-hi6220.c b/drivers/clk/hisilicon/clk-hi6220.c
index 4563343b6420..f02cb41d40a4 100644
--- a/drivers/clk/hisilicon/clk-hi6220.c
+++ b/drivers/clk/hisilicon/clk-hi6220.c
@@ -26,19 +26,19 @@
 
 /* clocks in AO (always on) controller */
 static struct hisi_fixed_rate_clock hi6220_fixed_rate_clks[] __initdata = {
-	{ HI6220_REF32K,	"ref32k",	NULL, CLK_IS_ROOT, 32764,     },
-	{ HI6220_CLK_TCXO,	"clk_tcxo",	NULL, CLK_IS_ROOT, 19200000,  },
-	{ HI6220_MMC1_PAD,	"mmc1_pad",	NULL, CLK_IS_ROOT, 100000000, },
-	{ HI6220_MMC2_PAD,	"mmc2_pad",	NULL, CLK_IS_ROOT, 100000000, },
-	{ HI6220_MMC0_PAD,	"mmc0_pad",	NULL, CLK_IS_ROOT, 200000000, },
-	{ HI6220_PLL_BBP,	"bbppll0",	NULL, CLK_IS_ROOT, 245760000, },
-	{ HI6220_PLL_GPU,	"gpupll",	NULL, CLK_IS_ROOT, 1000000000,},
-	{ HI6220_PLL1_DDR,	"ddrpll1",	NULL, CLK_IS_ROOT, 1066000000,},
-	{ HI6220_PLL_SYS,	"syspll",	NULL, CLK_IS_ROOT, 1200000000,},
-	{ HI6220_PLL_SYS_MEDIA,	"media_syspll",	NULL, CLK_IS_ROOT, 1200000000,},
-	{ HI6220_DDR_SRC,	"ddr_sel_src",  NULL, CLK_IS_ROOT, 1200000000,},
-	{ HI6220_PLL_MEDIA,	"media_pll",    NULL, CLK_IS_ROOT, 1440000000,},
-	{ HI6220_PLL_DDR,	"ddrpll0",      NULL, CLK_IS_ROOT, 1600000000,},
+	{ HI6220_REF32K,	"ref32k",	NULL, 0, 32764,     },
+	{ HI6220_CLK_TCXO,	"clk_tcxo",	NULL, 0, 19200000,  },
+	{ HI6220_MMC1_PAD,	"mmc1_pad",	NULL, 0, 100000000, },
+	{ HI6220_MMC2_PAD,	"mmc2_pad",	NULL, 0, 100000000, },
+	{ HI6220_MMC0_PAD,	"mmc0_pad",	NULL, 0, 200000000, },
+	{ HI6220_PLL_BBP,	"bbppll0",	NULL, 0, 245760000, },
+	{ HI6220_PLL_GPU,	"gpupll",	NULL, 0, 1000000000,},
+	{ HI6220_PLL1_DDR,	"ddrpll1",	NULL, 0, 1066000000,},
+	{ HI6220_PLL_SYS,	"syspll",	NULL, 0, 1200000000,},
+	{ HI6220_PLL_SYS_MEDIA,	"media_syspll",	NULL, 0, 1200000000,},
+	{ HI6220_DDR_SRC,	"ddr_sel_src",  NULL, 0, 1200000000,},
+	{ HI6220_PLL_MEDIA,	"media_pll",    NULL, 0, 1440000000,},
+	{ HI6220_PLL_DDR,	"ddrpll0",      NULL, 0, 1600000000,},
 };
 
 static struct hisi_fixed_factor_clock hi6220_fixed_factor_clks[] __initdata = {
diff --git a/drivers/clk/hisilicon/clk-hip04.c b/drivers/clk/hisilicon/clk-hip04.c
index 8ca967308343..b38e03da1d02 100644
--- a/drivers/clk/hisilicon/clk-hip04.c
+++ b/drivers/clk/hisilicon/clk-hip04.c
@@ -36,9 +36,9 @@
 
 /* fixed rate clocks */
 static struct hisi_fixed_rate_clock hip04_fixed_rate_clks[] __initdata = {
-	{ HIP04_OSC50M,   "osc50m",   NULL, CLK_IS_ROOT, 50000000, },
-	{ HIP04_CLK_50M,  "clk50m",   NULL, CLK_IS_ROOT, 50000000, },
-	{ HIP04_CLK_168M, "clk168m",  NULL, CLK_IS_ROOT, 168750000, },
+	{ HIP04_OSC50M,   "osc50m",   NULL, 0, 50000000, },
+	{ HIP04_CLK_50M,  "clk50m",   NULL, 0, 50000000, },
+	{ HIP04_CLK_168M, "clk168m",  NULL, 0, 168750000, },
 };
 
 static void __init hip04_clk_init(struct device_node *np)
diff --git a/drivers/clk/hisilicon/clk-hix5hd2.c b/drivers/clk/hisilicon/clk-hix5hd2.c
index 0aaf29da8491..14b05efa3c2a 100644
--- a/drivers/clk/hisilicon/clk-hix5hd2.c
+++ b/drivers/clk/hisilicon/clk-hix5hd2.c
@@ -14,36 +14,36 @@
 #include "clk.h"
 
 static struct hisi_fixed_rate_clock hix5hd2_fixed_rate_clks[] __initdata = {
-	{ HIX5HD2_FIXED_1200M, "1200m", NULL, CLK_IS_ROOT, 1200000000, },
-	{ HIX5HD2_FIXED_400M, "400m", NULL, CLK_IS_ROOT, 400000000, },
-	{ HIX5HD2_FIXED_48M, "48m", NULL, CLK_IS_ROOT, 48000000, },
-	{ HIX5HD2_FIXED_24M, "24m", NULL, CLK_IS_ROOT, 24000000, },
-	{ HIX5HD2_FIXED_600M, "600m", NULL, CLK_IS_ROOT, 600000000, },
-	{ HIX5HD2_FIXED_300M, "300m", NULL, CLK_IS_ROOT, 300000000, },
-	{ HIX5HD2_FIXED_75M, "75m", NULL, CLK_IS_ROOT, 75000000, },
-	{ HIX5HD2_FIXED_200M, "200m", NULL, CLK_IS_ROOT, 200000000, },
-	{ HIX5HD2_FIXED_100M, "100m", NULL, CLK_IS_ROOT, 100000000, },
-	{ HIX5HD2_FIXED_40M, "40m", NULL, CLK_IS_ROOT, 40000000, },
-	{ HIX5HD2_FIXED_150M, "150m", NULL, CLK_IS_ROOT, 150000000, },
-	{ HIX5HD2_FIXED_1728M, "1728m", NULL, CLK_IS_ROOT, 1728000000, },
-	{ HIX5HD2_FIXED_28P8M, "28p8m", NULL, CLK_IS_ROOT, 28000000, },
-	{ HIX5HD2_FIXED_432M, "432m", NULL, CLK_IS_ROOT, 432000000, },
-	{ HIX5HD2_FIXED_345P6M, "345p6m", NULL, CLK_IS_ROOT, 345000000, },
-	{ HIX5HD2_FIXED_288M, "288m", NULL, CLK_IS_ROOT, 288000000, },
-	{ HIX5HD2_FIXED_60M,	"60m", NULL, CLK_IS_ROOT, 60000000, },
-	{ HIX5HD2_FIXED_750M, "750m", NULL, CLK_IS_ROOT, 750000000, },
-	{ HIX5HD2_FIXED_500M, "500m", NULL, CLK_IS_ROOT, 500000000, },
-	{ HIX5HD2_FIXED_54M,	"54m", NULL, CLK_IS_ROOT, 54000000, },
-	{ HIX5HD2_FIXED_27M, "27m", NULL, CLK_IS_ROOT, 27000000, },
-	{ HIX5HD2_FIXED_1500M, "1500m", NULL, CLK_IS_ROOT, 1500000000, },
-	{ HIX5HD2_FIXED_375M, "375m", NULL, CLK_IS_ROOT, 375000000, },
-	{ HIX5HD2_FIXED_187M, "187m", NULL, CLK_IS_ROOT, 187000000, },
-	{ HIX5HD2_FIXED_250M, "250m", NULL, CLK_IS_ROOT, 250000000, },
-	{ HIX5HD2_FIXED_125M, "125m", NULL, CLK_IS_ROOT, 125000000, },
-	{ HIX5HD2_FIXED_2P02M, "2m", NULL, CLK_IS_ROOT, 2000000, },
-	{ HIX5HD2_FIXED_50M, "50m", NULL, CLK_IS_ROOT, 50000000, },
-	{ HIX5HD2_FIXED_25M, "25m", NULL, CLK_IS_ROOT, 25000000, },
-	{ HIX5HD2_FIXED_83M, "83m", NULL, CLK_IS_ROOT, 83333333, },
+	{ HIX5HD2_FIXED_1200M, "1200m", NULL, 0, 1200000000, },
+	{ HIX5HD2_FIXED_400M, "400m", NULL, 0, 400000000, },
+	{ HIX5HD2_FIXED_48M, "48m", NULL, 0, 48000000, },
+	{ HIX5HD2_FIXED_24M, "24m", NULL, 0, 24000000, },
+	{ HIX5HD2_FIXED_600M, "600m", NULL, 0, 600000000, },
+	{ HIX5HD2_FIXED_300M, "300m", NULL, 0, 300000000, },
+	{ HIX5HD2_FIXED_75M, "75m", NULL, 0, 75000000, },
+	{ HIX5HD2_FIXED_200M, "200m", NULL, 0, 200000000, },
+	{ HIX5HD2_FIXED_100M, "100m", NULL, 0, 100000000, },
+	{ HIX5HD2_FIXED_40M, "40m", NULL, 0, 40000000, },
+	{ HIX5HD2_FIXED_150M, "150m", NULL, 0, 150000000, },
+	{ HIX5HD2_FIXED_1728M, "1728m", NULL, 0, 1728000000, },
+	{ HIX5HD2_FIXED_28P8M, "28p8m", NULL, 0, 28000000, },
+	{ HIX5HD2_FIXED_432M, "432m", NULL, 0, 432000000, },
+	{ HIX5HD2_FIXED_345P6M, "345p6m", NULL, 0, 345000000, },
+	{ HIX5HD2_FIXED_288M, "288m", NULL, 0, 288000000, },
+	{ HIX5HD2_FIXED_60M,	"60m", NULL, 0, 60000000, },
+	{ HIX5HD2_FIXED_750M, "750m", NULL, 0, 750000000, },
+	{ HIX5HD2_FIXED_500M, "500m", NULL, 0, 500000000, },
+	{ HIX5HD2_FIXED_54M,	"54m", NULL, 0, 54000000, },
+	{ HIX5HD2_FIXED_27M, "27m", NULL, 0, 27000000, },
+	{ HIX5HD2_FIXED_1500M, "1500m", NULL, 0, 1500000000, },
+	{ HIX5HD2_FIXED_375M, "375m", NULL, 0, 375000000, },
+	{ HIX5HD2_FIXED_187M, "187m", NULL, 0, 187000000, },
+	{ HIX5HD2_FIXED_250M, "250m", NULL, 0, 250000000, },
+	{ HIX5HD2_FIXED_125M, "125m", NULL, 0, 125000000, },
+	{ HIX5HD2_FIXED_2P02M, "2m", NULL, 0, 2000000, },
+	{ HIX5HD2_FIXED_50M, "50m", NULL, 0, 50000000, },
+	{ HIX5HD2_FIXED_25M, "25m", NULL, 0, 25000000, },
+	{ HIX5HD2_FIXED_83M, "83m", NULL, 0, 83333333, },
 };
 
 static const char *const sfc_mux_p[] __initconst = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
