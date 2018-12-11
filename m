Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3EBDC5CFFE
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 19:29:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3B8C20870
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 19:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544556573;
	bh=iAKGauz5venGJniqKpfQh1ww9S96BOAIqJNhWGEqkM4=;
	h=In-Reply-To:To:Subject:From:References:Cc:Date:List-ID:From;
	b=uHpu3xSRzIkbWBNck/ocsfznPxljm8++3eEe8Fp+J32oYmxiiNKlGWse2rlnPC4nj
	 3elS5f5wvKgtn5yGWU6eTyD22cE/2Om+20+BR9chBWXNVsGxmDusrmjSwFawISuZFD
	 F3sF4fofKYflmNRM/Ww7WRyxLYWXTXzf4534VQIo=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3B8C20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbeLKT3d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 14:29:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:42496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbeLKT3d (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 11 Dec 2018 14:29:33 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A595520811;
        Tue, 11 Dec 2018 19:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544556571;
        bh=iAKGauz5venGJniqKpfQh1ww9S96BOAIqJNhWGEqkM4=;
        h=In-Reply-To:To:Subject:From:References:Cc:Date:From;
        b=UHC4Ckq0ul06nJ20RJo0GI5OkfK+3TmEoAyE4pun7Mt6RJmt8zbPMFefQ2jjwY48Z
         5uc81231NOn17o0yrHfOBD1xNo56NEG+s378anfWQ0cH9GEjN8gpXxtSQq8KVsXayM
         fu2vngJQiUttgQlm1dkC7OZP+P29KSN6OZ7CmPjk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AM0PR04MB4211B87A842FB8AF14621E3380A60@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <154455657071.17204.2493209125185218529@swboyd.mtv.corp.google.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V9 1/7] clk: imx: add configuration option for mmio clks
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com> <1543934041-12572-2-git-send-email-aisheng.dong@nxp.com> <154447530435.17204.3027810086542897433@swboyd.mtv.corp.google.com> <AM0PR04MB4211B87A842FB8AF14621E3380A60@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Date:   Tue, 11 Dec 2018 11:29:30 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-10 18:36:29)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Sent: Tuesday, December 11, 2018 4:55 AM
> [...]
> > Subject: Re: [PATCH V9 1/7] clk: imx: add configuration option for mmio=
 clks
> >=20
> > Quoting Aisheng DONG (2018-12-04 06:39:22)
> > > diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> > > index c12a05c..303082c 100644
> > > --- a/arch/arm/mach-imx/Kconfig
> > > +++ b/arch/arm/mach-imx/Kconfig
> > > @@ -570,6 +580,7 @@ config SOC_IMX7ULP  config SOC_VF610
> > >         bool "Vybrid Family VF610 support"
> > >         select ARM_GIC if ARCH_MULTI_V7
> > > +       select MXC_CLK
> > >         select PINCTRL_VF610
> > >
> >=20
> > Instead of select can we break this dependency on the arch Kconfig and
> > have:
> >=20
> >       config MXC_CLK
> >               def_bool ARCH_MXC && !ARM64
> >=20
>=20
> Thanks for the suggestion.
> One little problem is that we also have LS1021 supported under ARCH_MXC w=
hich
> does not use MXC_CLK.

Ok. So then your change is also limiting the compilation of
drivers/clk/imx/ to only the platforms that select it now, instead of
all ARCH_MXC like it was done before.

We can also have def_bool <big list of SoC platforms> if that helps for
the optimization that this patch is making.

arm-soc has generally pushed against having so many different arch level
Kconfig options because they make for unwieldy Kconfig fragments that
may become conflicting. Instead, the options for the different SoCs are
removed and we just have one for the platform and rely on defconfigs to
pick the right drivers.=20

Why can't we do that here?

> =20
> > > diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile index
> > > 5c0b11e..f850424 100644
> > > --- a/drivers/clk/imx/Makefile
> > > +++ b/drivers/clk/imx/Makefile
> > > @@ -1,6 +1,6 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > >
> > > -obj-y +=3D \
> > > +obj-$(CONFIG_MXC_CLK) +=3D \
> >=20
> > Because this changes to obj-$(CONFIG) we should change the
> > drivers/clk/Makefile to have obj-y for this Makefile instead of dependi=
ng on
> > ARCH_MXC.
>=20
> We also use ARCH_MXC for ARMv8 SoC clocks.

Yes, and? I'm suggesting drivers/clk/Makefile have an obj-y +=3D
drivers/clk/imx/ and then decide to compile or not compile the MXC_CLK
"core" bits based on CONFIG_MXC_CLK config option.

