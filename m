Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFF5C43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 10:38:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98FBF2133F
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 10:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732061AbeLQKiJ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 05:38:09 -0500
Received: from smtprelay06.ispgateway.de ([80.67.31.95]:40045 "EHLO
        smtprelay06.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbeLQKiJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Dec 2018 05:38:09 -0500
X-Greylist: delayed 606 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 Dec 2018 05:38:08 EST
Received: from [89.1.81.74] (helo=karo-electronics.de)
        by smtprelay06.ispgateway.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <LW@KARO-electronics.de>)
        id 1gYq7v-0005oC-F2; Mon, 17 Dec 2018 11:27:55 +0100
Date:   Mon, 17 Dec 2018 11:27:52 +0100
From:   Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH V9 2/7] clk: imx: add scu clock common part
Message-ID: <20181217112752.07e43d05@karo-electronics.de>
In-Reply-To: <AM0PR04MB4211E44C3B64033C3795BDB380A60@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
        <1543934041-12572-3-git-send-email-aisheng.dong@nxp.com>
        <154447896872.17204.13777399275077720705@swboyd.mtv.corp.google.com>
        <AM0PR04MB4211E44C3B64033C3795BDB380A60@AM0PR04MB4211.eurprd04.prod.outlook.com>
Organization: Ka-Ro electronics GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Df-Sender: bHdAa2Fyby1lbGVjdHJvbmljcy5kZQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Tue, 11 Dec 2018 03:35:48 +0000 Aisheng Dong wrote:
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Quoting Aisheng DONG (2018-12-04 06:39:25)  
> > > diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig index
> > > 43a3ecc..63e7b01 100644
> > > --- a/drivers/clk/imx/Kconfig
> > > +++ b/drivers/clk/imx/Kconfig
> > > @@ -3,3 +3,7 @@
> > >  config MXC_CLK
> > >         bool
> > >         depends on ARCH_MXC
> > > +
> > > +config MXC_CLK_SCU  
> > 
> > Is there any reason to make this a hidden option instead of making it a
> > selectable option? It can still depend on ARCH_MXC and ARM64, but otherwise
> > it should be compilable as long as CONFIG_IMX_SCU is defined (this should
> > also be a config we depend on here).
> >   
> 
> This is mostly following the exist using that CLK is selected by SoC config option.
> https://patchwork.kernel.org/patch/10677309/
> 
> As CLK usually is required for platform to run well, so we did not make it selectable.
> 
> > > +       bool
> > > +       depends on ARCH_MXC && ARM64
> > > diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile index
> > > f850424..4abed37 100644
> > > --- a/drivers/clk/imx/Makefile
> > > +++ b/drivers/clk/imx/Makefile
> > > @@ -20,6 +20,9 @@ obj-$(CONFIG_MXC_CLK) += \
> > >         clk-pllv4.o \
> > >         clk-sccg-pll.o
> > >
> > > +obj-$(CONFIG_MXC_CLK_SCU) += \
> > > +       clk-scu.o
> > > +
> > >  obj-$(CONFIG_SOC_IMX1)   += clk-imx1.o
> > >  obj-$(CONFIG_SOC_IMX21)  += clk-imx21.o
> > >  obj-$(CONFIG_SOC_IMX25)  += clk-imx25.o diff --git
> > > a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c new file mode
> > > 100644 index 0000000..ec8a471
> > > --- /dev/null
> > > +++ b/drivers/clk/imx/clk-scu.c
> > > @@ -0,0 +1,265 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright 2018 NXP
> > > + *   Dong Aisheng <aisheng.dong@nxp.com>
> > > + */
> > > +
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/err.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#include "clk-scu.h"
> > > +
> > > +struct imx_sc_ipc *ccm_ipc_handle;  
> > 
> > Why does this need to be a global? Can it be in each clk_scu instance instead?
> >   
> 
> No, no need to be in each clk_scu instance.
> There's only one handler.
> 
Shouldn't it be 'static'?


Lothar Waßmann
