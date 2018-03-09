Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-db5eur01on0041.outbound.protection.outlook.com ([104.47.2.41]:41040
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750937AbeCIFB2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 9 Mar 2018 00:01:28 -0500
From: Jacky Bai <ping.bai@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
CC: "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "A.s. Dong" <aisheng.dong@nxp.com>,
        "jacky.baip@gmail.com" <jacky.baip@gmail.com>
Subject: RE: [PATCH v4 4/4] driver: clk: imx: add clock driver for imx6sll
Date: Fri, 9 Mar 2018 05:01:23 +0000
Message-ID: <HE1PR04MB3113EF8891AECF0E0922E6C687DE0@HE1PR04MB3113.eurprd04.prod.outlook.com>
References: <1520502445-22576-1-git-send-email-ping.bai@nxp.com>
 <1520502445-22576-4-git-send-email-ping.bai@nxp.com>
 <20180309024513.GE3217@dragon>
In-Reply-To: <20180309024513.GE3217@dragon>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

> Subject: Re: [PATCH v4 4/4] driver: clk: imx: add clock driver for imx6sl=
l
>=20
> On Thu, Mar 08, 2018 at 05:47:25PM +0800, Bai Ping wrote:
> > diff --git a/drivers/clk/imx/clk-imx6sll.c
> > b/drivers/clk/imx/clk-imx6sll.c new file mode 100644 index
> > 0000000..e938db5
> > --- /dev/null
> > +++ b/drivers/clk/imx/clk-imx6sll.c
> > @@ -0,0 +1,344 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> > + * Copyright 2017-2018 NXP.
> > + */
> > +
> > +#include <dt-bindings/clock/imx6sll-clock.h>
> > +#include <linux/clk.h>
> > +#include <linux/clkdev.h>
> > +#include <linux/err.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/types.h>
> > +
> > +#include "clk.h"
> > +
> > +#define CCM_ANALOG_PLL_BYPASS		(0x1 << 16)
> > +#define BM_CCM_CCDR_MMDC_CH0_MASK	(0x2 << 16)
> > +#define CCDR				0x4
>=20
> We agreed to remove this define, right?

Sorry, this is missed, will correct it.
Jacky

>=20
> Shawn
>=20
> > +#define xPLL_CLR(offset)		(offset + 0x8)
