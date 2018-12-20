Return-Path: <SRS0=NpU+=O5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87E9C43387
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 19:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A935221901
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 19:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545334843;
	bh=pi24CHAmq7xCxJVYDvfBIo2R604H9Ryr/IlzefsreTs=;
	h=To:References:Cc:From:In-Reply-To:Subject:Date:List-ID:From;
	b=2ERH4qkhaJK8LdnBwaZUzNqPBJ2mS/gvkn+pYKCT88Eh6eXS5t+QurSLCU/PxOg2N
	 hDyiq4ptBzN6vmaEbjarnTVwPAQKzW/MbaADft7aQ2Gvl+u8i3bRfRs6hgHBFhlUXd
	 9DO+TFbyhOQdqEhkUMKZ5fIZ/HzBHhAlWH/Nd+Rw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387597AbeLTTkn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Dec 2018 14:40:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:46854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388139AbeLTTkm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 20 Dec 2018 14:40:42 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EEEBD218FD;
        Thu, 20 Dec 2018 19:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545334842;
        bh=pi24CHAmq7xCxJVYDvfBIo2R604H9Ryr/IlzefsreTs=;
        h=To:References:Cc:From:In-Reply-To:Subject:Date:From;
        b=BwCnDIi5tJKKp+NPMCw0RZ5DrZHd8Fl0EdB0yzv+kVTFE5xvI4v+se6IV1y61Dqrd
         SkJFe5J61ksz3X0Rgu6zlnb2dsDACzJqCKUj0GifshlB+OGZdB3kCBLSLjAMhvFyfy
         nMOvh/JbtRgsdldcAVFJYmySqaLzb3MEMXjZ+2Eg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
User-Agent: alot/0.8
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>
References: <1545232888-9302-1-git-send-email-aisheng.dong@nxp.com> <1545232888-9302-5-git-send-email-aisheng.dong@nxp.com> <CAOMZO5DzMpMp-Tf74iM3SuHoFpji8z-dxM-UsC13GeDx2bZYgA@mail.gmail.com> <VI1PR04MB4222ABD43B82BD3C0B73404780BF0@VI1PR04MB4222.eurprd04.prod.outlook.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <VI1PR04MB4222ABD43B82BD3C0B73404780BF0@VI1PR04MB4222.eurprd04.prod.outlook.com>
Message-ID: <154533484105.79149.16225192496445475758@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH 4/5] clk: imx8qxp: make the name of clock ID generic
Date:   Thu, 20 Dec 2018 11:40:41 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-19 22:26:50)
> > -----Original Message-----
> > From: Fabio Estevam [mailto:festevam@gmail.com]
> > Hi Aisheng,
> >=20
> > On Wed, Dec 19, 2018 at 1:29 PM Aisheng Dong <aisheng.dong@nxp.com>
> > wrote:
> > >
> > > SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> > > Let's make the name of clock ID generic to allow other SoCs to reuse
> > > the common part.
> > >
> > > This patch only changes the clock id name and file name, so no
> > > functional change.
> > >
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > >  drivers/clk/imx/clk-imx8qxp-lpcg.c        | 146 +++++++--------
> > >  drivers/clk/imx/clk-imx8qxp.c             | 152 ++++++++--------
> > >  include/dt-bindings/clock/imx8-clock.h    | 289
> > ++++++++++++++++++++++++++++++
> > >  include/dt-bindings/clock/imx8qxp-clock.h | 289
> > > ------------------------------
> > >  4 files changed, 438 insertions(+), 438 deletions(-)
> >=20
> > This seems like unneeded churn. Just keep the existing naming and other=
 SoCs
> > can reuse it without problem.
>=20
> There's a reason.
> We still need add some clock IDs which exist on MX8QM only (probably more=
 on future SoCs)
> Having them prefixed with 'IMX8QXP' may look strange.
>=20
> Besides that, as those clock IDs will also be used in devicetree, make th=
e name generic for
> different SoCs seems still better and less confusing.
>=20

This looks like an integration problem. Is anyone using the defines that
are merged through clk tree now? A grep of linux-next says no, but how
can I be sure?

So can you leave around the header file with the deprecated define names
and introduce another one that's a copy of the header file but with the
non-SoC specific names?  Then you can wait for a release cycle and
delete the old header file that nobody should be using in DT anymore.
Unless you plan to make sure that nobody uses the deprecated defines
somehow?

And please Cc DT mailing list and maintainers one all bindings patches.
This includes include/dt-bindings/.

