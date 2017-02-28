Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] clk: gxbb: put dividers and muxes in tables
Date: Tue, 28 Feb 2017 14:29:57 +0100
Message-Id: <20170228133002.17894-3-jbrunet@baylibre.com>
In-Reply-To: <20170228133002.17894-1-jbrunet@baylibre.com>
References: <20170228133002.17894-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Until now, there was only 2 dividers and 2 muxes declared for the gxbb
platform. With the ongoing work on various subsystem, including audio,
this is about to change. Use the same approach as gates for dividers and
muxes, putting them in tables to fix the register address at runtime.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 1c1ec137a3cc..388b0c8838af 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -902,6 +902,16 @@ static struct clk_gate *gxbb_clk_gates[] = {
 	&gxbb_sar_adc_clk,
 };
 
+static struct clk_mux *gxbb_clk_muxes[] = {
+	&gxbb_mpeg_clk_sel,
+	&gxbb_sar_adc_clk_sel,
+};
+
+static struct clk_divider *gxbb_clk_dividers[] = {
+	&gxbb_mpeg_clk_div,
+	&gxbb_sar_adc_clk_div,
+};
+
 static int gxbb_clkc_probe(struct platform_device *pdev)
 {
 	void __iomem *clk_base;
@@ -928,19 +938,21 @@ static int gxbb_clkc_probe(struct platform_device *pdev)
 	/* Populate the base address for CPU clk */
 	gxbb_cpu_clk.base = clk_base;
 
-	/* Populate the base address for the MPEG clks */
-	gxbb_mpeg_clk_sel.reg = clk_base + (u64)gxbb_mpeg_clk_sel.reg;
-	gxbb_mpeg_clk_div.reg = clk_base + (u64)gxbb_mpeg_clk_div.reg;
-
-	/* Populate the base address for the SAR ADC clks */
-	gxbb_sar_adc_clk_sel.reg = clk_base + (u64)gxbb_sar_adc_clk_sel.reg;
-	gxbb_sar_adc_clk_div.reg = clk_base + (u64)gxbb_sar_adc_clk_div.reg;
-
 	/* Populate base address for gates */
 	for (i = 0; i < ARRAY_SIZE(gxbb_clk_gates); i++)
 		gxbb_clk_gates[i]->reg = clk_base +
 			(u64)gxbb_clk_gates[i]->reg;
 
+	/* Populate base address for muxes */
+	for (i = 0; i < ARRAY_SIZE(gxbb_clk_muxes); i++)
+		gxbb_clk_muxes[i]->reg = clk_base +
+			(u64)gxbb_clk_muxes[i]->reg;
+
+	/* Populate base address for dividers */
+	for (i = 0; i < ARRAY_SIZE(gxbb_clk_dividers); i++)
+		gxbb_clk_dividers[i]->reg = clk_base +
+			(u64)gxbb_clk_dividers[i]->reg;
+
 	/*
 	 * register all clks
 	 */
-- 
2.9.3
