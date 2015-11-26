Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 3/6] clk: qcom: gdsc: Add GDSCs in msm8996 GCC
Date: Thu, 26 Nov 2015 11:24:54 +0530
Message-Id: <1448517297-32419-4-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
References: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add all data for the GDSCs which are part of msm8996 GCC block

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi        |  1 +
 drivers/clk/qcom/gcc-msm8996.c               | 88 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8996.h | 11 ++++
 3 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2c2736d..31e7bd9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -147,6 +147,7 @@
 			compatible = "qcom,gcc-msm8996";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#power-domain-cells = <1>;
 			reg = <0x300000 0x90000>;
 		};
 
diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 16d7c32..c5bce5f 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -30,6 +30,7 @@
 #include "clk-rcg.h"
 #include "clk-branch.h"
 #include "reset.h"
+#include "gdsc.h"
 
 #define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
 
@@ -3059,6 +3060,79 @@ static struct clk_hw *gcc_msm8996_hws[] = {
 	&ufs_ice_core_postdiv_clk_src.hw,
 };
 
+static struct gdsc aggre0_noc_gdsc = {
+	.gdscr = 0x81004,
+	.gds_hw_ctrl = 0x81028,
+	.pd = {
+		.name = "aggre0_noc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc hlos1_vote_aggre0_noc_gdsc = {
+	.gdscr = 0x7d024,
+	.pd = {
+		.name = "hlos1_vote_aggre0_noc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc hlos1_vote_lpass_adsp_gdsc = {
+	.gdscr = 0x7d034,
+	.pd = {
+		.name = "hlos1_vote_lpass_adsp",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc hlos1_vote_lpass_core_gdsc = {
+	.gdscr = 0x7d038,
+	.pd = {
+		.name = "hlos1_vote_lpass_core",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc usb30_gdsc = {
+	.gdscr = 0xf004,
+	.pd = {
+		.name = "usb30",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc pcie0_gdsc = {
+	.gdscr = 0x6b004,
+	.pd = {
+		.name = "pcie0",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc pcie1_gdsc = {
+	.gdscr = 0x6d004,
+	.pd = {
+		.name = "pcie1",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc pcie2_gdsc = {
+	.gdscr = 0x6e004,
+	.pd = {
+		.name = "pcie2",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc ufs_gdsc = {
+	.gdscr = 0x75004,
+	.pd = {
+		.name = "ufs",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct clk_regmap *gcc_msm8996_clocks[] = {
 	[GPLL0_EARLY] = &gpll0_early.clkr,
 	[GPLL0] = &gpll0.clkr,
@@ -3245,6 +3319,18 @@ static struct clk_regmap *gcc_msm8996_clocks[] = {
 	[GCC_RX1_USB2_CLKREF_CLK] = &gcc_rx1_usb2_clkref_clk.clkr,
 };
 
+static struct gdsc *gcc_msm8996_gdscs[] = {
+	[AGGRE0_NOC_GDSC] = &aggre0_noc_gdsc,
+	[HLOS1_VOTE_AGGRE0_NOC_GDSC] = &hlos1_vote_aggre0_noc_gdsc,
+	[HLOS1_VOTE_LPASS_ADSP_GDSC] = &hlos1_vote_lpass_adsp_gdsc,
+	[HLOS1_VOTE_LPASS_CORE_GDSC] = &hlos1_vote_lpass_core_gdsc,
+	[USB30_GDSC] = &usb30_gdsc,
+	[PCIE0_GDSC] = &pcie0_gdsc,
+	[PCIE1_GDSC] = &pcie1_gdsc,
+	[PCIE2_GDSC] = &pcie2_gdsc,
+	[UFS_GDSC] = &ufs_gdsc,
+};
+
 static const struct qcom_reset_map gcc_msm8996_resets[] = {
 	[GCC_SYSTEM_NOC_BCR] = { 0x4000 },
 	[GCC_CONFIG_NOC_BCR] = { 0x5000 },
@@ -3363,6 +3449,8 @@ static const struct qcom_cc_desc gcc_msm8996_desc = {
 	.num_clks = ARRAY_SIZE(gcc_msm8996_clocks),
 	.resets = gcc_msm8996_resets,
 	.num_resets = ARRAY_SIZE(gcc_msm8996_resets),
+	.gdscs = gcc_msm8996_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_msm8996_gdscs),
 };
 
 static const struct of_device_id gcc_msm8996_match_table[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8996.h b/include/dt-bindings/clock/qcom,gcc-msm8996.h
index 888e75c..6f814db 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8996.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8996.h
@@ -336,4 +336,15 @@
 #define GCC_MSS_Q6_BCR						99
 #define GCC_QREFS_VBG_CAL_BCR					100
 
+/* Indexes for GDSCs */
+#define AGGRE0_NOC_GDSC			0
+#define HLOS1_VOTE_AGGRE0_NOC_GDSC	1
+#define HLOS1_VOTE_LPASS_ADSP_GDSC	2
+#define HLOS1_VOTE_LPASS_CORE_GDSC	3
+#define USB30_GDSC			4
+#define PCIE0_GDSC			5
+#define PCIE1_GDSC			6
+#define PCIE2_GDSC			7
+#define UFS_GDSC			8
+
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
