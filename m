Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEF8C433ED
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 07:17:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BC8D613D6
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 07:17:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhEMHS5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 May 2021 03:18:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:59968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229786AbhEMHS4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 May 2021 03:18:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 561BB611AE;
        Thu, 13 May 2021 07:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620890267;
        bh=G1DL/ecO/4OrJh2St+MtpCfNfvI/z8JF02rlHR4AU4U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kfy2GSW01jBB7erWsZdVzBY8kj/RdebIZBuSiKrvATNY35LmR20syeZIflh3q2s0l
         OTujM+dRFsHfuZ3ma+o0yQvffYn6Gn0ZEpJjboz5Q8svJKhEysJFekpQoLyviBYd2d
         nVBHrzbEpCl7Izh9QyKKaiLIe2yi4KIwX9cvbwZneVV4q4iWYkbCrmCxbpACKu8biR
         X0iuegccZl72iVey7g1VoJDqR59oLDKbSLjVijefgh0Sf8yz7Vinbfx6wnTyt+2Wh3
         Hda8++COc9JLl7K+1gHtwAgd5GlprLj0FmUi6viHwVZBmoUJMXu7X22BCUME5YyVxg
         Oq/hgHAwLq9Og==
Date:   Thu, 13 May 2021 10:17:43 +0300
From:   Abel Vesa <abelvesa@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com, abel.vesa@nxp.com, sboyd@kernel.org
Subject: Re: [PATCH 6/6] clk: imx8qm: add clock valid resource checking
Message-ID: <YJzSlz5ELBcrC54Q@ryzen.lan>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
 <20210423033334.3317992-6-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423033334.3317992-6-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-04-23 11:33:34, Dong Aisheng wrote:
