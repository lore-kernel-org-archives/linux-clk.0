Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BECBC04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 20:55:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8CBA2084C
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 20:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544475306;
	bh=GbowKODnpFqwR4aPYcQkndvPuXB0oIO8rYxtHkaFx0k=;
	h=In-Reply-To:To:Subject:From:References:Cc:Date:List-ID:From;
	b=blsjEJ55nse7CUCRqJi2EUoXk+weFWkt5hLgNg3Yk0QqP4bVb1z0IVcj3Kqh70YTB
	 9M/1yUxm9x7JfDGBlxxZ4Y/Qogpc0oQ1iFSASNKn/MtAXLiaamxylj9QCEZtPc6ljA
	 0CL8BIGJtKhYR9u7Oo7q2vGdx67DUgpoW7lpnUsg=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8CBA2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729349AbeLJUzF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 15:55:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:49598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726677AbeLJUzF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 10 Dec 2018 15:55:05 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 238702082F;
        Mon, 10 Dec 2018 20:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544475305;
        bh=GbowKODnpFqwR4aPYcQkndvPuXB0oIO8rYxtHkaFx0k=;
        h=In-Reply-To:To:Subject:From:References:Cc:Date:From;
        b=uDK7akgzhMC9ItQKdEDTY/kPdmNTbW04oTOSdUopFi/E0V2omcFPDkwJPbSMJlMLW
         Ryp8h4hxF5uU7ZtZ3Z5HmBBrWR5LJkBIkL1lUqHu0KaBtGNAfUARAYN1hzCFFyqUAK
         heL5zTRv2gpeJW/EM8wCob71jnuCu0YYZ+YQ/uFM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1543934041-12572-2-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154447530435.17204.3027810086542897433@swboyd.mtv.corp.google.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng DONG <aisheng.dong@nxp.com>
Subject: Re: [PATCH V9 1/7] clk: imx: add configuration option for mmio clks
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com> <1543934041-12572-2-git-send-email-aisheng.dong@nxp.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng DONG <aisheng.dong@nxp.com>
Date:   Mon, 10 Dec 2018 12:55:04 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng DONG (2018-12-04 06:39:22)
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index c12a05c..303082c 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -570,6 +580,7 @@ config SOC_IMX7ULP
>  config SOC_VF610
>         bool "Vybrid Family VF610 support"
>         select ARM_GIC if ARCH_MULTI_V7
> +       select MXC_CLK
>         select PINCTRL_VF610
> =20

Instead of select can we break this dependency on the arch Kconfig and
have:

	config MXC_CLK
		def_bool ARCH_MXC && !ARM64

> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index 5c0b11e..f850424 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
> -obj-y +=3D \
> +obj-$(CONFIG_MXC_CLK) +=3D \

Because this changes to obj-$(CONFIG) we should change the
drivers/clk/Makefile to have obj-y for this Makefile instead of
depending on ARCH_MXC.

