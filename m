Return-Path: <SRS0=BIUh=BI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EE4C433E1
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6597521744
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727979AbgG2IEs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jul 2020 04:04:48 -0400
Received: from inva020.nxp.com ([92.121.34.13]:34394 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727041AbgG2IEr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 29 Jul 2020 04:04:47 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0E3C71A0F39;
        Wed, 29 Jul 2020 10:04:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E57D81A0F43;
        Wed, 29 Jul 2020 10:04:38 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E605040310;
        Wed, 29 Jul 2020 10:04:33 +0200 (CEST)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v7 03/11] clk: imx: scu: add two cells binding support
Date:   Wed, 29 Jul 2020 16:00:10 +0800
Message-Id: <1596009618-25516-4-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch implements the new two cells binding for SCU clocks.
The usage is as follows:
clocks = <&uart0_clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>

Due to each SCU clock is associated with a power domain, without power
on the domain, the SCU clock can't work. So we create platform devices
for each domain clock respectively and manually attach the required domain
before register the clock devices, then we can register clocks in the
clock platform driver accordingly.

Note because we do not have power domain info in device tree and the SCU
resource ID is the same for power domain and clock, so we use resource ID
to find power domains.

Later, we will also use this clock platform driver to support suspend/resume
and runtime pm.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v6->v7:
 Addressed all comments from Stephen
 * remove error check of reading #clock-cells
 * add more code comments about the dependency of power domain
 * squash the former [V6,12/12] clk: imx: scu: unregister clocks if add provider failed
   into this patch.
v4->v6:
 * remove global clock_cells
 * put node after using of_find_compatible_node()
 * using ERR_PTR(ret) instead of ERR_PTR(-ENOMEM)
v4: no changes
v3: new patch
---
 drivers/clk/imx/clk-imx8qxp.c | 136 ++++++++++++++++-------------
 drivers/clk/imx/clk-scu.c     | 156 +++++++++++++++++++++++++++++++++-
 drivers/clk/imx/clk-scu.h     |  27 ++++--
 3 files changed, 252 insertions(+), 67 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 5e2903efc488..5ed175de4771 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -22,9 +22,10 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 	struct device_node *ccm_node = pdev->dev.of_node;
 	struct clk_hw_onecell_data *clk_data;
 	struct clk_hw **clks;
+	u32 clk_cells;
 	int ret, i;
 
-	ret = imx_clk_scu_init();
+	ret = imx_clk_scu_init(ccm_node);
 	if (ret)
 		return ret;
 
@@ -33,6 +34,9 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
+	if (of_property_read_u32(ccm_node, "#clock-cells", &clk_cells))
+		return -EINVAL;
+
 	clk_data->num = IMX_SCU_CLK_END;
 	clks = clk_data->hws;
 
@@ -55,78 +59,78 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 	clks[IMX_LSIO_BUS_CLK]		= clk_hw_register_fixed_rate(NULL, "lsio_bus_clk_root", NULL, 0, 100000000);
 
 	/* ARM core */
-	clks[IMX_A35_CLK]		= imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU);
+	clks[IMX_A35_CLK]		= imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU, clk_cells);
 
 	/* LSIO SS */
