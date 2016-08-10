Return-Path: <fabio.estevam@nxp.com>
From: Fabio Estevam <fabio.estevam@nxp.com>
To: <mturquette@baylibre.com>
CC: <shawnguo@kernel.org>, <stefan@agner.ch>, <festevam@gmail.com>,
	<linux-clk@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH] clk: imx7d: Add the clock for SDMA
Date: Wed, 10 Aug 2016 13:03:31 -0300
Message-ID: <1470845011-13079-1-git-send-email-fabio.estevam@nxp.com>
Return-Path: fabio.estevam@nxp.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Add IMX7D_SDMA_CORE_CLK clock so that SDMA can be functional.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/clk/imx/clk-imx7d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 9257972..c24677d 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -779,6 +779,7 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	clks[IMX7D_DRAM_PHYM_ALT_ROOT_CLK] = imx_clk_gate4("dram_phym_alt_root_clk", "dram_phym_alt_post_div", base + 0x4130, 0);
 	clks[IMX7D_DRAM_ALT_ROOT_CLK] = imx_clk_gate4("dram_alt_root_clk", "dram_alt_post_div", base + 0x4130, 0);
 	clks[IMX7D_USB_HSIC_ROOT_CLK] = imx_clk_gate4("usb_hsic_root_clk", "usb_hsic_post_div", base + 0x4420, 0);
+	clks[IMX7D_SDMA_CORE_CLK] = imx_clk_gate4("sdma_root_clk", "ahb_root_clk", base + 0x4480, 0);
 	clks[IMX7D_PCIE_CTRL_ROOT_CLK] = imx_clk_gate4("pcie_ctrl_root_clk", "pcie_ctrl_post_div", base + 0x4600, 0);
 	clks[IMX7D_PCIE_PHY_ROOT_CLK] = imx_clk_gate4("pcie_phy_root_clk", "pcie_phy_post_div", base + 0x4600, 0);
 	clks[IMX7D_EPDC_PIXEL_ROOT_CLK] = imx_clk_gate4("epdc_pixel_root_clk", "epdc_pixel_post_div", base + 0x44a0, 0);
-- 
1.9.1
