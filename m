Return-Path: <ping.bai@nxp.com>
From: Jacky Bai <ping.bai@nxp.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: "shawnguo@kernel.org" <shawnguo@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "jacky.baip@gmail.com"
	<jacky.baip@gmail.com>
Subject: RE: [PATCH 10/11] Document: dt: binding: imx: update doc for imx6sll
Date: Mon, 12 Dec 2016 02:32:15 +0000
Message-ID: <AM3PR04MB53013A2B683F78B91B59BF287980@AM3PR04MB530.eurprd04.prod.outlook.com>
References: <1480660774-25055-1-git-send-email-ping.bai@nxp.com>
 <1480660774-25055-11-git-send-email-ping.bai@nxp.com>
 <20161208225424.GQ5423@codeaurora.org>
In-Reply-To: <20161208225424.GQ5423@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

> Subject: Re: [PATCH 10/11] Document: dt: binding: imx: update doc for imx=
6sll
>=20
> On 12/02, Bai Ping wrote:
> > Add necessary document update for i.MX6SLL support.
> >
> > Signed-off-by: Bai Ping <ping.bai@nxp.com>
> > ---
> >  .../devicetree/bindings/clock/imx6sll-clock.txt    | 13 ++++++++
> >  .../bindings/pinctrl/fsl,imx6sll-pinctrl.txt       | 37 ++++++++++++++=
++++++++
>=20
> Please split the bindings into different patches and put them closer to t=
he
> drivers that use them in the series.

Ok, I will fix it in V2.

>=20
> >  2 files changed, 50 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/imx6sll-clock.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt
> >
> > diff --git a/Documentation/devicetree/bindings/clock/imx6sll-clock.txt
> > b/Documentation/devicetree/bindings/clock/imx6sll-clock.txt
> > new file mode 100644
> > index 0000000..4f52efa
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/imx6sll-clock.txt
> > @@ -0,0 +1,13 @@
> > +* Clock bindings for Freescale i.MX6 UltraLite
> > +
> > +Required properties:
> > +- compatible: Should be "fsl,imx6sll-ccm"
> > +- reg: Address and length of the register set
> > +- #clock-cells: Should be <1>
> > +- clocks: list of clock specifiers, must contain an entry for each
> > +required
> > +  entry in clock-names
> > +- clock-names: should include entries "ckil", "osc", "ipp_di0" and "ip=
p_di1"
> > +
> > +The clock consumer should specify the desired clock by having the
> > +clock ID in its "clocks" phandle cell.  See
> > +include/dt-bindings/clock/imx6sll-clock.h
> > +for the full list of i.MX6 SLL clock IDs.
>=20
> Can you add an example node here?
>=20

Thanks for review, I will add it in V2.=20

> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linu=
x
> Foundation Collaborative Project
