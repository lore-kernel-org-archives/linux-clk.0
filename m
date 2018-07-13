Return-Path: <hofrat@osadl.org>
From: Nicholas Mc Guire <hofrat@osadl.org>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Frank Li <Frank.Li@freescale.com>, NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH] clk: imx6ul: fix missing of_node_put()
Date: Fri, 13 Jul 2018 13:13:20 +0200
Message-Id: <1531480400-7664-1-git-send-email-hofrat@osadl.org>
List-ID: <linux-clk.vger.kernel.org>

of_find_compatible_node() is returning a device node with refcount
incremented and must be explicitly decremented after the last use
which is right after the us in of_iomap() here.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
Fixes: commit 787b4271a6a0 ("clk: imx: add imx6ul clk tree support")
---

Problem located with experimental coccinelle script

Patch was compile tested with: imx_v6_v7_defconfig (implies
CONFIG_SOC_IMX6UL=y)

Patch is against 4.18-rc4 (localversion-next is next-20180713)

 drivers/clk/imx/clk-imx6ul.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index d3f7f4d..361b43f 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -135,6 +135,7 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx6ul-anatop");
 	base = of_iomap(np, 0);
+	of_node_put(np);
 	WARN_ON(!base);
 
 	clks[IMX6UL_PLL1_BYPASS_SRC] = imx_clk_mux("pll1_bypass_src", base + 0x00, 14, 1, pll_bypass_src_sels, ARRAY_SIZE(pll_bypass_src_sels));
-- 
2.1.4
