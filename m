Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:35701 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754181AbcHXVV0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Aug 2016 17:21:26 -0400
Received: by mail-yw0-f193.google.com with SMTP id r9so1457548ywg.2
        for <linux-clk@vger.kernel.org>; Wed, 24 Aug 2016 14:20:06 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sboyd@codeaurora.org
Cc: shawnguo@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH]  clk: imx7d: Add PLL_AUDIO_TEST_DIV/POST_DIV clocks
Date: Wed, 24 Aug 2016 18:19:54 -0300
Message-Id: <1472073594-6501-1-git-send-email-festevam@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

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
 drivers/clk/imx/clk-imx7d.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 6bafcaa..74c2df4 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -26,6 +26,22 @@ static u32 share_count_sai1;
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
@@ -431,9 +447,14 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	clks[IMX7D_PLL_ARM_MAIN_CLK] = imx_clk_gate("pll_arm_main_clk", "pll_arm_main_bypass", base + 0x60, 13);
 	clks[IMX7D_PLL_DRAM_MAIN_CLK] = imx_clk_gate("pll_dram_main_clk", "pll_dram_main_bypass", base + 0x70, 13);
 	clks[IMX7D_PLL_SYS_MAIN_CLK] = imx_clk_gate("pll_sys_main_clk", "pll_sys_main_bypass", base + 0xb0, 13);
-	clks[IMX7D_PLL_AUDIO_MAIN_CLK] = imx_clk_gate("pll_audio_main_clk", "pll_audio_main_bypass", base + 0xf0, 13);
+	clks[IMX7D_PLL_AUDIO_MAIN_CLK] = imx_clk_gate("pll_audio_main_clk", "pll_audio_test_div", base + 0xf0, 13);
 	clks[IMX7D_PLL_VIDEO_MAIN_CLK] = imx_clk_gate("pll_video_main_clk", "pll_video_main_bypass", base + 0x130, 13);
 
+	clks[IMX7D_PLL_AUDIO_TEST_DIV]  = clk_register_divider_table(NULL, "pll_audio_test_div", "pll_audio_main_bypass",
+				CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE, base + 0xf0, 19, 2, 0, test_div_table, &imx_ccm_lock);
+	clks[IMX7D_PLL_AUDIO_POST_DIV] = clk_register_divider_table(NULL, "pll_audio_post_div", "pll_audio_main_clk",
+				CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE, base + 0xf0, 22, 2, 0, post_div_table, &imx_ccm_lock);
+
 	clks[IMX7D_PLL_SYS_PFD0_392M_CLK] = imx_clk_pfd("pll_sys_pfd0_392m_clk", "pll_sys_main_clk", base + 0xc0, 0);
 	clks[IMX7D_PLL_SYS_PFD1_332M_CLK] = imx_clk_pfd("pll_sys_pfd1_332m_clk", "pll_sys_main_clk", base + 0xc0, 1);
 	clks[IMX7D_PLL_SYS_PFD2_270M_CLK] = imx_clk_pfd("pll_sys_pfd2_270m_clk", "pll_sys_main_clk", base + 0xc0, 2);
-- 
1.9.1

