Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ed1-f44.google.com ([209.85.208.44]:35296 "EHLO
        mail-ed1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbeHXNLA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Aug 2018 09:11:00 -0400
MIME-Version: 1.0
References: <1534781305-4770-1-git-send-email-aisheng.dong@nxp.com>
 <1534781305-4770-2-git-send-email-aisheng.dong@nxp.com> <20180820181155.GA13901@bogus>
 <AM0PR04MB4211B9113831B292110C709280310@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB4211B9113831B292110C709280310@AM0PR04MB4211.eurprd04.prod.outlook.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 24 Aug 2018 15:06:58 +0530
Message-ID: <CABb+yY1+J+=nV2gNN30KLr2YQDy_g81-dJS1DJq8NgUv7Qqcog@mail.gmail.com>
Subject: Re: [PATCH V5 1/5] dt-bindings: arm: fsl: add scu binding doc
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Dong Aisheng <dongas86@gmail.com>,
        ", Sascha Hauer" <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, ulf.hansson@linaro.org,
        Devicetree List <devicetree@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 21, 2018 at 8:30 AM A.s. Dong <aisheng.dong@nxp.com> wrote:
>
> > > +
> > > +The System Controller Firmware (SCFW) is a low-level system function
> > > +which runs on a dedicated Cortex-M core to provide power, clock, and
> > > +resource management. It exists on some i.MX8 processors. e.g. i.MX8QM
> > > +(QM, QP), and i.MX8QX (QXP, DX).
> > > +
> > > +The AP communicates with the SC using a multi-ported MU module found
> > > +in the LSIO subsystem. The current definition of this MU module
> > > +provides
> > > +5 remote AP connections to the SC to support up to 5 execution
> > > +environments (TZ, HV, standard Linux, etc.). The SC side of this MU
> > > +module interfaces with the LSIO DSC IP bus. The SC firmware will
> > > +communicate with this MU using the MSI bus.
> >
> > How are 5 users supported with only 4 channels defined below?
>
> There're 5 MU instances designed to be specifically communicate with
> SCU Firmware on MX8 hardware.
>
This is correct.

> With the new generic mu binding [1], each MU instance is abstracted
> Into 16 virtual MU channels. (4 Tx, 4 Rx, 4 Tx doorbell, 4 Rx doorbell).
> (MU has 4 pair of Tx/Rx data register which can be used to send/receive
> multi words. With new binding, each data register is abstracted into one
> MU channel, totally 8 channels for data transfer).
>
> SCU protocol is already designed to uses all data registers to send/receive
> multi words according to MU hardware reference manual. So it must
> use all channels in one MU instances with new binding.
>
FYI, this is incorrect.
The 16 channels are physical and not virtual. In fact, all this is to
avoid virtual channels.
The physical resources required by new bindings are exactly the same
as by old bindings. Now you use 8 physical channels instead of 1
virtual.
