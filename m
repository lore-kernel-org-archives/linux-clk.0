Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-cys01nam02on0042.outbound.protection.outlook.com ([104.47.37.42]:38080
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S933810AbcH3RsZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 30 Aug 2016 13:48:25 -0400
From: Fabio Estevam <fabio.estevam@nxp.com>
To: <sboyd@codeaurora.org>
CC: <shawnguo@kernel.org>, <festevam@gmail.com>, <stefan@agner.ch>,
        <linux-clk@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2]  clk: imx7d: Add PLL_AUDIO_TEST_DIV/POST_DIV clocks
Date: Tue, 30 Aug 2016 14:33:51 -0300
Message-ID: <1472578431-11257-1-git-send-email-fabio.estevam@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Currently we see the following error when using the SAI audio
driver on mx7:

Division by zero in kernel.                                      
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.8.0-rc3-next-20160823
Hardware name: Freescale i.MX7 Dual (Device Tree)                
Backtrace:                                                       
[<c010b70c>] (dump_backtrace) from [<c010b8a8>] (show_stack+0x18)
r6:60000013 r5:ffffffff r4:00000000 r3:00000000                 
[<c010b890>] (show_stack) from [<c03e9324>] (dump_stack+0xb0/0xe)
[<c03e9274>] (dump_stack) from [<c010b578>] (__div0+0x18/0x20)   
r8:00000000 r7:ffffffff r6:ffffffff r5:00000000 r4:00000000 r3:0
[<c010b560>] (__div0) from [<c03e795c>] (Ldiv0_64+0x8/0x18)      
[<c06cd860>] (divider_get_val) from [<c06cda28>] (clk_divider_se)

This error happens due to the lack of definition of the
IMX7D_PLL_AUDIO_TEST_DIV/IMX7D_PLL_AUDIO_POST_DIV clocks.

Add support for them.

Tested on a imx7s-warp board.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Also use pll_audio_post_div in the muxes. (Stefan)

 drivers/clk/imx/clk-imx7d.c | 101 ++++++++++++++++++++++++++------------------
 1 file changed, 61 insertions(+), 40 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 6bafcaa..86e2fdb 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -26,43 +26,59 @@ static u32 share_count_sai1;
 static u32 share_count_sai2;
 static u32 share_count_sai3;
 
