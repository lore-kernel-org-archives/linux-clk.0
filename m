Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 4/7] clk: qcom: Add freq tables for a few rcgs
Date: Wed, 19 Oct 2016 16:58:40 +0530
Message-Id: <1476876523-27378-5-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
References: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add frequency tables for a few RCG clocks in msm8996

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 3c85e05..f6124cf 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -464,10 +464,18 @@ enum {
 	},
 };
 
+static struct freq_tbl ftbl_sdcc1_ice_core_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(150000000, P_GPLL0, 4, 0, 0),
+	F(300000000, P_GPLL0, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 sdcc1_ice_core_clk_src = {
 	.cmd_rcgr = 0x13024,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_gpll4_gpll0_early_div_map,
+	.freq_tbl = ftbl_sdcc1_ice_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_ice_core_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll4_gpll0_early_div,
@@ -1230,10 +1238,18 @@ enum {
 	},
 };
 
+static const struct freq_tbl ftbl_ufs_ice_core_clk_src[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(150000000, P_GPLL0, 4, 0, 0),
+	F(300000000, P_GPLL0, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 ufs_ice_core_clk_src = {
 	.cmd_rcgr = 0x76014,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
+	.freq_tbl = ftbl_ufs_ice_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_ice_core_clk_src",
 		.parent_names = gcc_xo_gpll0,
@@ -1242,10 +1258,19 @@ enum {
 	},
 };
 
+static const struct freq_tbl ftbl_qspi_ser_clk_src[] = {
+	F(75000000, P_GPLL0, 8, 0, 0),
+	F(150000000, P_GPLL0, 4, 0, 0),
+	F(256000000, P_GPLL4, 1.5, 0, 0),
+	F(300000000, P_GPLL0, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 qspi_ser_clk_src = {
 	.cmd_rcgr = 0x8b00c,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div_map,
+	.freq_tbl = ftbl_qspi_ser_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "qspi_ser_clk_src",
 		.parent_names = gcc_xo_gpll0_gpll1_early_div_gpll1_gpll4_gpll0_early_div,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