> Add imx8qm clock valid resource checking mechanism
> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/Makefile          |   2 +-
>  drivers/clk/imx/clk-imx8qm-rsrc.c | 116 ++++++++++++++++++++++++++++++
>  drivers/clk/imx/clk-imx8qxp.c     |   1 +
>  drivers/clk/imx/clk-scu.h         |   1 +
>  4 files changed, 119 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/imx/clk-imx8qm-rsrc.c
> 
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index 2fdd2fff16c7..c24a2acbfa56 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -28,7 +28,7 @@ obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
>  
>  obj-$(CONFIG_MXC_CLK_SCU) += clk-imx-scu.o clk-imx-lpcg-scu.o
>  clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o \
> -				     clk-imx8qxp-rsrc.o
> +				     clk-imx8qxp-rsrc.o clk-imx8qm-rsrc.o
>  clk-imx-lpcg-scu-$(CONFIG_CLK_IMX8QXP) += clk-lpcg-scu.o clk-imx8qxp-lpcg.o
>  
>  obj-$(CONFIG_CLK_IMX1)   += clk-imx1.o
> diff --git a/drivers/clk/imx/clk-imx8qm-rsrc.c b/drivers/clk/imx/clk-imx8qm-rsrc.c
> new file mode 100644
> index 000000000000..183a071cbf20
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imx8qm-rsrc.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2019-2021 NXP
> + *	Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +#include <dt-bindings/firmware/imx/rsrc.h>
> +
> +#include "clk-scu.h"
> +
> +/* Keep sorted in the ascending order */
> +static u32 imx8qm_clk_scu_rsrc_table[] = {
> +	IMX_SC_R_A53,
> +	IMX_SC_R_A72,
> +	IMX_SC_R_DC_0_VIDEO0,
> +	IMX_SC_R_DC_0_VIDEO1,
> +	IMX_SC_R_DC_0,
> +	IMX_SC_R_DC_0_PLL_0,
> +	IMX_SC_R_DC_0_PLL_1,
> +	IMX_SC_R_DC_1_VIDEO0,
> +	IMX_SC_R_DC_1_VIDEO1,
> +	IMX_SC_R_DC_1,
> +	IMX_SC_R_DC_1_PLL_0,
> +	IMX_SC_R_DC_1_PLL_1,
> +	IMX_SC_R_SPI_0,
> +	IMX_SC_R_SPI_1,
> +	IMX_SC_R_SPI_2,
> +	IMX_SC_R_SPI_3,
> +	IMX_SC_R_UART_0,
> +	IMX_SC_R_UART_1,
> +	IMX_SC_R_UART_2,
> +	IMX_SC_R_UART_3,
> +	IMX_SC_R_UART_4,
> +	IMX_SC_R_EMVSIM_0,
> +	IMX_SC_R_EMVSIM_1,
> +	IMX_SC_R_I2C_0,
> +	IMX_SC_R_I2C_1,
> +	IMX_SC_R_I2C_2,
> +	IMX_SC_R_I2C_3,
> +	IMX_SC_R_I2C_4,
> +	IMX_SC_R_ADC_0,
> +	IMX_SC_R_ADC_1,
> +	IMX_SC_R_FTM_0,
> +	IMX_SC_R_FTM_1,
> +	IMX_SC_R_CAN_0,
> +	IMX_SC_R_GPU_0_PID0,
> +	IMX_SC_R_GPU_1_PID0,
> +	IMX_SC_R_PWM_0,
> +	IMX_SC_R_PWM_1,
> +	IMX_SC_R_PWM_2,
> +	IMX_SC_R_PWM_3,
> +	IMX_SC_R_PWM_4,
> +	IMX_SC_R_PWM_5,
> +	IMX_SC_R_PWM_6,
> +	IMX_SC_R_PWM_7,
> +	IMX_SC_R_GPT_0,
> +	IMX_SC_R_GPT_1,
> +	IMX_SC_R_GPT_2,
> +	IMX_SC_R_GPT_3,
> +	IMX_SC_R_GPT_4,
> +	IMX_SC_R_FSPI_0,
> +	IMX_SC_R_FSPI_1,
> +	IMX_SC_R_SDHC_0,
> +	IMX_SC_R_SDHC_1,
> +	IMX_SC_R_SDHC_2,
> +	IMX_SC_R_ENET_0,
> +	IMX_SC_R_ENET_1,
> +	IMX_SC_R_MLB_0,
> +	IMX_SC_R_USB_2,
> +	IMX_SC_R_NAND,
> +	IMX_SC_R_LVDS_0,
> +	IMX_SC_R_LVDS_0_PWM_0,
> +	IMX_SC_R_LVDS_0_I2C_0,
> +	IMX_SC_R_LVDS_0_I2C_1,
> +	IMX_SC_R_LVDS_1,
> +	IMX_SC_R_LVDS_1_PWM_0,
> +	IMX_SC_R_LVDS_1_I2C_0,
> +	IMX_SC_R_LVDS_1_I2C_1,
> +	IMX_SC_R_M4_0_I2C,
> +	IMX_SC_R_M4_1_I2C,
> +	IMX_SC_R_AUDIO_PLL_0,
> +	IMX_SC_R_VPU_UART,
> +	IMX_SC_R_VPUCORE,
> +	IMX_SC_R_MIPI_0,
> +	IMX_SC_R_MIPI_0_PWM_0,
> +	IMX_SC_R_MIPI_0_I2C_0,
> +	IMX_SC_R_MIPI_0_I2C_1,
> +	IMX_SC_R_MIPI_1,
> +	IMX_SC_R_MIPI_1_PWM_0,
> +	IMX_SC_R_MIPI_1_I2C_0,
> +	IMX_SC_R_MIPI_1_I2C_1,
> +	IMX_SC_R_CSI_0,
> +	IMX_SC_R_CSI_0_PWM_0,
> +	IMX_SC_R_CSI_0_I2C_0,
> +	IMX_SC_R_CSI_1,
> +	IMX_SC_R_CSI_1_PWM_0,
> +	IMX_SC_R_CSI_1_I2C_0,
> +	IMX_SC_R_HDMI,
> +	IMX_SC_R_HDMI_I2S,
> +	IMX_SC_R_HDMI_I2C_0,
> +	IMX_SC_R_HDMI_PLL_0,
> +	IMX_SC_R_HDMI_RX,
> +	IMX_SC_R_HDMI_RX_BYPASS,
> +	IMX_SC_R_HDMI_RX_I2C_0,
> +	IMX_SC_R_AUDIO_PLL_1,
> +	IMX_SC_R_AUDIO_CLK_0,
> +	IMX_SC_R_AUDIO_CLK_1,
> +	IMX_SC_R_HDMI_RX_PWM_0,
> +	IMX_SC_R_HDMI_PLL_1,
> +	IMX_SC_R_VPU,
> +};
> +
> +const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qm = {
> +	.rsrc = imx8qm_clk_scu_rsrc_table,
> +	.num = ARRAY_SIZE(imx8qm_clk_scu_rsrc_table),
> +};
> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> index 9e35ae45b3a0..88cc737ee125 100644
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -134,6 +134,7 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
>  static const struct of_device_id imx8qxp_match[] = {
>  	{ .compatible = "fsl,scu-clk", },
>  	{ .compatible = "fsl,imx8qxp-clk", &imx_clk_scu_rsrc_imx8qxp, },
> +	{ .compatible = "fsl,imx8qm-clk", &imx_clk_scu_rsrc_imx8qm, },
>  	{ /* sentinel */ }
>  };
>  
> diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
> index bcacd8b1d1ab..22156e93b85d 100644
> --- a/drivers/clk/imx/clk-scu.h
> +++ b/drivers/clk/imx/clk-scu.h
> @@ -22,6 +22,7 @@ struct imx_clk_scu_rsrc_table {
>  extern struct list_head imx_scu_clks[];
>  extern const struct dev_pm_ops imx_clk_lpcg_scu_pm_ops;
>  extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qxp;
> +extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qm;
>  
>  int imx_clk_scu_init(struct device_node *np,
>  		     const struct imx_clk_scu_rsrc_table *data);
> -- 
> 2.25.1
> 
