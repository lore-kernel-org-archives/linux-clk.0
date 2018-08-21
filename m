Return-Path: <aisheng.dong@nxp.com>
From: "A.s. Dong" <aisheng.dong@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
CC: Fabio Estevam <fabio.estevam@nxp.com>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "patchwork-lst@pengutronix.de"
	<patchwork-lst@pengutronix.de>
Subject: RE: [PATCH 2/3] clk: imx6q: optionally get CCM inputs via standard
 clock handles
Date: Tue, 21 Aug 2018 08:56:09 +0000
Message-ID: 
 <AM0PR04MB4211DE29E5644C8C9A33278780310@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180731102009.6710-1-l.stach@pengutronix.de>
 <20180731102009.6710-2-l.stach@pengutronix.de>
In-Reply-To: <20180731102009.6710-2-l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Lucas,

> -----Original Message-----
> From: Lucas Stach <l.stach@pengutronix.de>
> Sent: Tuesday, July 31, 2018 6:20 PM

[...]

> When specifying external clock inputs to the CCM the current code require=
s
> the clocks to be in a "clocks" child node of the DT root.
> This is not really conformant with DT best practices.
>=20
> To avoid the need to deviate from those best practices, allow the clock i=
nputs
> to be specifies via standard clock handles. This is in line with how driv=
ers of
> the later CCM driver revisions on newer i.MX SoCs handle this.
>=20
> As we can't retroactively change the DT binding, allow this as an option =
with a
> fallback to the old way of how this has been handled.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../devicetree/bindings/clock/imx6q-clock.txt |  5 +++++
>  drivers/clk/imx/clk-imx6q.c                   | 22 ++++++++++++++-----
>  2 files changed, 22 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> index a45ca67a9d5f..ce6aa9920c05 100644
> --- a/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> @@ -6,6 +6,11 @@ Required properties:
>  - interrupts: Should contain CCM interrupt
>  - #clock-cells: Should be <1>
>=20
> +Optional properties:
> +- clocks: list of clock specifiers, must contain an entry for each entry
> +          in clock-names
> +- clock-names: valid names are "osc", "ckil", "ckil", "anaclk1" and "ana=
clk2"

A minor issue:=20
The third name should be "ckih1".

Otherwise:
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng
