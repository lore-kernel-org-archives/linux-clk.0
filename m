Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] clk: qcom: Add MSM8916 gpu clocks
Date: Tue, 12 May 2015 14:00:37 +0300
Message-Id: <1431428438-8171-2-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1431428438-8171-1-git-send-email-georgi.djakov@linaro.org>
References: <1431428438-8171-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add support for the msm8916 bimc clocks that are needed for GPU.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c               |   58 ++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8916.h |    3 ++
 2 files changed, 61 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 7ad4c3751f43..0e2db91a1dfa 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -1094,6 +1094,27 @@ static struct clk_rcg2 apss_tcu_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_gcc_bimc_gpu_clk[] = {
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(266500000, P_BIMC, 4, 0, 0),
+	F(533000000, P_BIMC, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 bimc_gpu_clk_src = {
+	.cmd_rcgr = 0x31028,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_bimc_map,
+	.freq_tbl = ftbl_gcc_bimc_gpu_clk,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "bimc_gpu_clk_src",
+		.parent_names = gcc_xo_gpll0_bimc,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
 	F(80000000, P_GPLL0, 10, 0, 0),
 	{ }
@@ -2449,6 +2470,40 @@ static struct clk_branch gcc_gtcu_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_bimc_gfx_clk = {
+	.halt_reg = 0x31024,
+	.clkr = {
+		.enable_reg = 0x31024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_bimc_gfx_clk",
+			.parent_names = (const char *[]){
+				"bimc_gpu_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_bimc_gpu_clk = {
+	.halt_reg = 0x31040,
+	.clkr = {
+		.enable_reg = 0x31040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_bimc_gpu_clk",
+			.parent_names = (const char *[]){
+				"bimc_gpu_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_jpeg_tbu_clk = {
 	.halt_reg = 0x12034,
 	.clkr = {
@@ -2779,6 +2834,9 @@ static struct clk_regmap *gcc_msm8916_clocks[] = {
 	[GCC_BIMC_CLK] = &gcc_bimc_clk.clkr,
 	[GCC_APSS_TCU_CLK] = &gcc_apss_tcu_clk.clkr,
 	[GCC_GFX_TCU_CLK] = &gcc_gfx_tcu_clk.clkr,
+	[BIMC_GPU_CLK_SRC] = &bimc_gpu_clk_src.clkr,
+	[GCC_BIMC_GFX_CLK] = &gcc_bimc_gfx_clk.clkr,
+	[GCC_BIMC_GPU_CLK] = &gcc_bimc_gpu_clk.clkr,
 };
 
 static const struct qcom_reset_map gcc_msm8916_resets[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8916.h b/include/dt-bindings/clock/qcom,gcc-msm8916.h
index 0af3b49431df..1bac3dcc4f84 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8916.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8916.h
@@ -156,5 +156,8 @@
 #define GCC_BIMC_CLK				139
 #define GCC_APSS_TCU_CLK			140
 #define GCC_GFX_TCU_CLK				141
+#define BIMC_GPU_CLK_SRC			142
+#define GCC_BIMC_GFX_CLK			143
+#define GCC_BIMC_GPU_CLK			144
 
 #endif