-	clks[IMX_LSIO_PWM0_CLK]		= imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_PWM1_CLK]		= imx_clk_scu("pwm1_clk", IMX_SC_R_PWM_1, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_PWM2_CLK]		= imx_clk_scu("pwm2_clk", IMX_SC_R_PWM_2, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_PWM3_CLK]		= imx_clk_scu("pwm3_clk", IMX_SC_R_PWM_3, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_PWM4_CLK]		= imx_clk_scu("pwm4_clk", IMX_SC_R_PWM_4, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_PWM5_CLK]		= imx_clk_scu("pwm5_clk", IMX_SC_R_PWM_5, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_PWM6_CLK]		= imx_clk_scu("pwm6_clk", IMX_SC_R_PWM_6, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_PWM7_CLK]		= imx_clk_scu("pwm7_clk", IMX_SC_R_PWM_7, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_GPT0_CLK]		= imx_clk_scu("gpt0_clk", IMX_SC_R_GPT_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_GPT1_CLK]		= imx_clk_scu("gpt1_clk", IMX_SC_R_GPT_1, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_GPT2_CLK]		= imx_clk_scu("gpt2_clk", IMX_SC_R_GPT_2, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_GPT3_CLK]		= imx_clk_scu("gpt3_clk", IMX_SC_R_GPT_3, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_GPT4_CLK]		= imx_clk_scu("gpt4_clk", IMX_SC_R_GPT_4, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_FSPI0_CLK]	= imx_clk_scu("fspi0_clk", IMX_SC_R_FSPI_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_LSIO_FSPI1_CLK]	= imx_clk_scu("fspi1_clk", IMX_SC_R_FSPI_1, IMX_SC_PM_CLK_PER);
+	clks[IMX_LSIO_PWM0_CLK]		= imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_PWM1_CLK]		= imx_clk_scu("pwm1_clk", IMX_SC_R_PWM_1, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_PWM2_CLK]		= imx_clk_scu("pwm2_clk", IMX_SC_R_PWM_2, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_PWM3_CLK]		= imx_clk_scu("pwm3_clk", IMX_SC_R_PWM_3, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_PWM4_CLK]		= imx_clk_scu("pwm4_clk", IMX_SC_R_PWM_4, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_PWM5_CLK]		= imx_clk_scu("pwm5_clk", IMX_SC_R_PWM_5, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_PWM6_CLK]		= imx_clk_scu("pwm6_clk", IMX_SC_R_PWM_6, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_PWM7_CLK]		= imx_clk_scu("pwm7_clk", IMX_SC_R_PWM_7, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_GPT0_CLK]		= imx_clk_scu("gpt0_clk", IMX_SC_R_GPT_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_GPT1_CLK]		= imx_clk_scu("gpt1_clk", IMX_SC_R_GPT_1, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_GPT2_CLK]		= imx_clk_scu("gpt2_clk", IMX_SC_R_GPT_2, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_GPT3_CLK]		= imx_clk_scu("gpt3_clk", IMX_SC_R_GPT_3, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_GPT4_CLK]		= imx_clk_scu("gpt4_clk", IMX_SC_R_GPT_4, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_FSPI0_CLK]	= imx_clk_scu("fspi0_clk", IMX_SC_R_FSPI_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_LSIO_FSPI1_CLK]	= imx_clk_scu("fspi1_clk", IMX_SC_R_FSPI_1, IMX_SC_PM_CLK_PER, clk_cells);
 
 	/* ADMA SS */
