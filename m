Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4739C04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 21:56:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A242D2084E
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 21:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544478970;
	bh=RVvvfaRq2VkibiJbgy7GLb0+rHp/tsrl/UYuhPu1mOo=;
	h=In-Reply-To:To:Subject:From:References:Cc:Date:List-ID:From;
	b=mEancIpnlAOxNb+EQ10ZlRJp7G766lGZiLVqfXyaNj6YyKDbXSk/nMnIjC8c6d2Um
	 molBorjjDCJoYzTNilg5SwSJ5W62x0KZW6+FxSX+bw84cxqUzVUgoU/hsd9K3qPIpO
	 CNRTxHv1V825Lx7FFEuDw1bUx9t3JprZ7iXl0j6w=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A242D2084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbeLJV4K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 16:56:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:46246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726687AbeLJV4K (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 16:56:10 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A2492081F;
        Mon, 10 Dec 2018 21:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544478969;
        bh=RVvvfaRq2VkibiJbgy7GLb0+rHp/tsrl/UYuhPu1mOo=;
        h=In-Reply-To:To:Subject:From:References:Cc:Date:From;
        b=zQEe6xsUrRd1JK/xFdD+CpqxTTbUmJiDjscbrS9GXhx8xcdc7D4CneHAyWq/H6TnX
         A8frpr8GiNC1D7f8g0ry0Rupw8TyIZf4NBueGQkZcFucU1NzX9RYQVoTw5SzCTOliB
         4Bol5pxEcpDBQ/c4xPEdCblNywu/YvrZ+uVUuNdY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1543934041-12572-3-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154447896872.17204.13777399275077720705@swboyd.mtv.corp.google.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng DONG <aisheng.dong@nxp.com>
Subject: Re: [PATCH V9 2/7] clk: imx: add scu clock common part
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com> <1543934041-12572-3-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng DONG <aisheng.dong@nxp.com>
Date:   Mon, 10 Dec 2018 13:56:08 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng DONG (2018-12-04 06:39:25)
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> index 43a3ecc..63e7b01 100644
> --- a/drivers/clk/imx/Kconfig
> +++ b/drivers/clk/imx/Kconfig
> @@ -3,3 +3,7 @@
>  config MXC_CLK
>         bool
>         depends on ARCH_MXC
> +
> +config MXC_CLK_SCU

Is there any reason to make this a hidden option instead of making it a
selectable option? It can still depend on ARCH_MXC and ARM64, but
otherwise it should be compilable as long as CONFIG_IMX_SCU is defined
(this should also be a config we depend on here).

> +       bool
> +       depends on ARCH_MXC && ARM64
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index f850424..4abed37 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -20,6 +20,9 @@ obj-$(CONFIG_MXC_CLK) +=3D \
>         clk-pllv4.o \
>         clk-sccg-pll.o
> =20
> +obj-$(CONFIG_MXC_CLK_SCU) +=3D \
> +       clk-scu.o
> +
>  obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
>  obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
>  obj-$(CONFIG_SOC_IMX25)  +=3D clk-imx25.o
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> new file mode 100644
> index 0000000..ec8a471
> --- /dev/null
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2018 NXP
> + *   Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/slab.h>
> +
> +#include "clk-scu.h"
> +
> +struct imx_sc_ipc *ccm_ipc_handle;

Why does this need to be a global? Can it be in each clk_scu instance
instead?

> +
> diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
> new file mode 100644
> index 0000000..09f381b
> --- /dev/null
> +++ b/drivers/clk/imx/clk-scu.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2018 NXP
> + *   Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +#ifndef __IMX_CLK_SCU_H
> +#define __IMX_CLK_SCU_H
> +
> +#include <linux/firmware/imx/sci.h>
> +
> +extern struct imx_sc_ipc *ccm_ipc_handle;
> +
> +static inline int imx_clk_scu_init(void)
> +{
> +       return imx_scu_get_handle(&ccm_ipc_handle);

And then this can be implemented in the C driver so that ccm_ipc_handle
doesn't need to be exported into the header file?

