Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	georgi.djakov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] clk:gcc-msm8916: add missing mss_q6_bimc_axi clock
Date: Sat, 12 Dec 2015 15:39:09 +0000
Message-Id: <1449934749-26223-1-git-send-email-srinivas.kandagatla@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This clock is required for loading the qdsp firmware.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c               | 18 ++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8916.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index e3bf09d..1ec5a27 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -2590,6 +2590,23 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
+	.halt_reg = 0x49004,
+	.clkr = {
+		.enable_reg = 0x49004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_q6_bimc_axi_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_bfdcd_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_oxili_ahb_clk = {
 	.halt_reg = 0x59028,
 	.clkr = {
@@ -3227,6 +3244,7 @@ static struct clk_regmap *gcc_msm8916_clocks[] = {
 	[GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK] = &gcc_ultaudio_lpaif_sec_i2s_clk.clkr,
 	[GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK] = &gcc_ultaudio_lpaif_aux_i2s_clk.clkr,
 	[GCC_CODEC_DIGCODEC_CLK] = &gcc_codec_digcodec_clk.clkr,
+	[GCC_MSS_Q6_BIMC_AXI_CLK] = &gcc_mss_q6_bimc_axi_clk.clkr,
 };
 
 static struct gdsc *gcc_msm8916_gdscs[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8916.h b/include/dt-bindings/clock/qcom,gcc-msm8916.h
index 257e2fb..28a27a4 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8916.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8916.h
@@ -174,6 +174,7 @@
 #define GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK		157
 #define GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK		158
 #define GCC_CODEC_DIGCODEC_CLK			159
+#define GCC_MSS_Q6_BIMC_AXI_CLK			160
 
 /* Indexes for GDSCs */
 #define BIMC_GDSC				0
-- 
1.9.1
