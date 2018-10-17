Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1E5ECDE30
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:18:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 874D221526
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtjNfXcK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 874D221526
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbeJQXO1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 19:14:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:47704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727245AbeJQXO1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 19:14:27 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A0702150D;
        Wed, 17 Oct 2018 15:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539789497;
        bh=AC/m0tZeME4H8+zu+7f+II8tv2e2++uS5W8bG8d1oIU=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=LtjNfXcKVYS8tDbbsVpD1rotTyXLHqr+T6yrYL5ojwPw+4dJJIlrDArQUmQ/oajSe
         dAmNJpSIXiFf433VW2li/EPm2KRy/CIU2+TML7l0PStoA3lLFDBJ92icU/vw1B+78m
         xPNY0jwoBohqpzi2pge48yIsB3QtBEOjMBH5EQ3s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB42111EE950D372B8D330164780FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-9-git-send-email-aisheng.dong@nxp.com>
 <153972544065.5275.2030080128764662219@swboyd.mtv.corp.google.com>
 <AM0PR04MB42111EE950D372B8D330164780FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <153978949677.5275.18324073004650149491@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V4 08/11] clk: imx: scu: add scu clock gpr mux
Date:   Wed, 17 Oct 2018 08:18:16 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-17 02:07:00)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Sent: Wednesday, October 17, 2018 5:31 AM
> > Quoting A.s. Dong (2018-10-14 01:08:06)
> > > diff --git a/drivers/clk/imx/scu/clk-mux-gpr-scu.c
> > > b/drivers/clk/imx/scu/clk-mux-gpr-scu.c
> > > new file mode 100644
> > > index 0000000..2ad7a80
> > > --- /dev/null
> > > +++ b/drivers/clk/imx/scu/clk-mux-gpr-scu.c
> > > @@ -0,0 +1,90 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> > > + * Copyright 2017~2018 NXP
> > > + *     Dong Aisheng <aisheng.dong@nxp.com>
> > > + */
> > > +
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/err.h>
> > > +#include <linux/io.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#include "clk-scu.h"
> > > +
> > > +struct clk_mux_gpr_scu {
> > > +       struct clk_hw hw;
> > > +       u32     rsrc_id;
> > > +       u8      gpr_id;
> > > +};
> > > +
> > > +#define to_clk_mux_gpr_scu(_hw) container_of(_hw, struct
> > > +clk_mux_gpr_scu, hw)
> > > +
> > > +static u8 clk_mux_gpr_scu_get_parent(struct clk_hw *hw) {
> > > +       struct clk_mux_gpr_scu *gpr_mux =3D to_clk_mux_gpr_scu(hw);
> > > +       u32 val =3D 0;
> > > +       int ret;
> > > +
> > > +       ret =3D imx_sc_misc_get_control(ccm_ipc_handle, gpr_mux->rsrc=
_id,
> > > +                                     gpr_mux->gpr_id, &val);
> > > +       if (ret) {
> > > +               pr_err("%s: failed to get clock parent %d\n",
> > > +                       clk_hw_get_name(hw), ret);
> > > +               return 0;
> > > +       }
> > > +
> > > +       return (u8)val;
> > =

> > Nitpick: Please drop explicit casts.
> > =

> =

> Compiler does it for us already, right?
> Will drop it.

Yes and my brain is a tired compiler :)

