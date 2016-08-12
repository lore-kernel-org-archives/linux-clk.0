Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-dm3nam03on0069.outbound.protection.outlook.com ([104.47.41.69]:59608
	"EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752905AbcHLSmR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 12 Aug 2016 14:42:17 -0400
From: Fabio Estevam <fabio.estevam@nxp.com>
To: <sboyd@codeaurora.org>
CC: <shawnguo@kernel.org>, <stefan@agner.ch>, <festevam@gmail.com>,
	<linux-clk@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH 3/3] clk: imx7d: Add SAI IPG clocks
Date: Fri, 12 Aug 2016 15:26:56 -0300
Message-ID: <1471026416-11769-3-git-send-email-fabio.estevam@nxp.com>
In-Reply-To: <1471026416-11769-1-git-send-email-fabio.estevam@nxp.com>
References: <1471026416-11769-1-git-send-email-fabio.estevam@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The SAI_IPG clocks are enabled by the same bits that control SAI_ROOT_CLK
clocks, so represent them as shared clocks.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/clk/imx/clk-imx7d.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 6631ff5..c7f3655 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -22,6 +22,10 @@
 
 #include "clk.h"
 
+static u32 share_count_sai1;
+static u32 share_count_sai2;
+static u32 share_count_sai3;
+
 static struct clk *clks[IMX7D_CLK_END];
 static const char *arm_a7_sel[] = { "osc", "pll_arm_main_clk",
 	"pll_enet_500m_clk", "pll_dram_main_clk",
@@ -787,9 +791,12 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	clks[IMX7D_MIPI_DSI_ROOT_CLK] = imx_clk_gate4("mipi_dsi_root_clk", "mipi_dsi_post_div", base + 0x4650, 0);
 	clks[IMX7D_MIPI_CSI_ROOT_CLK] = imx_clk_gate4("mipi_csi_root_clk", "mipi_csi_post_div", base + 0x4640, 0);
 	clks[IMX7D_MIPI_DPHY_ROOT_CLK] = imx_clk_gate4("mipi_dphy_root_clk", "mipi_dphy_post_div", base + 0x4660, 0);
-	clks[IMX7D_SAI1_ROOT_CLK] = imx_clk_gate4("sai1_root_clk", "sai1_post_div", base + 0x48c0, 0);
-	clks[IMX7D_SAI2_ROOT_CLK] = imx_clk_gate4("sai2_root_clk", "sai2_post_div", base + 0x48d0, 0);
-	clks[IMX7D_SAI3_ROOT_CLK] = imx_clk_gate4("sai3_root_clk", "sai3_post_div", base + 0x48e0, 0);
+	clks[IMX7D_SAI1_ROOT_CLK] = imx_clk_gate2_shared2("sai1_root_clk", "sai1_post_div", base + 0x48c0, 0, &share_count_sai1);
+	clks[IMX7D_SAI1_IPG_CLK]  = imx_clk_gate2_shared2("sai1_ipg_clk",  "ipg_root_clk",  base + 0x48c0, 0, &share_count_sai1);
+	clks[IMX7D_SAI2_ROOT_CLK] = imx_clk_gate2_shared2("sai2_root_clk", "sai2_post_div", base + 0x48d0, 0, &share_count_sai2);
+	clks[IMX7D_SAI2_IPG_CLK]  = imx_clk_gate2_shared2("sai2_ipg_clk",  "ipg_root_clk",  base + 0x48d0, 0, &share_count_sai2);
+	clks[IMX7D_SAI3_ROOT_CLK] = imx_clk_gate2_shared2("sai3_root_clk", "sai3_post_div", base + 0x48e0, 0, &share_count_sai3);
+	clks[IMX7D_SAI3_IPG_CLK]  = imx_clk_gate2_shared2("sai3_ipg_clk",  "ipg_root_clk",  base + 0x48e0, 0, &share_count_sai3);
 	clks[IMX7D_SPDIF_ROOT_CLK] = imx_clk_gate4("spdif_root_clk", "spdif_post_div", base + 0x44d0, 0);
 	clks[IMX7D_ENET1_REF_ROOT_CLK] = imx_clk_gate4("enet1_ref_root_clk", "enet1_ref_post_div", base + 0x44e0, 0);
 	clks[IMX7D_ENET1_TIME_ROOT_CLK] = imx_clk_gate4("enet1_time_root_clk", "enet1_time_post_div", base + 0x44f0, 0);
-- 
1.9.1

