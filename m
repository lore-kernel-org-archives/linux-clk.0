Return-Path: <michael@amarulasolutions.com>
Return-Path: <michael@amarulasolutions.com>
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: imx: Add new clo01 and clo2 controlled by CCOSR
Date: Fri, 20 Apr 2018 22:45:39 +0200
Message-Id: <1524257139-27913-1-git-send-email-michael@amarulasolutions.com>
List-ID: <linux-clk.vger.kernel.org>

osc->cko2_sel->cko2_podf->clk_cko2->clk_cko

Example of usage to provide clock to the sgtl5000

codec: sgtl5000@0a {
	compatible = "fsl,sgtl5000";
	reg = <0x0a>;
	clocks = <&clks IMX6UL_CLK_OSC>;
	#sound-dai-cells = <0>;
	clocks = <&clks IMX6UL_CLK_CKO>;
	assigned-clocks = <&clks IMX6UL_CLK_CKO2_SEL>,
			  <&clks IMX6UL_CLK_CKO2_PODF>,
			  <&clks IMX6UL_CLK_CKO2>,
			  <&clks IMX6UL_CLK_CKO>;
	assigned-clock-parents = <&clks IMX6UL_CLK_OSC>,
				 <&clks IMX6UL_CLK_CKO2_SEL>,
				 <&clks IMX6UL_CLK_CKO2_PODF>,
				 <&clks IMX6UL_CLK_CKO2>;
	clock-names = "mclk";
	wlf,shared-lrclk;

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 drivers/clk/imx/clk-imx6ul.c             | 18 +++++++++++++++++
 include/dt-bindings/clock/imx6ul-clock.h | 33 +++++++++++++++++++-------------
 2 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index 114ecbb..9bfef1a 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -68,6 +68,13 @@ static const char *sim_sels[] = { "sim_podf", "ipp_di0", "ipp_di1", "ldb_di0", "
 static const char *epdc_pre_sels[] = { "pll2_bus", "pll3_usb_otg", "pll5_video_div", "pll2_pfd0_352m", "pll2_pfd2_396m", "pll3_pfd2_508m", };
 static const char *esai_sels[] = { "pll4_audio_div", "pll3_pfd2_508m", "pll5_video_div", "pll3_usb_otg", };
 static const char *epdc_sels[] = { "epdc_podf", "ipp_di0", "ipp_di1", "ldb_di0", "ldb_di1", };
+static const char *cko1_sels[] = { "dummy", "dummy", "dummy", "dummy", "dummy", "axi", "enfc", "dummy", "dummy",
+				   "dummy", "lcdif_pix", "ahb", "ipg", "ipg_per", "ckil", "pll4_audio_div", };
+static const char *cko2_sels[] = { "dummy", "dummy", "dummy", "usdhc1", "dummy", "dummy", "ecspi_root", "dummy",
+				   "dummy", "dummy", "dummy", "dummy", "dummy", "dummy", "osc", "dummy",
+				   "dummy", "usdhc2", "sai1", "sai2", "sai3", "dummy", "dummy", "can_root",
+				   "dummy", "dummy", "dummy", "dummy", "uart_serial", "spdif", "dummy", "dummy", };
+static const char *cko_sels[] = { "cko1", "cko2", };
 
 static struct clk *clks[IMX6UL_CLK_END];
 static struct clk_onecell_data clk_data;
@@ -273,6 +280,10 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 	clks[IMX6UL_CLK_LDB_DI0_DIV_SEL]  = imx_clk_mux("ldb_di0", base + 0x20, 10, 1, ldb_di0_div_sels, ARRAY_SIZE(ldb_di0_div_sels));
 	clks[IMX6UL_CLK_LDB_DI1_DIV_SEL]  = imx_clk_mux("ldb_di1", base + 0x20, 11, 1, ldb_di1_div_sels, ARRAY_SIZE(ldb_di1_div_sels));
 
+	clks[IMX6UL_CLK_CKO1_SEL]	  = imx_clk_mux("cko1_sel", base + 0x60, 0,  4, cko1_sels, ARRAY_SIZE(cko1_sels));
+	clks[IMX6UL_CLK_CKO2_SEL]	  = imx_clk_mux("cko2_sel", base + 0x60, 16, 5, cko2_sels, ARRAY_SIZE(cko2_sels));
+	clks[IMX6UL_CLK_CKO]		  = imx_clk_mux("cko", base + 0x60, 8, 1, cko_sels, ARRAY_SIZE(cko_sels));
+
 	clks[IMX6UL_CLK_LDB_DI0_DIV_3_5] = imx_clk_fixed_factor("ldb_di0_div_3_5", "ldb_di0_sel", 2, 7);
 	clks[IMX6UL_CLK_LDB_DI0_DIV_7]	 = imx_clk_fixed_factor("ldb_di0_div_7",   "ldb_di0_sel", 1, 7);
 	clks[IMX6UL_CLK_LDB_DI1_DIV_3_5] = imx_clk_fixed_factor("ldb_di1_div_3_5", "qspi1_sel", 2, 7);
@@ -316,6 +327,9 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 	clks[IMX6UL_CLK_LCDIF_PRED]	= imx_clk_divider("lcdif_pred",	   "lcdif_pre_sel",	base + 0x38, 12, 3);
 	clks[IMX6UL_CLK_CSI_PODF]       = imx_clk_divider("csi_podf",      "csi_sel",           base + 0x3c, 11, 3);
 
+	clks[IMX6UL_CLK_CKO1_PODF]	= imx_clk_divider("cko1_podf",     "cko1_sel",          base + 0x60, 4,  3);
+	clks[IMX6UL_CLK_CKO2_PODF]	= imx_clk_divider("cko2_podf",     "cko2_sel",          base + 0x60, 21, 3);
+
 	clks[IMX6UL_CLK_ARM]		= imx_clk_busy_divider("arm",	    "pll1_sw",	base +	0x10, 0,  3,  base + 0x48, 16);
 	clks[IMX6UL_CLK_MMDC_PODF]	= imx_clk_busy_divider("mmdc_podf", "periph2",	base +  0x14, 3,  3,  base + 0x48, 2);
 	clks[IMX6UL_CLK_AXI_PODF]	= imx_clk_busy_divider("axi_podf",  "axi_sel",	base +  0x14, 16, 3,  base + 0x48, 0);
@@ -445,6 +459,10 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 	clks[IMX6UL_CLK_PWM6]		= imx_clk_gate2("pwm6",		"perclk",	 base +	0x80,	28);
 	clks[IMX6UL_CLK_PWM7]		= imx_clk_gate2("pwm7",		"perclk",	 base + 0x80,	30);
 
+	/* CCOSR */
+	clks[IMX6UL_CLK_CKO1]		= imx_clk_gate("cko1",		"cko1_podf",	 base + 0x60,	7);
+	clks[IMX6UL_CLK_CKO2]		= imx_clk_gate("cko2",		"cko2_podf",	 base + 0x60,	24);
+
 	/* mask handshake of mmdc */
 	writel_relaxed(BM_CCM_CCDR_MMDC_CH0_MASK, base + CCDR);
 
diff --git a/include/dt-bindings/clock/imx6ul-clock.h b/include/dt-bindings/clock/imx6ul-clock.h
index ee9f1a5..9564597 100644
--- a/include/dt-bindings/clock/imx6ul-clock.h
+++ b/include/dt-bindings/clock/imx6ul-clock.h
@@ -235,20 +235,27 @@
 #define IMX6UL_CLK_CSI_PODF		222
 #define IMX6UL_CLK_PLL3_120M		223
 #define IMX6UL_CLK_KPP			224
+#define IMX6UL_CLK_CKO1_SEL		225
+#define IMX6UL_CLK_CKO1_PODF		226
+#define IMX6UL_CLK_CKO1			227
+#define IMX6UL_CLK_CKO2_SEL		228
+#define IMX6UL_CLK_CKO2_PODF		229
+#define IMX6UL_CLK_CKO2			230
+#define IMX6UL_CLK_CKO			231
 
 /* For i.MX6ULL */
-#define IMX6ULL_CLK_ESAI_PRED		225
-#define IMX6ULL_CLK_ESAI_PODF		226
-#define IMX6ULL_CLK_ESAI_EXTAL		227
-#define IMX6ULL_CLK_ESAI_MEM		228
-#define IMX6ULL_CLK_ESAI_IPG		229
-#define IMX6ULL_CLK_DCP_CLK		230
-#define IMX6ULL_CLK_EPDC_PRE_SEL	231
-#define IMX6ULL_CLK_EPDC_SEL		232
-#define IMX6ULL_CLK_EPDC_PODF		233
-#define IMX6ULL_CLK_EPDC_ACLK		234
-#define IMX6ULL_CLK_EPDC_PIX		235
-#define IMX6ULL_CLK_ESAI_SEL		236
-#define IMX6UL_CLK_END			237
+#define IMX6ULL_CLK_ESAI_PRED		232
+#define IMX6ULL_CLK_ESAI_PODF		233
+#define IMX6ULL_CLK_ESAI_EXTAL		234
+#define IMX6ULL_CLK_ESAI_MEM		235
+#define IMX6ULL_CLK_ESAI_IPG		236
+#define IMX6ULL_CLK_DCP_CLK		237
+#define IMX6ULL_CLK_EPDC_PRE_SEL	238
+#define IMX6ULL_CLK_EPDC_SEL		239
+#define IMX6ULL_CLK_EPDC_PODF		240
+#define IMX6ULL_CLK_EPDC_ACLK		241
+#define IMX6ULL_CLK_EPDC_PIX		242
+#define IMX6ULL_CLK_ESAI_SEL		243
+#define IMX6UL_CLK_END			244
 
 #endif /* __DT_BINDINGS_CLOCK_IMX6UL_H */
-- 
2.7.4
