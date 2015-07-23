Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
Cc: shawn.guo@linaro.org,
	jason.liu@linaro.org,
	wan.zhijun@zte.com.cn,
	Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v2 3/3] clk: zx: Constify parent names in clock init data
Date: Thu, 23 Jul 2015 15:02:53 +0800
Message-Id: <1437634973-27347-4-git-send-email-jun.nie@linaro.org>
In-Reply-To: <1437634973-27347-1-git-send-email-jun.nie@linaro.org>
References: <1437634973-27347-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The array of parent names can be made as array of const pointers to
const strings.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/clk/zte/clk-zx296702.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/zte/clk-zx296702.c b/drivers/clk/zte/clk-zx296702.c
index 9dcac73..ebd20d8 100644
--- a/drivers/clk/zte/clk-zx296702.c
+++ b/drivers/clk/zte/clk-zx296702.c
@@ -83,115 +83,115 @@ static const struct clk_div_table sec_wclk_divider[] = {
 	{ /* sentinel */ }
 };
 
-static const char * matrix_aclk_sel[] = {
+static const char * const matrix_aclk_sel[] = {
 	"pll_mm0_198M",
 	"osc",
 	"clk_148M5",
 	"pll_lsp_104M",
 };
 
-static const char * a9_wclk_sel[] = {
+static const char * const a9_wclk_sel[] = {
 	"pll_a9",
 	"osc",
 	"clk_500",
 	"clk_250",
 };
 
-static const char * a9_as1_aclk_sel[] = {
+static const char * const a9_as1_aclk_sel[] = {
 	"clk_250",
 	"osc",
 	"pll_mm0_396M",
 	"pll_mac_333M",
 };
 
-static const char * a9_trace_clkin_sel[] = {
+static const char * const a9_trace_clkin_sel[] = {
 	"clk_74M25",
 	"pll_mm1_108M",
 	"clk_125",
 	"clk_148M5",
 };
 
-static const char * decppu_aclk_sel[] = {
+static const char * const decppu_aclk_sel[] = {
 	"clk_250",
 	"pll_mm0_198M",
 	"pll_lsp_104M",
 	"pll_audio_294M912",
 };
 
-static const char * vou_main_wclk_sel[] = {
+static const char * const vou_main_wclk_sel[] = {
 	"clk_148M5",
 	"clk_74M25",
 	"clk_27",
 	"pll_mm1_54M",
 };
 
-static const char * vou_scaler_wclk_sel[] = {
+static const char * const vou_scaler_wclk_sel[] = {
 	"clk_250",
 	"pll_mac_333M",
 	"pll_audio_294M912",
 	"pll_mm0_198M",
 };
 
-static const char * r2d_wclk_sel[] = {
+static const char * const r2d_wclk_sel[] = {
 	"pll_audio_294M912",
 	"pll_mac_333M",
 	"pll_a9_350M",
 	"pll_mm0_396M",
 };
 
-static const char * ddr_wclk_sel[] = {
+static const char * const ddr_wclk_sel[] = {
 	"pll_mac_333M",
 	"pll_ddr_266M",
 	"pll_audio_294M912",
 	"pll_mm0_198M",
 };
 
-static const char * nand_wclk_sel[] = {
+static const char * const nand_wclk_sel[] = {
 	"pll_lsp_104M",
 	"osc",
 };
 
-static const char * lsp_26_wclk_sel[] = {
+static const char * const lsp_26_wclk_sel[] = {
 	"pll_lsp_26M",
 	"osc",
 };
 
-static const char * vl0_sel[] = {
+static const char * const vl0_sel[] = {
 	"vou_main_channel_div",
 	"vou_aux_channel_div",
 };
 
-static const char * hdmi_sel[] = {
+static const char * const hdmi_sel[] = {
 	"vou_main_channel_wclk",
 	"vou_aux_channel_wclk",
 };
 
-static const char * sdmmc0_wclk_sel[] = {
+static const char * const sdmmc0_wclk_sel[] = {
 	"lsp1_104M_wclk",
 	"lsp1_26M_wclk",
 };
 
-static const char * sdmmc1_wclk_sel[] = {
+static const char * const sdmmc1_wclk_sel[] = {
 	"lsp0_104M_wclk",
 	"lsp0_26M_wclk",
 };
 
-static const char * uart_wclk_sel[] = {
+static const char * const uart_wclk_sel[] = {
 	"lsp1_104M_wclk",
 	"lsp1_26M_wclk",
 };
 
-static const char * spdif0_wclk_sel[] = {
+static const char * const spdif0_wclk_sel[] = {
 	"lsp0_104M_wclk",
 	"lsp0_26M_wclk",
 };
 
-static const char * spdif1_wclk_sel[] = {
+static const char * const spdif1_wclk_sel[] = {
 	"lsp1_104M_wclk",
 	"lsp1_26M_wclk",
 };
 
-static const char * i2s_wclk_sel[] = {
+static const char * const i2s_wclk_sel[] = {
 	"lsp0_104M_wclk",
 	"lsp0_26M_wclk",
 };
@@ -211,7 +211,7 @@ static inline struct clk *zx_div(const char *name, const char *parent,
 				    reg, shift, width, 0, &reg_lock);
 }
 
-static inline struct clk *zx_mux(const char *name, const char **parents,
+static inline struct clk *zx_mux(const char *name, const char * const *parents,
 		int num_parents, void __iomem *reg, u8 shift, u8 width)
 {
 	return clk_register_mux(NULL, name, parents, num_parents,
-- 
1.9.1
