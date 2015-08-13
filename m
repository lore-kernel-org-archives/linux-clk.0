Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v3 4/4] clk: qcom: Add MSM8916 audio clocks
Date: Thu, 13 Aug 2015 17:48:37 +0300
Message-Id: <1439477317-1902-5-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1439477317-1902-1-git-send-email-georgi.djakov@linaro.org>
References: <1439477317-1902-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add support for the msm8916 audio clocks. This includes core bus,
low-power audio and codec clocks. They are required for audio playback.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c               |  388 ++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8916.h |   16 ++
 2 files changed, 404 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 9a3e3504502a..1290ee2dc66a 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -44,6 +44,9 @@ enum {
 	P_SLEEP_CLK,
 	P_DSI0_PHYPLL_BYTE,
 	P_DSI0_PHYPLL_DSI,
+	P_EXT_PRI_I2S,
+	P_EXT_SEC_I2S,
+	P_EXT_MCLK,
 };
 
 static const struct parent_map gcc_xo_gpll0_map[] = {
@@ -190,6 +193,76 @@ static const char * const gcc_xo_gpll0a_gpll1_gpll2[] = {
 	"gpll2_vote",
 };
 
+static const struct parent_map gcc_xo_gpll0_gpll1_sleep_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL1, 2 },
+	{ P_SLEEP_CLK, 6 }
+};
+
+static const char * const gcc_xo_gpll0_gpll1_sleep[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll1_vote",
+	"sleep_clk",
+};
+
+static const struct parent_map gcc_xo_gpll1_epi2s_emclk_sleep_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL1, 1 },
+	{ P_EXT_PRI_I2S, 2 },
+	{ P_EXT_MCLK, 3 },
+	{ P_SLEEP_CLK, 6 }
+};
+
+static const char * const gcc_xo_gpll1_epi2s_emclk_sleep[] = {
+	"xo",
+	"gpll1_vote",
+	"ext_pri_i2s",
+	"ext_mclk",
+	"sleep_clk",
+};
+
+static const struct parent_map gcc_xo_gpll1_esi2s_emclk_sleep_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL1, 1 },
+	{ P_EXT_SEC_I2S, 2 },
+	{ P_EXT_MCLK, 3 },
+	{ P_SLEEP_CLK, 6 }
+};
+
+static const char * const gcc_xo_gpll1_esi2s_emclk_sleep[] = {
+	"xo",
+	"gpll1_vote",
+	"ext_sec_i2s",
+	"ext_mclk",
+	"sleep_clk",
+};
+
+static const struct parent_map gcc_xo_sleep_map[] = {
+	{ P_XO, 0 },
+	{ P_SLEEP_CLK, 6 }
+};
+
+static const char * const gcc_xo_sleep[] = {
+	"xo",
+	"sleep_clk",
+};
+
+static const struct parent_map gcc_xo_gpll1_emclk_sleep_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL1, 1 },
+	{ P_EXT_MCLK, 2 },
+	{ P_SLEEP_CLK, 6 }
+};
+
+static const char * const gcc_xo_gpll1_emclk_sleep[] = {
+	"xo",
+	"gpll1_vote",
+	"ext_mclk",
+	"sleep_clk",
+};
+
 #define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
 
 static struct clk_pll gpll0 = {
@@ -1136,6 +1209,305 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_gcc_ultaudio_ahb_clk[] = {
+	F(3200000, P_XO, 6, 0, 0),
+	F(6400000, P_XO, 3, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(19200000, P_XO, 1, 0, 0),
+	F(40000000, P_GPLL0, 10, 1, 2),
+	F(66670000, P_GPLL0, 12, 0, 0),
+	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ultaudio_ahbfabric_clk_src = {
+	.cmd_rcgr = 0x1c010,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.parent_map = gcc_xo_gpll0_gpll1_sleep_map,
+	.freq_tbl = ftbl_gcc_ultaudio_ahb_clk,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ultaudio_ahbfabric_clk_src",
+		.parent_names = gcc_xo_gpll0_gpll1_sleep,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_ultaudio_ahbfabric_ixfabric_clk = {
+	.halt_reg = 0x1c028,
+	.clkr = {
+		.enable_reg = 0x1c028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ultaudio_ahbfabric_ixfabric_clk",
+			.parent_names = (const char *[]){
+				"ultaudio_ahbfabric_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ultaudio_ahbfabric_ixfabric_lpm_clk = {
+	.halt_reg = 0x1c024,
+	.clkr = {
+		.enable_reg = 0x1c024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ultaudio_ahbfabric_ixfabric_lpm_clk",
+			.parent_names = (const char *[]){
+				"ultaudio_ahbfabric_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_ultaudio_lpaif_i2s_clk[] = {
+	F(256000, P_XO, 5, 1, 15),
+	F(512000, P_XO, 5, 2, 15),
+	F(705600, P_GPLL1, 16, 1, 80),
+	F(768000, P_XO, 5, 1, 5),
+	F(800000, P_XO, 5, 5, 24),
+	F(1024000, P_GPLL1, 14, 1, 63),
+	F(1152000, P_XO, 1, 3, 50),
+	F(1411200, P_GPLL1, 16, 1, 40),
+	F(1536000, P_XO, 1, 2, 25),
+	F(1600000, P_XO, 12, 0, 0),
+	F(2048000, P_GPLL1, 9, 1, 49),
+	F(2400000, P_XO, 8, 0, 0),
+	F(2822400, P_GPLL1, 16, 1, 20),
+	F(3072000, P_GPLL1, 14, 1, 21),
+	F(4096000, P_GPLL1, 9, 2, 49),
+	F(4800000, P_XO, 4, 0, 0),
+	F(5644800, P_GPLL1, 16, 1, 10),
+	F(6144000, P_GPLL1, 7, 1, 21),
+	F(8192000, P_GPLL1, 9, 4, 49),
+	F(9600000, P_XO, 2, 0, 0),
+	F(11289600, P_GPLL1, 16, 1, 5),
+	F(12288000, P_GPLL1, 7, 2, 21),
+	{ }
+};
+
+static struct clk_rcg2 ultaudio_lpaif_pri_i2s_clk_src = {
+	.cmd_rcgr = 0x1c054,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.parent_map = gcc_xo_gpll1_epi2s_emclk_sleep_map,
+	.freq_tbl = ftbl_gcc_ultaudio_lpaif_i2s_clk,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ultaudio_lpaif_pri_i2s_clk_src",
+		.parent_names = gcc_xo_gpll1_epi2s_emclk_sleep,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_ultaudio_lpaif_pri_i2s_clk = {
+	.halt_reg = 0x1c068,
+	.clkr = {
+		.enable_reg = 0x1c068,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ultaudio_lpaif_pri_i2s_clk",
+			.parent_names = (const char *[]){
+				"ultaudio_lpaif_pri_i2s_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 ultaudio_lpaif_sec_i2s_clk_src = {
+	.cmd_rcgr = 0x1c06c,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.parent_map = gcc_xo_gpll1_esi2s_emclk_sleep_map,
+	.freq_tbl = ftbl_gcc_ultaudio_lpaif_i2s_clk,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ultaudio_lpaif_sec_i2s_clk_src",
+		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_ultaudio_lpaif_sec_i2s_clk = {
+	.halt_reg = 0x1c080,
+	.clkr = {
+		.enable_reg = 0x1c080,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ultaudio_lpaif_sec_i2s_clk",
+			.parent_names = (const char *[]){
+				"ultaudio_lpaif_sec_i2s_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_rcg2 ultaudio_lpaif_aux_i2s_clk_src = {
+	.cmd_rcgr = 0x1c084,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.parent_map = gcc_xo_gpll1_emclk_sleep_map,
+	.freq_tbl = ftbl_gcc_ultaudio_lpaif_i2s_clk,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ultaudio_lpaif_aux_i2s_clk_src",
+		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
+		.num_parents = 5,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_ultaudio_lpaif_aux_i2s_clk = {
+	.halt_reg = 0x1c098,
+	.clkr = {
+		.enable_reg = 0x1c098,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ultaudio_lpaif_aux_i2s_clk",
+			.parent_names = (const char *[]){
+				"ultaudio_lpaif_aux_i2s_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_gcc_ultaudio_xo_clk[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ultaudio_xo_clk_src = {
+	.cmd_rcgr = 0x1c034,
+	.hid_width = 5,
+	.parent_map = gcc_xo_sleep_map,
+	.freq_tbl = ftbl_gcc_ultaudio_xo_clk,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ultaudio_xo_clk_src",
+		.parent_names = gcc_xo_sleep,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_ultaudio_avsync_xo_clk = {
+	.halt_reg = 0x1c04c,
+	.clkr = {
+		.enable_reg = 0x1c04c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ultaudio_avsync_xo_clk",
+			.parent_names = (const char *[]){
+				"ultaudio_xo_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ultaudio_stc_xo_clk = {
+	.halt_reg = 0x1c050,
+	.clkr = {
+		.enable_reg = 0x1c050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ultaudio_stc_xo_clk",
+			.parent_names = (const char *[]){
+				"ultaudio_xo_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_codec_clk[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(11289600, P_EXT_MCLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 codec_digcodec_clk_src = {
+	.cmd_rcgr = 0x1c09c,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll1_emclk_sleep_map,
+	.freq_tbl = ftbl_codec_clk,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "codec_digcodec_clk_src",
+		.parent_names = gcc_xo_gpll1_emclk_sleep,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch gcc_codec_digcodec_clk = {
+	.halt_reg = 0x1c0b0,
+	.clkr = {
+		.enable_reg = 0x1c0b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ultaudio_codec_digcodec_clk",
+			.parent_names = (const char *[]){
+				"codec_digcodec_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ultaudio_pcnoc_mport_clk = {
+	.halt_reg = 0x1c000,
+	.clkr = {
+		.enable_reg = 0x1c000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ultaudio_pcnoc_mport_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_bfdcd_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ultaudio_pcnoc_sway_clk = {
+	.halt_reg = 0x1c004,
+	.clkr = {
+		.enable_reg = 0x1c004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ultaudio_pcnoc_sway_clk",
+			.parent_names = (const char *[]){
+				"pcnoc_bfdcd_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static const struct freq_tbl ftbl_gcc_venus0_vcodec0_clk[] = {
 	F(100000000, P_GPLL0, 8, 0, 0),
 	F(160000000, P_GPLL0, 5, 0, 0),
@@ -2810,6 +3182,22 @@ static struct clk_regmap *gcc_msm8916_clocks[] = {
 	[BIMC_GPU_CLK_SRC] = &bimc_gpu_clk_src.clkr,
 	[GCC_BIMC_GFX_CLK] = &gcc_bimc_gfx_clk.clkr,
 	[GCC_BIMC_GPU_CLK] = &gcc_bimc_gpu_clk.clkr,
+	[ULTAUDIO_AHBFABRIC_CLK_SRC] = &ultaudio_ahbfabric_clk_src.clkr,
+	[ULTAUDIO_LPAIF_PRI_I2S_CLK_SRC] = &ultaudio_lpaif_pri_i2s_clk_src.clkr,
+	[ULTAUDIO_LPAIF_SEC_I2S_CLK_SRC] = &ultaudio_lpaif_sec_i2s_clk_src.clkr,
+	[ULTAUDIO_LPAIF_AUX_I2S_CLK_SRC] = &ultaudio_lpaif_aux_i2s_clk_src.clkr,
+	[ULTAUDIO_XO_CLK_SRC] = &ultaudio_xo_clk_src.clkr,
+	[CODEC_DIGCODEC_CLK_SRC] = &codec_digcodec_clk_src.clkr,
+	[GCC_ULTAUDIO_PCNOC_MPORT_CLK] = &gcc_ultaudio_pcnoc_mport_clk.clkr,
+	[GCC_ULTAUDIO_PCNOC_SWAY_CLK] = &gcc_ultaudio_pcnoc_sway_clk.clkr,
+	[GCC_ULTAUDIO_AVSYNC_XO_CLK] = &gcc_ultaudio_avsync_xo_clk.clkr,
+	[GCC_ULTAUDIO_STC_XO_CLK] = &gcc_ultaudio_stc_xo_clk.clkr,
+	[GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK] =	&gcc_ultaudio_ahbfabric_ixfabric_clk.clkr,
+	[GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_LPM_CLK] = &gcc_ultaudio_ahbfabric_ixfabric_lpm_clk.clkr,
+	[GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK] = &gcc_ultaudio_lpaif_pri_i2s_clk.clkr,
+	[GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK] = &gcc_ultaudio_lpaif_sec_i2s_clk.clkr,
+	[GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK] = &gcc_ultaudio_lpaif_aux_i2s_clk.clkr,
+	[GCC_CODEC_DIGCODEC_CLK] = &gcc_codec_digcodec_clk.clkr,
 };
 
 static const struct qcom_reset_map gcc_msm8916_resets[] = {
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8916.h b/include/dt-bindings/clock/qcom,gcc-msm8916.h
index d54a9715c37e..694872d887f5 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8916.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8916.h
@@ -158,5 +158,21 @@
 #define BIMC_GPU_CLK_SRC			141
 #define GCC_BIMC_GFX_CLK			142
 #define GCC_BIMC_GPU_CLK			143
+#define ULTAUDIO_LPAIF_PRI_I2S_CLK_SRC		144
+#define ULTAUDIO_LPAIF_SEC_I2S_CLK_SRC		145
+#define ULTAUDIO_LPAIF_AUX_I2S_CLK_SRC		146
+#define ULTAUDIO_XO_CLK_SRC			147
+#define ULTAUDIO_AHBFABRIC_CLK_SRC		148
+#define CODEC_DIGCODEC_CLK_SRC			149
+#define GCC_ULTAUDIO_PCNOC_MPORT_CLK		150
+#define GCC_ULTAUDIO_PCNOC_SWAY_CLK		151
+#define GCC_ULTAUDIO_AVSYNC_XO_CLK		152
+#define GCC_ULTAUDIO_STC_XO_CLK			153
+#define GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK	154
+#define GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_LPM_CLK	155
+#define GCC_ULTAUDIO_LPAIF_PRI_I2S_CLK		156
+#define GCC_ULTAUDIO_LPAIF_SEC_I2S_CLK		157
+#define GCC_ULTAUDIO_LPAIF_AUX_I2S_CLK		158
+#define GCC_CODEC_DIGCODEC_CLK			159
 
 #endif
