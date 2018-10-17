Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB490ECDE30
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 825C921527
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cfw66XWF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 825C921527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727214AbeJQXO7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 19:14:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:47954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbeJQXO6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 19:14:58 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 268C821526;
        Wed, 17 Oct 2018 15:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539789528;
        bh=hG6EW0etaRNLTr+cpiC26qA84Y6jDmJX83Nh1tfBut4=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=Cfw66XWFDsVHnZX0268Yd51yrLcccyi/mxJMd1cvRwsiGPEbAkoUqY1FTynCKn/ev
         /LFJOOxSmg1iHmMVnZO3TUG0HxTxnOfU2gGaoKEJKxFP+hqM+gtHCdgV5l2VniNot3
         DjxXc4MitW3za4wkTwqGlUt3DndeKFmY7mWHTgqU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB4211AC4095A29F4C49FF7E0180FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-10-git-send-email-aisheng.dong@nxp.com>
 <153972556312.5275.17225594568267875356@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211AC4095A29F4C49FF7E0180FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <153978952755.5275.12107400457792189263@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V4 09/11] clk: imx: add common imx_clk_hw_fixed functions
Date:   Wed, 17 Oct 2018 08:18:47 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-17 02:21:57)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Sent: Wednesday, October 17, 2018 5:33 AM
> > Quoting A.s. Dong (2018-10-14 01:08:09)
> > > This may be used by both mmio and scu clks. So let's put it into a
> > > common file.
> > >
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > >  drivers/clk/imx/clk-common.h  | 16 ++++++++++++++++
> > > drivers/clk/imx/scu/clk-scu.h |  2 ++
> > >  2 files changed, 18 insertions(+)
> > >  create mode 100644 drivers/clk/imx/clk-common.h
> > >
> > > diff --git a/drivers/clk/imx/clk-common.h
> > > b/drivers/clk/imx/clk-common.h new file mode 100644 index
> > > 0000000..e3634a5
> > > --- /dev/null
> > > +++ b/drivers/clk/imx/clk-common.h
> > > @@ -0,0 +1,16 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Copyright 2018 NXP
> > > + */
> > > +
> > > +#ifndef __IMX_CLK_COMMON_H
> > > +#define __IMX_CLK_COMMON_H
> > > +
> > > +#include <linux/clk-provider.h>
> > > +
> > > +static inline struct clk_hw *imx_clk_hw_fixed(const char *name, int
> > > +rate) {
> > > +       return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
> > > +}
> > =

> > Why do we need this wrapper file? =

> =

> This file clk-common.h is used to put the common bits between legacy cloc=
ks and scu clocks.
> Only imx_clk_hw_fixed() is added in this patch.
> =

> > Just call the registration function directly
> > with the right arguments instead of wrapping them in another function p=
lease.
> =

> That's legacy way and widely used before in order to save unnecessary par=
ameters
> for imx clocks.
> e.g.
> drivers/clk/imx/clk.h
> static inline struct clk *imx_clk_fixed(const char *name, int rate)
> {
>         return clk_register_fixed_rate(NULL, name, NULL, 0, rate);
> }
> =

> static inline struct clk *imx_clk_divider(const char *name, const char *p=
arent,
>                 void __iomem *reg, u8 shift, u8 width)
> {
>         return clk_register_divider(NULL, name, parent, CLK_SET_RATE_PARE=
NT,
>                         reg, shift, width, 0, &imx_ccm_lock);
> }
> =

> I can remove it if you dislike it.
> =

> Just one question, in later patch, another common function will also be a=
dded here:
> static inline void imx_check_clk_hws(struct clk_hw *clks[], unsigned int =
count)
> {
>         unsigned int i;
> =

>         for (i =3D 0; i < count; i++) {
>                 if (IS_ERR(clks[i]))
>                         pr_err("i.MX clk %u: register failed with %ld\n",
>                                 i, PTR_ERR(clks[i])); =

>         }
> }
> =

> Should we remove it as well?
> =


Yes please remove this whole file.

