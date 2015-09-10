Return-Path: <alim.akhtar@samsung.com>
From: Alim Akhtar <alim.akhtar@samsung.com>
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org,
 k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com,
 gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 01/12] clk: samsung: exynos7: Change the CMU_TOPC block
 clock names
Date: Thu, 10 Sep 2015 14:14:26 +0530
Message-id: <1441874677-24148-2-git-send-email-alim.akhtar@samsung.com>
In-reply-to: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Corrects the CMU_TOPC block clock names as per user manual.
This does not change any functionalities.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |   70 ++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 380608b..df061ce 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -37,36 +37,36 @@
 #define ENABLE_ACLK_TOPC1	0x0804
 
 static struct samsung_fixed_factor_clock topc_fixed_factor_clks[] __initdata = {
-	FFACTOR(0, "ffac_topc_bus0_pll_div2", "mout_bus0_pll_ctrl", 1, 2, 0),
+	FFACTOR(0, "ffac_topc_bus0_pll_div2", "mout_topc_bus0_pll", 1, 2, 0),
 	FFACTOR(0, "ffac_topc_bus0_pll_div4",
 		"ffac_topc_bus0_pll_div2", 1, 2, 0),
-	FFACTOR(0, "ffac_topc_bus1_pll_div2", "mout_bus1_pll_ctrl", 1, 2, 0),
-	FFACTOR(0, "ffac_topc_cc_pll_div2", "mout_cc_pll_ctrl", 1, 2, 0),
-	FFACTOR(0, "ffac_topc_mfc_pll_div2", "mout_mfc_pll_ctrl", 1, 2, 0),
+	FFACTOR(0, "ffac_topc_bus1_pll_div2", "mout_topc_bus1_pll", 1, 2, 0),
+	FFACTOR(0, "ffac_topc_cc_pll_div2", "mout_topc_cc_pll", 1, 2, 0),
+	FFACTOR(0, "ffac_topc_mfc_pll_div2", "mout_topc_mfc_pll", 1, 2, 0),
 };
 
 /* List of parent clocks for Muxes in CMU_TOPC */
-PNAME(mout_aud_pll_ctrl_p)	= { "fin_pll", "fout_aud_pll" };
-PNAME(mout_bus0_pll_ctrl_p)	= { "fin_pll", "fout_bus0_pll" };
-PNAME(mout_bus1_pll_ctrl_p)	= { "fin_pll", "fout_bus1_pll" };
-PNAME(mout_cc_pll_ctrl_p)	= { "fin_pll", "fout_cc_pll" };
-PNAME(mout_mfc_pll_ctrl_p)	= { "fin_pll", "fout_mfc_pll" };
+PNAME(mout_topc_aud_pll_ctrl_p)	= { "fin_pll", "fout_aud_pll" };
+PNAME(mout_topc_bus0_pll_ctrl_p)	= { "fin_pll", "fout_bus0_pll" };
+PNAME(mout_topc_bus1_pll_ctrl_p)	= { "fin_pll", "fout_bus1_pll" };
+PNAME(mout_topc_cc_pll_ctrl_p)	= { "fin_pll", "fout_cc_pll" };
+PNAME(mout_topc_mfc_pll_ctrl_p)	= { "fin_pll", "fout_mfc_pll" };
 
-PNAME(mout_topc_group2) = { "mout_sclk_bus0_pll_cmuc",
-	"mout_sclk_bus1_pll_cmuc", "mout_sclk_cc_pll_cmuc",
-	"mout_sclk_mfc_pll_cmuc" };
+PNAME(mout_topc_group2) = { "mout_topc_bus0_pll_half",
+	"mout_topc_bus1_pll_half", "mout_topc_cc_pll_half",
+	"mout_topc_mfc_pll_half" };
 
