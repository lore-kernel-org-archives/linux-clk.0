Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B55CC433B4
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 20:04:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7164B6143D
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 20:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbhEMUFX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 May 2021 16:05:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:39074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232197AbhEMUFW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 May 2021 16:05:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D8A8613CD;
        Thu, 13 May 2021 20:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620936252;
        bh=DA1oLnipdK8BMidOFM3b6zTDRkEJyEmkjtIxTh3Xk7g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VTc++uBWpkdku+WQXN6nB44upZE0pERDlopBE+BDVkJ6YSj28OIlRkFIFV5b4DNan
         6Stb0DCUV2E4HBA+IKqc0mGz1GY1B9Po4Vp1Gh+Kq88MQK4jpra9OwEcoCwkmW8YiG
         p3gT0i4IAZ22LXHBrL51mLfLegjIKRzbjMARseGcaSeDxQcG69EOPuvOB8IluvL1PK
         cxCsnCwd5KM0SedFRd4adES9Hzxnj6wu09GVY0WRd9bQyKpUZkUSwxaOjKbuTMRciK
         Y2Z2cBx3xRkMh8X0lU2AvXI8LhdQLmR3OXrd8yV9v893YCETcj/ibaukcz8c1VFA5X
         Tw+m8gYTHzfeQ==
Date:   Thu, 13 May 2021 23:04:08 +0300
From:   Abel Vesa <abelvesa@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com, abel.vesa@nxp.com, sboyd@kernel.org
Subject: Re: [PATCH 3/6] clk: imx: scu: remove legacy scu clock binding
 support
Message-ID: <YJ2GOPXj5qhtJHm4@ryzen.lan>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
 <20210423033334.3317992-3-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423033334.3317992-3-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-04-23 11:33:31, Dong Aisheng wrote:
> Legacy scu clock binding are not maintained anymore, it has a very
> limited clocks supported during initial upstreaming and obviously
> unusable by products. So it's meaningless to keep it in
> kernel which worse the code readability.
> Remove it to keep code much cleaner.
> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

