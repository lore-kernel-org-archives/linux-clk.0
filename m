Return-Path: <aisheng.dong@nxp.com>
From: Dong Aisheng <aisheng.dong@nxp.com>
To: <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <sboyd@codeaurora.org>,
	<mturquette@baylibre.com>, <shawnguo@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <aisheng.dong@nxp.com>,
	<anson.huang@nxp.com>
Subject: [PATCH 06/11] clk: imx6ul: fix gpt2 clock names
Date: Wed, 8 Jun 2016 22:33:35 +0800
Message-ID: <1465396420-27064-6-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1465396420-27064-1-git-send-email-aisheng.dong@nxp.com>
References: <1465396420-27064-1-git-send-email-aisheng.dong@nxp.com>
Return-Path: aisheng.dong@nxp.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

fix gpt2 clock names

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-imx6ul.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index 0f1f17a8f3ed..67ae3465dd37 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -305,8 +305,8 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 	clks[IMX6UL_CLK_CAN1_SERIAL]	= imx_clk_gate2("can1_serial",	"can_podf",	base + 0x68,	16);
 	clks[IMX6UL_CLK_CAN2_IPG]	= imx_clk_gate2("can2_ipg",	"ipg",		base + 0x68,	18);
 	clks[IMX6UL_CLK_CAN2_SERIAL]	= imx_clk_gate2("can2_serial",	"can_podf",	base + 0x68,	20);
-	clks[IMX6UL_CLK_GPT2_BUS]	= imx_clk_gate2("gpt_bus",	"perclk",	base + 0x68,	24);
-	clks[IMX6UL_CLK_GPT2_SERIAL]	= imx_clk_gate2("gpt_serial",	"perclk",	base + 0x68,	26);
+	clks[IMX6UL_CLK_GPT2_BUS]	= imx_clk_gate2("gpt_bus2",	"perclk",	base + 0x68,	24);
+	clks[IMX6UL_CLK_GPT2_SERIAL]	= imx_clk_gate2("gpt_serial2",	"perclk",	base + 0x68,	26);
 	clks[IMX6UL_CLK_UART2_IPG]	= imx_clk_gate2("uart2_ipg",	"ipg",		base + 0x68,	28);
 	clks[IMX6UL_CLK_UART2_SERIAL]	= imx_clk_gate2("uart2_serial",	"uart_podf",	base + 0x68,	28);
 	clks[IMX6UL_CLK_AIPSTZ3]	= imx_clk_gate2("aips_tz3",	"ahb",		base + 0x68,	30);
-- 
1.9.1