+static struct clk_div_table test_div_table[] = {
+	{ .val = 3, .div = 1, },
+	{ .val = 2, .div = 1, },
+	{ .val = 1, .div = 2, },
+	{ .val = 0, .div = 4, },
+	{ }
+};
+
+static struct clk_div_table post_div_table[] = {
+	{ .val = 3, .div = 4, },
+	{ .val = 2, .div = 1, },
+	{ .val = 1, .div = 2, },
+	{ .val = 0, .div = 1, },
+	{ }
+};
+
 static struct clk *clks[IMX7D_CLK_END];
 static const char *arm_a7_sel[] = { "osc", "pll_arm_main_clk",
 	"pll_enet_500m_clk", "pll_dram_main_clk",
-	"pll_sys_main_clk", "pll_sys_pfd0_392m_clk", "pll_audio_main_clk",
+	"pll_sys_main_clk", "pll_sys_pfd0_392m_clk", "pll_audio_post_div",
 	"pll_usb_main_clk", };
 
 static const char *arm_m4_sel[] = { "osc", "pll_sys_main_240m_clk",
 	"pll_enet_250m_clk", "pll_sys_pfd2_270m_clk",
-	"pll_dram_533m_clk", "pll_audio_main_clk", "pll_video_main_clk",
+	"pll_dram_533m_clk", "pll_audio_post_div", "pll_video_main_clk",
 	"pll_usb_main_clk", };
 
 static const char *arm_m0_sel[] = { "osc", "pll_sys_main_120m_clk",
 	"pll_enet_125m_clk", "pll_sys_pfd2_135m_clk",
-	"pll_dram_533m_clk", "pll_audio_main_clk", "pll_video_main_clk",
+	"pll_dram_533m_clk", "pll_audio_post_div", "pll_video_main_clk",
 	"pll_usb_main_clk", };
 
 static const char *axi_sel[] = { "osc", "pll_sys_pfd1_332m_clk",
 	"pll_dram_533m_clk", "pll_enet_250m_clk", "pll_sys_pfd5_clk",
-	"pll_audio_main_clk", "pll_video_main_clk", "pll_sys_pfd7_clk", };
+	"pll_audio_post_div", "pll_video_main_clk", "pll_sys_pfd7_clk", };
 
 static const char *disp_axi_sel[] = { "osc", "pll_sys_pfd1_332m_clk",
 	"pll_dram_533m_clk", "pll_enet_250m_clk", "pll_sys_pfd6_clk",
-	"pll_sys_pfd7_clk", "pll_audio_main_clk", "pll_video_main_clk", };
+	"pll_sys_pfd7_clk", "pll_audio_post_div", "pll_video_main_clk", };
 
 static const char *enet_axi_sel[] = { "osc", "pll_sys_pfd2_270m_clk",
 	"pll_dram_533m_clk", "pll_enet_250m_clk",
-	"pll_sys_main_240m_clk", "pll_audio_main_clk", "pll_video_main_clk",
+	"pll_sys_main_240m_clk", "pll_audio_post_div", "pll_video_main_clk",
 	"pll_sys_pfd4_clk", };
 
 static const char *nand_usdhc_bus_sel[] = { "osc", "pll_sys_pfd2_270m_clk",
 	"pll_dram_533m_clk", "pll_sys_main_240m_clk",
 	"pll_sys_pfd2_135m_clk", "pll_sys_pfd6_clk", "pll_enet_250m_clk",
-	"pll_audio_main_clk", };
+	"pll_audio_post_div", };
 
 static const char *ahb_channel_sel[] = { "osc", "pll_sys_pfd2_270m_clk",
 	"pll_dram_533m_clk", "pll_sys_pfd0_392m_clk",
-	"pll_enet_125m_clk", "pll_usb_main_clk", "pll_audio_main_clk",
+	"pll_enet_125m_clk", "pll_usb_main_clk", "pll_audio_post_div",
 	"pll_video_main_clk", };
 
 static const char *dram_phym_sel[] = { "pll_dram_main_clk",
@@ -73,13 +89,13 @@ static const char *dram_sel[] = { "pll_dram_main_clk",
 
 static const char *dram_phym_alt_sel[] = { "osc", "pll_dram_533m_clk",
 	"pll_sys_main_clk", "pll_enet_500m_clk",
-	"pll_usb_main_clk", "pll_sys_pfd7_clk", "pll_audio_main_clk",
+	"pll_usb_main_clk", "pll_sys_pfd7_clk", "pll_audio_post_div",
 	"pll_video_main_clk", };
 
 static const char *dram_alt_sel[] = { "osc", "pll_dram_533m_clk",
 	"pll_sys_main_clk", "pll_enet_500m_clk",
 	"pll_enet_250m_clk", "pll_sys_pfd0_392m_clk",
-	"pll_audio_main_clk", "pll_sys_pfd2_270m_clk", };
+	"pll_audio_post_div", "pll_sys_pfd2_270m_clk", };
 
 static const char *usb_hsic_sel[] = { "osc", "pll_sys_main_clk",
 	"pll_usb_main_clk", "pll_sys_pfd3_clk", "pll_sys_pfd4_clk",
@@ -105,53 +121,53 @@ static const char *lcdif_pixel_sel[] = { "osc", "pll_sys_pfd5_clk",
 
 static const char *mipi_dsi_sel[] = { "osc", "pll_sys_pfd5_clk",
 	"pll_sys_pfd3_clk", "pll_sys_main_clk", "pll_sys_pfd0_196m_clk",
-	"pll_dram_533m_clk", "pll_video_main_clk", "pll_audio_main_clk", };
+	"pll_dram_533m_clk", "pll_video_main_clk", "pll_audio_post_div", };
 
 static const char *mipi_csi_sel[] = { "osc", "pll_sys_pfd4_clk",
 	"pll_sys_pfd3_clk", "pll_sys_main_clk", "pll_sys_pfd0_196m_clk",
-	"pll_dram_533m_clk", "pll_video_main_clk", "pll_audio_main_clk", };
+	"pll_dram_533m_clk", "pll_video_main_clk", "pll_audio_post_div", };
 
 static const char *mipi_dphy_sel[] = { "osc", "pll_sys_main_120m_clk",
 	"pll_dram_533m_clk", "pll_sys_pfd5_clk", "ref_1m_clk", "ext_clk_2",
 	"pll_video_main_clk", "ext_clk_3", };
 
 static const char *sai1_sel[] = { "osc", "pll_sys_pfd2_135m_clk",
-	"pll_audio_main_clk", "pll_dram_533m_clk", "pll_video_main_clk",
+	"pll_audio_post_div", "pll_dram_533m_clk", "pll_video_main_clk",
 	"pll_sys_pfd4_clk", "pll_enet_125m_clk", "ext_clk_2", };
 
 static const char *sai2_sel[] = { "osc", "pll_sys_pfd2_135m_clk",
-	"pll_audio_main_clk", "pll_dram_533m_clk", "pll_video_main_clk",
+	"pll_audio_post_div", "pll_dram_533m_clk", "pll_video_main_clk",
 	"pll_sys_pfd4_clk", "pll_enet_125m_clk", "ext_clk_2", };
 
 static const char *sai3_sel[] = { "osc", "pll_sys_pfd2_135m_clk",
-	"pll_audio_main_clk", "pll_dram_533m_clk", "pll_video_main_clk",
+	"pll_audio_post_div", "pll_dram_533m_clk", "pll_video_main_clk",
 	"pll_sys_pfd4_clk", "pll_enet_125m_clk", "ext_clk_3", };
 
 static const char *spdif_sel[] = { "osc", "pll_sys_pfd2_135m_clk",
-	"pll_audio_main_clk", "pll_dram_533m_clk", "pll_video_main_clk",
+	"pll_audio_post_div", "pll_dram_533m_clk", "pll_video_main_clk",
 	"pll_sys_pfd4_clk", "pll_enet_125m_clk", "ext_3_clk", };
 
 static const char *enet1_ref_sel[] = { "osc", "pll_enet_125m_clk",
 	"pll_enet_50m_clk", "pll_enet_25m_clk",
-	"pll_sys_main_120m_clk", "pll_audio_main_clk", "pll_video_main_clk",
+	"pll_sys_main_120m_clk", "pll_audio_post_div", "pll_video_main_clk",
 	"ext_clk_4", };
 
 static const char *enet1_time_sel[] = { "osc", "pll_enet_100m_clk",
-	"pll_audio_main_clk", "ext_clk_1", "ext_clk_2", "ext_clk_3",
+	"pll_audio_post_div", "ext_clk_1", "ext_clk_2", "ext_clk_3",
 	"ext_clk_4", "pll_video_main_clk", };
 
 static const char *enet2_ref_sel[] = { "osc", "pll_enet_125m_clk",
 	"pll_enet_50m_clk", "pll_enet_25m_clk",
-	"pll_sys_main_120m_clk", "pll_audio_main_clk", "pll_video_main_clk",
+	"pll_sys_main_120m_clk", "pll_audio_post_div", "pll_video_main_clk",
 	"ext_clk_4", };
 
 static const char *enet2_time_sel[] = { "osc", "pll_enet_100m_clk",
-	"pll_audio_main_clk", "ext_clk_1", "ext_clk_2", "ext_clk_3",
+	"pll_audio_post_div", "ext_clk_1", "ext_clk_2", "ext_clk_3",
 	"ext_clk_4", "pll_video_main_clk", };
 
 static const char *enet_phy_ref_sel[] = { "osc", "pll_enet_25m_clk",
 	"pll_enet_50m_clk", "pll_enet_125m_clk",
-	"pll_dram_533m_clk", "pll_audio_main_clk", "pll_video_main_clk",
+	"pll_dram_533m_clk", "pll_audio_post_div", "pll_video_main_clk",
 	"pll_sys_pfd3_clk", };
 
 static const char *eim_sel[] = { "osc", "pll_sys_pfd2_135m_clk",
@@ -192,22 +208,22 @@ static const char *can2_sel[] = { "osc", "pll_sys_main_120m_clk",
 
 static const char *i2c1_sel[] = { "osc", "pll_sys_main_120m_clk",
 	"pll_enet_50m_clk", "pll_dram_533m_clk",
-	"pll_audio_main_clk", "pll_video_main_clk", "pll_usb_main_clk",
+	"pll_audio_post_div", "pll_video_main_clk", "pll_usb_main_clk",
 	"pll_sys_pfd2_135m_clk", };
 
 static const char *i2c2_sel[] = { "osc", "pll_sys_main_120m_clk",
 	"pll_enet_50m_clk", "pll_dram_533m_clk",
-	"pll_audio_main_clk", "pll_video_main_clk", "pll_usb_main_clk",
+	"pll_audio_post_div", "pll_video_main_clk", "pll_usb_main_clk",
 	"pll_sys_pfd2_135m_clk", };
 
 static const char *i2c3_sel[] = { "osc", "pll_sys_main_120m_clk",
 	"pll_enet_50m_clk", "pll_dram_533m_clk",
-	"pll_audio_main_clk", "pll_video_main_clk", "pll_usb_main_clk",
+	"pll_audio_post_div", "pll_video_main_clk", "pll_usb_main_clk",
 	"pll_sys_pfd2_135m_clk", };
 
 static const char *i2c4_sel[] = { "osc", "pll_sys_main_120m_clk",
 	"pll_enet_50m_clk", "pll_dram_533m_clk",
-	"pll_audio_main_clk", "pll_video_main_clk", "pll_usb_main_clk",
+	"pll_audio_post_div", "pll_video_main_clk", "pll_usb_main_clk",
 	"pll_sys_pfd2_135m_clk", };
 
 static const char *uart1_sel[] = { "osc", "pll_sys_main_240m_clk",
@@ -266,32 +282,32 @@ static const char *ecspi4_sel[] = { "osc", "pll_sys_main_240m_clk",
 	"pll_usb_main_clk", };
 
 static const char *pwm1_sel[] = { "osc", "pll_enet_100m_clk",
-	"pll_sys_main_120m_clk", "pll_enet_40m_clk", "pll_audio_main_clk",
+	"pll_sys_main_120m_clk", "pll_enet_40m_clk", "pll_audio_post_div",
 	"ext_clk_1", "ref_1m_clk", "pll_video_main_clk", };
 
 static const char *pwm2_sel[] = { "osc", "pll_enet_100m_clk",
-	"pll_sys_main_120m_clk", "pll_enet_40m_clk", "pll_audio_main_clk",
+	"pll_sys_main_120m_clk", "pll_enet_40m_clk", "pll_audio_post_div",
 	"ext_clk_1", "ref_1m_clk", "pll_video_main_clk", };
 
 static const char *pwm3_sel[] = { "osc", "pll_enet_100m_clk",
-	"pll_sys_main_120m_clk", "pll_enet_40m_clk", "pll_audio_main_clk",
+	"pll_sys_main_120m_clk", "pll_enet_40m_clk", "pll_audio_post_div",
 	"ext_clk_2", "ref_1m_clk", "pll_video_main_clk", };
 
 static const char *pwm4_sel[] = { "osc", "pll_enet_100m_clk",
-	"pll_sys_main_120m_clk", "pll_enet_40m_clk", "pll_audio_main_clk",
+	"pll_sys_main_120m_clk", "pll_enet_40m_clk", "pll_audio_post_div",
 	"ext_clk_2", "ref_1m_clk", "pll_video_main_clk", };
 
 static const char *flextimer1_sel[] = { "osc", "pll_enet_100m_clk",
-	"pll_sys_main_120m_clk", "pll_enet_40m_clk", "pll_audio_main_clk",
+	"pll_sys_main_120m_clk", "pll_enet_40m_clk", "pll_audio_post_div",
 	"ext_clk_3", "ref_1m_clk", "pll_video_main_clk", };
 
 static const char *flextimer2_sel[] = { "osc", "pll_enet_100m_clk",
-	"pll_sys_main_120m_clk", "pll_enet_40m_clk", "pll_audio_main_clk",
+	"pll_sys_main_120m_clk", "pll_enet_40m_clk", "pll_audio_post_div",
 	"ext_clk_3", "ref_1m_clk", "pll_video_main_clk", };
 
 static const char *sim1_sel[] = { "osc", "pll_sys_pfd2_135m_clk",
 	"pll_sys_main_120m_clk", "pll_dram_533m_clk",
-	"pll_usb_main_clk", "pll_audio_main_clk", "pll_enet_125m_clk",
+	"pll_usb_main_clk", "pll_audio_post_div", "pll_enet_125m_clk",
 	"pll_sys_pfd7_clk", };
 
 static const char *sim2_sel[] = { "osc", "pll_sys_pfd2_135m_clk",
@@ -301,19 +317,19 @@ static const char *sim2_sel[] = { "osc", "pll_sys_pfd2_135m_clk",
 
 static const char *gpt1_sel[] = { "osc", "pll_enet_100m_clk",
 	"pll_sys_pfd0_392m_clk", "pll_enet_40m_clk", "pll_video_main_clk",
-	"ref_1m_clk", "pll_audio_main_clk", "ext_clk_1", };
+	"ref_1m_clk", "pll_audio_post_div", "ext_clk_1", };
 
 static const char *gpt2_sel[] = { "osc", "pll_enet_100m_clk",
 	"pll_sys_pfd0_392m_clk", "pll_enet_40m_clk", "pll_video_main_clk",
-	"ref_1m_clk", "pll_audio_main_clk", "ext_clk_2", };
+	"ref_1m_clk", "pll_audio_post_div", "ext_clk_2", };
 
 static const char *gpt3_sel[] = { "osc", "pll_enet_100m_clk",
 	"pll_sys_pfd0_392m_clk", "pll_enet_40m_clk", "pll_video_main_clk",
-	"ref_1m_clk", "pll_audio_main_clk", "ext_clk_3", };
+	"ref_1m_clk", "pll_audio_post_div", "ext_clk_3", };
 
 static const char *gpt4_sel[] = { "osc", "pll_enet_100m_clk",
 	"pll_sys_pfd0_392m_clk", "pll_enet_40m_clk", "pll_video_main_clk",
-	"ref_1m_clk", "pll_audio_main_clk", "ext_clk_4", };
+	"ref_1m_clk", "pll_audio_post_div", "ext_clk_4", };
 
 static const char *trace_sel[] = { "osc", "pll_sys_pfd2_135m_clk",
 	"pll_sys_main_120m_clk", "pll_dram_533m_clk",
@@ -327,12 +343,12 @@ static const char *wdog_sel[] = { "osc", "pll_sys_pfd2_135m_clk",
 
 static const char *csi_mclk_sel[] = { "osc", "pll_sys_pfd2_135m_clk",
 	"pll_sys_main_120m_clk", "pll_dram_533m_clk",
-	"pll_enet_125m_clk", "pll_audio_main_clk", "pll_video_main_clk",
+	"pll_enet_125m_clk", "pll_audio_post_div", "pll_video_main_clk",
 	"pll_usb_main_clk", };
 
 static const char *audio_mclk_sel[] = { "osc", "pll_sys_pfd2_135m_clk",
 	"pll_sys_main_120m_clk", "pll_dram_533m_clk",
-	"pll_enet_125m_clk", "pll_audio_main_clk", "pll_video_main_clk",
+	"pll_enet_125m_clk", "pll_audio_post_div", "pll_video_main_clk",
 	"pll_usb_main_clk", };
 
 static const char *wrclk_sel[] = { "osc", "pll_enet_40m_clk",
@@ -346,13 +362,13 @@ static const char *clko1_sel[] = { "osc", "pll_sys_main_clk",
 
 static const char *clko2_sel[] = { "osc", "pll_sys_main_240m_clk",
 	"pll_sys_pfd0_392m_clk", "pll_sys_pfd1_166m_clk", "pll_sys_pfd4_clk",
-	"pll_audio_main_clk", "pll_video_main_clk", "ckil", };
+	"pll_audio_post_div", "pll_video_main_clk", "ckil", };
 
 static const char *lvds1_sel[] = { "pll_arm_main_clk",
 	"pll_sys_main_clk", "pll_sys_pfd0_392m_clk", "pll_sys_pfd1_332m_clk",
 	"pll_sys_pfd2_270m_clk", "pll_sys_pfd3_clk", "pll_sys_pfd4_clk",
 	"pll_sys_pfd5_clk", "pll_sys_pfd6_clk", "pll_sys_pfd7_clk",
-	"pll_audio_main_clk", "pll_video_main_clk", "pll_enet_500m_clk",
+	"pll_audio_post_div", "pll_video_main_clk", "pll_enet_500m_clk",
 	"pll_enet_250m_clk", "pll_enet_125m_clk", "pll_enet_100m_clk",
 	"pll_enet_50m_clk", "pll_enet_40m_clk", "pll_enet_25m_clk",
 	"pll_dram_main_clk", };
@@ -434,6 +450,11 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	clks[IMX7D_PLL_AUDIO_MAIN_CLK] = imx_clk_gate("pll_audio_main_clk", "pll_audio_main_bypass", base + 0xf0, 13);
 	clks[IMX7D_PLL_VIDEO_MAIN_CLK] = imx_clk_gate("pll_video_main_clk", "pll_video_main_bypass", base + 0x130, 13);
 
+	clks[IMX7D_PLL_AUDIO_TEST_DIV]  = clk_register_divider_table(NULL, "pll_audio_test_div", "pll_audio_main_clk",
+				CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE, base + 0xf0, 19, 2, 0, test_div_table, &imx_ccm_lock);
+	clks[IMX7D_PLL_AUDIO_POST_DIV] = clk_register_divider_table(NULL, "pll_audio_post_div", "pll_audio_test_div",
+				CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE, base + 0xf0, 22, 2, 0, post_div_table, &imx_ccm_lock);
+
 	clks[IMX7D_PLL_SYS_PFD0_392M_CLK] = imx_clk_pfd("pll_sys_pfd0_392m_clk", "pll_sys_main_clk", base + 0xc0, 0);
 	clks[IMX7D_PLL_SYS_PFD1_332M_CLK] = imx_clk_pfd("pll_sys_pfd1_332m_clk", "pll_sys_main_clk", base + 0xc0, 1);
 	clks[IMX7D_PLL_SYS_PFD2_270M_CLK] = imx_clk_pfd("pll_sys_pfd2_270m_clk", "pll_sys_main_clk", base + 0xc0, 2);
-- 
1.9.1

