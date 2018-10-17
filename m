Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA5EECDE3A
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:20:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78A3F21526
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:20:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSebVeNx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78A3F21526
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbeJQXQd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 19:16:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:48434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbeJQXQc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 19:16:32 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 358CD2151D;
        Wed, 17 Oct 2018 15:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539789622;
        bh=WQHA5+K6Lh+Qzq0a+jJ0nj5b/BV6Joh7MXhNF7K2ERk=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=HSebVeNxqrmAT8PkIxl6insO2c/AhPwGomAeIdJrSXx7uBq5US/G15UthlQur1yUZ
         ctQJdaU5l8McpriH9fyWEv0xcUmc5YYEp9TrK+EWGQlMx/+n1c3cM/p7U/T5KRCvPj
         mJtjgfZDp05adpJcLvKSxSts76RFGc0E2kSVTFGw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB4211CA96D332FCC1ED3D547380FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-12-git-send-email-aisheng.dong@nxp.com>
 <153972593926.5275.4006811101853084389@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211CA96D332FCC1ED3D547380FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <153978961553.5275.18366013902055673508@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V4 11/11] clk: imx: add imx8qxp clk driver
Date:   Wed, 17 Oct 2018 08:20:15 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-17 02:43:05)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Sent: Wednesday, October 17, 2018 5:39 AM
> > To: A.s. Dong <aisheng.dong@nxp.com>; linux-clk@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org; mturquette@baylibre.com;
> > shawnguo@kernel.org; Fabio Estevam <fabio.estevam@nxp.com>; dl-linux-imx
> > <linux-imx@nxp.com>; kernel@pengutronix.de; A.s. Dong
> > <aisheng.dong@nxp.com>
> > Subject: Re: [PATCH V4 11/11] clk: imx: add imx8qxp clk driver
> > =

> > Quoting A.s. Dong (2018-10-14 01:08:16)
> > > diff --git a/drivers/clk/imx/scu/clk-imx8qxp.c
> > > b/drivers/clk/imx/scu/clk-imx8qxp.c
> > > new file mode 100644
> > > index 0000000..958c26d
> > > --- /dev/null
> > > +++ b/drivers/clk/imx/scu/clk-imx8qxp.c
> > =

