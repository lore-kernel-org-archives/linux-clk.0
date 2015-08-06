Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Anson Huang <b20788@freescale.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH] clk: imx: increase AXI clock rate to 264MHz for i.MX6UL
Date: Thu, 6 Aug 2015 22:13:56 +0800
Message-ID: <1438870436-16061-1-git-send-email-b20788@freescale.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: shawnguo@kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On i.MX6UL, AXI clock rate's design target is 264MHz, but by default
it is only set to 198MHz which is NOT good enough for performance,
this patch increases AXI clock rate from 198MHz to 264MHz to meet
the design target, this is done by switching its parent clock
"periph" from 396MHz PFD to 528MHz PLL.

Signed-off-by: Anson Huang <b20788@freescale.com>
---
 drivers/clk/imx/clk-imx6ul.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index aaa3665..01718d0 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -407,6 +407,24 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 	clk_data.clk_num = ARRAY_SIZE(clks);
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
 
+	/*
+	 * Lower the AHB clock rate before changing the parent clock source,
+	 * as AHB clock rate can NOT be higher than 133MHz, but its parent
+	 * will be switched from 396MHz PFD to 528MHz PLL in order to increase
+	 * AXI clock rate, so we need to lower AHB rate first to make sure at
+	 * any time, AHB rate is <= 133MHz.
+	 */
+	clk_set_rate(clks[IMX6UL_CLK_AHB], 99000000);
+
+	/* Change periph_pre clock to pll2_bus to adjust AXI rate to 264MHz */
+	clk_set_parent(clks[IMX6UL_CLK_PERIPH_CLK2_SEL], clks[IMX6UL_CLK_PLL3_USB_OTG]);
+	clk_set_parent(clks[IMX6UL_CLK_PERIPH], clks[IMX6UL_CLK_PERIPH_CLK2]);
+	clk_set_parent(clks[IMX6UL_CLK_PERIPH_PRE], clks[IMX6UL_CLK_PLL2_BUS]);
+	clk_set_parent(clks[IMX6UL_CLK_PERIPH], clks[IMX6UL_CLK_PERIPH_PRE]);
+
+	/* Make sure AHB rate is 132MHz  */
+	clk_set_rate(clks[IMX6UL_CLK_AHB], 132000000);
+
 	/* set perclk to from OSC */
 	clk_set_parent(clks[IMX6UL_CLK_PERCLK_SEL], clks[IMX6UL_CLK_OSC]);
 
-- 
1.9.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
