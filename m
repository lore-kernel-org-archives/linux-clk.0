Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] clk: meson: gxbb: add cts_amclk
Date: Fri, 31 Mar 2017 15:04:07 +0200
Message-Id: <20170331130411.4781-5-jbrunet@baylibre.com>
In-Reply-To: <20170331130411.4781-1-jbrunet@baylibre.com>
References: <20170331130411.4781-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Add the i2s master clock also referred as cts_amclk

Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/gxbb.h |  5 +++-
 2 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 28812ea41a60..1c20edbfc812 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -845,6 +845,51 @@ static struct clk_mux gxbb_mali = {
 	},
 };
 
+static struct clk_mux gxbb_cts_amclk_sel = {
+	.reg = (void *) HHI_AUD_CLK_CNTL,
+	.mask = 0x3,
+	.shift = 9,
+	/* Default parent unknown (register reset value: 0) */
+	.table = (u32[]){ 1, 2, 3 },
+	.lock = &clk_lock,
+		.hw.init = &(struct clk_init_data){
+		.name = "cts_amclk_sel",
+		.ops = &clk_mux_ops,
+		.parent_names = (const char *[]){ "mpll0", "mpll1", "mpll2" },
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct meson_clk_audio_divider gxbb_cts_amclk_div = {
+	.div = {
+		.reg_off = HHI_AUD_CLK_CNTL,
+		.shift   = 0,
+		.width   = 8,
+	},
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_amclk_div",
+		.ops = &meson_clk_audio_divider_ops,
+		.parent_names = (const char *[]){ "cts_amclk_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_DIVIDER_ROUND_CLOSEST,
+	},
+};
+
+static struct clk_gate gxbb_cts_amclk = {
+	.reg = (void *) HHI_AUD_CLK_CNTL,
+	.bit_idx = 8,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_amclk",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "cts_amclk_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
 static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
@@ -1045,6 +1090,9 @@ static struct clk_hw_onecell_data gxbb_hw_onecell_data = {
 		[CLKID_MALI_1_DIV]	    = &gxbb_mali_1_div.hw,
 		[CLKID_MALI_1]		    = &gxbb_mali_1.hw,
 		[CLKID_MALI]		    = &gxbb_mali.hw,
+		[CLKID_CTS_AMCLK]	    = &gxbb_cts_amclk.hw,
+		[CLKID_CTS_AMCLK_SEL]	    = &gxbb_cts_amclk_sel.hw,
+		[CLKID_CTS_AMCLK_DIV]	    = &gxbb_cts_amclk_div.hw,
 	},
 	.num = NR_CLKS,
 };
@@ -1158,6 +1206,9 @@ static struct clk_hw_onecell_data gxl_hw_onecell_data = {
 		[CLKID_MALI_1_DIV]	    = &gxbb_mali_1_div.hw,
 		[CLKID_MALI_1]		    = &gxbb_mali_1.hw,
 		[CLKID_MALI]		    = &gxbb_mali.hw,
+		[CLKID_CTS_AMCLK]	    = &gxbb_cts_amclk.hw,
+		[CLKID_CTS_AMCLK_SEL]	    = &gxbb_cts_amclk_sel.hw,
+		[CLKID_CTS_AMCLK_DIV]	    = &gxbb_cts_amclk_div.hw,
 	},
 	.num = NR_CLKS,
 };
@@ -1270,6 +1321,7 @@ static struct clk_gate *const gxbb_clk_gates[] = {
 	&gxbb_sar_adc_clk,
 	&gxbb_mali_0,
 	&gxbb_mali_1,
+	&gxbb_cts_amclk,
 };
 
 static struct clk_mux *const gxbb_clk_muxes[] = {
@@ -1278,6 +1330,7 @@ static struct clk_mux *const gxbb_clk_muxes[] = {
 	&gxbb_mali_0_sel,
 	&gxbb_mali_1_sel,
 	&gxbb_mali,
+	&gxbb_cts_amclk_sel,
 };
 
 static struct clk_divider *const gxbb_clk_dividers[] = {
@@ -1287,6 +1340,10 @@ static struct clk_divider *const gxbb_clk_dividers[] = {
 	&gxbb_mali_1_div,
 };
 
+static struct meson_clk_audio_divider *const gxbb_audio_dividers[] = {
+	&gxbb_cts_amclk_div,
+};
+
 struct clkc_data {
 	struct clk_gate *const *clk_gates;
 	unsigned int clk_gates_count;
@@ -1298,6 +1355,8 @@ struct clkc_data {
 	unsigned int clk_muxes_count;
 	struct clk_divider *const *clk_dividers;
 	unsigned int clk_dividers_count;
+	struct meson_clk_audio_divider *const *clk_audio_dividers;
+	unsigned int clk_audio_dividers_count;
 	struct meson_clk_cpu *cpu_clk;
 	struct clk_hw_onecell_data *hw_onecell_data;
 };
@@ -1313,6 +1372,8 @@ static const struct clkc_data gxbb_clkc_data = {
 	.clk_muxes_count = ARRAY_SIZE(gxbb_clk_muxes),
 	.clk_dividers = gxbb_clk_dividers,
 	.clk_dividers_count = ARRAY_SIZE(gxbb_clk_dividers),
+	.clk_audio_dividers = gxbb_audio_dividers,
+	.clk_audio_dividers_count = ARRAY_SIZE(gxbb_audio_dividers),
 	.cpu_clk = &gxbb_cpu_clk,
 	.hw_onecell_data = &gxbb_hw_onecell_data,
 };
@@ -1328,6 +1389,8 @@ static const struct clkc_data gxl_clkc_data = {
 	.clk_muxes_count = ARRAY_SIZE(gxbb_clk_muxes),
 	.clk_dividers = gxbb_clk_dividers,
 	.clk_dividers_count = ARRAY_SIZE(gxbb_clk_dividers),
+	.clk_audio_dividers = gxbb_audio_dividers,
+	.clk_audio_dividers_count = ARRAY_SIZE(gxbb_audio_dividers),
 	.cpu_clk = &gxbb_cpu_clk,
 	.hw_onecell_data = &gxl_hw_onecell_data,
 };
@@ -1384,6 +1447,10 @@ static int gxbb_clkc_probe(struct platform_device *pdev)
 		clkc_data->clk_dividers[i]->reg = clk_base +
 			(u64)clkc_data->clk_dividers[i]->reg;
 
+	/* Populate base address for the audio dividers */
+	for (i = 0; i < clkc_data->clk_audio_dividers_count; i++)
+		clkc_data->clk_audio_dividers[i]->base = clk_base;
+
 	/*
 	 * register all clks
 	 */
diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index 0d535f7e7aed..c8e9fb99af92 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -277,8 +277,11 @@
 #define CLKID_MALI_1_DIV	 104
 /* CLKID_MALI_1	*/
 /* CLKID_MALI	*/
+#define CLKID_CTS_AMCLK		  107
+#define CLKID_CTS_AMCLK_SEL	  108
+#define CLKID_CTS_AMCLK_DIV	  109
 
-#define NR_CLKS			  107
+#define NR_CLKS			  110
 
 /* include the CLKIDs that have been made part of the stable DT binding */
 #include <dt-bindings/clock/gxbb-clkc.h>
-- 
2.9.3