-PNAME(mout_sclk_bus0_pll_cmuc_p) = { "mout_bus0_pll_ctrl",
+PNAME(mout_topc_bus0_pll_half_p) = { "mout_topc_bus0_pll",
 	"ffac_topc_bus0_pll_div2", "ffac_topc_bus0_pll_div4"};
-PNAME(mout_sclk_bus1_pll_cmuc_p) = { "mout_bus1_pll_ctrl",
+PNAME(mout_topc_bus1_pll_half_p) = { "mout_topc_bus1_pll",
 	"ffac_topc_bus1_pll_div2"};
-PNAME(mout_sclk_cc_pll_cmuc_p) = { "mout_cc_pll_ctrl",
+PNAME(mout_topc_cc_pll_half_p) = { "mout_topc_cc_pll",
 	"ffac_topc_cc_pll_div2"};
-PNAME(mout_sclk_mfc_pll_cmuc_p) = { "mout_mfc_pll_ctrl",
+PNAME(mout_topc_mfc_pll_half_p) = { "mout_topc_mfc_pll",
 	"ffac_topc_mfc_pll_div2"};
 
 
-PNAME(mout_sclk_bus0_pll_out_p) = {"mout_bus0_pll_ctrl",
+PNAME(mout_topc_bus0_pll_out_p) = {"mout_topc_bus0_pll",
 	"ffac_topc_bus0_pll_div2"};
 
 static unsigned long topc_clk_regs[] __initdata = {
@@ -90,22 +90,26 @@ static unsigned long topc_clk_regs[] __initdata = {
 };
 
 static struct samsung_mux_clock topc_mux_clks[] __initdata = {
-	MUX(0, "mout_bus0_pll_ctrl", mout_bus0_pll_ctrl_p, MUX_SEL_TOPC0, 0, 1),
-	MUX(0, "mout_bus1_pll_ctrl", mout_bus1_pll_ctrl_p, MUX_SEL_TOPC0, 4, 1),
-	MUX(0, "mout_cc_pll_ctrl", mout_cc_pll_ctrl_p, MUX_SEL_TOPC0, 8, 1),
-	MUX(0, "mout_mfc_pll_ctrl", mout_mfc_pll_ctrl_p, MUX_SEL_TOPC0, 12, 1),
-
-	MUX(0, "mout_sclk_bus0_pll_cmuc", mout_sclk_bus0_pll_cmuc_p,
+	MUX(0, "mout_topc_bus0_pll", mout_topc_bus0_pll_ctrl_p,
+		MUX_SEL_TOPC0, 0, 1),
+	MUX(0, "mout_topc_bus1_pll", mout_topc_bus1_pll_ctrl_p,
+		MUX_SEL_TOPC0, 4, 1),
+	MUX(0, "mout_topc_cc_pll", mout_topc_cc_pll_ctrl_p,
+		MUX_SEL_TOPC0, 8, 1),
+	MUX(0, "mout_topc_mfc_pll", mout_topc_mfc_pll_ctrl_p,
+		MUX_SEL_TOPC0, 12, 1),
+	MUX(0, "mout_topc_bus0_pll_half", mout_topc_bus0_pll_half_p,
 		MUX_SEL_TOPC0, 16, 2),
-	MUX(0, "mout_sclk_bus1_pll_cmuc", mout_sclk_bus1_pll_cmuc_p,
+	MUX(0, "mout_topc_bus1_pll_half", mout_topc_bus1_pll_half_p,
 		MUX_SEL_TOPC0, 20, 1),
-	MUX(0, "mout_sclk_cc_pll_cmuc", mout_sclk_cc_pll_cmuc_p,
+	MUX(0, "mout_topc_cc_pll_half", mout_topc_cc_pll_half_p,
 		MUX_SEL_TOPC0, 24, 1),
-	MUX(0, "mout_sclk_mfc_pll_cmuc", mout_sclk_mfc_pll_cmuc_p,
+	MUX(0, "mout_topc_mfc_pll_half", mout_topc_mfc_pll_half_p,
 		MUX_SEL_TOPC0, 28, 1),
 
-	MUX(0, "mout_aud_pll_ctrl", mout_aud_pll_ctrl_p, MUX_SEL_TOPC1, 0, 1),
-	MUX(0, "mout_sclk_bus0_pll_out", mout_sclk_bus0_pll_out_p,
+	MUX(0, "mout_topc_aud_pll", mout_topc_aud_pll_ctrl_p,
+		MUX_SEL_TOPC1, 0, 1),
+	MUX(0, "mout_topc_bus0_pll_out", mout_topc_bus0_pll_out_p,
 		MUX_SEL_TOPC1, 16, 1),
 
 	MUX(0, "mout_aclk_ccore_133", mout_topc_group2,	MUX_SEL_TOPC2, 4, 2),
@@ -123,15 +127,15 @@ static struct samsung_div_clock topc_div_clks[] __initdata = {
 	DIV(DOUT_ACLK_PERIS, "dout_aclk_peris_66", "mout_aclk_peris_66",
 		DIV_TOPC1, 24, 4),
 
-	DIV(DOUT_SCLK_BUS0_PLL, "dout_sclk_bus0_pll", "mout_sclk_bus0_pll_out",
+	DIV(DOUT_SCLK_BUS0_PLL, "dout_sclk_bus0_pll", "mout_topc_bus0_pll_out",
 		DIV_TOPC3, 0, 4),
-	DIV(DOUT_SCLK_BUS1_PLL, "dout_sclk_bus1_pll", "mout_bus1_pll_ctrl",
+	DIV(DOUT_SCLK_BUS1_PLL, "dout_sclk_bus1_pll", "mout_topc_bus1_pll",
 		DIV_TOPC3, 8, 4),
-	DIV(DOUT_SCLK_CC_PLL, "dout_sclk_cc_pll", "mout_cc_pll_ctrl",
+	DIV(DOUT_SCLK_CC_PLL, "dout_sclk_cc_pll", "mout_topc_cc_pll",
 		DIV_TOPC3, 12, 4),
-	DIV(DOUT_SCLK_MFC_PLL, "dout_sclk_mfc_pll", "mout_mfc_pll_ctrl",
+	DIV(DOUT_SCLK_MFC_PLL, "dout_sclk_mfc_pll", "mout_topc_mfc_pll",
 		DIV_TOPC3, 16, 4),
-	DIV(DOUT_SCLK_AUD_PLL, "dout_sclk_aud_pll", "mout_aud_pll_ctrl",
+	DIV(DOUT_SCLK_AUD_PLL, "dout_sclk_aud_pll", "mout_topc_aud_pll",
 		DIV_TOPC3, 28, 4),
 };
 
-- 
1.7.10.4
