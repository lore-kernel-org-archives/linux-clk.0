Return-Path: <SRS0=PmFx=O6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984B9C43387
	for <linux-clk@archiver.kernel.org>; Fri, 21 Dec 2018 19:00:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6467621928
	for <linux-clk@archiver.kernel.org>; Fri, 21 Dec 2018 19:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545418857;
	bh=tKCy/obsv6cYooVTpl2l9vGZthElPottVY1/IlJ5K/g=;
	h=Subject:Cc:To:From:In-Reply-To:References:Date:List-ID:From;
	b=KvNOsf8AETQwvooVHQRgsXTa3mpnFwicY7gxcI5IrTUTsr0JdKXrUVRC8UaR/giva
	 ZTXENNmYRdG+tmotexxojt1FE9WIDA/8faHwJ0AplyQjOIUjy6flfA+xoq2xiHvyTs
	 AThii3XpvM/zCLE5pC0nQc89fq1UqMkvfB50Vpko=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729726AbeLUTA5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Dec 2018 14:00:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:49290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729609AbeLUTA4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 21 Dec 2018 14:00:56 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 850B32190A;
        Fri, 21 Dec 2018 19:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545418855;
        bh=tKCy/obsv6cYooVTpl2l9vGZthElPottVY1/IlJ5K/g=;
        h=Subject:Cc:To:From:In-Reply-To:References:Date:From;
        b=a+mBcdCUQcVDpSgzwJmjvTpF8HuVX+W8gv7FKLePBo3HkWAHngvyfIM9+kRkz2lPk
         UVlad/N1p7E6CtM4nebr4kewmMjn9LE744MIzmh4Jk6OgUHQ8bxz3dn15MbvUQOi4x
         DPvrl04jDBvy/rqilWyEGgDmCgkKFkrQqMhK/UUM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH 4/5] clk: imx8qxp: make the name of clock ID generic
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB4211F8786714DD6CCBB55F0A80B80@AM0PR04MB4211.eurprd04.prod.outlook.com>
User-Agent: alot/0.8
References: <1545232888-9302-1-git-send-email-aisheng.dong@nxp.com> <1545232888-9302-5-git-send-email-aisheng.dong@nxp.com> <CAOMZO5DzMpMp-Tf74iM3SuHoFpji8z-dxM-UsC13GeDx2bZYgA@mail.gmail.com> <VI1PR04MB4222ABD43B82BD3C0B73404780BF0@VI1PR04MB4222.eurprd04.prod.outlook.com> <154533484105.79149.16225192496445475758@swboyd.mtv.corp.google.com> <AM0PR04MB4211F8786714DD6CCBB55F0A80B80@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <154541885475.13075.16994932864140896829@swboyd.mtv.corp.google.com>
Date:   Fri, 21 Dec 2018 11:00:54 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-20 17:44:28)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Quoting Aisheng Dong (2018-12-19 22:26:50)
> > > > -----Original Message-----
> > > > From: Fabio Estevam [mailto:festevam@gmail.com] Hi Aisheng,
> > > >
> > > > On Wed, Dec 19, 2018 at 1:29 PM Aisheng Dong
> > <aisheng.dong@nxp.com>
> > > > wrote:
> > > > >
> > > > > SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> > > > > Let's make the name of clock ID generic to allow other SoCs to
> > > > > reuse the common part.
> > > > >
> > > > > This patch only changes the clock id name and file name, so no
> > > > > functional change.
> > > > >
> > > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > > > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > > > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > > > ---
> > > > >  drivers/clk/imx/clk-imx8qxp-lpcg.c        | 146 +++++++--------
> > > > >  drivers/clk/imx/clk-imx8qxp.c             | 152 ++++++++--------
> > > > >  include/dt-bindings/clock/imx8-clock.h    | 289
> > > > ++++++++++++++++++++++++++++++
> > > > >  include/dt-bindings/clock/imx8qxp-clock.h | 289
> > > > > ------------------------------
> > > > >  4 files changed, 438 insertions(+), 438 deletions(-)
> > > >
> > > > This seems like unneeded churn. Just keep the existing naming and
> > > > other SoCs can reuse it without problem.
> > >
> > > There's a reason.
> > > We still need add some clock IDs which exist on MX8QM only (probably
> > > more on future SoCs) Having them prefixed with 'IMX8QXP' may look
> > strange.
> > >
> > > Besides that, as those clock IDs will also be used in devicetree, make
> > > the name generic for different SoCs seems still better and less confu=
sing.
> > >
> >=20
> > This looks like an integration problem. Is anyone using the defines tha=
t are
> > merged through clk tree now? A grep of linux-next says no, but how can =
I be
> > sure?
>=20
> I'm sure no one is using it now.
> The only user DTS (imx8qxp mek) is waiting for merge after 4.21-rc1 is ou=
t.
> So it's a chance to update it.=20
>=20
> >=20
> > So can you leave around the header file with the deprecated define name=
s and
> > introduce another one that's a copy of the header file but with the non=
-SoC
> > specific names?  Then you can wait for a release cycle and delete the o=
ld
> > header file that nobody should be using in DT anymore.
> > Unless you plan to make sure that nobody uses the deprecated defines
> > somehow?
> >=20
>=20
> Yes, the plan is to make sure nobody uses that.
> Otherwise, it may be hard to send DTS patches using new CLK ID name throu=
gh
> different tree later.
>=20

I've already tagged and prepared to send out clk tree for the next merge
window. It's getting difficult to change this before -rc1 too because
I'm traveling for the holidays in the US. I'm fine with changing the
world if it doesn't break anything, but I'm not interested in making the
pull request wait another few days for this particular topic, so I'd
rather send this as part of a follow-on fixes PR during the merge window
next week.

Can you resend with just the things that need to be changed for the next
release (v4.21 or v5.0)? And Cc the relevant people/lists and try to
collect acks and reviewed-by tags before next Wednesday? I can send a
fixes PR on Friday next week then.

