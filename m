Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:54724 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752933AbeGDQzK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Jul 2018 12:55:10 -0400
Received: by mail-wm0-f67.google.com with SMTP id i139-v6so6924192wmf.4
        for <linux-clk@vger.kernel.org>; Wed, 04 Jul 2018 09:55:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] clk: meson: add gen_clk
Date: Wed,  4 Jul 2018 18:54:58 +0200
Message-Id: <20180704165458.24149-4-jbrunet@baylibre.com>
In-Reply-To: <20180704165458.24149-1-jbrunet@baylibre.com>
References: <20180704165458.24149-1-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

GEN_CLK is able to route several internal clocks to one of the SoC
pads. In the future, even more clocks could be made accessible using
cts_msr_clk - the clock measure block.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c  | 64 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/meson/axg.h  |  4 ++-
 drivers/clk/meson/gxbb.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/gxbb.h |  4 ++-
 4 files changed, 135 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 2d458092884a..00ce62ad6416 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -909,6 +909,63 @@ static struct clk_regmap axg_sd_emmc_c_clk0 = {
 	},
 };
 
+static u32 mux_table_gen_clk[]	= { 0, 4, 5, 6, 7, 8,
+				    9, 10, 11, 13, 14, };
+static const char * const gen_clk_parent_names[] = {
+	"xtal", "hifi_pll", "mpll0", "mpll1", "mpll2", "mpll3",
+	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7", "gp0_pll",
+};
+
+static struct clk_regmap axg_gen_clk_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_GEN_CLK_CNTL,
+		.mask = 0xf,
+		.shift = 12,
+		.table = mux_table_gen_clk,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "gen_clk_sel",
+		.ops = &clk_regmap_mux_ops,
+		/*
+		 * bits 15:12 selects from 14 possible parents:
+		 * xtal, [rtc_oscin_i], [sys_cpu_div16], [ddr_dpll_pt],
+		 * hifi_pll, mpll0, mpll1, mpll2, mpll3, fdiv4,
+		 * fdiv3, fdiv5, [cts_msr_clk], fdiv7, gp0_pll
+		 */
+		.parent_names = gen_clk_parent_names,
+		.num_parents = ARRAY_SIZE(gen_clk_parent_names),
+	},
+};
+
+static struct clk_regmap axg_gen_clk_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_GEN_CLK_CNTL,
+		.shift = 0,
+		.width = 11,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "gen_clk_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "gen_clk_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap axg_gen_clk = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_GEN_CLK_CNTL,
+		.bit_idx = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "gen_clk",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "gen_clk_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(axg_ddr, HHI_GCLK_MPEG0, 0);
 static MESON_GATE(axg_audio_locker, HHI_GCLK_MPEG0, 2);
