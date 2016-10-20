Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robdclark@gmail.com,
	jcrouse@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 2/2] clk: qcom: mmcc-8996: Add gpu gdscs
Date: Thu, 20 Oct 2016 15:08:07 +0530
Message-Id: <1476956287-13749-3-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1476956287-13749-1-git-send-email-rnayak@codeaurora.org>
References: <1476956287-13749-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add gpu gdsc data for msm8996

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/mmcc-msm8996.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index ca97e11..f77206f 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -3034,6 +3034,28 @@ enum {
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
+static struct gdsc gpu_gdsc = {
+	.gdscr = 0x4034,
+	.gds_hw_ctrl = 0x4038,
+	.pd = {
+		.name = "gpu",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc gpu_gx_gdsc = {
+	.gdscr = 0x4024,
+	.clamp_io_ctrl = 0x4300,
+	.cxcs = (unsigned int []){ 0x4028 },
+	.cxc_count = 1,
+	.pd = {
+		.name = "gpu_gx",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = CLAMP_IO,
+};
+
 static struct clk_regmap *mmcc_msm8996_clocks[] = {
 	[MMPLL0_EARLY] = &mmpll0_early.clkr,
 	[MMPLL0_PLL] = &mmpll0.clkr,
@@ -3223,6 +3245,8 @@ enum {
 	[CPP_GDSC] = &cpp_gdsc,
 	[FD_GDSC] = &fd_gdsc,
 	[MDSS_GDSC] = &mdss_gdsc,
+	[GPU_GDSC] = &gpu_gdsc,
+	[GPU_GX_GDSC] = &gpu_gx_gdsc,
 };
 
 static const struct qcom_reset_map mmcc_msm8996_resets[] = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
