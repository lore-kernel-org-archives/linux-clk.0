Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE7AC65BAE
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 01:32:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0735620879
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 01:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544751138;
	bh=5llEuIAoScurxG1Q85zNA8LC0l++qF8B7+Mb4v/syDk=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=brrtkhh9T+TO1pYgfeKa5MTfmfkowOZKC54d8YCVoriyiqwQS2oOLCeQoVrSnpxM3
	 bMcnZ6neMO1uXLJnmetT7Cdrkrg8pu33/RHbbtGbUCHW6IpCmkISVBz1jPK9HhXaN7
	 M2jpwdVhQgG79SqGtISU1fYmKTL5asNtPAhKDtE0=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0735620879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbeLNBcR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 20:32:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:58590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727654AbeLNBcR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 20:32:17 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E409C2075B;
        Fri, 14 Dec 2018 01:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544751136;
        bh=5llEuIAoScurxG1Q85zNA8LC0l++qF8B7+Mb4v/syDk=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=OCjYtzRXiRdE6b5RIzpkYzUiItrlgHFmJ2G0G1fvZd9h9dzhXxAfekvCTKoV5kVRT
         YUONMHkEliVmXq57hc42+oLGz2OlbNwBG5DQZltJE9IzM712oMLyHvhS1HUGGt98Bh
         rplRjbM9dsvxOoGV5rFg1IIBZvp8zk/sT94MJr/I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AM0PR04MB4211128F59A987F3D94AAD8F80A00@AM0PR04MB4211.eurprd04.prod.outlook.com>
Subject: RE: [PATCH V11 1/7] clk: imx: add configuration option for mmio clks
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com> <1544662938-5020-2-git-send-email-aisheng.dong@nxp.com> <154468785263.19322.9529215687462426277@swboyd.mtv.corp.google.com> <AM0PR04MB4211128F59A987F3D94AAD8F80A00@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <154475113520.19322.14425233247345284599@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Date:   Thu, 13 Dec 2018 17:32:15 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-13 04:49:07)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Sent: Thursday, December 13, 2018 3:58 PM
> > To: linux-clk@vger.kernel.org; Aisheng Dong <aisheng.dong@nxp.com>
> > Cc: linux-arm-kernel@lists.infradead.org; mturquette@baylibre.com;
> > shawnguo@kernel.org; Fabio Estevam <fabio.estevam@nxp.com>; dl-linux-imx
> > <linux-imx@nxp.com>; kernel@pengutronix.de; Aisheng Dong
> > <aisheng.dong@nxp.com>; Arnd Bergmann <arnd@arndb.de>; Olof Johansson
> > <olof@lixom.net>
> > Subject: Re: [PATCH V11 1/7] clk: imx: add configuration option for mmi=
o clks
> >=20
> > Quoting Aisheng Dong (2018-12-12 17:07:52)
> > > The patch introduces CONFIG_MXC_CLK option for legacy MMIO clocks,
> > > this is required to compile legacy MMIO clock conditionally when
> > > adding SCU based clocks for MX8 platforms later.
> > >
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com> diff --git
> > > a/drivers/clk/Makefile b/drivers/clk/Makefile index a47430b..8a9440a
> > > 100644
> > > --- a/drivers/clk/Makefile
> > > +++ b/drivers/clk/Makefile
> > > @@ -72,7 +72,7 @@ obj-$(CONFIG_ARCH_DAVINCI)            +=3D
> > davinci/
> > >  obj-$(CONFIG_H8300)                    +=3D h8300/
> > >  obj-$(CONFIG_ARCH_HISI)                        +=3D hisilicon/
> > >  obj-y                                  +=3D imgtec/
> > > -obj-$(CONFIG_ARCH_MXC)                 +=3D imx/
> > > +obj-y                                  +=3D imx/
> > >  obj-y                                  +=3D ingenic/
> > >  obj-$(CONFIG_ARCH_K3)                  +=3D keystone/
> > >  obj-$(CONFIG_ARCH_KEYSTONE)            +=3D keystone/
> > > diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig new
> > > file mode 100644 index 0000000..37478ba
> > > --- /dev/null
> > > +++ b/drivers/clk/imx/Kconfig
> > > @@ -0,0 +1,5 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +# common clock support for NXP i.MX SoC family.
> > > +config MXC_CLK
> > > +       bool
> > > +       def_bool (ARCH_MXC && !ARM64) || (ARCH_MXC && ARM64 &&
> > > +SOC_IMX8MQ)
> >=20
> > Ok I looked closer, SOC_IMX8MQ is only being introduced now and has only
> > been in linux-next for a few days. Having such a config symbol is highl=
y unusual
> > for arm64 code. Has that been accepted by arm-soc? I don't know why it
> > would be because we don't add SoC specific config options anymore. I im=
agine
> > it will be rejected and we'll need to have this new MXC_CLK config be e=
nabled
> > in the defconfig instead of selected from the arch layer.
> >=20
> > Given all that, is there any damage if this is just a def_bool ARCH_MXC=
 right
> > now? If it's enabled on the platforms that don't use it because they ha=
ve SCU,
> > does it actually matter? Or we just get some code bloat?
> > If it's just some extra code, then even more reason to make a user visi=
ble config
> > option that can be selected in the configurations that care to save som=
e space.
> >=20
>=20
> It make sense to me. No actual damage as we support multiplatforms using =
both
> MXC_CLK and MXC_CLK_SCU on ARMv8. And for users who want to save one of t=
hem,
> they do can change via memuconfig later.
> I will make it a def_bool ARCH_MXC.
> Thanks for the suggestion.
>=20
> BTW, as I also introduced SOC_IMX8QXP in Patch 4 and 7.
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> +obj-$(CONFIG_SOC_IMX8QXP) +=3D clk-imx8qxp.o clk-imx8qxp-lpcg.o=20
>=20
> According to your former suggestion, I think we should remove it.
> So I'm going to make imx8qxp clk an user selectable configuration option =
which
> will select the common MXC_CLK_SCU. So a bit difference from former discu=
ssion,
> MXC_CLK_SCU will still be kept a hide option.
>=20
> This way is mostly like how QCOM does and should work for IMX as well.
>=20
> Then it will look like:
> config MXC_CLK_SCU
>         bool=20
>=20
> config CLK_IMX8QXP
>         bool "IMX8QXP SCU Clock"
>         depends on ARCH_MXC && IMX_SCU && ARM64
>         select MXC_CLK_SCU
>         help
>           Build the driver for IMX8QXP SCU based clocks.
>=20
> If any issue, please let me know.

Ok, so a library pattern, where MXC_CLK_SCU is the library of code that
various SoC specific clk drivers use. Seems fine to me.

