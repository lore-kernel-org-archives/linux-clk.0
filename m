Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Anson Huang <anson.huang@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB44813C7A3E0AF4F3BCFFCF0088390@AM0PR04MB4481.eurprd04.prod.outlook.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
References: <1533703167-26583-1-git-send-email-Anson.Huang@nxp.com>
 <1533703167-26583-2-git-send-email-Anson.Huang@nxp.com>
 <AM0PR04MB4481FC2BAD71B75D7BE84C0788260@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916F8BC381BBA01DB21D1C0F5260@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM0PR04MB44813C7A3E0AF4F3BCFFCF0088390@AM0PR04MB4481.eurprd04.prod.outlook.com>
Message-ID: <153567894721.93865.4092113232222931488@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH 2/2] clk: imx: imx7d: remove clks_init_on array
Date: Thu, 30 Aug 2018 18:29:07 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Peng Fan (2018-08-12 18:15:41)
> Hi Anson,
> =

> > > > -----Original Message-----
> > > > From: Anson Huang
> > > > Sent: 2018=E5=B9=B48=E6=9C=888=E6=97=A5 12:39
> > > > To: shawnguo@kernel.org; s.hauer@pengutronix.de;
> > > > kernel@pengutronix.de; Fabio Estevam <fabio.estevam@nxp.com>;
> > > > mturquette@baylibre.com; sboyd@kernel.org;
> > > > linux-arm-kernel@lists.infradead.org;
> > > > linux-clk@vger.kernel.org; linux-kernel@vger.kernel.org
> > > > Cc: dl-linux-imx <linux-imx@nxp.com>
> > > > Subject: [PATCH 2/2] clk: imx: imx7d: remove clks_init_on array
> > > >
> > > > Clock framework will enable those clocks registered with
> > > > CLK_IS_CRITICAL flag, so no need to have clks_init_on array during
> > > > clock
> > > initialization now.
> > >
> > > Will it be more flexible to parse dts saying "critical-clocks =3D <xx=
x>"
> > > or "init-on-arrary=3D<xxx>"
> > > and enable those clocks?
> > =

> > Parsing the clocks arrays from dtb is another way of enabling critical =
clocks, but
> > for current i.MX6/7 platforms, we implement it in same way as most of o=
ther
> > SoCs, currently I did NOT see any necessity of putting them in dtb, jus=
t adding
> > flag during clock registering is more simple, if there is any special r=
equirement
> > for different clocks set to be enabled, then we can add support to enab=
le the
> > method of parsing critical-clocks from dtb. Just my two cents.
> =

> Thinking about OP-TEE want to use one device, but it's clocks are registe=
red
> by Linux, because there is no module in Linux side use it, it will shutdo=
wn the clock,
> which cause OP-TEE could not access the device.
> =

> Then people have to modify clk code to add CLK_IS_CRITICAL flag to make s=
ure
> the clocks are not shutdown by Linux.
> =

> However adding a new property in clk node and let driver code parse the d=
ts,
> there is no need to modify clk driver code when OP-TEE needs another devi=
ce clock.
> =


If OP-TEE needs linux to keep things on then why can't the OP-TEE driver
in Linux probe, acquire clocks, and keep the clks enabled forever?
