Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-by2nam01on0056.outbound.protection.outlook.com ([104.47.34.56]:60416
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751281AbdFFPqG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 6 Jun 2017 11:46:06 -0400
From: Fabio Estevam <fabio.estevam@nxp.com>
To: <sboyd@codeaurora.org>
CC: <shawnguo@kernel.org>, <kernel@pengutronix.de>, <stefan@agner.ch>,
        <linux-clk@vger.kernel.org>, <leonard.crestez@nxp.com>,
        <festevam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH] clk: imx7d: Fix the DDR PLL enable bit
Date: Tue, 6 Jun 2017 12:45:54 -0300
Message-ID: <1496763954-10981-1-git-send-email-fabio.estevam@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Commit ad14972422899b6 ("clk: imx7d: Fix the powerdown bit location
of PLL DDR") used the incorrect bit for the IMX_PLLV3_DDR_IMX7 case.

Fix it accordingly to avoid a kernel hang.

Reported-by: Leonard Crestez <leonard.crestez@nxp.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/clk/imx/clk-pllv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index 0039b16..9af62ee 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -453,7 +453,7 @@ struct clk *imx_clk_pllv3(enum imx_pllv3_type type, const char *name,
 		ops = &clk_pllv3_enet_ops;
 		break;
 	case IMX_PLLV3_DDR_IMX7:
-		pll->power_bit = IMX7_ENET_PLL_POWER;
+		pll->power_bit = IMX7_DDR_PLL_POWER;
 		ops = &clk_pllv3_av_ops;
 		break;
 	default:
-- 
2.7.4

