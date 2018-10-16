Return-Path: <SRS0=lNOc=M4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E4BC5ACCC
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 21:39:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0558821470
	for <linux-clk@archiver.kernel.org>; Tue, 16 Oct 2018 21:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVH3hjmg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0558821470
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbeJQFbV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 01:31:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:53022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbeJQFbU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 01:31:20 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5A942086E;
        Tue, 16 Oct 2018 21:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539725940;
        bh=NMXjA5ovXrorL5KdxbHz0wzTP/lZwyt2BFWouoy1aAA=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=UVH3hjmgreF9XtzAycspApZtElf2w/86jFO+S22HzLFPlPGOYCImexGd4kYM1HR3C
         ojStOo/6HpBHPTOAK1SinVMwTr9HV1ZjJTc0yePGH0aTqKZQQx2REyL81sdSqZmtdf
         mheJy5VcOe/nz+4R0zmXlEtXkrMM+hEGaa/FIPpo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1539504194-28289-12-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-12-git-send-email-aisheng.dong@nxp.com>
Message-ID: <153972593926.5275.4006811101853084389@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH V4 11/11] clk: imx: add imx8qxp clk driver
Date:   Tue, 16 Oct 2018 14:38:59 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-14 01:08:16)
> diff --git a/drivers/clk/imx/scu/clk-imx8qxp.c b/drivers/clk/imx/scu/clk-=
imx8qxp.c
> new file mode 100644
> index 0000000..958c26d
> --- /dev/null
> +++ b/drivers/clk/imx/scu/clk-imx8qxp.c
> @@ -0,0 +1,425 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> + * Copyright 2017~2018 NXP
> + *     Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +#include <dt-bindings/clock/imx8qxp-clock.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include <soc/imx/imx8qxp/lpcg.h>
> +
> +#include "clk-scu.h"
> +
> +static struct clk_hw_onecell_data *clk_data;

Please give this static global variable a more unique name as opposed to
'clk_data'.


> +
> +static const char * const enet_sels[] =3D { "enet_25MHz", "enet_125MHz",=
 };
