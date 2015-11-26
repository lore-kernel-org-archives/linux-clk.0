Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 4/6] clk: qcom: gdsc: Add mmcc gdscs for msm8996 family
Date: Thu, 26 Nov 2015 11:24:55 +0530
Message-Id: <1448517297-32419-5-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
References: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add all gdsc data which are part of mmcc on msm8996 family

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   1 +
 drivers/clk/qcom/mmcc-msm8996.c               | 154 ++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,mmcc-msm8996.h |  17 +++
 3 files changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 31e7bd9..0506fb8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -252,6 +252,7 @@
 			compatible = "qcom,mmcc-msm8996";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#power-domain-cells = <1>;
 			reg = <0x8c0000 0x40000>;
 			assigned-clocks = <&mmcc MMPLL9_PLL>,
 					  <&mmcc MMPLL1_PLL>,
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 064f3ea..236acf5 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -32,6 +32,7 @@
 #include "clk-rcg.h"
 #include "clk-branch.h"
 #include "reset.h"
+#include "gdsc.h"
 
 #define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
 
@@ -2917,6 +2918,141 @@ static struct clk_hw *mmcc_msm8996_hws[] = {
 	&gpll0_div.hw,
 };
 
+struct gdsc mmagic_video_gdsc = {
+	.gdscr = 0x119c,
+	.gds_hw_ctrl = 0x120c,
+	.pd = {
+		.name = "mmagic_video",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct gdsc mmagic_mdss_gdsc = {
+	.gdscr = 0x247c,
+	.gds_hw_ctrl = 0x2480,
+	.pd = {
+		.name = "mmagic_mdss",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct gdsc mmagic_camss_gdsc = {
+	.gdscr = 0x3c4c,
+	.gds_hw_ctrl = 0x3c50,
+	.pd = {
+		.name = "mmagic_camss",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct gdsc venus_gdsc = {
+	.gdscr = 0x1024,
+	.cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },
+	.cxc_count = 3,
+	.pd = {
+		.name = "venus",
+	},
+	.parent = &mmagic_video_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct gdsc venus_core0_gdsc = {
+	.gdscr = 0x1040,
+	.cxcs = (unsigned int []){ 0x1048 },
+	.cxc_count = 1,
+	.pd = {
+		.name = "venus_core0",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct gdsc venus_core1_gdsc = {
+	.gdscr = 0x1044,
+	.cxcs = (unsigned int []){ 0x104c },
+	.cxc_count = 1,
+	.pd = {
+		.name = "venus_core1",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct gdsc camss_gdsc = {
+	.gdscr = 0x34a0,
+	.cxcs = (unsigned int []){ 0x36bc, 0x36c4 },
+	.cxc_count = 2,
+	.pd = {
+		.name = "camss",
+	},
+	.parent = &mmagic_camss_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct gdsc vfe0_gdsc = {
+	.gdscr = 0x3664,
+	.cxcs = (unsigned int []){ 0x36a8 },
+	.cxc_count = 1,
+	.pd = {
+		.name = "vfe0",
+	},
+	.parent = &camss_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct gdsc vfe1_gdsc = {
+	.gdscr = 0x3674,
+	.cxcs = (unsigned int []){ 0x36ac },
+	.cxc_count = 1,
+	.pd = {
+		.name = "vfe0",
+	},
+	.parent = &camss_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct gdsc jpeg_gdsc = {
+	.gdscr = 0x35a4,
+	.cxcs = (unsigned int []){ 0x35a8, 0x35b0, 0x35c0, 0x35b8 },
+	.cxc_count = 4,
+	.pd = {
+		.name = "jpeg",
+	},
+	.parent = &camss_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct gdsc cpp_gdsc = {
+	.gdscr = 0x36d4,
+	.cxcs = (unsigned int []){ 0x36b0 },
+	.cxc_count = 1,
+	.pd = {
+		.name = "cpp",
+	},
+	.parent = &camss_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct gdsc fd_gdsc = {
+	.gdscr = 0x3b64,
+	.cxcs = (unsigned int []){ 0x3b68, 0x3b6c },
+	.cxc_count = 2,
+	.pd = {
+		.name = "fd",
+	},
+	.parent = &camss_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+struct gdsc mdss_gdsc = {
+	.gdscr = 0x2304,
+	.cxcs = (unsigned int []){ 0x2310, 0x231c },
+	.cxc_count = 2,
+	.pd = {
+		.name = "mdss",
+	},
+	.parent = &mmagic_mdss_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct clk_regmap *mmcc_msm8996_clocks[] = {
 	[MMPLL0_EARLY] = &mmpll0_early.clkr,
 	[MMPLL0_PLL] = &mmpll0.clkr,
@@ -3093,6 +3229,22 @@ static struct clk_regmap *mmcc_msm8996_clocks[] = {
 	[FD_AHB_CLK] = &fd_ahb_clk.clkr,
 };
 
+static struct gdsc *mmcc_msm8996_gdscs[] = {
+	[MMAGIC_VIDEO_GDSC] = &mmagic_video_gdsc,
+	[MMAGIC_MDSS_GDSC] = &mmagic_mdss_gdsc,
+	[MMAGIC_CAMSS_GDSC] = &mmagic_camss_gdsc,
+	[VENUS_GDSC] = &venus_gdsc,
+	[VENUS_CORE0_GDSC] = &venus_core0_gdsc,
+	[VENUS_CORE1_GDSC] = &venus_core1_gdsc,
+	[CAMSS_GDSC] = &camss_gdsc,
+	[VFE0_GDSC] = &vfe0_gdsc,
+	[VFE1_GDSC] = &vfe1_gdsc,
+	[JPEG_GDSC] = &jpeg_gdsc,
+	[CPP_GDSC] = &cpp_gdsc,
+	[FD_GDSC] = &fd_gdsc,
+	[MDSS_GDSC] = &mdss_gdsc,
+};
+
 static const struct qcom_reset_map mmcc_msm8996_resets[] = {
 	[MMAGICAHB_BCR] = { 0x5020 },
 	[MMAGIC_CFG_BCR] = { 0x5050 },
@@ -3170,6 +3322,8 @@ static const struct qcom_cc_desc mmcc_msm8996_desc = {
 	.num_clks = ARRAY_SIZE(mmcc_msm8996_clocks),
 	.resets = mmcc_msm8996_resets,
 	.num_resets = ARRAY_SIZE(mmcc_msm8996_resets),
+	.gdscs = mmcc_msm8996_gdscs,
+	.num_gdscs = ARRAY_SIZE(mmcc_msm8996_gdscs),
 };
 
 static const struct of_device_id mmcc_msm8996_match_table[] = {
diff --git a/include/dt-bindings/clock/qcom,mmcc-msm8996.h b/include/dt-bindings/clock/qcom,mmcc-msm8996.h
index 9b81ca6..7d3a7fa 100644
--- a/include/dt-bindings/clock/qcom,mmcc-msm8996.h
+++ b/include/dt-bindings/clock/qcom,mmcc-msm8996.h
@@ -282,4 +282,21 @@
 #define FD_BCR						58
 #define MMSS_SPDM_RM_BCR				59
 
+/* Indexes for GDSCs */
+#define MMAGIC_VIDEO_GDSC	0
+#define MMAGIC_MDSS_GDSC	1
+#define MMAGIC_CAMSS_GDSC	2
+#define GPU_GDSC		3
+#define VENUS_GDSC		4
+#define VENUS_CORE0_GDSC	5
+#define VENUS_CORE1_GDSC	6
+#define CAMSS_GDSC		7
+#define VFE0_GDSC		8
+#define VFE1_GDSC		9
+#define JPEG_GDSC		10
+#define CPP_GDSC		11
+#define FD_GDSC			12
+#define MDSS_GDSC		13
+#define GPU_GX_GDSC		14
+
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
