Return-Path: <SRS0=3egD=OV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58168C67839
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 22:23:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B41720851
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 22:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544653427;
	bh=l9MQGS+qOpU8T4nMV6gHPxzE28YMdLd/M6YGRO0B1lc=;
	h=In-Reply-To:To:Subject:From:References:Cc:Date:List-ID:From;
	b=hD6bo7zWFZ+eGAJeLs1X3kEviu8dZAxa5A0tw8VFnGZyuknivW2CrVB9AktJqPic0
	 enJjBa6IMJZGFaFI4DuhKdB15RjdVWb6GuQlVsNdEDrUFQ61tatvX7GPQtj8ooAvYx
	 9vhi0ptx6Om9FpBZ0E0MRBzZEftUBH+rRIOklOMM=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B41720851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbeLLWXq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Dec 2018 17:23:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:53920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726437AbeLLWXq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Dec 2018 17:23:46 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1AF3120672;
        Wed, 12 Dec 2018 22:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544653425;
        bh=l9MQGS+qOpU8T4nMV6gHPxzE28YMdLd/M6YGRO0B1lc=;
        h=In-Reply-To:To:Subject:From:References:Cc:Date:From;
        b=e8/Os+31jKBEg06OUq0jkkhC0FaVlBIlYxMGAejCYGIRPM3Pl4HpjZyhNOP8VIIKr
         fTAHD33r4y6jAM6M+cjh0hV7qHKCx0TK2Eup5HvD+215fS5jPvRKqk/ycB/9B7pxG9
         LYyQNGyEQRTw5N2YBQsEK+C0jKaWfajJ5uttBV3g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AM0PR04MB4211C8B8DC2D5F2133D30B9F80A70@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <154465342417.17204.9306702088509412293@swboyd.mtv.corp.google.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V9 1/7] clk: imx: add configuration option for mmio clks
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.7
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com> <1543934041-12572-2-git-send-email-aisheng.dong@nxp.com> <154447530435.17204.3027810086542897433@swboyd.mtv.corp.google.com> <AM0PR04MB4211B87A842FB8AF14621E3380A60@AM0PR04MB4211.eurprd04.prod.outlook.com> <154455657071.17204.2493209125185218529@swboyd.mtv.corp.google.com> <AM0PR04MB4211D9C32A4DDCCF266B60C380A70@AM0PR04MB4211.eurprd04.prod.outlook.com> <AM0PR04MB4211C8B8DC2D5F2133D30B9F80A70@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Date:   Wed, 12 Dec 2018 14:23:44 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-12 02:27:24)
> Hi Stephen,
>=20
> > > > > > diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> > > > > > index
> > > > > > 5c0b11e..f850424 100644
> > > > > > --- a/drivers/clk/imx/Makefile
> > > > > > +++ b/drivers/clk/imx/Makefile
> > > > > > @@ -1,6 +1,6 @@
> > > > > >  # SPDX-License-Identifier: GPL-2.0
> > > > > >
> > > > > > -obj-y +=3D \
> > > > > > +obj-$(CONFIG_MXC_CLK) +=3D \
> > > > >
> > > > > Because this changes to obj-$(CONFIG) we should change the
> > > > > drivers/clk/Makefile to have obj-y for this Makefile instead of
> > > > > depending on ARCH_MXC.
> > > >
> > > > We also use ARCH_MXC for ARMv8 SoC clocks.
> > >
> > > Yes, and? I'm suggesting drivers/clk/Makefile have an obj-y +=3D
> > > drivers/clk/imx/ and then decide to compile or not compile the MXC_CLK
> > > "core" bits based on CONFIG_MXC_CLK config option.
> >=20
> > Sorry for the missunderstanding before.
> > I guess you point is have an ojb-y +=3D drivrs/clk/imx/ Then in
> > drivers/clk/imx/Kconfig config MXC_CLK
> >               def_bool ARCH_MXC && !ARM64
> >               select MXC_clk bits
> > config MXC_CLK_SCU
> >               def_bool ARCH_MXC && ARM64
> >               select SCU clock bits
> >=20
> > If wrong please let me know.
> >=20
> > Will update the patch series and re-send.
> > Thanks for the suggestion.

Yes that looks like what I'm asking for.

> >=20
>=20
> I tried and met another problem that MX8MQ (ARM64) is also
> using legacy MXC_CLK. (And 3 more MX8M series based chips.)
>=20
> That means I have to write something like:
> config MXC_CLK
>         bool
>         def_bool (ARCH_MXC && !ARM64) || (ARCH_MXC && ARM64 && SOC_IMX8MQ)
>=20
> config MXC_CLK_SCU
>         bool
>         def_bool (ARCH_MXC && ARM64 && !SOC_IMX8MQ)
>=20
> But it can't work as ARM64 supports multiplatforms.
> e.g. we have also SOC_IMX8QXP, SOC_IMX8QM, SOC_IMX8DM ...
>=20
> Do you have a suggestion about this?
>=20

Can you put the enabling of MXC_CLK_SCU in the defconfig and exposed it
as a user selectable option? And keep hiding the MXC_CLK option behind
the def_bool? I hope that MXC_CLK could be user selectable eventually,
but the def_bool is there to make it easier to bridge the transition and
update everyone's defconfigs while it is moved into the defconfig.

