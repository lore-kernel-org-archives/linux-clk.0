Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 1/2] clk: qcom: gdsc: Add the missing BIMC gdsc for msm8996
Date: Tue, 16 Aug 2016 12:55:48 +0530
Message-Id: <1471332348-6522-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add BIMC gdsc data found in MMCC part of msm8996 family of devices.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/mmcc-msm8996.c               | 9 +++++++++
 include/dt-bindings/clock/qcom,mmcc-msm8996.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 847dd9d..1822045 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -2888,6 +2888,14 @@ static struct clk_hw *mmcc_msm8996_hws[] = {
 	&gpll0_div.hw,
 };
 
+static struct gdsc mmagic_bimc_gdsc = {
+	.gdscr = 0x529c,
+	.pd = {
+		.name = "mmagic_bimc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct gdsc mmagic_video_gdsc = {
 	.gdscr = 0x119c,
 	.gds_hw_ctrl = 0x120c,
@@ -3201,6 +3209,7 @@ static struct clk_regmap *mmcc_msm8996_clocks[] = {
 };
 
 static struct gdsc *mmcc_msm8996_gdscs[] = {
+	[MMAGIC_BIMC_GDSC] = &mmagic_bimc_gdsc,
 	[MMAGIC_VIDEO_GDSC] = &mmagic_video_gdsc,
 	[MMAGIC_MDSS_GDSC] = &mmagic_mdss_gdsc,
 	[MMAGIC_CAMSS_GDSC] = &mmagic_camss_gdsc,
diff --git a/include/dt-bindings/clock/qcom,mmcc-msm8996.h b/include/dt-bindings/clock/qcom,mmcc-msm8996.h
index 7d3a7fa..5abc445 100644
--- a/include/dt-bindings/clock/qcom,mmcc-msm8996.h
+++ b/include/dt-bindings/clock/qcom,mmcc-msm8996.h
@@ -298,5 +298,6 @@
 #define FD_GDSC			12
 #define MDSS_GDSC		13
 #define GPU_GX_GDSC		14
+#define MMAGIC_BIMC_GDSC	15
 
 #endif
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
