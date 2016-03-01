Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49696 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751778AbcCATAe (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2016 14:00:34 -0500
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 12/41] clk: qcom: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 10:59:57 -0800
Message-Id: <1456858826-28541-13-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/common.c       |  1 -
 drivers/clk/qcom/gcc-ipq806x.c  | 37 ------------------------------------
 drivers/clk/qcom/gcc-msm8660.c  | 32 -------------------------------
 drivers/clk/qcom/gcc-msm8960.c  | 42 -----------------------------------------
 drivers/clk/qcom/gcc-msm8974.c  |  1 -
 drivers/clk/qcom/gcc-msm8996.c  |  6 ++----
 drivers/clk/qcom/mmcc-msm8960.c | 35 ----------------------------------
 7 files changed, 2 insertions(+), 152 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index cc8a06534362..f7c226ab4307 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -119,7 +119,6 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
 		fixed->hw.init = &init_data;
 
 		init_data.name = path;
-		init_data.flags = CLK_IS_ROOT;
 		init_data.ops = &clk_fixed_rate_ops;
 
 		clk = devm_clk_register(dev, &fixed->hw);
diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index dd5402bac620..52a7d3959875 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -890,7 +890,6 @@ static struct clk_branch gsbi1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -906,7 +905,6 @@ static struct clk_branch gsbi2_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -922,7 +920,6 @@ static struct clk_branch gsbi4_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -938,7 +935,6 @@ static struct clk_branch gsbi5_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -954,7 +950,6 @@ static struct clk_branch gsbi6_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -970,7 +965,6 @@ static struct clk_branch gsbi7_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1144,7 +1138,6 @@ static struct clk_branch pmem_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pmem_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1308,7 +1301,6 @@ static struct clk_branch sdc1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1324,7 +1316,6 @@ static struct clk_branch sdc3_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc3_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1394,7 +1385,6 @@ static struct clk_branch tsif_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "tsif_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1410,7 +1400,6 @@ static struct clk_branch dma_bam_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dma_bam_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1425,7 +1414,6 @@ static struct clk_branch adm0_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "adm0_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1442,7 +1430,6 @@ static struct clk_branch adm0_pbus_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "adm0_pbus_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1457,7 +1444,6 @@ static struct clk_branch pmic_arb0_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pmic_arb0_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1472,7 +1458,6 @@ static struct clk_branch pmic_arb1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pmic_arb1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1487,7 +1472,6 @@ static struct clk_branch pmic_ssbi2_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pmic_ssbi2_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1504,7 +1488,6 @@ static struct clk_branch rpm_msg_ram_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "rpm_msg_ram_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1563,7 +1546,6 @@ static struct clk_branch pcie_a_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie_a_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1577,7 +1559,6 @@ static struct clk_branch pcie_aux_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie_aux_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1591,7 +1572,6 @@ static struct clk_branch pcie_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1605,7 +1585,6 @@ static struct clk_branch pcie_phy_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie_phy_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1659,7 +1638,6 @@ static struct clk_branch pcie1_a_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie1_a_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1673,7 +1651,6 @@ static struct clk_branch pcie1_aux_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie1_aux_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1687,7 +1664,6 @@ static struct clk_branch pcie1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1701,7 +1677,6 @@ static struct clk_branch pcie1_phy_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie1_phy_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1755,7 +1730,6 @@ static struct clk_branch pcie2_a_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie2_a_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1769,7 +1743,6 @@ static struct clk_branch pcie2_aux_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie2_aux_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1783,7 +1756,6 @@ static struct clk_branch pcie2_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie2_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1797,7 +1769,6 @@ static struct clk_branch pcie2_phy_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie2_phy_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1887,7 +1858,6 @@ static struct clk_branch sata_a_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sata_a_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1901,7 +1871,6 @@ static struct clk_branch sata_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sata_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1915,7 +1884,6 @@ static struct clk_branch sfab_sata_s_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sfab_sata_s_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1929,7 +1897,6 @@ static struct clk_branch sata_phy_cfg_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sata_phy_cfg_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2139,7 +2106,6 @@ static struct clk_branch usb_hs1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2218,7 +2184,6 @@ static struct clk_branch usb_fs1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2234,7 +2199,6 @@ static struct clk_branch ebi2_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "ebi2_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2248,7 +2212,6 @@ static struct clk_branch ebi2_aon_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "ebi2_always_on_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm8660.c
index ad413036f7c7..6dc55864979c 100644
--- a/drivers/clk/qcom/gcc-msm8660.c
+++ b/drivers/clk/qcom/gcc-msm8660.c
@@ -1479,7 +1479,6 @@ static struct clk_branch pmem_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pmem_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2027,7 +2026,6 @@ static struct clk_branch gsbi1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2041,7 +2039,6 @@ static struct clk_branch gsbi2_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2055,7 +2052,6 @@ static struct clk_branch gsbi3_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2069,7 +2065,6 @@ static struct clk_branch gsbi4_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2083,7 +2078,6 @@ static struct clk_branch gsbi5_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2097,7 +2091,6 @@ static struct clk_branch gsbi6_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2111,7 +2104,6 @@ static struct clk_branch gsbi7_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2125,7 +2117,6 @@ static struct clk_branch gsbi8_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi8_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2139,7 +2130,6 @@ static struct clk_branch gsbi9_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi9_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2153,7 +2143,6 @@ static struct clk_branch gsbi10_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi10_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2167,7 +2156,6 @@ static struct clk_branch gsbi11_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi11_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2181,7 +2169,6 @@ static struct clk_branch gsbi12_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi12_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2195,7 +2182,6 @@ static struct clk_branch tsif_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "tsif_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2209,7 +2195,6 @@ static struct clk_branch usb_fs1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2223,7 +2208,6 @@ static struct clk_branch usb_fs2_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs2_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2237,7 +2221,6 @@ static struct clk_branch usb_hs1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2251,7 +2234,6 @@ static struct clk_branch sdc1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2265,7 +2247,6 @@ static struct clk_branch sdc2_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc2_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2279,7 +2260,6 @@ static struct clk_branch sdc3_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc3_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2293,7 +2273,6 @@ static struct clk_branch sdc4_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc4_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2307,7 +2286,6 @@ static struct clk_branch sdc5_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc5_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2322,7 +2300,6 @@ static struct clk_branch adm0_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "adm0_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2337,7 +2314,6 @@ static struct clk_branch adm0_pbus_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "adm0_pbus_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2352,7 +2328,6 @@ static struct clk_branch adm1_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "adm1_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2367,7 +2342,6 @@ static struct clk_branch adm1_pbus_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "adm1_pbus_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2382,7 +2356,6 @@ static struct clk_branch modem_ahb1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "modem_ahb1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2397,7 +2370,6 @@ static struct clk_branch modem_ahb2_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "modem_ahb2_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2412,7 +2384,6 @@ static struct clk_branch pmic_arb0_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pmic_arb0_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2427,7 +2398,6 @@ static struct clk_branch pmic_arb1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pmic_arb1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2442,7 +2412,6 @@ static struct clk_branch pmic_ssbi2_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pmic_ssbi2_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2459,7 +2428,6 @@ static struct clk_branch rpm_msg_ram_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "rpm_msg_ram_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 63ecd97f3793..90d9b7e2bb2c 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -1546,7 +1546,6 @@ static struct clk_branch pmem_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pmem_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2143,7 +2142,6 @@ static struct clk_branch usb_hsic_hsio_cal_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_hsio_cal_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2293,7 +2291,6 @@ static struct clk_branch ce1_core_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "ce1_core_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2307,7 +2304,6 @@ static struct clk_branch ce1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "ce1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2323,7 +2319,6 @@ static struct clk_branch dma_bam_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dma_bam_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2339,7 +2334,6 @@ static struct clk_branch gsbi1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2355,7 +2349,6 @@ static struct clk_branch gsbi2_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2371,7 +2364,6 @@ static struct clk_branch gsbi3_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2387,7 +2379,6 @@ static struct clk_branch gsbi4_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2403,7 +2394,6 @@ static struct clk_branch gsbi5_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2419,7 +2409,6 @@ static struct clk_branch gsbi6_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi6_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2435,7 +2424,6 @@ static struct clk_branch gsbi7_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi7_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2451,7 +2439,6 @@ static struct clk_branch gsbi8_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi8_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2467,7 +2454,6 @@ static struct clk_branch gsbi9_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi9_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2483,7 +2469,6 @@ static struct clk_branch gsbi10_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi10_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2499,7 +2484,6 @@ static struct clk_branch gsbi11_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi11_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2515,7 +2499,6 @@ static struct clk_branch gsbi12_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi12_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2531,7 +2514,6 @@ static struct clk_branch tsif_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "tsif_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2545,7 +2527,6 @@ static struct clk_branch usb_fs1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2559,7 +2540,6 @@ static struct clk_branch usb_fs2_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_fs2_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2575,7 +2555,6 @@ static struct clk_branch usb_hs1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2589,7 +2568,6 @@ static struct clk_branch usb_hs3_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs3_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2603,7 +2581,6 @@ static struct clk_branch usb_hs4_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs4_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2617,7 +2594,6 @@ static struct clk_branch usb_hsic_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2633,7 +2609,6 @@ static struct clk_branch sdc1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2649,7 +2624,6 @@ static struct clk_branch sdc2_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc2_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2665,7 +2639,6 @@ static struct clk_branch sdc3_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc3_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2681,7 +2654,6 @@ static struct clk_branch sdc4_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc4_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2697,7 +2669,6 @@ static struct clk_branch sdc5_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc5_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2712,7 +2683,6 @@ static struct clk_branch adm0_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "adm0_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2729,7 +2699,6 @@ static struct clk_branch adm0_pbus_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "adm0_pbus_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2883,7 +2852,6 @@ static struct clk_branch sata_a_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sata_a_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2897,7 +2865,6 @@ static struct clk_branch sata_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sata_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2911,7 +2878,6 @@ static struct clk_branch sfab_sata_s_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sfab_sata_s_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2925,7 +2891,6 @@ static struct clk_branch sata_phy_cfg_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "sata_phy_cfg_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2939,7 +2904,6 @@ static struct clk_branch pcie_phy_ref_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie_phy_ref_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2953,7 +2917,6 @@ static struct clk_branch pcie_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2967,7 +2930,6 @@ static struct clk_branch pcie_a_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcie_a_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2982,7 +2944,6 @@ static struct clk_branch pmic_arb0_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pmic_arb0_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2997,7 +2958,6 @@ static struct clk_branch pmic_arb1_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pmic_arb1_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -3012,7 +2972,6 @@ static struct clk_branch pmic_ssbi2_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pmic_ssbi2_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -3029,7 +2988,6 @@ static struct clk_branch rpm_msg_ram_h_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "rpm_msg_ram_h_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index 335952db309b..00915209e7c5 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -1965,7 +1965,6 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_q6_bimc_axi_clk",
-			.flags = CLK_IS_ROOT,
 			.ops = &clk_branch2_ops,
 		},
 	},
diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index bb8c61ff0176..c9b96f318d9c 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -1321,7 +1321,7 @@ static struct clk_branch gcc_mmss_bimc_gfx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mmss_bimc_gfx_clk",
-			.flags = CLK_SET_RATE_PARENT | CLK_IS_ROOT,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2315,7 +2315,7 @@ static struct clk_branch gcc_bimc_gfx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_bimc_gfx_clk",
-			.flags = CLK_SET_RATE_PARENT | CLK_IS_ROOT,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2815,7 +2815,6 @@ static struct clk_branch gcc_ufs_sys_clk_core_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_sys_clk_core_clk",
 			.ops = &clk_branch2_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2828,7 +2827,6 @@ static struct clk_branch gcc_ufs_tx_symbol_clk_core_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_tx_symbol_clk_core_clk",
 			.ops = &clk_branch2_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index 00e36192a1de..7f21421c87d6 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -1789,7 +1789,6 @@ static struct clk_branch gmem_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gmem_axi_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1805,7 +1804,6 @@ static struct clk_branch ijpeg_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "ijpeg_axi_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1821,7 +1819,6 @@ static struct clk_branch mmss_imem_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_imem_axi_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1835,7 +1832,6 @@ static struct clk_branch jpegd_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "jpegd_axi_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1851,7 +1847,6 @@ static struct clk_branch vcodec_axi_b_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vcodec_axi_b_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1867,7 +1862,6 @@ static struct clk_branch vcodec_axi_a_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vcodec_axi_a_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1883,7 +1877,6 @@ static struct clk_branch vcodec_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vcodec_axi_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1897,7 +1890,6 @@ static struct clk_branch vfe_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vfe_axi_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1913,7 +1905,6 @@ static struct clk_branch mdp_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "mdp_axi_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1929,7 +1920,6 @@ static struct clk_branch rot_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "rot_axi_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1945,7 +1935,6 @@ static struct clk_branch vcap_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vcap_axi_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1961,7 +1950,6 @@ static struct clk_branch vpe_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vpe_axi_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1977,7 +1965,6 @@ static struct clk_branch gfx3d_axi_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx3d_axi_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -1991,7 +1978,6 @@ static struct clk_branch amp_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "amp_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2005,7 +1991,6 @@ static struct clk_branch csi_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "csi_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT
 		},
 	},
 };