@@ -1047,7 +1104,9 @@ static struct clk_hw_onecell_data axg_hw_onecell_data = {
 		[CLKID_PCIE_CML_EN0]		= &axg_pcie_cml_en0.hw,
 		[CLKID_PCIE_CML_EN1]		= &axg_pcie_cml_en1.hw,
 		[CLKID_MIPI_ENABLE]		= &axg_mipi_enable.hw,
-
+		[CLKID_GEN_CLK_SEL]		= &axg_gen_clk_sel.hw,
+		[CLKID_GEN_CLK_DIV]		= &axg_gen_clk_div.hw,
+		[CLKID_GEN_CLK]			= &axg_gen_clk.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -1132,6 +1191,9 @@ static struct clk_regmap *const axg_clk_regmaps[] = {
 	&axg_pcie_cml_en0,
 	&axg_pcie_cml_en1,
 	&axg_mipi_enable,
+	&axg_gen_clk_sel,
+	&axg_gen_clk_div,
+	&axg_gen_clk,
 };
 
 static const struct of_device_id clkc_match_table[] = {
diff --git a/drivers/clk/meson/axg.h b/drivers/clk/meson/axg.h
index 6e55ebd6c77d..1d04144a1b2c 100644
--- a/drivers/clk/meson/axg.h
+++ b/drivers/clk/meson/axg.h
@@ -131,8 +131,10 @@
 #define CLKID_PCIE_PLL				76
 #define CLKID_PCIE_MUX				77
 #define CLKID_PCIE_REF				78
+#define CLKID_GEN_CLK_SEL			82
+#define CLKID_GEN_CLK_DIV			83
 
-#define NR_CLKS					82
+#define NR_CLKS					85
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/axg-clkc.h>
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 894a6adaa17a..86d3ae58e84c 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1624,6 +1624,63 @@ static struct clk_regmap gxbb_vdec_hevc = {
 	},
 };
 
+static u32 mux_table_gen_clk[]	= { 0, 4, 5, 6, 7, 8,
+				    9, 10, 11, 13, 14, };
+static const char * const gen_clk_parent_names[] = {
+	"xtal", "vdec_1", "vdec_hevc", "mpll0", "mpll1", "mpll2",
+	"fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7", "gp0_pll",
+};
+
+static struct clk_regmap gxbb_gen_clk_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_GEN_CLK_CNTL,
+		.mask = 0xf,
+		.shift = 12,
+		.table = mux_table_gen_clk,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "gen_clk_sel",
+		.ops = &clk_regmap_mux_ops,
+		/*
+		 * bits 15:12 selects from 14 possible parents:
+		 * xtal, [rtc_oscin_i], [sys_cpu_div16], [ddr_dpll_pt],
+		 * vid_pll, vid2_pll (hevc), mpll0, mpll1, mpll2, fdiv4,
+		 * fdiv3, fdiv5, [cts_msr_clk], fdiv7, gp0_pll
+		 */
+		.parent_names = gen_clk_parent_names,
+		.num_parents = ARRAY_SIZE(gen_clk_parent_names),
+	},
+};
+
+static struct clk_regmap gxbb_gen_clk_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_GEN_CLK_CNTL,
+		.shift = 0,
+		.width = 11,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "gen_clk_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "gen_clk_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap gxbb_gen_clk = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_GEN_CLK_CNTL,
+		.bit_idx = 7,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "gen_clk",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "gen_clk_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
 static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
@@ -1873,6 +1930,9 @@ static struct clk_hw_onecell_data gxbb_hw_onecell_data = {
 		[CLKID_VDEC_HEVC_SEL]	    = &gxbb_vdec_hevc_sel.hw,
 		[CLKID_VDEC_HEVC_DIV]	    = &gxbb_vdec_hevc_div.hw,
 		[CLKID_VDEC_HEVC]	    = &gxbb_vdec_hevc.hw,
+		[CLKID_GEN_CLK_SEL]	    = &gxbb_gen_clk_sel.hw,
+		[CLKID_GEN_CLK_DIV]	    = &gxbb_gen_clk_div.hw,
+		[CLKID_GEN_CLK]		    = &gxbb_gen_clk.hw,
 		[NR_CLKS]		    = NULL,
 	},
 	.num = NR_CLKS,
@@ -2035,6 +2095,9 @@ static struct clk_hw_onecell_data gxl_hw_onecell_data = {
 		[CLKID_VDEC_HEVC_SEL]	    = &gxbb_vdec_hevc_sel.hw,
 		[CLKID_VDEC_HEVC_DIV]	    = &gxbb_vdec_hevc_div.hw,
 		[CLKID_VDEC_HEVC]	    = &gxbb_vdec_hevc.hw,
+		[CLKID_GEN_CLK_SEL]	    = &gxbb_gen_clk_sel.hw,
+		[CLKID_GEN_CLK_DIV]	    = &gxbb_gen_clk_div.hw,
+		[CLKID_GEN_CLK]		    = &gxbb_gen_clk.hw,
 		[NR_CLKS]		    = NULL,
 	},
 	.num = NR_CLKS,
@@ -2199,6 +2262,9 @@ static struct clk_regmap *const gx_clk_regmaps[] = {
 	&gxbb_vdec_hevc_sel,
 	&gxbb_vdec_hevc_div,
 	&gxbb_vdec_hevc,
+	&gxbb_gen_clk_sel,
+	&gxbb_gen_clk_div,
+	&gxbb_gen_clk,
 };
 
 struct clkc_data {
diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index df6c21d368c6..20dfb1daf5b8 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -157,8 +157,10 @@
 #define CLKID_VDEC_1_DIV	  152
 #define CLKID_VDEC_HEVC_SEL	  154
 #define CLKID_VDEC_HEVC_DIV	  155
+#define CLKID_GEN_CLK_SEL	  157
+#define CLKID_GEN_CLK_DIV	  158
 
-#define NR_CLKS			  157
+#define NR_CLKS			  160
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/gxbb-clkc.h>
-- 
2.14.4