I'm OK with this one too.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8qxp.c          | 201 ++++++++++---------------
>  drivers/clk/imx/clk-scu.h              |  15 +-
>  include/dt-bindings/clock/imx8-clock.h | 128 ----------------
>  3 files changed, 81 insertions(+), 263 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> index fbf1170c09ed..d17b418ac577 100644
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -14,7 +14,6 @@
>  
>  #include "clk-scu.h"
>  
> -#include <dt-bindings/clock/imx8-clock.h>
>  #include <dt-bindings/firmware/imx/rsrc.h>
>  
>  static const char *dc0_sels[] = {
> @@ -28,149 +27,103 @@ static const char *dc0_sels[] = {
>  static int imx8qxp_clk_probe(struct platform_device *pdev)
>  {
>  	struct device_node *ccm_node = pdev->dev.of_node;
> -	struct clk_hw_onecell_data *clk_data;
> -	struct clk_hw **clks;
> -	u32 clk_cells;
> -	int ret, i;
> +	int ret;
>  
>  	ret = imx_clk_scu_init(ccm_node);
>  	if (ret)
>  		return ret;
>  
> -	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hws,
> -				IMX_SCU_CLK_END), GFP_KERNEL);
> -	if (!clk_data)
> -		return -ENOMEM;
> -
> -	if (of_property_read_u32(ccm_node, "#clock-cells", &clk_cells))
> -		return -EINVAL;
> -
> -	clk_data->num = IMX_SCU_CLK_END;
> -	clks = clk_data->hws;
> -
> -	/* Fixed clocks */
> -	clks[IMX_CLK_DUMMY]		= clk_hw_register_fixed_rate(NULL, "dummy", NULL, 0, 0);
> -	clks[IMX_ADMA_IPG_CLK_ROOT] 	= clk_hw_register_fixed_rate(NULL, "dma_ipg_clk_root", NULL, 0, 120000000);
> -	clks[IMX_CONN_AXI_CLK_ROOT]	= clk_hw_register_fixed_rate(NULL, "conn_axi_clk_root", NULL, 0, 333333333);
> -	clks[IMX_CONN_AHB_CLK_ROOT]	= clk_hw_register_fixed_rate(NULL, "conn_ahb_clk_root", NULL, 0, 166666666);
> -	clks[IMX_CONN_IPG_CLK_ROOT]	= clk_hw_register_fixed_rate(NULL, "conn_ipg_clk_root", NULL, 0, 83333333);
> -	clks[IMX_DC_AXI_EXT_CLK]	= clk_hw_register_fixed_rate(NULL, "dc_axi_ext_clk_root", NULL, 0, 800000000);
> -	clks[IMX_DC_AXI_INT_CLK]	= clk_hw_register_fixed_rate(NULL, "dc_axi_int_clk_root", NULL, 0, 400000000);
> -	clks[IMX_DC_CFG_CLK]		= clk_hw_register_fixed_rate(NULL, "dc_cfg_clk_root", NULL, 0, 100000000);
> -	clks[IMX_MIPI_IPG_CLK]		= clk_hw_register_fixed_rate(NULL, "mipi_ipg_clk_root", NULL, 0, 120000000);
> -	clks[IMX_IMG_AXI_CLK]		= clk_hw_register_fixed_rate(NULL, "img_axi_clk_root", NULL, 0, 400000000);
> -	clks[IMX_IMG_IPG_CLK]		= clk_hw_register_fixed_rate(NULL, "img_ipg_clk_root", NULL, 0, 200000000);
> -	clks[IMX_IMG_PXL_CLK]		= clk_hw_register_fixed_rate(NULL, "img_pxl_clk_root", NULL, 0, 600000000);
> -	clks[IMX_HSIO_AXI_CLK]		= clk_hw_register_fixed_rate(NULL, "hsio_axi_clk_root", NULL, 0, 400000000);
> -	clks[IMX_HSIO_PER_CLK]		= clk_hw_register_fixed_rate(NULL, "hsio_per_clk_root", NULL, 0, 133333333);
> -	clks[IMX_LSIO_MEM_CLK]		= clk_hw_register_fixed_rate(NULL, "lsio_mem_clk_root", NULL, 0, 200000000);
> -	clks[IMX_LSIO_BUS_CLK]		= clk_hw_register_fixed_rate(NULL, "lsio_bus_clk_root", NULL, 0, 100000000);
> -
>  	/* ARM core */
> -	clks[IMX_A35_CLK]		= imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU, clk_cells);
> +	imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU);
>  
>  	/* LSIO SS */
> -	clks[IMX_LSIO_PWM0_CLK]		= imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_PWM1_CLK]		= imx_clk_scu("pwm1_clk", IMX_SC_R_PWM_1, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_PWM2_CLK]		= imx_clk_scu("pwm2_clk", IMX_SC_R_PWM_2, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_PWM3_CLK]		= imx_clk_scu("pwm3_clk", IMX_SC_R_PWM_3, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_PWM4_CLK]		= imx_clk_scu("pwm4_clk", IMX_SC_R_PWM_4, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_PWM5_CLK]		= imx_clk_scu("pwm5_clk", IMX_SC_R_PWM_5, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_PWM6_CLK]		= imx_clk_scu("pwm6_clk", IMX_SC_R_PWM_6, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_PWM7_CLK]		= imx_clk_scu("pwm7_clk", IMX_SC_R_PWM_7, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_GPT0_CLK]		= imx_clk_scu("gpt0_clk", IMX_SC_R_GPT_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_GPT1_CLK]		= imx_clk_scu("gpt1_clk", IMX_SC_R_GPT_1, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_GPT2_CLK]		= imx_clk_scu("gpt2_clk", IMX_SC_R_GPT_2, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_GPT3_CLK]		= imx_clk_scu("gpt3_clk", IMX_SC_R_GPT_3, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_GPT4_CLK]		= imx_clk_scu("gpt4_clk", IMX_SC_R_GPT_4, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_FSPI0_CLK]	= imx_clk_scu("fspi0_clk", IMX_SC_R_FSPI_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_LSIO_FSPI1_CLK]	= imx_clk_scu("fspi1_clk", IMX_SC_R_FSPI_1, IMX_SC_PM_CLK_PER, clk_cells);
> +	imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("pwm1_clk", IMX_SC_R_PWM_1, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("pwm2_clk", IMX_SC_R_PWM_2, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("pwm3_clk", IMX_SC_R_PWM_3, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("pwm4_clk", IMX_SC_R_PWM_4, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("pwm5_clk", IMX_SC_R_PWM_5, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("pwm6_clk", IMX_SC_R_PWM_6, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("pwm7_clk", IMX_SC_R_PWM_7, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("gpt0_clk", IMX_SC_R_GPT_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("gpt1_clk", IMX_SC_R_GPT_1, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("gpt2_clk", IMX_SC_R_GPT_2, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("gpt3_clk", IMX_SC_R_GPT_3, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("gpt4_clk", IMX_SC_R_GPT_4, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("fspi0_clk", IMX_SC_R_FSPI_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("fspi1_clk", IMX_SC_R_FSPI_1, IMX_SC_PM_CLK_PER);
>  
>  	/* ADMA SS */
> -	clks[IMX_ADMA_UART0_CLK]	= imx_clk_scu("uart0_clk", IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_UART1_CLK]	= imx_clk_scu("uart1_clk", IMX_SC_R_UART_1, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_UART2_CLK]	= imx_clk_scu("uart2_clk", IMX_SC_R_UART_2, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_UART3_CLK]	= imx_clk_scu("uart3_clk", IMX_SC_R_UART_3, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_SPI0_CLK]		= imx_clk_scu("spi0_clk",  IMX_SC_R_SPI_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_SPI1_CLK]		= imx_clk_scu("spi1_clk",  IMX_SC_R_SPI_1, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_SPI2_CLK]		= imx_clk_scu("spi2_clk",  IMX_SC_R_SPI_2, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_SPI3_CLK]		= imx_clk_scu("spi3_clk",  IMX_SC_R_SPI_3, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_CAN0_CLK]		= imx_clk_scu("can0_clk",  IMX_SC_R_CAN_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_I2C0_CLK]		= imx_clk_scu("i2c0_clk",  IMX_SC_R_I2C_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_I2C1_CLK]		= imx_clk_scu("i2c1_clk",  IMX_SC_R_I2C_1, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_I2C2_CLK]		= imx_clk_scu("i2c2_clk",  IMX_SC_R_I2C_2, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_I2C3_CLK]		= imx_clk_scu("i2c3_clk",  IMX_SC_R_I2C_3, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_FTM0_CLK]		= imx_clk_scu("ftm0_clk",  IMX_SC_R_FTM_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_FTM1_CLK]		= imx_clk_scu("ftm1_clk",  IMX_SC_R_FTM_1, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_ADC0_CLK]		= imx_clk_scu("adc0_clk",  IMX_SC_R_ADC_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_PWM_CLK]		= imx_clk_scu("pwm_clk",   IMX_SC_R_LCD_0_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_ADMA_LCD_CLK]		= imx_clk_scu("lcd_clk",   IMX_SC_R_LCD_0, IMX_SC_PM_CLK_PER, clk_cells);
> +	imx_clk_scu("uart0_clk", IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("uart1_clk", IMX_SC_R_UART_1, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("uart2_clk", IMX_SC_R_UART_2, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("uart3_clk", IMX_SC_R_UART_3, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("spi0_clk",  IMX_SC_R_SPI_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("spi1_clk",  IMX_SC_R_SPI_1, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("spi2_clk",  IMX_SC_R_SPI_2, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("spi3_clk",  IMX_SC_R_SPI_3, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("can0_clk",  IMX_SC_R_CAN_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("i2c0_clk",  IMX_SC_R_I2C_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("i2c1_clk",  IMX_SC_R_I2C_1, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("i2c2_clk",  IMX_SC_R_I2C_2, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("i2c3_clk",  IMX_SC_R_I2C_3, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("ftm0_clk",  IMX_SC_R_FTM_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("ftm1_clk",  IMX_SC_R_FTM_1, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("adc0_clk",  IMX_SC_R_ADC_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("pwm_clk",   IMX_SC_R_LCD_0_PWM_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("lcd_clk",   IMX_SC_R_LCD_0, IMX_SC_PM_CLK_PER);
>  
>  	/* Connectivity */
> -	clks[IMX_CONN_SDHC0_CLK]	= imx_clk_scu("sdhc0_clk", IMX_SC_R_SDHC_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_CONN_SDHC1_CLK]	= imx_clk_scu("sdhc1_clk", IMX_SC_R_SDHC_1, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_CONN_SDHC2_CLK]	= imx_clk_scu("sdhc2_clk", IMX_SC_R_SDHC_2, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_CONN_ENET0_ROOT_CLK]	= imx_clk_scu("enet0_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_CONN_ENET0_BYPASS_CLK]	= imx_clk_scu("enet0_bypass_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_BYPASS, clk_cells);
> -	clks[IMX_CONN_ENET0_RGMII_CLK]	= imx_clk_scu("enet0_rgmii_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_MISC0, clk_cells);
> -	clks[IMX_CONN_ENET1_ROOT_CLK]	= imx_clk_scu("enet1_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_CONN_ENET1_BYPASS_CLK]	= imx_clk_scu("enet1_bypass_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_BYPASS, clk_cells);
> -	clks[IMX_CONN_ENET1_RGMII_CLK]	= imx_clk_scu("enet1_rgmii_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_MISC0, clk_cells);
> -	clks[IMX_CONN_GPMI_BCH_IO_CLK]	= imx_clk_scu("gpmi_io_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_MST_BUS, clk_cells);
> -	clks[IMX_CONN_GPMI_BCH_CLK]	= imx_clk_scu("gpmi_bch_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_CONN_USB2_ACLK]	= imx_clk_scu("usb3_aclk_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_CONN_USB2_BUS_CLK]	= imx_clk_scu("usb3_bus_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MST_BUS, clk_cells);
> -	clks[IMX_CONN_USB2_LPM_CLK]	= imx_clk_scu("usb3_lpm_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MISC, clk_cells);
> +	imx_clk_scu("sdhc0_clk", IMX_SC_R_SDHC_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("sdhc1_clk", IMX_SC_R_SDHC_1, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("sdhc2_clk", IMX_SC_R_SDHC_2, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("enet0_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("enet0_bypass_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_BYPASS);
> +	imx_clk_scu("enet0_rgmii_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_MISC0);
> +	imx_clk_scu("enet1_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("enet1_bypass_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_BYPASS);
> +	imx_clk_scu("enet1_rgmii_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_MISC0);
> +	imx_clk_scu("gpmi_io_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_MST_BUS);
> +	imx_clk_scu("gpmi_bch_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("usb3_aclk_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("usb3_bus_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MST_BUS);
> +	imx_clk_scu("usb3_lpm_div", IMX_SC_R_USB_2, IMX_SC_PM_CLK_MISC);
>  
>  	/* Display controller SS */
> -	clks[IMX_DC0_DISP0_CLK]		= imx_clk_scu2("dc0_disp0_clk", dc0_sels, ARRAY_SIZE(dc0_sels), IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC0, clk_cells);
> -	clks[IMX_DC0_DISP1_CLK]		= imx_clk_scu2("dc0_disp1_clk", dc0_sels, ARRAY_SIZE(dc0_sels), IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC1, clk_cells);
> -	clks[IMX_DC0_PLL0_CLK]		= imx_clk_scu("dc0_pll0_clk", IMX_SC_R_DC_0_PLL_0, IMX_SC_PM_CLK_PLL, clk_cells);
> -	clks[IMX_DC0_PLL1_CLK]		= imx_clk_scu("dc0_pll1_clk", IMX_SC_R_DC_0_PLL_1, IMX_SC_PM_CLK_PLL, clk_cells);
> -	clks[IMX_DC0_BYPASS0_CLK]	= imx_clk_scu("dc0_bypass0_clk", IMX_SC_R_DC_0_VIDEO0, IMX_SC_PM_CLK_BYPASS, clk_cells);
> -	clks[IMX_DC0_BYPASS1_CLK]	= imx_clk_scu("dc0_bypass1_clk", IMX_SC_R_DC_0_VIDEO1, IMX_SC_PM_CLK_BYPASS, clk_cells);
> +	imx_clk_scu2("dc0_disp0_clk", dc0_sels, ARRAY_SIZE(dc0_sels), IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC0);
> +	imx_clk_scu2("dc0_disp1_clk", dc0_sels, ARRAY_SIZE(dc0_sels), IMX_SC_R_DC_0, IMX_SC_PM_CLK_MISC1);
> +	imx_clk_scu("dc0_pll0_clk", IMX_SC_R_DC_0_PLL_0, IMX_SC_PM_CLK_PLL);
> +	imx_clk_scu("dc0_pll1_clk", IMX_SC_R_DC_0_PLL_1, IMX_SC_PM_CLK_PLL);
> +	imx_clk_scu("dc0_bypass0_clk", IMX_SC_R_DC_0_VIDEO0, IMX_SC_PM_CLK_BYPASS);
> +	imx_clk_scu("dc0_bypass1_clk", IMX_SC_R_DC_0_VIDEO1, IMX_SC_PM_CLK_BYPASS);
>  
>  	/* MIPI-LVDS SS */
> -	clks[IMX_MIPI0_LVDS_PIXEL_CLK]	= imx_clk_scu("mipi0_lvds_pixel_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC2, clk_cells);
> -	clks[IMX_MIPI0_LVDS_BYPASS_CLK]	= imx_clk_scu("mipi0_lvds_bypass_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_BYPASS, clk_cells);
> -	clks[IMX_MIPI0_LVDS_PHY_CLK]	= imx_clk_scu("mipi0_lvds_phy_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC3, clk_cells);
> -	clks[IMX_MIPI0_I2C0_CLK]	= imx_clk_scu("mipi0_i2c0_clk", IMX_SC_R_MIPI_0_I2C_0, IMX_SC_PM_CLK_MISC2, clk_cells);
> -	clks[IMX_MIPI0_I2C1_CLK]	= imx_clk_scu("mipi0_i2c1_clk", IMX_SC_R_MIPI_0_I2C_1, IMX_SC_PM_CLK_MISC2, clk_cells);
> -	clks[IMX_MIPI0_PWM0_CLK]	= imx_clk_scu("mipi0_pwm0_clk", IMX_SC_R_MIPI_0_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_MIPI1_LVDS_PIXEL_CLK]	= imx_clk_scu("mipi1_lvds_pixel_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC2, clk_cells);
> -	clks[IMX_MIPI1_LVDS_BYPASS_CLK]	= imx_clk_scu("mipi1_lvds_bypass_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_BYPASS, clk_cells);
> -	clks[IMX_MIPI1_LVDS_PHY_CLK]	= imx_clk_scu("mipi1_lvds_phy_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC3, clk_cells);
> -	clks[IMX_MIPI1_I2C0_CLK]	= imx_clk_scu("mipi1_i2c0_clk", IMX_SC_R_MIPI_1_I2C_0, IMX_SC_PM_CLK_MISC2, clk_cells);
> -	clks[IMX_MIPI1_I2C1_CLK]	= imx_clk_scu("mipi1_i2c1_clk", IMX_SC_R_MIPI_1_I2C_1, IMX_SC_PM_CLK_MISC2, clk_cells);
> -	clks[IMX_MIPI1_PWM0_CLK]	= imx_clk_scu("mipi1_pwm0_clk", IMX_SC_R_MIPI_1_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
> +	imx_clk_scu("mipi0_lvds_pixel_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu("mipi0_lvds_bypass_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_BYPASS);
> +	imx_clk_scu("mipi0_lvds_phy_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC3);
> +	imx_clk_scu("mipi0_i2c0_clk", IMX_SC_R_MIPI_0_I2C_0, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu("mipi0_i2c1_clk", IMX_SC_R_MIPI_0_I2C_1, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu("mipi0_pwm0_clk", IMX_SC_R_MIPI_0_PWM_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("mipi1_lvds_pixel_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu("mipi1_lvds_bypass_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_BYPASS);
> +	imx_clk_scu("mipi1_lvds_phy_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC3);
> +	imx_clk_scu("mipi1_i2c0_clk", IMX_SC_R_MIPI_1_I2C_0, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu("mipi1_i2c1_clk", IMX_SC_R_MIPI_1_I2C_1, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu("mipi1_pwm0_clk", IMX_SC_R_MIPI_1_PWM_0, IMX_SC_PM_CLK_PER);
>  
>  	/* MIPI CSI SS */
> -	clks[IMX_CSI0_CORE_CLK]		= imx_clk_scu("mipi_csi0_core_clk", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_CSI0_ESC_CLK]		= imx_clk_scu("mipi_csi0_esc_clk",  IMX_SC_R_CSI_0, IMX_SC_PM_CLK_MISC, clk_cells);
> -	clks[IMX_CSI0_I2C0_CLK]		= imx_clk_scu("mipi_csi0_i2c0_clk", IMX_SC_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_CSI0_PWM0_CLK]		= imx_clk_scu("mipi_csi0_pwm0_clk", IMX_SC_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER, clk_cells);
> +	imx_clk_scu("mipi_csi0_core_clk", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("mipi_csi0_esc_clk",  IMX_SC_R_CSI_0, IMX_SC_PM_CLK_MISC);
> +	imx_clk_scu("mipi_csi0_i2c0_clk", IMX_SC_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("mipi_csi0_pwm0_clk", IMX_SC_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER);
>  
>  	/* GPU SS */
> -	clks[IMX_GPU0_CORE_CLK]		= imx_clk_scu("gpu_core0_clk",	 IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_PER, clk_cells);
> -	clks[IMX_GPU0_SHADER_CLK]	= imx_clk_scu("gpu_shader0_clk", IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_MISC, clk_cells);
> -
> -	for (i = 0; i < clk_data->num; i++) {
> -		if (IS_ERR(clks[i]))
> -			pr_warn("i.MX clk %u: register failed with %ld\n",
> -				i, PTR_ERR(clks[i]));
> -	}
> -
> -	if (clk_cells == 2) {
> -		ret = of_clk_add_hw_provider(ccm_node, imx_scu_of_clk_src_get, imx_scu_clks);
> -		if (ret)
> -			imx_clk_scu_unregister();
> -	} else {
> -		/*
> -		 * legacy binding code path doesn't unregister here because
> -		 * it will be removed later.
> -		 */
> -		ret = of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, clk_data);
> -	}
> +	imx_clk_scu("gpu_core0_clk",	 IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("gpu_shader0_clk", IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_MISC);
> +
> +	ret = of_clk_add_hw_provider(ccm_node, imx_scu_of_clk_src_get, imx_scu_clks);
> +	if (ret)
> +		imx_clk_scu_unregister();
>  
>  	return ret;
>  }
> diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
> index e8352164923e..a6c6d3103e94 100644
> --- a/drivers/clk/imx/clk-scu.h
> +++ b/drivers/clk/imx/clk-scu.h
> @@ -32,22 +32,15 @@ struct clk_hw *__imx_clk_lpcg_scu(struct device *dev, const char *name,
>  void imx_clk_lpcg_scu_unregister(struct clk_hw *hw);
>  
>  static inline struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id,
> -					 u8 clk_type, u8 clk_cells)
> +					 u8 clk_type)
>  {
> -	if (clk_cells == 2)
> -		return imx_clk_scu_alloc_dev(name, NULL, 0, rsrc_id, clk_type);
> -	else
> -		return __imx_clk_scu(NULL, name, NULL, 0, rsrc_id, clk_type);
> +	return imx_clk_scu_alloc_dev(name, NULL, 0, rsrc_id, clk_type);
>  }
>  
>  static inline struct clk_hw *imx_clk_scu2(const char *name, const char * const *parents,
> -					  int num_parents, u32 rsrc_id, u8 clk_type,
> -					  u8 clk_cells)
> +					  int num_parents, u32 rsrc_id, u8 clk_type)
>  {
> -	if (clk_cells == 2)
> -		return imx_clk_scu_alloc_dev(name, parents, num_parents, rsrc_id, clk_type);
> -	else
> -		return __imx_clk_scu(NULL, name, parents, num_parents, rsrc_id, clk_type);
> +	return imx_clk_scu_alloc_dev(name, parents, num_parents, rsrc_id, clk_type);
>  }
>  
>  static inline struct clk_hw *imx_clk_lpcg_scu_dev(struct device *dev, const char *name,
> diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/clock/imx8-clock.h
> index 82b1fc8d1ee0..2e60ce4d2622 100644
> --- a/include/dt-bindings/clock/imx8-clock.h
> +++ b/include/dt-bindings/clock/imx8-clock.h
> @@ -7,134 +7,6 @@
>  #ifndef __DT_BINDINGS_CLOCK_IMX_H
>  #define __DT_BINDINGS_CLOCK_IMX_H
>  
> -/* SCU Clocks */
> -
> -#define IMX_CLK_DUMMY				0
> -
> -/* CPU */
> -#define IMX_A35_CLK					1
> -
> -/* LSIO SS */
> -#define IMX_LSIO_MEM_CLK				2
> -#define IMX_LSIO_BUS_CLK				3
> -#define IMX_LSIO_PWM0_CLK				10
> -#define IMX_LSIO_PWM1_CLK				11
> -#define IMX_LSIO_PWM2_CLK				12
> -#define IMX_LSIO_PWM3_CLK				13
> -#define IMX_LSIO_PWM4_CLK				14
> -#define IMX_LSIO_PWM5_CLK				15
> -#define IMX_LSIO_PWM6_CLK				16
> -#define IMX_LSIO_PWM7_CLK				17
> -#define IMX_LSIO_GPT0_CLK				18
> -#define IMX_LSIO_GPT1_CLK				19
> -#define IMX_LSIO_GPT2_CLK				20
> -#define IMX_LSIO_GPT3_CLK				21
> -#define IMX_LSIO_GPT4_CLK				22
> -#define IMX_LSIO_FSPI0_CLK				23
> -#define IMX_LSIO_FSPI1_CLK				24
> -
> -/* Connectivity SS */
> -#define IMX_CONN_AXI_CLK_ROOT				30
> -#define IMX_CONN_AHB_CLK_ROOT				31
> -#define IMX_CONN_IPG_CLK_ROOT				32
> -#define IMX_CONN_SDHC0_CLK				40
> -#define IMX_CONN_SDHC1_CLK				41
> -#define IMX_CONN_SDHC2_CLK				42
> -#define IMX_CONN_ENET0_ROOT_CLK				43
> -#define IMX_CONN_ENET0_BYPASS_CLK			44
> -#define IMX_CONN_ENET0_RGMII_CLK			45
> -#define IMX_CONN_ENET1_ROOT_CLK				46
> -#define IMX_CONN_ENET1_BYPASS_CLK			47
> -#define IMX_CONN_ENET1_RGMII_CLK			48
> -#define IMX_CONN_GPMI_BCH_IO_CLK			49
> -#define IMX_CONN_GPMI_BCH_CLK				50
> -#define IMX_CONN_USB2_ACLK				51
> -#define IMX_CONN_USB2_BUS_CLK				52
> -#define IMX_CONN_USB2_LPM_CLK				53
> -
> -/* HSIO SS */
> -#define IMX_HSIO_AXI_CLK				60
> -#define IMX_HSIO_PER_CLK				61
> -
> -/* Display controller SS */
> -#define IMX_DC_AXI_EXT_CLK				70
> -#define IMX_DC_AXI_INT_CLK				71
> -#define IMX_DC_CFG_CLK					72
> -#define IMX_DC0_PLL0_CLK				80
> -#define IMX_DC0_PLL1_CLK				81
> -#define IMX_DC0_DISP0_CLK				82
> -#define IMX_DC0_DISP1_CLK				83
> -#define IMX_DC0_BYPASS0_CLK				84
> -#define IMX_DC0_BYPASS1_CLK				85
> -
> -/* MIPI-LVDS SS */
> -#define IMX_MIPI_IPG_CLK				90
> -#define IMX_MIPI0_PIXEL_CLK				100
> -#define IMX_MIPI0_BYPASS_CLK				101
> -#define IMX_MIPI0_LVDS_PIXEL_CLK			102
> -#define IMX_MIPI0_LVDS_BYPASS_CLK			103
> -#define IMX_MIPI0_LVDS_PHY_CLK				104
> -#define IMX_MIPI0_I2C0_CLK				105
> -#define IMX_MIPI0_I2C1_CLK				106
> -#define IMX_MIPI0_PWM0_CLK				107
> -#define IMX_MIPI1_PIXEL_CLK				108
> -#define IMX_MIPI1_BYPASS_CLK				109
> -#define IMX_MIPI1_LVDS_PIXEL_CLK			110
> -#define IMX_MIPI1_LVDS_BYPASS_CLK			111
> -#define IMX_MIPI1_LVDS_PHY_CLK				112
> -#define IMX_MIPI1_I2C0_CLK				113
> -#define IMX_MIPI1_I2C1_CLK				114
> -#define IMX_MIPI1_PWM0_CLK				115
> -
> -/* IMG SS */
> -#define IMX_IMG_AXI_CLK					120
> -#define IMX_IMG_IPG_CLK					121
> -#define IMX_IMG_PXL_CLK					122
> -
> -/* MIPI-CSI SS */
> -#define IMX_CSI0_CORE_CLK				130
> -#define IMX_CSI0_ESC_CLK				131
> -#define IMX_CSI0_PWM0_CLK				132
> -#define IMX_CSI0_I2C0_CLK				133
> -
> -/* PARALLER CSI SS */
> -#define IMX_PARALLEL_CSI_DPLL_CLK			140
> -#define IMX_PARALLEL_CSI_PIXEL_CLK			141
> -#define IMX_PARALLEL_CSI_MCLK_CLK			142
> -
> -/* VPU SS */
> -#define IMX_VPU_ENC_CLK					150
> -#define IMX_VPU_DEC_CLK					151
> -
> -/* GPU SS */
> -#define IMX_GPU0_CORE_CLK				160
> -#define IMX_GPU0_SHADER_CLK				161
> -
> -/* ADMA SS */
> -#define IMX_ADMA_IPG_CLK_ROOT				165
> -#define IMX_ADMA_UART0_CLK				170
> -#define IMX_ADMA_UART1_CLK				171
> -#define IMX_ADMA_UART2_CLK				172
> -#define IMX_ADMA_UART3_CLK				173
> -#define IMX_ADMA_SPI0_CLK				174
> -#define IMX_ADMA_SPI1_CLK				175
> -#define IMX_ADMA_SPI2_CLK				176
> -#define IMX_ADMA_SPI3_CLK				177
> -#define IMX_ADMA_CAN0_CLK				178
> -#define IMX_ADMA_CAN1_CLK				179
> -#define IMX_ADMA_CAN2_CLK				180
> -#define IMX_ADMA_I2C0_CLK				181
> -#define IMX_ADMA_I2C1_CLK				182
> -#define IMX_ADMA_I2C2_CLK				183
> -#define IMX_ADMA_I2C3_CLK				184
> -#define IMX_ADMA_FTM0_CLK				185
> -#define IMX_ADMA_FTM1_CLK				186
> -#define IMX_ADMA_ADC0_CLK				187
> -#define IMX_ADMA_PWM_CLK				188
> -#define IMX_ADMA_LCD_CLK				189
> -
> -#define IMX_SCU_CLK_END					190
> -
>  /* LPCG clocks */
>  
>  /* LSIO SS LPCG */
> -- 
> 2.25.1
> 
