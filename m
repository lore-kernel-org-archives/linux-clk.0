Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
From: Shawn Guo <shawn.guo@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>,
	Jianguo Sun <sunjianguo1@huawei.com>,
	linux-clk@vger.kernel.org,
	tianshuliang <tianshuliang@hisilicon.com>,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 2/2] clk: hi3798cv200: add emmc sample and drive clock
Date: Mon,  5 Mar 2018 15:01:32 +0800
Message-Id: <1520233292-14704-3-git-send-email-shawn.guo@linaro.org>
In-Reply-To: <1520233292-14704-1-git-send-email-shawn.guo@linaro.org>
References: <1520233292-14704-1-git-send-email-shawn.guo@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

From: tianshuliang <tianshuliang@hisilicon.com>

It adds eMMC sample clock HISTB_MMC_SAMPLE_CLK and drive clock
HISTB_MMC_DRV_CLK support for Hi3798cv200 SoC.

Signed-off-by: tianshuliang <tianshuliang@hisilicon.com>
Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/hisilicon/crg-hi3798cv200.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/hisilicon/crg-hi3798cv200.c b/drivers/clk/hisilicon/crg-hi3798cv200.c
index d6e3971bac9e..743eec131528 100644
--- a/drivers/clk/hisilicon/crg-hi3798cv200.c
+++ b/drivers/clk/hisilicon/crg-hi3798cv200.c
@@ -97,6 +97,18 @@
 		0x9c, 8, 2, 0, sdio_mux_table, },
 };
 
+static u32 mmc_phase_regvals[] = {0, 1, 2, 3, 4, 5, 6, 7};
+static u32 mmc_phase_degrees[] = {0, 45, 90, 135, 180, 225, 270, 315};
+
+static struct hisi_phase_clock hi3798cv200_phase_clks[] = {
+	{ HISTB_MMC_SAMPLE_CLK, "mmc_sample", "clk_mmc_ciu",
+		CLK_SET_RATE_PARENT, 0xa0, 12, 3, mmc_phase_degrees,
+		mmc_phase_regvals, ARRAY_SIZE(mmc_phase_regvals) },
+	{ HISTB_MMC_DRV_CLK, "mmc_drive", "clk_mmc_ciu",
+		CLK_SET_RATE_PARENT, 0xa0, 16, 3, mmc_phase_degrees,
+		mmc_phase_regvals, ARRAY_SIZE(mmc_phase_regvals) },
+};
+
 static const struct hisi_gate_clock hi3798cv200_gate_clks[] = {
 	/* UART */
 	{ HISTB_UART2_CLK, "clk_uart2", "75m",
@@ -186,6 +198,14 @@ static struct hisi_clock_data *hi3798cv200_clk_register(
 	if (!clk_data)
 		return ERR_PTR(-ENOMEM);
 
+	/* hisi_phase_clock is resource managed */
+	ret = hisi_clk_register_phase(&pdev->dev,
+				hi3798cv200_phase_clks,
+				ARRAY_SIZE(hi3798cv200_phase_clks),
+				clk_data);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = hisi_clk_register_fixed_rate(hi3798cv200_fixed_rate_clks,
 				     ARRAY_SIZE(hi3798cv200_fixed_rate_clks),
 				     clk_data);
-- 
1.9.1