-	clks[IMX_ADMA_UART0_CLK]	= imx_clk_scu("uart0_clk", IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_UART1_CLK]	= imx_clk_scu("uart1_clk", IMX_SC_R_UART_1, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_UART2_CLK]	= imx_clk_scu("uart2_clk", IMX_SC_R_UART_2, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_UART3_CLK]	= imx_clk_scu("uart3_clk", IMX_SC_R_UART_3, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_SPI0_CLK]		= imx_clk_scu("spi0_clk",  IMX_SC_R_SPI_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_SPI1_CLK]		= imx_clk_scu("spi1_clk",  IMX_SC_R_SPI_1, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_SPI2_CLK]		= imx_clk_scu("spi2_clk",  IMX_SC_R_SPI_2, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_SPI3_CLK]		= imx_clk_scu("spi3_clk",  IMX_SC_R_SPI_3, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_CAN0_CLK]		= imx_clk_scu("can0_clk",  IMX_SC_R_CAN_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_I2C0_CLK]		= imx_clk_scu("i2c0_clk",  IMX_SC_R_I2C_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_I2C1_CLK]		= imx_clk_scu("i2c1_clk",  IMX_SC_R_I2C_1, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_I2C2_CLK]		= imx_clk_scu("i2c2_clk",  IMX_SC_R_I2C_2, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_I2C3_CLK]		= imx_clk_scu("i2c3_clk",  IMX_SC_R_I2C_3, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_FTM0_CLK]		= imx_clk_scu("ftm0_clk",  IMX_SC_R_FTM_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_FTM1_CLK]		= imx_clk_scu("ftm1_clk",  IMX_SC_R_FTM_1, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_ADC0_CLK]		= imx_clk_scu("adc0_clk",  IMX_SC_R_ADC_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_PWM_CLK]		= imx_clk_scu("pwm_clk",   IMX_SC_R_LCD_0_PWM_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_ADMA_LCD_CLK]		= imx_clk_scu("lcd_clk",   IMX_SC_R_LCD_0, IMX_SC_PM_CLK_PER);
+	clks[IMX_ADMA_UART0_CLK]	= imx_clk_scu("uart0_clk", IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_UART1_CLK]	= imx_clk_scu("uart1_clk", IMX_SC_R_UART_1, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_UART2_CLK]	= imx_clk_scu("uart2_clk", IMX_SC_R_UART_2, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_UART3_CLK]	= imx_clk_scu("uart3_clk", IMX_SC_R_UART_3, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_SPI0_CLK]		= imx_clk_scu("spi0_clk",  IMX_SC_R_SPI_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_SPI1_CLK]		= imx_clk_scu("spi1_clk",  IMX_SC_R_SPI_1, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_SPI2_CLK]		= imx_clk_scu("spi2_clk",  IMX_SC_R_SPI_2, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_SPI3_CLK]		= imx_clk_scu("spi3_clk",  IMX_SC_R_SPI_3, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_CAN0_CLK]		= imx_clk_scu("can0_clk",  IMX_SC_R_CAN_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_I2C0_CLK]		= imx_clk_scu("i2c0_clk",  IMX_SC_R_I2C_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_I2C1_CLK]		= imx_clk_scu("i2c1_clk",  IMX_SC_R_I2C_1, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_I2C2_CLK]		= imx_clk_scu("i2c2_clk",  IMX_SC_R_I2C_2, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_I2C3_CLK]		= imx_clk_scu("i2c3_clk",  IMX_SC_R_I2C_3, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_FTM0_CLK]		= imx_clk_scu("ftm0_clk",  IMX_SC_R_FTM_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_FTM1_CLK]		= imx_clk_scu("ftm1_clk",  IMX_SC_R_FTM_1, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_ADC0_CLK]		= imx_clk_scu("adc0_clk",  IMX_SC_R_ADC_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_PWM_CLK]		= imx_clk_scu("pwm_clk",   IMX_SC_R_LCD_0_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_ADMA_LCD_CLK]		= imx_clk_scu("lcd_clk",   IMX_SC_R_LCD_0, IMX_SC_PM_CLK_PER, clk_cells);
 
 	/* Connectivity */
