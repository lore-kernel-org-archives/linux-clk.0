Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga04-in.huawei.com ([45.249.212.190]:8494 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752607AbdJRC5d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2017 22:57:33 -0400
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <hermit.wangheming@hisilicon.com>, <shawn.guo@linaro.org>,
        <project-aspen-dev@linaro.org>,
        tianshuliang <tianshuliang@hisilicon.com>,
        Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH 2/3] clk: hisilicon: add emmc sample and drive clock for hi3798cv200 SoC
Date: Wed, 18 Oct 2017 07:00:28 -0400
Message-ID: <1508324429-6012-3-git-send-email-xuejiancheng@hisilicon.com>
In-Reply-To: <1508324429-6012-1-git-send-email-xuejiancheng@hisilicon.com>
References: <1508324429-6012-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: tianshuliang <tianshuliang@hisilicon.com>

Add emmc sample and emmc drive clock for Hi3798cv200 SoC

Signed-off-by: tianshuliang <tianshuliang@hisilicon.com>
Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
---
 drivers/clk/hisilicon/crg-hi3798cv200.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/crg-hi3798cv200.c b/drivers/clk/hisilicon/crg-hi3798cv200.c
index ed8bb5f..25d750c 100644
--- a/drivers/clk/hisilicon/crg-hi3798cv200.c
+++ b/drivers/clk/hisilicon/crg-hi3798cv200.c
@@ -83,6 +83,18 @@ static struct hisi_mux_clock hi3798cv200_mux_clks[] = {
 		CLK_SET_RATE_PARENT, 0x188, 10, 2, 0, comphy1_mux_table, },
 };
 
+static u32 mmc_phase_reg[] = {0, 1, 2, 3, 4, 5, 6, 7};
+static u32 mmc_phase_val[] = {0, 45, 90, 135, 180, 225, 270, 315};
+
+static struct hisi_phase_clock hi3798cv200_phase_clks[] = {
+	{ HISTB_MMC_SAMPLE_CLK, "mmc_sample", "clk_mmc_ciu",
+	CLK_SET_RATE_PARENT, 0xa0, 12, 3, mmc_phase_val,
+	mmc_phase_reg, ARRAY_SIZE(mmc_phase_reg)},
+	{ HISTB_MMC_DRV_CLK, "mmc_drive", "clk_mmc_ciu",
+	CLK_SET_RATE_PARENT, 0xa0, 16, 3, mmc_phase_val,
+	mmc_phase_reg, ARRAY_SIZE(mmc_phase_reg)},
+};
+
 static const struct hisi_gate_clock hi3798cv200_gate_clks[] = {
 	/* UART */
 	{ HISTB_UART2_CLK, "clk_uart2", "75m",
@@ -179,11 +191,18 @@ static struct hisi_clock_data *hi3798cv200_clk_register(
 	if (ret)
 		goto unregister_fixed_rate;
 
+	ret = hisi_clk_register_phase(&pdev->dev,
+				hi3798cv200_phase_clks,
+				ARRAY_SIZE(hi3798cv200_phase_clks),
+				clk_data);
+	if (ret)
+		goto unregister_mux;
+
 	ret = hisi_clk_register_gate(hi3798cv200_gate_clks,
 				ARRAY_SIZE(hi3798cv200_gate_clks),
 				clk_data);
 	if (ret)
-		goto unregister_mux;
+		goto unregister_phase;
 
 	ret = of_clk_add_provider(pdev->dev.of_node,
 			of_clk_src_onecell_get, &clk_data->clk_data);
@@ -201,6 +220,10 @@ static struct hisi_clock_data *hi3798cv200_clk_register(
 	hisi_clk_unregister_mux(hi3798cv200_mux_clks,
 				ARRAY_SIZE(hi3798cv200_mux_clks),
 				clk_data);
+unregister_phase:
+	hisi_clk_unregister_phase(hi3798cv200_phase_clks,
+				ARRAY_SIZE(hi3798cv200_phase_clks),
+				clk_data);
 unregister_gate:
 	hisi_clk_unregister_gate(hi3798cv200_gate_clks,
 				ARRAY_SIZE(hi3798cv200_gate_clks),
-- 
2.7.4