> > > +
> > > +static const char * const enet_sels[] =3D { "enet_25MHz",
> > > +"enet_125MHz", }; static const char * const enet0_rmii_tx_sels[] =3D=
 {
> > > +"enet0_ref_div", "dummy", }; static const char * const
> > > +enet1_rmii_tx_sels[] =3D { "enet1_ref_div", "dummy", };
> > > +
> > > +static int imx8qxp_clk_probe(struct platform_device *pdev) {
> > > +       struct device_node *ccm_node =3D pdev->dev.of_node;
> > > +       struct clk_hw **clks;
> > > +       int ret;
> > > +
> > > +       ret =3D imx_clk_scu_init();
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       clk_data =3D devm_kzalloc(&pdev->dev, sizeof(*clk_data) +
> > > +                               sizeof(*clk_data->hws) *
> > IMX8QXP_CLK_END,
> > > +                               GFP_KERNEL);
> > > +       if (!clk_data)
> > > +               return -ENOMEM;
> > > +
> > > +       clk_data->num =3D IMX8QXP_CLK_END;
> > > +       clks =3D clk_data->hws;
> > > +
> > > +       /* Fixed clocks */
> > > +       clks[IMX8QXP_CLK_DUMMY]         =3D
> > imx_clk_hw_fixed("dummy", 0);
> > > +       clks[IMX8QXP_24MHZ]             =3D
> > imx_clk_hw_fixed("xtal_24MHz", 24000000);
> > > +       clks[IMX8QXP_GPT_3M]            =3D
> > imx_clk_hw_fixed("gpt_3m", 3000000);
> > > +       clks[IMX8QXP_32KHZ]             =3D
> > imx_clk_hw_fixed("xtal_32KHz", 32768);
> > > +
> =

> These are external clocks and should be put in Devicetree.

Ok, great!

> =

> > > +       /* ARM core */
> > > +       clks[IMX8QXP_A35_DIV]           =3D
> > imx_clk_divider_scu("a35_div", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU);
> > > +
> > > +       clks[IMX8QXP_IPG_DMA_CLK_ROOT]  =3D
> > imx_clk_hw_fixed("ipg_dma_clk_root", 120000000);
> > > +       clks[IMX8QXP_AXI_CONN_CLK_ROOT] =3D
> > imx_clk_hw_fixed("axi_conn_clk_root", 333333333);
> > > +       clks[IMX8QXP_AHB_CONN_CLK_ROOT] =3D
> > imx_clk_hw_fixed("ahb_conn_clk_root", 166666666);
> > > +       clks[IMX8QXP_IPG_CONN_CLK_ROOT] =3D
> > imx_clk_hw_fixed("ipg_conn_clk_root", 83333333);
> > > +       clks[IMX8QXP_DC_AXI_EXT_CLK]    =3D
> > imx_clk_hw_fixed("axi_ext_dc_clk_root", 800000000);
> > > +       clks[IMX8QXP_DC_AXI_INT_CLK]    =3D
> > imx_clk_hw_fixed("axi_int_dc_clk_root", 400000000);
> > > +       clks[IMX8QXP_DC_CFG_CLK]        =3D
> > imx_clk_hw_fixed("cfg_dc_clk_root", 100000000);
> > > +       clks[IMX8QXP_MIPI_IPG_CLK]      =3D
> > imx_clk_hw_fixed("ipg_mipi_clk_root", 120000000);
> > > +       clks[IMX8QXP_IMG_AXI_CLK]       =3D
> > imx_clk_hw_fixed("axi_img_clk_root", 400000000);
> > > +       clks[IMX8QXP_IMG_IPG_CLK]       =3D
> > imx_clk_hw_fixed("ipg_img_clk_root", 200000000);
> > > +       clks[IMX8QXP_IMG_PXL_CLK]       =3D
> > imx_clk_hw_fixed("pxl_img_clk_root", 600000000);
> > > +       clks[IMX8QXP_HSIO_AXI_CLK]      =3D
> > imx_clk_hw_fixed("axi_hsio_clk_root", 400000000);
> > > +       clks[IMX8QXP_HSIO_PER_CLK]      =3D
> > imx_clk_hw_fixed("per_hsio_clk_root", 133333333);
> > =

> > Can these fixed rate clks come from DT? Or what's going on here?
> > =

> =

> Those are not external clocks.
> Do we have to put them in device tree as well?

No if they're not external clks then it's fine to keep specifying them
in this driver.

> =

> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static const struct of_device_id imx8qxp_match[] =3D {
> > > +       { .compatible =3D "fsl,imx8qxp-clk", },
> > > +       { /* sentinel */ }
> > > +};
> > > +
> > > +static struct platform_driver imx8qxp_clk_driver =3D {
> > > +       .driver =3D {
> > > +               .name =3D "imx8qxp-clk",
> > > +               .of_match_table =3D imx8qxp_match,
> > > +       },
> > > +       .probe =3D imx8qxp_clk_probe,
> > > +};
> > > +
> > > +static int __init imx8qxp_clk_init(void) {
> > > +       return platform_driver_register(&imx8qxp_clk_driver);
> > > +}
> > > +core_initcall(imx8qxp_clk_init);
> > > diff --git a/include/soc/imx/imx8qxp/lpcg.h
> > > b/include/soc/imx/imx8qxp/lpcg.h new file mode 100644 index
> > > 0000000..afbb5da
> > > --- /dev/null
> > > +++ b/include/soc/imx/imx8qxp/lpcg.h
> > > @@ -0,0 +1,186 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> > > + * Copyright 2017~2018 NXP
> > > + *
> > > + */
> > > +
> > > +#ifndef _SC_LPCG_H
> > > +#define _SC_LPCG_H
> > > +
> > > +/*LSIO SS */
> > > +#define                PWM_0_LPCG              0x5D400000
> > =

> > Are these virtual or physical addresses? Because up above they're caste=
d right
> > into void __iomem pointers, which makes me thing they're virtual addres=
ses,
> > but then that would mean there's some sort of static iomap being used, =
but
> > I'm not aware of anything like that.
> =

> Yes, you're right. Those should be physical address and iomem cast is not=
 necessary.
> Sorry about missing that.
> =


Ok. Thanks for fixing it.

