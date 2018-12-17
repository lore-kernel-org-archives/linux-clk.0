Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC20C43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 18:52:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE59E214C6
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 18:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545072728;
	bh=CHtyK2UF5ixNOy8ikAHCuoiZlATbQRK/qy/VCsjlnS8=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=kkFtmJOPgIAcHLshrXU97/ncF1yILhs4u5MfeDo78sdEpOgY3KpKW8auOTSVD/5xU
	 Lr6efmBNKmTmdk4iXOn6ALBZKY8h++p7La68YfKOm8HDhqusdgThrwd9bnFBNhVqRL
	 zqMbdxO5dWl1TIGUy4mC27M+HVzFDjxdIcjL6xAM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727571AbeLQSwH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 13:52:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:44894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbeLQSwH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Dec 2018 13:52:07 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6F1920874;
        Mon, 17 Dec 2018 18:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545072725;
        bh=CHtyK2UF5ixNOy8ikAHCuoiZlATbQRK/qy/VCsjlnS8=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=DA4v8R6KFGJIeafB85aB0zQzEIsmDcxSrhO4cfhMIJiN81fNAqDxpn49G6NVbar6X
         AIu61ExUu4ssCK3PP4JdnlJJD6nQgyrxknXQQpkQlF9aowb+4JVB3v/AggR6FIEFi3
         cZRdTjoJJfPniT0h7SWDZQIuOgwIcALBnfNTlLmw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181215103557.2748-3-govinds@codeaurora.org>
Subject: Re: [PATCH v3 2/7] clk: qcom: Add WCSS Q6DSP clock controller for QCS404
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org
References: <20181215103557.2748-1-govinds@codeaurora.org> <20181215103557.2748-3-govinds@codeaurora.org>
Message-ID: <154507272487.19322.760504004108754132@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Date:   Mon, 17 Dec 2018 10:52:04 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Govind Singh (2018-12-15 02:35:52)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 9fe28b9ceba8..84acc7718691 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -222,6 +222,15 @@ config QCS_GCC_404
>           Say Y if you want to use multimedia devices or peripheral
>           devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
> =20
> +config QCS_WCSSCC_404
> +       tristate "QCS404 WCSS Clock Controller"
> +       depends on COMMON_CLK_QCOM

This is going away, so you can drop this depends on statement soon.

> +       select QCS_GCC_404
> +       help
> +         Support for the WCSS clock controller on QCS404 devices.
> +         Say Y if you want to use the WCSS branch clocks of the WCSS clo=
ck
> +         controller to reset the WCSS subsystem.
> +
>  config SDM_GCC_845
>         tristate "SDM845 Global Clock Controller"
>         select QCOM_GDSC
> diff --git a/drivers/clk/qcom/wcsscc-qcs404.c b/drivers/clk/qcom/wcsscc-q=
cs404.c
> new file mode 100644
> index 000000000000..bd694ef1b6ac
> --- /dev/null
> +++ b/drivers/clk/qcom/wcsscc-qcs404.c
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>

Is this used?

> +#include <linux/clk.h>

Is this used?

> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>

Is this used?

> +
> +#include <dt-bindings/clock/qcom,wcss-qcs404.h>
> +#include <linux/reset-controller.h>

Cool, but where are the resets? Also, please put <linux/*.h> before any
dt-bindings includes.

> +
> +#include "clk-regmap.h"
> +#include "clk-branch.h"
> +#include "common.h"
> +#include "reset.h"
> +
> +/* Q6SSTOP clocks. These clocks are voted
> + * during by remoteproc client when loaded from

This sentence doesn't parse easily. "during by"?

> + * user space, soc hang is seen when CCF turns

SoC? Or just system hang?

> + * off unused clocks. As a temp solution use

Temporary?

> + * CLK_IGNORE_UNUSED flags which prevent these
> + * clocks from being gated during bootup.

Ok.. but userspace is after CLK_IGNORE_UNUSED would process these clks?
So we're keeping them on from the bootloader why? Something is using
these clks during that operation but after that point they need to be
turned off?

> + */
> +
> +static int wcss_clocks_qcs404_probe(struct platform_device *pdev, int in=
dex,
> +                                   const struct qcom_cc_desc *desc)
> +{
> +       struct regmap *regmap;
> +       struct resource *res;
> +       void __iomem *base;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, index);
> +       base =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(base))
> +               return -ENOMEM;
> +
> +       regmap =3D devm_regmap_init_mmio(&pdev->dev, base, desc->config);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       return qcom_cc_really_probe(pdev, desc, regmap);
> +}

You're the second user of this "probe on reg region" logic. Please
extract it out of the lpasscc driver and put it into common.c so it can
be reused by the two drivers.

> +
> +static int wcss_cc_qcs404_probe(struct platform_device *pdev)
> +{
> +       const struct qcom_cc_desc *desc;
> +       int ret;
> +
> +       wcss_regmap_config.name =3D "wcss_q6sstop";
> +       desc =3D &wcss_q6sstop_qcs404_desc;
> +
> +       ret =3D wcss_clocks_qcs404_probe(pdev, 0, desc);
> +       if (ret)
> +               return ret;
> +
> +       wcss_regmap_config.name =3D "wcnss_tcsr";
> +       desc =3D &wcnss_tcsr_qcs404_desc;
> +
> +       ret =3D wcss_clocks_qcs404_probe(pdev, 1, desc);
> +       if (ret)
> +               return ret;
> +
> +       wcss_regmap_config.name =3D "wcss_qdsp6ss";
> +       desc =3D &wcnss_qdsp6ss_qcs404_desc;
> +
> +       return wcss_clocks_qcs404_probe(pdev, 2, desc);
> +}
> +
> +static struct platform_driver wcss_cc_qcs404_driver =3D {
> +       .probe          =3D wcss_cc_qcs404_probe,
> +       .driver         =3D {
> +               .name   =3D "qcs404-wcsscc",
> +               .of_match_table =3D wcss_cc_qcs404_match_table,
> +       },
> +};
> +
> +static int __init wcss_cc_qcs404_init(void)
> +{
> +       return platform_driver_register(&wcss_cc_qcs404_driver);
> +}
> +subsys_initcall(wcss_cc_qcs404_init);

Where is the driver removal exit function?

> +
> +MODULE_LICENSE("GPL v2");

MODULE_DESCRIPTION?

