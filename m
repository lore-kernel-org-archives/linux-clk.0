Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B3EC65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 07:57:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2ABF20873
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544687856;
	bh=ICWhwbMaKImiZV7MhribkZULvCL0qp5icy1lAFsJhW4=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=yomlq7d1QTZ837CVc1MENEPbrYPNSaTwN5WSn14mrcXGiH+H8KOgXO8XEm12GAjZv
	 QvuJJs/UmAQ6XAcBRWeVp3n+tdVSuI2AGJTEElqI0uWWypdRq0zoKzzzITgCzoA+t2
	 mjW10NBB8fGVzo3zmXiQua3RLK7MUwpnNBfE2hSM=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2ABF20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbeLMH5f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 02:57:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:42100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726500AbeLMH5e (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 02:57:34 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 696692075B;
        Thu, 13 Dec 2018 07:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544687853;
        bh=ICWhwbMaKImiZV7MhribkZULvCL0qp5icy1lAFsJhW4=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=flecOUwbsY7cRG4F4nz8vHBQV5MuKtlkh/TijB7kadWBlvo9hqJVWEcG/x3fy1HK/
         lxjSVebNwEgL25uhoyNITo5D4H2HhWXkNXkJ6HE2uOQHTEsXB0ltYp71Q3227oSN4G
         oRxZ+ptqi4FMPhXe9tzN4BKIku/4yA2VcWX6Vhc4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1544662938-5020-2-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V11 1/7] clk: imx: add configuration option for mmio clks
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com> <1544662938-5020-2-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154468785263.19322.9529215687462426277@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Date:   Wed, 12 Dec 2018 23:57:32 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-12 17:07:52)
> The patch introduces CONFIG_MXC_CLK option for legacy MMIO clocks,
> this is required to compile legacy MMIO clock conditionally when adding
> SCU based clocks for MX8 platforms later.
>=20
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index a47430b..8a9440a 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -72,7 +72,7 @@ obj-$(CONFIG_ARCH_DAVINCI)            +=3D davinci/
>  obj-$(CONFIG_H8300)                    +=3D h8300/
>  obj-$(CONFIG_ARCH_HISI)                        +=3D hisilicon/
>  obj-y                                  +=3D imgtec/
> -obj-$(CONFIG_ARCH_MXC)                 +=3D imx/
> +obj-y                                  +=3D imx/
>  obj-y                                  +=3D ingenic/
>  obj-$(CONFIG_ARCH_K3)                  +=3D keystone/
>  obj-$(CONFIG_ARCH_KEYSTONE)            +=3D keystone/
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> new file mode 100644
> index 0000000..37478ba
> --- /dev/null
> +++ b/drivers/clk/imx/Kconfig
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# common clock support for NXP i.MX SoC family.
> +config MXC_CLK
> +       bool
> +       def_bool (ARCH_MXC && !ARM64) || (ARCH_MXC && ARM64 && SOC_IMX8MQ)

Ok I looked closer, SOC_IMX8MQ is only being introduced now and has only
been in linux-next for a few days. Having such a config symbol is highly
unusual for arm64 code. Has that been accepted by arm-soc? I don't know
why it would be because we don't add SoC specific config options
anymore. I imagine it will be rejected and we'll need to have this new
MXC_CLK config be enabled in the defconfig instead of selected from the
arch layer.

Given all that, is there any damage if this is just a def_bool ARCH_MXC
right now? If it's enabled on the platforms that don't use it because
they have SCU, does it actually matter? Or we just get some code bloat?
If it's just some extra code, then even more reason to make a user
visible config option that can be selected in the configurations that
care to save some space.

> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index 5c0b11e..f850424 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
> -obj-y +=3D \
> +obj-$(CONFIG_MXC_CLK) +=3D \
>         clk.o \
>         clk-busy.o \
>         clk-composite-8m.o \
