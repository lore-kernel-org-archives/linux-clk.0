Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:45379 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423585AbcBQSrp (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 17 Feb 2016 13:47:45 -0500
From: Anatolij Gustschin <agust@denx.de>
To: linux-clk@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: imx: correct pwm7 clock name in driver for i.MX6UL
Date: Wed, 17 Feb 2016 19:48:20 +0100
Message-Id: <1455734900-1913-2-git-send-email-agust@denx.de>
In-Reply-To: <1455734900-1913-1-git-send-email-agust@denx.de>
References: <1455734900-1913-1-git-send-email-agust@denx.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Don't capitalize p in the pwm7 clock name.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/clk/imx/clk-imx6ul.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index 01718d0..15f2ac8 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -394,7 +394,7 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 	clks[IMX6UL_CLK_I2C4]		= imx_clk_gate2("i2c4",		"perclk", 	 base + 0x80,	24);
 	clks[IMX6UL_CLK_PWM5]		= imx_clk_gate2("pwm5",		"perclk",	 base + 0x80,	26);
 	clks[IMX6UL_CLK_PWM6]		= imx_clk_gate2("pwm6",		"perclk",	 base +	0x80,	28);
-	clks[IMX6UL_CLK_PWM7]		= imx_clk_gate2("Pwm7",		"perclk",	 base + 0x80,	30);
+	clks[IMX6UL_CLK_PWM7]		= imx_clk_gate2("pwm7",		"perclk",	 base + 0x80,	30);
 
 	/* mask handshake of mmdc */
 	writel_relaxed(BM_CCM_CCDR_MMDC_CH0_MASK, base + CCDR);
-- 
1.7.9.5