@@ -2019,7 +2004,6 @@ static struct clk_branch dsi_m_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi_m_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2035,7 +2019,6 @@ static struct clk_branch dsi_s_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi_s_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2049,7 +2032,6 @@ static struct clk_branch dsi2_m_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_m_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT
 		},
 	},
 };
@@ -2065,7 +2047,6 @@ static struct clk_branch dsi2_s_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "dsi2_s_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2425,7 +2406,6 @@ static struct clk_branch gfx2d0_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx2d0_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2441,7 +2421,6 @@ static struct clk_branch gfx2d1_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx2d1_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2457,7 +2436,6 @@ static struct clk_branch gfx3d_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gfx3d_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2473,7 +2451,6 @@ static struct clk_branch hdmi_m_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "hdmi_m_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2489,7 +2466,6 @@ static struct clk_branch hdmi_s_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "hdmi_s_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2503,7 +2479,6 @@ static struct clk_branch ijpeg_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "ijpeg_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT
 		},
 	},
 };
@@ -2519,7 +2494,6 @@ static struct clk_branch mmss_imem_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_imem_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT
 		},
 	},
 };
@@ -2533,7 +2507,6 @@ static struct clk_branch jpegd_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "jpegd_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2547,7 +2520,6 @@ static struct clk_branch mdp_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "mdp_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2561,7 +2533,6 @@ static struct clk_branch rot_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "rot_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT
 		},
 	},
 };
@@ -2577,7 +2548,6 @@ static struct clk_branch smmu_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2591,7 +2561,6 @@ static struct clk_branch tv_enc_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "tv_enc_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2605,7 +2574,6 @@ static struct clk_branch vcap_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vcap_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2621,7 +2589,6 @@ static struct clk_branch vcodec_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vcodec_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2635,7 +2602,6 @@ static struct clk_branch vfe_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vfe_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
@@ -2649,7 +2615,6 @@ static struct clk_branch vpe_ahb_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "vpe_ahb_clk",
 			.ops = &clk_branch_ops,
-			.flags = CLK_IS_ROOT,
 		},
 	},
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

