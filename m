Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/5] clk: qcom: Add MSM8916 iommu clocks
Date: Fri,  5 Jun 2015 15:40:33 +0300
Message-Id: <1433508036-28644-3-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1433508036-28644-1-git-send-email-georgi.djakov@linaro.org>
References: <1433508036-28644-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add support for the msm8916 TCU clocks that are needed for IOMMU.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c               |   48 ++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8916.h |    3 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index c66f7bc2ae87..d493e9f3a2eb 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -2358,6 +2358,51 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 	},
 };
 
+static struct clk_rcg2 bimc_ddr_clk_src = {
+	.cmd_rcgr = 0x32004,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_bimc_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "bimc_ddr_clk_src",
+		.parent_names = gcc_xo_gpll0_bimc,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ro_ops,
+		.flags = CLK_GET_RATE_NOCACHE,
+	},
+};
+
+static struct clk_branch gcc_apss_tcu_clk = {
+	.halt_reg = 0x12018,
+	.clkr = {
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_apss_tcu_clk",
+			.parent_names = (const char *[]){
+				"bimc_ddr_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_gfx_tcu_clk = {
+	.halt_reg = 0x12020,
+	.clkr = {
+		.enable_reg = 0x4500c,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_gfx_tcu_clk",
+			.parent_names = (const char *[]){
+				"bimc_ddr_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_gtcu_ahb_clk = {
 	.halt_reg = 0x12044,
 	.clkr = {
@@ -2701,6 +2746,9 @@ static struct clk_regmap *gcc_msm8916_clocks[] = {
 	[GCC_VENUS0_AHB_CLK] = &gcc_venus0_ahb_clk.clkr,
 	[GCC_VENUS0_AXI_CLK] = &gcc_venus0_axi_clk.clkr,
 	[GCC_VENUS0_VCODEC0_CLK] = &gcc_venus0_vcodec0_clk.clkr,
+	[BIMC_DDR_CLK_SRC] = &bimc_ddr_clk_src.clkr,
+	[GCC_APSS_TCU_CLK] = &gcc_apss_tcu_clk.clkr,
+	[GCC_GFX_TCU_CLK] = &gcc_gfx_tcu_clk.clkr,
 };
 
 static const struct qcom_reset_map gcc_msm8916_resets[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8916.h b/include/dt-bindings/clock/qcom,gcc-msm8916.h
index e430f644dd6c..53b39293d759 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8916.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8916.h
@@ -152,5 +152,8 @@
 #define GCC_VENUS0_AHB_CLK			135
 #define GCC_VENUS0_AXI_CLK			136
 #define GCC_VENUS0_VCODEC0_CLK			137
+#define BIMC_DDR_CLK_SRC			138
+#define GCC_APSS_TCU_CLK			139
+#define GCC_GFX_TCU_CLK				140
 
 #endif
