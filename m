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
Subject: [PATCH v2 5/8] clk: meson: gxbb: add cts_mclk_i958
Date: Fri, 31 Mar 2017 15:04:08 +0200
Message-Id: <20170331130411.4781-6-jbrunet@baylibre.com>
In-Reply-To: <20170331130411.4781-1-jbrunet@baylibre.com>
References: <20170331130411.4781-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Add the spdif master clock also referred as cts_mclk_i958

Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/gxbb.h |  5 ++++-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 1c20edbfc812..72492cc63915 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -890,6 +890,49 @@ static struct clk_gate gxbb_cts_amclk = {
 	},
 };
 
+static struct clk_mux gxbb_cts_mclk_i958_sel = {
+	.reg = (void *)HHI_AUD_CLK_CNTL2,
+	.mask = 0x3,
+	.shift = 25,
+	/* Default parent unknown (register reset value: 0) */
+	.table = (u32[]){ 1, 2, 3 },
+	.lock = &clk_lock,
+		.hw.init = &(struct clk_init_data){
+		.name = "cts_mclk_i958_sel",
+		.ops = &clk_mux_ops,
+		.parent_names = (const char *[]){ "mpll0", "mpll1", "mpll2" },
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_divider gxbb_cts_mclk_i958_div = {
+	.reg = (void *)HHI_AUD_CLK_CNTL2,
+	.shift = 16,
+	.width = 8,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_mclk_i958_div",
+		.ops = &clk_divider_ops,
+		.parent_names = (const char *[]){ "cts_mclk_i958_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_DIVIDER_ROUND_CLOSEST,
+	},
+};
+
+static struct clk_gate gxbb_cts_mclk_i958 = {
+	.reg = (void *)HHI_AUD_CLK_CNTL2,
+	.bit_idx = 24,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_mclk_i958",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "cts_mclk_i958_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
 static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
@@ -1093,6 +1136,9 @@ static struct clk_hw_onecell_data gxbb_hw_onecell_data = {
 		[CLKID_CTS_AMCLK]	    = &gxbb_cts_amclk.hw,
 		[CLKID_CTS_AMCLK_SEL]	    = &gxbb_cts_amclk_sel.hw,
 		[CLKID_CTS_AMCLK_DIV]	    = &gxbb_cts_amclk_div.hw,
+		[CLKID_CTS_MCLK_I958]	    = &gxbb_cts_mclk_i958.hw,
+		[CLKID_CTS_MCLK_I958_SEL]   = &gxbb_cts_mclk_i958_sel.hw,
+		[CLKID_CTS_MCLK_I958_DIV]   = &gxbb_cts_mclk_i958_div.hw,
 	},
 	.num = NR_CLKS,
 };
@@ -1209,6 +1255,9 @@ static struct clk_hw_onecell_data gxl_hw_onecell_data = {
 		[CLKID_CTS_AMCLK]	    = &gxbb_cts_amclk.hw,
 		[CLKID_CTS_AMCLK_SEL]	    = &gxbb_cts_amclk_sel.hw,
 		[CLKID_CTS_AMCLK_DIV]	    = &gxbb_cts_amclk_div.hw,
+		[CLKID_CTS_MCLK_I958]	    = &gxbb_cts_mclk_i958.hw,
+		[CLKID_CTS_MCLK_I958_SEL]   = &gxbb_cts_mclk_i958_sel.hw,
+		[CLKID_CTS_MCLK_I958_DIV]   = &gxbb_cts_mclk_i958_div.hw,
 	},
 	.num = NR_CLKS,
 };
@@ -1322,6 +1371,7 @@ static struct clk_gate *const gxbb_clk_gates[] = {
 	&gxbb_mali_0,
 	&gxbb_mali_1,
 	&gxbb_cts_amclk,
+	&gxbb_cts_mclk_i958,
 };
 
 static struct clk_mux *const gxbb_clk_muxes[] = {
@@ -1331,6 +1381,7 @@ static struct clk_mux *const gxbb_clk_muxes[] = {
 	&gxbb_mali_1_sel,
 	&gxbb_mali,
 	&gxbb_cts_amclk_sel,
+	&gxbb_cts_mclk_i958_sel,
 };
 
 static struct clk_divider *const gxbb_clk_dividers[] = {
@@ -1338,6 +1389,7 @@ static struct clk_divider *const gxbb_clk_dividers[] = {
 	&gxbb_sar_adc_clk_div,
 	&gxbb_mali_0_div,
 	&gxbb_mali_1_div,
+	&gxbb_cts_mclk_i958_div,
 };
 
 static struct meson_clk_audio_divider *const gxbb_audio_dividers[] = {
diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index c8e9fb99af92..efa90dad3478 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -280,8 +280,11 @@
 #define CLKID_CTS_AMCLK		  107
 #define CLKID_CTS_AMCLK_SEL	  108
 #define CLKID_CTS_AMCLK_DIV	  109
+#define CLKID_CTS_MCLK_I958	  110
+#define CLKID_CTS_MCLK_I958_SEL	  111
+#define CLKID_CTS_MCLK_I958_DIV	  112
 
-#define NR_CLKS			  110
+#define NR_CLKS			  113
 
 /* include the CLKIDs that have been made part of the stable DT binding */
 #include <dt-bindings/clock/gxbb-clkc.h>
-- 
2.9.3
