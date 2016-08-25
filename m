Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] clk: gcc-msm8996: add missing pcie phy reset lines
Date: Thu, 25 Aug 2016 12:20:47 +0100
Message-Id: <1472124047-22627-2-git-send-email-srinivas.kandagatla@linaro.org>
In-Reply-To: <1472124047-22627-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1472124047-22627-1-git-send-email-srinivas.kandagatla@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patch adds missing 2 PCIE common reset lines.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c               | 2 ++
 include/dt-bindings/clock/qcom,gcc-msm8996.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 456b2f4..993b0ed 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -3404,6 +3404,8 @@ static const struct qcom_reset_map gcc_msm8996_resets[] = {
 	[GCC_PCIE_2_BCR] = { 0x6e000 },
 	[GCC_PCIE_2_PHY_BCR] = { 0x6e038 },
 	[GCC_PCIE_PHY_BCR] = { 0x6f000 },
+	[GCC_PCIE_PHY_COM_BCR] = { 0x6f014 },
+	[GCC_PCIE_PHY_COM_NOCSR_BCR] = { 0x6f00c },
 	[GCC_DCD_BCR] = { 0x70000 },
 	[GCC_OBT_ODT_BCR] = { 0x73000 },
 	[GCC_UFS_BCR] = { 0x75000 },
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8996.h b/include/dt-bindings/clock/qcom,gcc-msm8996.h
index 6f814db..b7ea1e8 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8996.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8996.h
@@ -335,6 +335,9 @@
 #define GCC_MSMPU_BCR						98
 #define GCC_MSS_Q6_BCR						99
 #define GCC_QREFS_VBG_CAL_BCR					100
+#define GCC_PCIE_PHY_COM_BCR					101
+#define GCC_PCIE_PHY_COM_NOCSR_BCR				102
+
 
 /* Indexes for GDSCs */
 #define AGGRE0_NOC_GDSC			0
-- 
2.7.4
