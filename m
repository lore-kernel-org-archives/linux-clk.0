Return-Path: <aisheng.dong@nxp.com>
From: "A.s. Dong" <aisheng.dong@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Fabio Estevam
	<fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, Mark Rutland
	<mark.rutland@arm.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH 11/12] dt-bindings: clock: add imx8qxp clock binding doc
Date: Wed, 2 May 2018 17:40:54 +0000
Message-ID: <AM0PR04MB42112867033DD6A0D36D364B80800@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1524855403-15301-1-git-send-email-aisheng.dong@nxp.com>
 <1524855403-15301-12-git-send-email-aisheng.dong@nxp.com>
 <20180501153727.GA21845@rob-hp-laptop>
In-Reply-To: <20180501153727.GA21845@rob-hp-laptop>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, May 1, 2018 11:37 PM
> To: A.s. Dong <aisheng.dong@nxp.com>
> Cc: linux-clk@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> sboyd@kernel.org; mturquette@baylibre.com; shawnguo@kernel.org; Fabio
> Estevam <fabio.estevam@nxp.com>; dl-linux-imx <linux-imx@nxp.com>;
> kernel@pengutronix.de; Mark Rutland <mark.rutland@arm.com>;
> devicetree@vger.kernel.org
> Subject: Re: [PATCH 11/12] dt-bindings: clock: add imx8qxp clock binding =
doc
>=20
> On Sat, Apr 28, 2018 at 02:56:42AM +0800, Dong Aisheng wrote:
> > Add imx8qxp clock binding doc.
> >
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <kernel@pengutronix.de>
> > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> >  .../devicetree/bindings/clock/imx8qxp-clk.txt      |  39 +++
> >  include/dt-bindings/clock/imx8qxp-clock.h          | 362
> +++++++++++++++++++++
> >  2 files changed, 401 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/imx8qxp-clk.txt
> >  create mode 100644 include/dt-bindings/clock/imx8qxp-clock.h
> >
> > diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-clk.txt
> > b/Documentation/devicetree/bindings/clock/imx8qxp-clk.txt
> > new file mode 100644
> > index 0000000..5e365d7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/imx8qxp-clk.txt
> > @@ -0,0 +1,39 @@
> > +NXP i.MX8QXP Clocks Based on SCFW
> > +--------------------------------------------------------------------
> > +
> > +Some i.MX SoCs contain a system controller that is responsible for
> > +providing clock control service for the IPs. Communication between
> > +the host processor running an OS and the system controller happens
> > +through a SCU protocol [1].
> > +
> > +[1] Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > +
> > +Required properties:
> > +
> > +- compatible:	Should be "fsl,imx8qxp-clock".
> > +- #clock-cells:	Should be <1>.
>=20
> There's no reason for this node. Just make the parent (SCU) a clock provi=
der.
>=20

It can be done, but do I need to also remove other nodes like pinctrl, powe=
r domain
in the same sub-nodes Of SCU?

BTW i saw arm,scpi.txt also keep the clk node under scpi node.
Documentation/devicetree/bindings/arm/arm,scpi.txt

Seems like SCU like ARM SCPI is more like a protocol node while still needs
different drivers to provide services.

Regards
Dong Aisheng

> > +
> > +The clock consumer should specify the desired clock by having the
> > +clock ID in its "clocks" phandle cell.
> > +See include/dt-bindings/clock/imx8qxp-clock.h
> > +for the full list of i.MX8QXP clock IDs.
> > +
> > +Examples:
> > +
> > +#include <dt-bindings/clock/imx8qxp-clock.h>
> > +
> > +clk: clk {
> > +	compatible =3D "fsl,imx8qxp-clk";
> > +	#clock-cells =3D <1>;
> > +};
> > +
> > +i2c0: i2c@5a800000 {
> > +	compatible =3D "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
> > +	reg =3D <0x0 0x5a800000 0x0 0x4000>;
> > +	interrupts =3D <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
> > +	interrupt-parent =3D <&gic>;
> > +	clocks =3D <&clk IMX8QXP_I2C0_CLK>,
> > +		 <&clk IMX8QXP_I2C0_IPG_CLK>;
> > +	clock-names =3D "per", "ipg";
> > +	...
> > +};
