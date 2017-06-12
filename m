Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] clk: gcc-msm8996: Add missing lpass smmu clks
Date: Mon, 12 Jun 2017 10:41:37 +0100
Message-Id: <20170612094137.6821-1-srinivas.kandagatla@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patch adds missing LPASS smmu clks which are required by the audio driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c               | 26 ++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8996.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 56e0a295c74e..6290ce551505 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -2644,6 +2644,30 @@ static struct clk_fixed_factor ufs_rx_cfg_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_hlos1_vote_lpass_core_smmu_clk = {
+	.halt_reg = 0x7d010,
+	.clkr = {
+		.enable_reg = 0x7d010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "hlos1_vote_lpass_core_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_hlos1_vote_lpass_adsp_smmu_clk = {
+	.halt_reg = 0x7d014,
+	.clkr = {
+		.enable_reg = 0x7d014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "hlos1_vote_lpass_adsp_smmu_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_rx_cfg_clk = {
 	.halt_reg = 0x75014,
 	.clkr = {
@@ -3217,6 +3241,8 @@ static struct clk_regmap *gcc_msm8996_clocks[] = {
 	[GCC_UFS_AHB_CLK] = &gcc_ufs_ahb_clk.clkr,
 	[GCC_UFS_TX_CFG_CLK] = &gcc_ufs_tx_cfg_clk.clkr,
 	[GCC_UFS_RX_CFG_CLK] = &gcc_ufs_rx_cfg_clk.clkr,
+	[GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK] = &gcc_hlos1_vote_lpass_core_smmu_clk.clkr,
+	[GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK] = &gcc_hlos1_vote_lpass_adsp_smmu_clk.clkr,
 	[GCC_UFS_TX_SYMBOL_0_CLK] = &gcc_ufs_tx_symbol_0_clk.clkr,
 	[GCC_UFS_RX_SYMBOL_0_CLK] = &gcc_ufs_rx_symbol_0_clk.clkr,
 	[GCC_UFS_RX_SYMBOL_1_CLK] = &gcc_ufs_rx_symbol_1_clk.clkr,
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8996.h b/include/dt-bindings/clock/qcom,gcc-msm8996.h
index 1847e130f5a0..4df1898d71b2 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8996.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8996.h
@@ -229,6 +229,8 @@
 #define GCC_PCIE_CLKREF_CLK					216
 #define GCC_RX2_USB2_CLKREF_CLK					217
 #define GCC_RX1_USB2_CLKREF_CLK					218
+#define GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK			219
+#define GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK			220
 
 #define GCC_SYSTEM_NOC_BCR					0
 #define GCC_CONFIG_NOC_BCR					1
-- 
2.11.0