-	clks[IMX_CONN_SDHC0_CLK]	= imx_clk_scu("sdhc0_clk", IMX_SC_R_SDHC_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_CONN_SDHC1_CLK]	= imx_clk_scu("sdhc1_clk", IMX_SC_R_SDHC_1, IMX_SC_PM_CLK_PER);
-	clks[IMX_CONN_SDHC2_CLK]	= imx_clk_scu("sdhc2_clk", IMX_SC_R_SDHC_2, IMX_SC_PM_CLK_PER);
-	clks[IMX_CONN_ENET0_ROOT_CLK]	= imx_clk_scu("enet0_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_CONN_ENET0_BYPASS_CLK]	= imx_clk_scu("enet0_bypass_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_BYPASS);
-	clks[IMX_CONN_ENET0_RGMII_CLK]	= imx_clk_scu("enet0_rgmii_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_MISC0);
-	clks[IMX_CONN_ENET1_ROOT_CLK]	= imx_clk_scu("enet1_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_PER);
-	clks[IMX_CONN_ENET1_BYPASS_CLK]	= imx_clk_scu("enet1_bypass_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_BYPASS);
-	clks[IMX_CONN_ENET1_RGMII_CLK]	= imx_clk_scu("enet1_rgmii_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_MISC0);
-	clks[IMX_CONN_GPMI_BCH_IO_CLK]	= imx_clk_scu("gpmi_io_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_MST_BUS);
-	clks[IMX_CONN_GPMI_BCH_CLK]	= imx_clk_scu("gpmi_bch_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_PER);
-	clks[IMX_CONN_USB2_ACLK]	= imx_clk_scu("usb3_aclk_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_PER);
-	clks[IMX_CONN_USB2_BUS_CLK]	= imx_clk_scu("usb3_bus_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MST_BUS);
-	clks[IMX_CONN_USB2_LPM_CLK]	= imx_clk_scu("usb3_lpm_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MISC);
+	clks[IMX_CONN_SDHC0_CLK]	= imx_clk_scu("sdhc0_clk", IMX_SC_R_SDHC_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_CONN_SDHC1_CLK]	= imx_clk_scu("sdhc1_clk", IMX_SC_R_SDHC_1, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_CONN_SDHC2_CLK]	= imx_clk_scu("sdhc2_clk", IMX_SC_R_SDHC_2, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_CONN_ENET0_ROOT_CLK]	= imx_clk_scu("enet0_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_CONN_ENET0_BYPASS_CLK]	= imx_clk_scu("enet0_bypass_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_BYPASS, clk_cells);
+	clks[IMX_CONN_ENET0_RGMII_CLK]	= imx_clk_scu("enet0_rgmii_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_MISC0, clk_cells);
+	clks[IMX_CONN_ENET1_ROOT_CLK]	= imx_clk_scu("enet1_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_CONN_ENET1_BYPASS_CLK]	= imx_clk_scu("enet1_bypass_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_BYPASS, clk_cells);
+	clks[IMX_CONN_ENET1_RGMII_CLK]	= imx_clk_scu("enet1_rgmii_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_MISC0, clk_cells);
+	clks[IMX_CONN_GPMI_BCH_IO_CLK]	= imx_clk_scu("gpmi_io_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_MST_BUS, clk_cells);
+	clks[IMX_CONN_GPMI_BCH_CLK]	= imx_clk_scu("gpmi_bch_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_CONN_USB2_ACLK]	= imx_clk_scu("usb3_aclk_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_CONN_USB2_BUS_CLK]	= imx_clk_scu("usb3_bus_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MST_BUS, clk_cells);
+	clks[IMX_CONN_USB2_LPM_CLK]	= imx_clk_scu("usb3_lpm_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MISC, clk_cells);
 
 	/* Display controller SS */
-	clks[IMX_DC0_DISP0_CLK]		= imx_clk_scu("dc0_disp0_clk", IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC0);
-	clks[IMX_DC0_DISP1_CLK]		= imx_clk_scu("dc0_disp1_clk", IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC1);
+	clks[IMX_DC0_DISP0_CLK]		= imx_clk_scu("dc0_disp0_clk", IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC0, clk_cells);
+	clks[IMX_DC0_DISP1_CLK]		= imx_clk_scu("dc0_disp1_clk", IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC1, clk_cells);
 
 	/* MIPI-LVDS SS */
-	clks[IMX_MIPI0_I2C0_CLK]	= imx_clk_scu("mipi0_i2c0_clk", IMX_SC_R_MIPI_0_I2C_0, IMX_SC_PM_CLK_MISC2);
-	clks[IMX_MIPI0_I2C1_CLK]	= imx_clk_scu("mipi0_i2c1_clk", IMX_SC_R_MIPI_0_I2C_1, IMX_SC_PM_CLK_MISC2);
+	clks[IMX_MIPI0_I2C0_CLK]	= imx_clk_scu("mipi0_i2c0_clk", IMX_SC_R_MIPI_0_I2C_0, IMX_SC_PM_CLK_MISC2, clk_cells);
+	clks[IMX_MIPI0_I2C1_CLK]	= imx_clk_scu("mipi0_i2c1_clk", IMX_SC_R_MIPI_0_I2C_1, IMX_SC_PM_CLK_MISC2, clk_cells);
 
 	/* MIPI CSI SS */
-	clks[IMX_CSI0_CORE_CLK]		= imx_clk_scu("mipi_csi0_core_clk", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_CSI0_ESC_CLK]		= imx_clk_scu("mipi_csi0_esc_clk",  IMX_SC_R_CSI_0, IMX_SC_PM_CLK_MISC);
-	clks[IMX_CSI0_I2C0_CLK]		= imx_clk_scu("mipi_csi0_i2c0_clk", IMX_SC_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER);
-	clks[IMX_CSI0_PWM0_CLK]		= imx_clk_scu("mipi_csi0_pwm0_clk", IMX_SC_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER);
+	clks[IMX_CSI0_CORE_CLK]		= imx_clk_scu("mipi_csi0_core_clk", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_CSI0_ESC_CLK]		= imx_clk_scu("mipi_csi0_esc_clk",  IMX_SC_R_CSI_0, IMX_SC_PM_CLK_MISC, clk_cells);
+	clks[IMX_CSI0_I2C0_CLK]		= imx_clk_scu("mipi_csi0_i2c0_clk", IMX_SC_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_CSI0_PWM0_CLK]		= imx_clk_scu("mipi_csi0_pwm0_clk", IMX_SC_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
 
 	/* GPU SS */
-	clks[IMX_GPU0_CORE_CLK]		= imx_clk_scu("gpu_core0_clk",	 IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_PER);
-	clks[IMX_GPU0_SHADER_CLK]	= imx_clk_scu("gpu_shader0_clk", IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_MISC);
+	clks[IMX_GPU0_CORE_CLK]		= imx_clk_scu("gpu_core0_clk",	 IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_PER, clk_cells);
+	clks[IMX_GPU0_SHADER_CLK]	= imx_clk_scu("gpu_shader0_clk", IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_MISC, clk_cells);
 
 	for (i = 0; i < clk_data->num; i++) {
 		if (IS_ERR(clks[i]))
@@ -134,7 +138,19 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 				i, PTR_ERR(clks[i]));
 	}
 
-	return of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, clk_data);
+	if (clk_cells == 2) {
+		ret = of_clk_add_hw_provider(ccm_node, imx_scu_of_clk_src_get, imx_scu_clks);
+		if (ret)
+			imx_clk_scu_unregister();
+	} else {
+		/*
+		 * legacy binding code path doesn't unregister here because
+		 * it will be removed later.
+		 */
+		ret = of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, clk_data);
+	}
+
+	return ret;
 }
 
 static const struct of_device_id imx8qxp_match[] = {
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index b8b2072742a5..e5837e7caa50 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -8,6 +8,9 @@
 #include <linux/arm-smccc.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/slab.h>
 
 #include "clk-scu.h"
@@ -16,6 +19,20 @@
 #define IMX_SIP_SET_CPUFREQ		0x00
 
 static struct imx_sc_ipc *ccm_ipc_handle;
+struct device_node *pd_np;
+
+struct imx_scu_clk_node {
+	const char *name;
+	u32 rsrc;
+	u8 clk_type;
+	const char * const *parents;
+	int num_parents;
+
+	struct clk_hw *hw;
+	struct list_head node;
+};
+
+struct list_head imx_scu_clks[IMX_SC_R_LAST];
 
 /*
  * struct clk_scu - Description of one SCU clock
@@ -128,9 +145,35 @@ static inline struct clk_scu *to_clk_scu(struct clk_hw *hw)
 	return container_of(hw, struct clk_scu, hw);
 }
 
-int imx_clk_scu_init(void)
+int imx_clk_scu_init(struct device_node *np)
 {
-	return imx_scu_get_handle(&ccm_ipc_handle);
+	struct platform_device *pd_dev;
+	u32 clk_cells;
+	int ret, i;
+
+	ret = imx_scu_get_handle(&ccm_ipc_handle);
+	if (ret)
+		return ret;
+
+	of_property_read_u32(np, "#clock-cells", &clk_cells);
+
+	if (clk_cells == 2) {
+		for (i = 0; i < IMX_SC_R_LAST; i++)
+			INIT_LIST_HEAD(&imx_scu_clks[i]);
+		/*
+		 * Note: SCU clock driver depends on SCU power domain to be ready
+		 * first. As there're no power domains under scu clock node in dts,
+		 * we can't use PROBE_DEFER automatically.
+		 */
+		pd_np = of_find_compatible_node(NULL, NULL, "fsl,scu-pd");
+		pd_dev = of_find_device_by_node(pd_np);
+		if (!pd_dev || !device_is_bound(&pd_dev->dev)) {
+			of_node_put(pd_np);
+			return -EPROBE_DEFER;
+		}
+	}
+
+	return 0;
 }
 
 /*
@@ -387,3 +430,112 @@ struct clk_hw *__imx_clk_scu(const char *name, const char * const *parents,
 
 	return hw;
 }
+
+struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,
+				      void *data)
+{
+	unsigned int rsrc = clkspec->args[0];
+	unsigned int idx = clkspec->args[1];
+	struct list_head *scu_clks = data;
+	struct imx_scu_clk_node *clk;
+
+	list_for_each_entry(clk, &scu_clks[rsrc], node) {
+		if (clk->clk_type == idx)
+			return clk->hw;
+	}
+
+	return ERR_PTR(-ENODEV);
+}
+
+static int imx_clk_scu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx_scu_clk_node *clk = dev_get_platdata(dev);
+	struct clk_hw *hw;
+
+	hw = __imx_clk_scu(clk->name, clk->parents, clk->num_parents,
+			   clk->rsrc, clk->clk_type);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk->hw = hw;
+	list_add_tail(&clk->node, &imx_scu_clks[clk->rsrc]);
+
+	dev_dbg(dev, "register SCU clock rsrc:%d type:%d\n", clk->rsrc,
+		clk->clk_type);
+
+	return 0;
+}
+
+static struct platform_driver imx_clk_scu_driver = {
+	.driver = {
+		.name = "imx-scu-clk",
+		.suppress_bind_attrs = true,
+	},
+	.probe = imx_clk_scu_probe,
+};
+builtin_platform_driver(imx_clk_scu_driver);
+
+static int imx_clk_scu_attach_pd(struct device *dev, u32 rsrc_id)
+{
+	struct of_phandle_args genpdspec = {
+		.np = pd_np,
+		.args_count = 1,
+		.args[0] = rsrc_id,
+	};
+
+	return of_genpd_add_device(&genpdspec, dev);
+}
+
+struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
+				     const char * const *parents,
+				     int num_parents, u32 rsrc_id, u8 clk_type)
+{
+	struct imx_scu_clk_node clk = {
+		.name = name,
+		.rsrc = rsrc_id,
+		.clk_type = clk_type,
+		.parents = parents,
+		.num_parents = num_parents,
+	};
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
+	if (!pdev) {
+		pr_err("%s: failed to allocate scu clk dev rsrc %d type %d\n",
+		       name, rsrc_id, clk_type);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ret = platform_device_add_data(pdev, &clk, sizeof(clk));
+	if (ret) {
+		platform_device_put(pdev);
+		return ERR_PTR(ret);
+	}
+
+	pdev->driver_override = "imx-scu-clk";
+
+	ret = imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
+	if (ret)
+		pr_warn("%s: failed to attached the power domain %d\n",
+			name, ret);
+
+	platform_device_add(pdev);
+
+	/* For API backwards compatiblilty, simply return NULL for success */
+	return NULL;
+}
+
+void imx_clk_scu_unregister(void)
+{
+	struct imx_scu_clk_node *clk;
+	int i;
+
+	for (i = 0; i < IMX_SC_R_LAST; i++) {
+		list_for_each_entry(clk, &imx_scu_clks[i], node) {
+			clk_hw_unregister(clk->hw);
+			kfree(clk);
+		}
+	}
+}
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index 2bcfaf06a458..f7480898ea74 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -8,22 +8,39 @@
 #define __IMX_CLK_SCU_H
 
 #include <linux/firmware/imx/sci.h>
+#include <linux/of.h>
 
-int imx_clk_scu_init(void);
+extern struct list_head imx_scu_clks[];
+
+int imx_clk_scu_init(struct device_node *np);
+struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,
+				      void *data);
+struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
+				     const char * const *parents,
+				     int num_parents, u32 rsrc_id, u8 clk_type);
 
 struct clk_hw *__imx_clk_scu(const char *name, const char * const *parents,
 			     int num_parents, u32 rsrc_id, u8 clk_type);
 
+void imx_clk_scu_unregister(void);
+
 static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
-					 u8 clk_type)
+					 u8 clk_type, u8 clk_cells)
 {
-	return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type);
+	if (clk_cells == 2)
+		return imx_clk_scu_alloc_dev(name, NULL, 0, rsrc_id, clk_type);
+	else
+		return __imx_clk_scu(name, NULL, 0, rsrc_id, clk_type);
 }
 
 static inline struct clk_hw *imx_clk_scu2(const char *name, const char * const *parents,
-					  int num_parents, u32 rsrc_id, u8 clk_type)
+					  int num_parents, u32 rsrc_id, u8 clk_type,
+					  u8 clk_cells)
 {
-	return __imx_clk_scu(name, parents, num_parents, rsrc_id, clk_type);
+	if (clk_cells == 2)
+		return imx_clk_scu_alloc_dev(name, parents, num_parents, rsrc_id, clk_type);
+	else
+		return __imx_clk_scu(name, parents, num_parents, rsrc_id, clk_type);
 }
 
 struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
-- 
2.23.0