> +static const char * const enet0_rmii_tx_sels[] =3D { "enet0_ref_div", "d=
ummy", };
> +static const char * const enet1_rmii_tx_sels[] =3D { "enet1_ref_div", "d=
ummy", };
> +
> +static int imx8qxp_clk_probe(struct platform_device *pdev)
> +{
> +       struct device_node *ccm_node =3D pdev->dev.of_node;
> +       struct clk_hw **clks;
> +       int ret;
> +
> +       ret =3D imx_clk_scu_init();
> +       if (ret)
> +               return ret;
> +
> +       clk_data =3D devm_kzalloc(&pdev->dev, sizeof(*clk_data) +
> +                               sizeof(*clk_data->hws) * IMX8QXP_CLK_END,
> +                               GFP_KERNEL);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       clk_data->num =3D IMX8QXP_CLK_END;
> +       clks =3D clk_data->hws;
> +
> +       /* Fixed clocks */
> +       clks[IMX8QXP_CLK_DUMMY]         =3D imx_clk_hw_fixed("dummy", 0);
> +       clks[IMX8QXP_24MHZ]             =3D imx_clk_hw_fixed("xtal_24MHz"=
, 24000000);
> +       clks[IMX8QXP_GPT_3M]            =3D imx_clk_hw_fixed("gpt_3m", 30=
00000);
> +       clks[IMX8QXP_32KHZ]             =3D imx_clk_hw_fixed("xtal_32KHz"=
, 32768);
> +
> +       /* ARM core */
> +       clks[IMX8QXP_A35_DIV]           =3D imx_clk_divider_scu("a35_div"=
, IMX_SC_R_A35, IMX_SC_PM_CLK_CPU);
> +
> +       clks[IMX8QXP_IPG_DMA_CLK_ROOT]  =3D imx_clk_hw_fixed("ipg_dma_clk=
_root", 120000000);
> +       clks[IMX8QXP_AXI_CONN_CLK_ROOT] =3D imx_clk_hw_fixed("axi_conn_cl=
k_root", 333333333);
> +       clks[IMX8QXP_AHB_CONN_CLK_ROOT] =3D imx_clk_hw_fixed("ahb_conn_cl=
k_root", 166666666);
> +       clks[IMX8QXP_IPG_CONN_CLK_ROOT] =3D imx_clk_hw_fixed("ipg_conn_cl=
k_root", 83333333);
> +       clks[IMX8QXP_DC_AXI_EXT_CLK]    =3D imx_clk_hw_fixed("axi_ext_dc_=
clk_root", 800000000);
> +       clks[IMX8QXP_DC_AXI_INT_CLK]    =3D imx_clk_hw_fixed("axi_int_dc_=
clk_root", 400000000);
> +       clks[IMX8QXP_DC_CFG_CLK]        =3D imx_clk_hw_fixed("cfg_dc_clk_=
root", 100000000);
> +       clks[IMX8QXP_MIPI_IPG_CLK]      =3D imx_clk_hw_fixed("ipg_mipi_cl=
k_root", 120000000);
> +       clks[IMX8QXP_IMG_AXI_CLK]       =3D imx_clk_hw_fixed("axi_img_clk=
_root", 400000000);
> +       clks[IMX8QXP_IMG_IPG_CLK]       =3D imx_clk_hw_fixed("ipg_img_clk=
_root", 200000000);
> +       clks[IMX8QXP_IMG_PXL_CLK]       =3D imx_clk_hw_fixed("pxl_img_clk=
_root", 600000000);
> +       clks[IMX8QXP_HSIO_AXI_CLK]      =3D imx_clk_hw_fixed("axi_hsio_cl=
k_root", 400000000);
> +       clks[IMX8QXP_HSIO_PER_CLK]      =3D imx_clk_hw_fixed("per_hsio_cl=
k_root", 133333333);

Can these fixed rate clks come from DT? Or what's going on here?

> +
> +       clks[IMX8QXP_UART0_DIV]         =3D imx_clk_divider_scu("uart0_di=
v", IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER);
> +       clks[IMX8QXP_UART0_IPG_CLK]     =3D imx_clk_gate2_scu("uart0_ipg_=
clk", "ipg_dma_clk_root", (void __iomem *)(LPUART_0_LPCG), 16, 0);
> +       clks[IMX8QXP_UART0_CLK]         =3D imx_clk_gate_scu("uart0_clk",=
 "uart0_div", IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER, (void __iomem *)(LPUART_0=
_LPCG), 0, 0);
> +
[...]
> +       clks[IMX8QXP_IMG_PDMA_2_CLK]            =3D imx_clk_gate2_scu("im=
g_pdma2_clk", "pxl_img_clk_root", (void __iomem *)(IMG_PDMA_2_LPCG), 0, 0);
> +       clks[IMX8QXP_IMG_PDMA_3_CLK]            =3D imx_clk_gate2_scu("im=
g_pdma3_clk", "pxl_img_clk_root", (void __iomem *)(IMG_PDMA_3_LPCG), 0, 0);
> +       clks[IMX8QXP_IMG_PDMA_4_CLK]            =3D imx_clk_gate2_scu("im=
g_pdma4_clk", "pxl_img_clk_root", (void __iomem *)(IMG_PDMA_4_LPCG), 0, 0);
> +       clks[IMX8QXP_IMG_PDMA_5_CLK]            =3D imx_clk_gate2_scu("im=
g_pdma5_clk", "pxl_img_clk_root", (void __iomem *)(IMG_PDMA_5_LPCG), 0, 0);
> +       clks[IMX8QXP_IMG_PDMA_6_CLK]            =3D imx_clk_gate2_scu("im=
g_pdma6_clk", "pxl_img_clk_root", (void __iomem *)(IMG_PDMA_6_LPCG), 0, 0);
> +       clks[IMX8QXP_IMG_PDMA_7_CLK]            =3D imx_clk_gate2_scu("im=
g_pdma7_clk", "pxl_img_clk_root", (void __iomem *)(IMG_PDMA_7_LPCG), 0, 0);

All the casts in here shouldn't be necessary, see below.

> +
> +       /* MIPI CSI SS */
> +       clks[IMX8QXP_CSI0_I2C0_DIV]     =3D imx_clk_divider_scu("mipi_csi=
0_i2c0_div", IMX_SC_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER);
> +       clks[IMX8QXP_CSI0_PWM0_DIV]     =3D imx_clk_divider_scu("mipi_csi=
0_pwm0_div", IMX_SC_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER);
> +       clks[IMX8QXP_CSI0_CORE_DIV]     =3D imx_clk_divider_scu("mipi_csi=
0_core_div", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER);
> +       clks[IMX8QXP_CSI0_ESC_DIV]      =3D imx_clk_divider_scu("mipi_csi=
0_esc_div", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_MISC);
> +       clks[IMX8QXP_CSI0_IPG_CLK_S]    =3D imx_clk_gate2_scu("mipi_csi0_=
ipg_s", "ipg_mipi_csi_clk_root", (void __iomem *)(MIPI_CSI_0_LPCG + 0x8), 1=
6, 0);
> +       clks[IMX8QXP_CSI0_IPG_CLK]      =3D imx_clk_gate2_scu("mipi_csi0_=
ipg", "mipi_csi0_ipg_s", (void __iomem *)(MIPI_CSI_0_LPCG), 16, 0);
> +       clks[IMX8QXP_CSI0_APB_CLK]      =3D imx_clk_gate2_scu("mipi_csi0_=
apb_clk", "ipg_mipi_csi_clk_root", (void __iomem *)(MIPI_CSI_0_LPCG + 0x4),=
 16,  0);
> +       clks[IMX8QXP_CSI0_I2C0_IPG_CLK] =3D imx_clk_gate2_scu("mipi_csi0_=
i2c0_ipg_s", "ipg_mipi_csi_clk_root", (void __iomem *)(MIPI_CSI_0_LPCG + 0x=
14), 16, 0);
> +       clks[IMX8QXP_CSI0_I2C0_CLK]     =3D imx_clk_gate_scu("mipi_csi0_i=
2c0_clk", "mipi_csi0_i2c0_div", IMX_SC_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER, (v=
oid __iomem *)(MIPI_CSI_0_LPCG + 0x14), 0, 0);
> +       clks[IMX8QXP_CSI0_PWM0_IPG_CLK] =3D imx_clk_gate2_scu("mipi_csi0_=
pwm0_ipg_s", "ipg_mipi_csi_clk_root", (void __iomem *)(MIPI_CSI_0_LPCG + 0x=
10), 16, 0);
> +       clks[IMX8QXP_CSI0_PWM0_CLK]     =3D imx_clk_gate_scu("mipi_csi0_p=
wm0_clk", "mipi_csi0_pwm0_div", IMX_SC_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER, (v=
oid __iomem *)(MIPI_CSI_0_LPCG + 0x10), 0, 0);
> +       clks[IMX8QXP_CSI0_CORE_CLK]     =3D imx_clk_gate_scu("mipi_csi0_c=
ore_clk", "mipi_csi0_core_div", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER, (void __=
iomem *)(MIPI_CSI_0_LPCG + 0x18), 16, 0);
> +       clks[IMX8QXP_CSI0_ESC_CLK]      =3D imx_clk_gate_scu("mipi_csi0_e=
sc_clk", "mipi_csi0_esc_div", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_MISC, (void __i=
omem *)(MIPI_CSI_0_LPCG + 0x1C), 16, 0);
> +
> +       /* HSIO SS */
> +       clks[IMX8QXP_HSIO_PCIE_MSTR_AXI_CLK]    =3D imx_clk_gate2_scu("hs=
io_pcie_mstr_axi_clk", "axi_hsio_clk_root", (void __iomem *)(HSIO_PCIE_X1_L=
PCG), 16, 0);
> +       clks[IMX8QXP_HSIO_PCIE_SLV_AXI_CLK]     =3D imx_clk_gate2_scu("hs=
io_pcie_slv_axi_clk", "axi_hsio_clk_root", (void __iomem *)(HSIO_PCIE_X1_LP=
CG), 20, 0);
> +       clks[IMX8QXP_HSIO_PCIE_DBI_AXI_CLK]     =3D imx_clk_gate2_scu("hs=
io_pcie_dbi_axi_clk", "axi_hsio_clk_root", (void __iomem *)(HSIO_PCIE_X1_LP=
CG), 24, 0);
> +       clks[IMX8QXP_HSIO_PCIE_X1_PER_CLK]      =3D imx_clk_gate2_scu("hs=
io_pcie_x1_per_clk", "per_hsio_clk_root", (void __iomem *)(HSIO_PCIE_X1_CRR=
3_LPCG), 16, 0);
> +       clks[IMX8QXP_HSIO_PHY_X1_PER_CLK]       =3D imx_clk_gate2_scu("hs=
io_phy_x1_per_clk", "per_hsio_clk_root", (void __iomem *)(HSIO_PHY_X1_CRR1_=
LPCG), 16, 0);
> +       clks[IMX8QXP_HSIO_MISC_PER_CLK]         =3D imx_clk_gate2_scu("hs=
io_misc_per_clk", "per_hsio_clk_root", (void __iomem *)(HSIO_MISC_LPCG), 16=
, 0);
> +       clks[IMX8QXP_HSIO_PHY_X1_APB_CLK]       =3D imx_clk_gate2_scu("hs=
io_phy_x1_apb_clk", "per_hsio_clk_root", (void __iomem *)(HSIO_PHY_X1_LPCG)=
, 16, 0);
> +       clks[IMX8QXP_HSIO_GPIO_CLK]             =3D imx_clk_gate2_scu("hs=
io_gpio_clk", "per_hsio_clk_root", (void __iomem *)(HSIO_GPIO_LPCG), 16, 0);
> +       clks[IMX8QXP_HSIO_PHY_X1_PCLK]          =3D imx_clk_gate2_scu("hs=
io_phy_x1_pclk", "dummy", (void __iomem *)(HSIO_PHY_X1_LPCG), 0, 0);
> +
> +       imx_check_clk_hws(clks, clk_data->num);
> +
> +       of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, clk_data);
> +
> +       pr_info("i.MX8QXP clock tree init done.\n");

Please no "I'm alive!" messages.

> +
> +       return 0;
> +}
> +
> +static const struct of_device_id imx8qxp_match[] =3D {
> +       { .compatible =3D "fsl,imx8qxp-clk", },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver imx8qxp_clk_driver =3D {
> +       .driver =3D {
> +               .name =3D "imx8qxp-clk",
> +               .of_match_table =3D imx8qxp_match,
> +       },
> +       .probe =3D imx8qxp_clk_probe,
> +};
> +
> +static int __init imx8qxp_clk_init(void)
> +{
> +       return platform_driver_register(&imx8qxp_clk_driver);
> +}
> +core_initcall(imx8qxp_clk_init);
> diff --git a/include/soc/imx/imx8qxp/lpcg.h b/include/soc/imx/imx8qxp/lpc=
g.h
> new file mode 100644
> index 0000000..afbb5da
> --- /dev/null
> +++ b/include/soc/imx/imx8qxp/lpcg.h
> @@ -0,0 +1,186 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> + * Copyright 2017~2018 NXP
> + *
> + */
> +
> +#ifndef _SC_LPCG_H
> +#define _SC_LPCG_H
> +
> +/*LSIO SS */
> +#define                PWM_0_LPCG              0x5D400000

Are these virtual or physical addresses? Because up above they're casted
right into void __iomem pointers, which makes me thing they're virtual
addresses, but then that would mean there's some sort of static iomap
being used, but I'm not aware of anything like that.

