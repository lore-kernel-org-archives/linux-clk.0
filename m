Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-he1eur01on0057.outbound.protection.outlook.com ([104.47.0.57]:13376
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726832AbeHUPLp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 21 Aug 2018 11:11:45 -0400
From: "A.s. Dong" <aisheng.dong@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: RE: [PATCH V5 1/5] dt-bindings: arm: fsl: add scu binding doc
Date: Tue, 21 Aug 2018 11:51:49 +0000
Message-ID: <AM0PR04MB421175C894CFA5F16C2CB79C80310@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1534781305-4770-1-git-send-email-aisheng.dong@nxp.com>
 <1534781305-4770-2-git-send-email-aisheng.dong@nxp.com>
 <20180820181155.GA13901@bogus>
 <AM0PR04MB4211B9113831B292110C709280310@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB4211B9113831B292110C709280310@AM0PR04MB4211.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Rob,

> > > +Clock bindings based on SCU Message Protocol
> > > +------------------------------------------------------------
> > > +
> > > +This binding uses the common clock binding[1].
> > > +
> > > +Required properties:
> > > +- compatible:		Should be "fsl,imx8qxp-clock".
> > > +- #clock-cells:		Should be 1. Contains the Clock ID value.
> >
> > There was a recent patch adding input clocks to other i.MX CCM bindings=
.
> > Is that needed here?
> >
>=20
> Will double check it, thanks for reminder.

It should work for mx8 as well.

I will add them like below:
+- clocks:              List of clock specifiers, must contain an entry for
+                       each required entry in clock-names
+- clock-names:         Should include entries "xtal_32KHz", "xtal_24MHz"

Thanks for the suggestion.

Regards
Dong Aisheng
