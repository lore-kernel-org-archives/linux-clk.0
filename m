Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: Sort Makefile alphabetically
Date: Mon, 15 Aug 2016 16:11:02 -0700
Message-Id: <20160815231102.17638-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

We've started getting out of order, fix it.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 15ab44e1b0ed..1fb1f5476cb0 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -12,19 +12,20 @@ clk-qcom-y += clk-regmap-mux.o
 clk-qcom-y += reset.o
 clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 
+# Keep alphabetically sorted by config
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
 obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
 obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
 obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
+obj-$(CONFIG_MDM_GCC_9615) += gcc-mdm9615.o
+obj-$(CONFIG_MDM_LCC_9615) += lcc-mdm9615.o
 obj-$(CONFIG_MSM_GCC_8660) += gcc-msm8660.o
 obj-$(CONFIG_MSM_GCC_8916) += gcc-msm8916.o
 obj-$(CONFIG_MSM_GCC_8960) += gcc-msm8960.o
-obj-$(CONFIG_MSM_LCC_8960) += lcc-msm8960.o
 obj-$(CONFIG_MSM_GCC_8974) += gcc-msm8974.o
 obj-$(CONFIG_MSM_GCC_8996) += gcc-msm8996.o
+obj-$(CONFIG_MSM_LCC_8960) += lcc-msm8960.o
 obj-$(CONFIG_MSM_MMCC_8960) += mmcc-msm8960.o
 obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
 obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
-obj-$(CONFIG_MDM_GCC_9615) += gcc-mdm9615.o
-obj-$(CONFIG_MDM_LCC_9615) += lcc-mdm9615.o
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
