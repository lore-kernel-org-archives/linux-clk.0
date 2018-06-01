Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46561 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750917AbeFAG6b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jun 2018 02:58:31 -0400
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 1/4] clk: imx7d: add IMX7D_MU_ROOT_CLK
Date: Fri,  1 Jun 2018 08:58:18 +0200
Message-Id: <20180601065821.28234-2-o.rempel@pengutronix.de>
In-Reply-To: <20180601065821.28234-1-o.rempel@pengutronix.de>
References: <20180601065821.28234-1-o.rempel@pengutronix.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This clock is needed for iMX mailbox driver

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/clk/imx/clk-imx7d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 975a20d3cc94..1c2541dc40e7 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -793,6 +793,7 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	clks[IMX7D_DRAM_PHYM_ROOT_CLK] = imx_clk_gate4("dram_phym_root_clk", "dram_phym_cg", base + 0x4130, 0);
 	clks[IMX7D_DRAM_PHYM_ALT_ROOT_CLK] = imx_clk_gate4("dram_phym_alt_root_clk", "dram_phym_alt_post_div", base + 0x4130, 0);
 	clks[IMX7D_DRAM_ALT_ROOT_CLK] = imx_clk_gate4("dram_alt_root_clk", "dram_alt_post_div", base + 0x4130, 0);
+	clks[IMX7D_MU_ROOT_CLK] = imx_clk_gate2("mu_root_clk", "ipg_root_clk", base + 0x4270, 0);
 	clks[IMX7D_OCOTP_CLK] = imx_clk_gate4("ocotp_clk", "ipg_root_clk", base + 0x4230, 0);
 	clks[IMX7D_SNVS_CLK] = imx_clk_gate4("snvs_clk", "ipg_root_clk", base + 0x4250, 0);
 	clks[IMX7D_CAAM_CLK] = imx_clk_gate4("caam_clk", "ipg_root_clk", base + 0x4240, 0);
-- 
2.17.1

