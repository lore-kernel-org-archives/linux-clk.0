Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 7/7] clk: qcom: Add some missing gcc clks for msm8996
Date: Wed, 19 Oct 2016 16:58:43 +0530
Message-Id: <1476876523-27378-8-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
References: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add a few missing gcc clks for msm8996

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/gcc-msm8996.c               | 203 +++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8996.h |  12 ++
 2 files changed, 215 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 2c01b62..43333e9 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -260,6 +260,36 @@ enum {
 	},
 };
 
+static struct clk_branch gcc_mmss_gpll0_div_clk = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mmss_gpll0_div_clk",
+			.parent_names = (const char *[]){ "gpll0" },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_gpll0_div_clk = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_gpll0_div_clk",
+			.parent_names = (const char *[]){ "gpll0" },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops
+		},
+	},
+};
+
 static struct clk_alpha_pll gpll4_early = {
 	.offset = 0x77000,
 	.clkr = {
@@ -2866,6 +2896,36 @@ enum {
 	},
 };
 
+static struct clk_branch hlos1_vote_lpass_core_smmu_clk = {
+	.halt_reg = 0x7d010,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x7d010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "hlos1_vote_lpass_core_smmu_clk",
+			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch hlos1_vote_lpass_adsp_smmu_clk = {
+	.halt_reg = 0x7d014,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x7d014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "hlos1_vote_lpass_adsp_smmu_clk",
+			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_aggre0_snoc_axi_clk = {
 	.halt_reg = 0x81008,
 	.clkr = {
@@ -2928,6 +2988,35 @@ enum {
 	},
 };
 
+static struct clk_branch gcc_aggre0_noc_qosgen_extref_clk = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.udelay = 500,
+	.clkr = {
+		.enable_reg = 0x8101c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_aggre0_noc_qosgen_extref_clk",
+			.parent_names = (const char *[]){ "xo" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_aggre1_pnoc_ahb_clk = {
+	.halt_reg = 0x82014,
+	.clkr = {
+		.enable_reg = 0x82014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_aggre1_pnoc_ahb_clk",
+			.parent_names = (const char *[]){ "periph_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_aggre2_ufs_axi_clk = {
 	.halt_reg = 0x83014,
 	.clkr = {
@@ -2958,6 +3047,34 @@ enum {
 	},
 };
 
+static struct clk_branch gcc_dcc_ahb_clk = {
+	.halt_reg = 0x84004,
+	.clkr = {
+		.enable_reg = 0x84004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_dcc_ahb_clk",
+			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_aggre0_noc_mpu_cfg_ahb_clk = {
+	.halt_reg = 0x85000,
+	.clkr = {
+		.enable_reg = 0x85000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_aggre0_noc_mpu_cfg_ahb_clk",
+			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_qspi_ahb_clk = {
 	.halt_reg = 0x8b004,
 	.clkr = {
@@ -3016,6 +3133,20 @@ enum {
 	},
 };
 
+static struct clk_branch gcc_edp_clkref_clk = {
+	.halt_reg = 0x88004,
+	.clkr = {
+		.enable_reg = 0x88004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_edp_clkref_clk",
+			.parent_names = (const char *[]){ "xo" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_clkref_clk = {
 	.halt_reg = 0x88008,
 	.clkr = {
@@ -3072,6 +3203,62 @@ enum {
 	},
 };
 
+static struct clk_branch gcc_mss_cfg_ahb_clk = {
+	.halt_reg = 0x8a000,
+	.clkr = {
+		.enable_reg = 0x8a000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_cfg_ahb_clk",
+			.parent_names = (const char *[]){ "config_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_mnoc_bimc_axi_clk = {
+	.halt_reg = 0x8a004,
+	.clkr = {
+		.enable_reg = 0x8a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_mnoc_bimc_axi_clk",
+			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_snoc_axi_clk = {
+	.halt_reg = 0x8a024,
+	.clkr = {
+		.enable_reg = 0x8a024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_snoc_axi_clk",
+			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
+	.halt_reg = 0x8a028,
+	.clkr = {
+		.enable_reg = 0x8a028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_q6_bimc_axi_clk",
+			.parent_names = (const char *[]){ "system_noc_clk_src" },
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_hw *gcc_msm8996_hws[] = {
 	&xo.hw,
 	&gpll0_early_div.hw,
@@ -3330,6 +3517,7 @@ enum {
 	[GCC_AGGRE0_CNOC_AHB_CLK] = &gcc_aggre0_cnoc_ahb_clk.clkr,
 	[GCC_SMMU_AGGRE0_AXI_CLK] = &gcc_smmu_aggre0_axi_clk.clkr,
 	[GCC_SMMU_AGGRE0_AHB_CLK] = &gcc_smmu_aggre0_ahb_clk.clkr,
+	[GCC_AGGRE1_PNOC_AHB_CLK] = &gcc_aggre1_pnoc_ahb_clk.clkr,
 	[GCC_AGGRE2_UFS_AXI_CLK] = &gcc_aggre2_ufs_axi_clk.clkr,
 	[GCC_AGGRE2_USB3_AXI_CLK] = &gcc_aggre2_usb3_axi_clk.clkr,
 	[GCC_QSPI_AHB_CLK] = &gcc_qspi_ahb_clk.clkr,
@@ -3340,6 +3528,21 @@ enum {
 	[GCC_PCIE_CLKREF_CLK] = &gcc_pcie_clkref_clk.clkr,
 	[GCC_RX2_USB2_CLKREF_CLK] = &gcc_rx2_usb2_clkref_clk.clkr,
 	[GCC_RX1_USB2_CLKREF_CLK] = &gcc_rx1_usb2_clkref_clk.clkr,
+	[GCC_AGGRE0_NOC_QOSGEN_EXTREF_CLK] =
+					&gcc_aggre0_noc_qosgen_extref_clk.clkr,
+	[GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK] =
+					&hlos1_vote_lpass_core_smmu_clk.clkr,
+	[GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK] =
+					&hlos1_vote_lpass_adsp_smmu_clk.clkr,
+	[GCC_EDP_CLKREF_CLK] = &gcc_edp_clkref_clk.clkr,
+	[GCC_MSS_CFG_AHB_CLK] = &gcc_mss_cfg_ahb_clk.clkr,
+	[GCC_MSS_Q6_BIMC_AXI_CLK] = &gcc_mss_q6_bimc_axi_clk.clkr,
+	[GCC_MSS_SNOC_AXI_CLK] = &gcc_mss_snoc_axi_clk.clkr,
+	[GCC_MSS_MNOC_BIMC_AXI_CLK] = &gcc_mss_mnoc_bimc_axi_clk.clkr,
+	[GCC_DCC_AHB_CLK] = &gcc_dcc_ahb_clk.clkr,
+	[GCC_AGGRE0_NOC_MPU_CFG_AHB_CLK] = &gcc_aggre0_noc_mpu_cfg_ahb_clk.clkr,
+	[GCC_MMSS_GPLL0_DIV_CLK] = &gcc_mmss_gpll0_div_clk.clkr,
+	[GCC_MSS_GPLL0_DIV_CLK] = &gcc_mss_gpll0_div_clk.clkr,
 };
 
 static struct gdsc *gcc_msm8996_gdscs[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8996.h b/include/dt-bindings/clock/qcom,gcc-msm8996.h
index 1828723..4673094 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8996.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8996.h
@@ -233,6 +233,18 @@
 #define GCC_PCIE_CLKREF_CLK					216
 #define GCC_RX2_USB2_CLKREF_CLK					217
 #define GCC_RX1_USB2_CLKREF_CLK					218
+#define GCC_AGGRE0_NOC_QOSGEN_EXTREF_CLK			219
+#define GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK			220
+#define GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK			221
+#define GCC_EDP_CLKREF_CLK					222
+#define GCC_MSS_CFG_AHB_CLK					223
+#define GCC_MSS_Q6_BIMC_AXI_CLK					224
+#define GCC_MSS_SNOC_AXI_CLK					225
+#define GCC_MSS_MNOC_BIMC_AXI_CLK				226
+#define GCC_DCC_AHB_CLK						227
+#define GCC_AGGRE0_NOC_MPU_CFG_AHB_CLK				228
+#define GCC_MMSS_GPLL0_DIV_CLK					229
+#define GCC_MSS_GPLL0_DIV_CLK					230
 
 #define GCC_SYSTEM_NOC_BCR					0
 #define GCC_CONFIG_NOC_BCR					1
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
