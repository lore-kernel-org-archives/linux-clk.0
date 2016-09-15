Return-Path: <vivek.gautam@codeaurora.org>
From: vivek.gautam@codeaurora.org
To: sboyd@codeaurora.org
Cc: andy.gross@linaro.org,
	david.brown@linaro.org,
	mturquette@baylibre.com,
	srinivas.kandagatla@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH] clk: Add USB3 PHY reset lines
Date: Thu, 15 Sep 2016 10:15:33 +0530
Message-Id: <1473914733-4182-1-git-send-email-vivek.gautam@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

From: Vivek Gautam <vivek.gautam@codeaurora.org>

Adding missing reset lines for USB 3.0 PHY.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
---

 - Build tested on clk-next branch.
 - Tested with my wip branch for usbphy that is available @[1].

[1]https://github.com/vivekgautam1/linux/tree/linaro/integration-linux-qcomlt-usbphy-wip

 drivers/clk/qcom/gcc-msm8996.c               | 2 ++
 include/dt-bindings/clock/qcom,gcc-msm8996.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index ebe5d18..fe03e6f 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -3329,6 +3329,8 @@ static const struct qcom_reset_map gcc_msm8996_resets[] = {
 	[GCC_USB_20_BCR] = { 0x12000 },
 	[GCC_QUSB2PHY_PRIM_BCR] = { 0x12038 },
 	[GCC_QUSB2PHY_SEC_BCR] = { 0x1203c },
+	[GCC_USB3_PHY_BCR] = { 0x50020 },
+	[GCC_USB3PHY_PHY_BCR] = { 0x50024 },
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
 	[GCC_SDCC1_BCR] = { 0x13000 },
 	[GCC_SDCC2_BCR] = { 0x14000 },
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8996.h b/include/dt-bindings/clock/qcom,gcc-msm8996.h
index b7ea1e8..1828723 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8996.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8996.h
@@ -337,6 +337,8 @@
 #define GCC_QREFS_VBG_CAL_BCR					100
 #define GCC_PCIE_PHY_COM_BCR					101
 #define GCC_PCIE_PHY_COM_NOCSR_BCR				102
+#define GCC_USB3_PHY_BCR					103
+#define GCC_USB3PHY_PHY_BCR					104
 
 
 /* Indexes for GDSCs */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
