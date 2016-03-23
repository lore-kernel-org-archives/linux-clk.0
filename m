Return-Path: <mmcclint@codeaurora.org>
From: Matthew McClintock <mmcclint@codeaurora.org>
To: andy.gross@linaro.org,
	linux-arm-msm@vger.kernel.org
Cc: qca-upstream.external@qca.qualcomm.com,
	Matthew McClintock <mmcclint@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Senthilkumar N L <snlakshm@codeaurora.org>,
	Varadarajan Narayanan <varada@codeaurora.org>,
	Pradeep Banavathi <pradeepb@codeaurora.org>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 04/17] clk: qcom: ipq4019: switch remaining defines to enums
Date: Wed, 23 Mar 2016 17:04:59 -0500
Message-Id: <1458770712-10880-5-git-send-email-mmcclint@codeaurora.org>
In-Reply-To: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

When this was added not all the remaining defines were switched over to
use enums, so let's complete that process here

Reported-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 60 ++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index 21def7f..38ada8d 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -129,20 +129,10 @@ static const char * const gcc_xo_ddr_500_200[] = {
 };
 
 #define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
-#define P_XO 0
-#define FE_PLL_200 1
-#define FE_PLL_500 2
-#define DDRC_PLL_666  3
-
-#define DDRC_PLL_666_SDCC  1
-#define FE_PLL_125_DLY 1
-
-#define FE_PLL_WCSS2G 1
-#define FE_PLL_WCSS5G 1
 
 static const struct freq_tbl ftbl_gcc_audio_pwm_clk[] = {
 	F(48000000, P_XO, 1, 0, 0),
-	F(200000000, FE_PLL_200, 1, 0, 0),
+	F(200000000, P_FEPLL200, 1, 0, 0),
 	{ }
 };
 
@@ -334,15 +324,15 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
 };
 
 static const struct freq_tbl ftbl_gcc_blsp1_uart1_2_apps_clk[] = {
-	F(1843200, FE_PLL_200, 1, 144, 15625),
-	F(3686400, FE_PLL_200, 1, 288, 15625),
-	F(7372800, FE_PLL_200, 1, 576, 15625),
-	F(14745600, FE_PLL_200, 1, 1152, 15625),
-	F(16000000, FE_PLL_200, 1, 2, 25),
+	F(1843200, P_FEPLL200, 1, 144, 15625),
+	F(3686400, P_FEPLL200, 1, 288, 15625),
+	F(7372800, P_FEPLL200, 1, 576, 15625),
+	F(14745600, P_FEPLL200, 1, 1152, 15625),
+	F(16000000, P_FEPLL200, 1, 2, 25),
 	F(24000000, P_XO, 1, 1, 2),
-	F(32000000, FE_PLL_200, 1, 4, 25),
-	F(40000000, FE_PLL_200, 1, 1, 5),
-	F(46400000, FE_PLL_200, 1, 29, 125),
+	F(32000000, P_FEPLL200, 1, 4, 25),
+	F(40000000, P_FEPLL200, 1, 1, 5),
+	F(46400000, P_FEPLL200, 1, 29, 125),
 	F(48000000, P_XO, 1, 0, 0),
 	{ }
 };
@@ -410,9 +400,9 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
 };
 
 static const struct freq_tbl ftbl_gcc_gp_clk[] = {
-	F(1250000,  FE_PLL_200, 1, 16, 0),
-	F(2500000,  FE_PLL_200, 1,  8, 0),
-	F(5000000,  FE_PLL_200, 1,  4, 0),
+	F(1250000,  P_FEPLL200, 1, 16, 0),
+	F(2500000,  P_FEPLL200, 1,  8, 0),
+	F(5000000,  P_FEPLL200, 1,  4, 0),
 	{ }
 };
 
@@ -512,11 +502,11 @@ static struct clk_branch gcc_gp3_clk = {
 static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk[] = {
 	F(144000,    P_XO,			1,  3, 240),
 	F(400000,    P_XO,			1,  1, 0),
-	F(20000000,  FE_PLL_500,		1,  1, 25),
-	F(25000000,  FE_PLL_500,		1,  1, 20),
-	F(50000000,  FE_PLL_500,		1,  1, 10),
-	F(100000000, FE_PLL_500,		1,  1, 5),
-	F(193000000, DDRC_PLL_666_SDCC,		1,  0, 0),
+	F(20000000,  P_FEPLL500,		1,  1, 25),
+	F(25000000,  P_FEPLL500,		1,  1, 20),
+	F(50000000,  P_FEPLL500,		1,  1, 10),
+	F(100000000, P_FEPLL500,		1,  1, 5),
+	F(193000000, P_DDRPLL,		1,  0, 0),
 	{ }
 };
 
@@ -536,9 +526,9 @@ static struct clk_rcg2  sdcc1_apps_clk_src = {
 
 static const struct freq_tbl ftbl_gcc_apps_clk[] = {
 	F(48000000, P_XO,	   1, 0, 0),
-	F(200000000, FE_PLL_200,   1, 0, 0),
-	F(500000000, FE_PLL_500,   1, 0, 0),
-	F(626000000, DDRC_PLL_666, 1, 0, 0),
+	F(200000000, P_FEPLL200,   1, 0, 0),
+	F(500000000, P_FEPLL500,   1, 0, 0),
+	F(626000000, P_DDRPLLAPSS, 1, 0, 0),
 	{ }
 };
 
@@ -557,7 +547,7 @@ static struct clk_rcg2 apps_clk_src = {
 
 static const struct freq_tbl ftbl_gcc_apps_ahb_clk[] = {
 	F(48000000, P_XO,	   1, 0, 0),
-	F(100000000, FE_PLL_200,   2, 0, 0),
+	F(100000000, P_FEPLL200,   2, 0, 0),
 	{ }
 };
 
@@ -941,7 +931,7 @@ static struct clk_branch gcc_usb2_mock_utmi_clk = {
 };
 
 static const struct freq_tbl ftbl_gcc_usb30_mock_utmi_clk[] = {
-	F(2000000, FE_PLL_200, 10, 0, 0),
+	F(2000000, P_FEPLL200, 10, 0, 0),
 	{ }
 };
 
@@ -1008,7 +998,7 @@ static struct clk_branch gcc_usb3_mock_utmi_clk = {
 };
 
 static const struct freq_tbl ftbl_gcc_fephy_dly_clk[] = {
-	F(125000000, FE_PLL_125_DLY, 1, 0, 0),
+	F(125000000, P_FEPLL125DLY, 1, 0, 0),
 	{ }
 };
 
@@ -1028,7 +1018,7 @@ static struct clk_rcg2 fephy_125m_dly_clk_src = {
 
 static const struct freq_tbl ftbl_gcc_wcss2g_clk[] = {
 	F(48000000, P_XO, 1, 0, 0),
-	F(250000000, FE_PLL_WCSS2G, 1, 0, 0),
+	F(250000000, P_FEPLLWCSS2G, 1, 0, 0),
 	{ }
 };
 
@@ -1098,7 +1088,7 @@ static struct clk_branch gcc_wcss2g_rtc_clk = {
 
 static const struct freq_tbl ftbl_gcc_wcss5g_clk[] = {
 	F(48000000, P_XO, 1, 0, 0),
-	F(250000000, FE_PLL_WCSS5G, 1, 0, 0),
+	F(250000000, P_FEPLLWCSS5G, 1, 0, 0),
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
