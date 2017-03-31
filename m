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
Subject: [PATCH v2 6/8] clk: meson: gxbb: add cts_i958 clock
Date: Fri, 31 Mar 2017 15:04:09 +0200
Message-Id: <20170331130411.4781-7-jbrunet@baylibre.com>
In-Reply-To: <20170331130411.4781-1-jbrunet@baylibre.com>
References: <20170331130411.4781-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This adds the cts_i958 clock to control the clock source of the spdif
output block. This mux is not explicitly mentionned in the documentation
but it is critical to the spdif dai. It is used to select whether the clock
source of the spdif output is cts_amclk (when data are taken from i2s
buffer) or the cts_mclk_i958 (when data are taken from the spdif buffer)

Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 21 +++++++++++++++++++++
 drivers/clk/meson/gxbb.h |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 72492cc63915..ad5f027af1a2 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -933,6 +933,24 @@ static struct clk_gate gxbb_cts_mclk_i958 = {
 	},
 };
 
+static struct clk_mux gxbb_cts_i958 = {
+	.reg = (void *)HHI_AUD_CLK_CNTL2,
+	.mask = 0x1,
+	.shift = 27,
+	.lock = &clk_lock,
+		.hw.init = &(struct clk_init_data){
+		.name = "cts_i958",
+		.ops = &clk_mux_ops,
+		.parent_names = (const char *[]){ "cts_amclk", "cts_mclk_i958" },
+		.num_parents = 2,
+		/*
+		 *The parent is specific to origin of the audio data. Let the
+		 * consumer choose the appropriate parent
+		 */
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
 static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
@@ -1139,6 +1157,7 @@ static struct clk_hw_onecell_data gxbb_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958]	    = &gxbb_cts_mclk_i958.hw,
 		[CLKID_CTS_MCLK_I958_SEL]   = &gxbb_cts_mclk_i958_sel.hw,
 		[CLKID_CTS_MCLK_I958_DIV]   = &gxbb_cts_mclk_i958_div.hw,
+		[CLKID_CTS_I958]	    = &gxbb_cts_i958.hw,
 	},
 	.num = NR_CLKS,
 };
@@ -1258,6 +1277,7 @@ static struct clk_hw_onecell_data gxl_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958]	    = &gxbb_cts_mclk_i958.hw,
 		[CLKID_CTS_MCLK_I958_SEL]   = &gxbb_cts_mclk_i958_sel.hw,
 		[CLKID_CTS_MCLK_I958_DIV]   = &gxbb_cts_mclk_i958_div.hw,
+		[CLKID_CTS_I958]	    = &gxbb_cts_i958.hw,
 	},
 	.num = NR_CLKS,
 };
@@ -1382,6 +1402,7 @@ static struct clk_mux *const gxbb_clk_muxes[] = {
 	&gxbb_mali,
 	&gxbb_cts_amclk_sel,
 	&gxbb_cts_mclk_i958_sel,
+	&gxbb_cts_i958,
 };
 
 static struct clk_divider *const gxbb_clk_dividers[] = {
diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index efa90dad3478..3b0665099a1e 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -283,8 +283,9 @@
 #define CLKID_CTS_MCLK_I958	  110
 #define CLKID_CTS_MCLK_I958_SEL	  111
 #define CLKID_CTS_MCLK_I958_DIV	  112
+#define CLKID_CTS_I958		  113
 
-#define NR_CLKS			  113
+#define NR_CLKS			  114
 
 /* include the CLKIDs that have been made part of the stable DT binding */
 #include <dt-bindings/clock/gxbb-clkc.h>
-- 
2.9.3
