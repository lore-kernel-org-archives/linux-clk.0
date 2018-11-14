Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66512C43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 23:28:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BE262243E
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 23:28:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZVU9cgt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BE262243E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbeKOJeD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 04:34:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:33708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725952AbeKOJeD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Nov 2018 04:34:03 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33F2522419;
        Wed, 14 Nov 2018 23:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542238120;
        bh=jtaOr80xGgRzEQltue4ejhPbC/TLGnFw3uzy8IZ4REg=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=OZVU9cgtXBoJQsmkvSwj0s0OTNkKPmV8bqoo7kYBAZKv4vXJlnrh2bdr08ZVw6kgY
         ALT/Cthlx+C2oYqMw4/2rth/8+4z6seR6YiTC+IzZY4WdjhNd+P1vReD/a7xGbMyLt
         gwC/r+EckdaKRVr2m+rioN7ChOCY0u3FOEiXXflc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1541862894-8209-7-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>
References: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
 <1541862894-8209-7-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154223811948.88331.8860718270277533070@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH V6 6/6] clk: imx: add imx8qxp lpcg driver
Date:   Wed, 14 Nov 2018 15:28:39 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-11-10 07:20:08)
> Add imx8qxp lpcg driver support
> =

> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

I like it!

> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx=
8qxp-lpcg.c
> new file mode 100644
> index 0000000..7b318d7
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -0,0 +1,198 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2018 NXP
> + *     Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +#include <dt-bindings/clock/imx8qxp-clock.h>

Include this after <linux/*> and before locals please.

> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "clk-scu.h"
> +#include "clk-imx8qxp-lpcg.h"
> +
> +struct imx8qxp_lpcg_data {
> +       int id;
> +       char *name;
> +       char *parent;
> +       unsigned long flags;
> +       u32 offset;
> +       u8 bit_idx;
> +       bool hw_gate;
> +};
> +
> +struct imx8qxp_ss_lpcg {
> +       const struct imx8qxp_lpcg_data *lpcg;
> +       u8 num_lpcg;
> +       u8 num_max;
> +};

Any chance we can get kernel-doc on these structs and members of the
structs?

> +
> +static const struct imx8qxp_lpcg_data imx8qxp_lpcg_adma[] =3D {
> +       { IMX8QXP_ADMA_LPCG_UART0_IPG_CLK, "uart0_lpcg_ipg_clk", "dma_ipg=
_clk_root", 0, ADMA_LPUART_0_LPCG, 16, 0, },
> +       { IMX8QXP_ADMA_LPCG_UART0_BAUD_CLK, "uart0_lpcg_baud_clk", "uart0=
_clk", 0, ADMA_LPUART_0_LPCG, 0, 0, },
> +       { IMX8QXP_ADMA_LPCG_UART1_IPG_CLK, "uart1_lpcg_ipg_clk", "dma_ipg=
_clk_root", 0, ADMA_LPUART_1_LPCG, 16, 0, },
> +       { IMX8QXP_ADMA_LPCG_UART1_BAUD_CLK, "uart1_lpcg_baud_clk", "uart1=
_clk", 0, ADMA_LPUART_1_LPCG, 0, 0, },
[...]
> +
> +static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       struct clk_hw_onecell_data *clk_data;
> +       const struct imx8qxp_ss_lpcg *ss_lpcg;
> +       const struct imx8qxp_lpcg_data *lpcg;
> +       struct resource *res;
> +       struct clk_hw **clks;
> +       void __iomem *base;
> +       int i;

That's a good amount of local variables!

> +
> +       ss_lpcg =3D of_device_get_match_data(dev);
> +       if (!ss_lpcg)
> +               return -ENODEV;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base =3D devm_ioremap(dev, res->start, resource_size(res));

Why not devm_ioremap_resource()?

> +       if (!base)
> +               return -ENOMEM;

And then return the error code out of it?

> +
> +       clk_data =3D devm_kzalloc(&pdev->dev, sizeof(*clk_data) +
> +                               sizeof(*clk_data->hws) * ss_lpcg->num_max,

Can you use struct_size() here?

> +                               GFP_KERNEL);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       clk_data->num =3D ss_lpcg->num_max;
> +       clks =3D clk_data->hws;
> +
> +       for (i =3D 0; i < ss_lpcg->num_lpcg; i++) {
> +               lpcg =3D ss_lpcg->lpcg + i;
> +               clks[lpcg->id] =3D imx_clk_lpcg_scu(lpcg->name, lpcg->par=
ent,
> +                                                 lpcg->flags, base + lpc=
g->offset,
> +                                                 lpcg->bit_idx, lpcg->hw=
_gate);
> +       }
> +
> +       for (i =3D 0; i < clk_data->num; i++) {
> +               if (IS_ERR(clks[i]))
> +                       pr_err("i.MX clk %u: register failed with %ld\n",
> +                               i, PTR_ERR(clks[i]));

But we're OK to continue? Alright...

> +       }
> +
> +       return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data=
);

Why not use devm_? Or can the driver never be unbound from sysfs?

> +}
> +
> +static const struct of_device_id imx8qxp_lpcg_match[] =3D {
> +       { .compatible =3D "fsl,imx8qxp-lpcg-adma", &imx8qxp_ss_adma, },
> +       { .compatible =3D "fsl,imx8qxp-lpcg-conn", &imx8qxp_ss_conn, },
> +       { .compatible =3D "fsl,imx8qxp-lpcg-lsio", &imx8qxp_ss_lsio, },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver imx8qxp_lpcg_clk_driver =3D {
> +       .driver =3D {
> +               .name =3D "imx8qxp-lpcg-clk",
> +               .of_match_table =3D imx8qxp_lpcg_match,
> +       },
> +       .probe =3D imx8qxp_lpcg_clk_probe,
> +};
> +
> +builtin_platform_driver(imx8qxp_lpcg_clk_driver);
> +
> +MODULE_AUTHOR("Dong Aisheng <aisheng.dong@nxp.com>");
> +MODULE_DESCRIPTION("IMX8QXP LPCG Clock driver");
> +MODULE_LICENSE("GPL v2");

If the module is builtin all the time because of
builtin_platform_driver() I think we don't need these MODULE_ macros.

