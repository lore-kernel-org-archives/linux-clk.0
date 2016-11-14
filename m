Return-Path: <shawnguo@kernel.org>
Date: Mon, 14 Nov 2016 14:13:12 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Peter Chen <peter.chen@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] ARM: imx6ull: add imx6ull support
Message-ID: <20161114061311.GA14956@dragon>
References: <1478584614-12054-1-git-send-email-peter.chen@nxp.com>
 <1478584614-12054-2-git-send-email-peter.chen@nxp.com>
 <20161114054833.GG3310@dragon>
 <HE1PR04MB14509BFD0CBA838BC1EA7D598BBC0@HE1PR04MB1450.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <HE1PR04MB14509BFD0CBA838BC1EA7D598BBC0@HE1PR04MB1450.eurprd04.prod.outlook.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Nov 14, 2016 at 05:59:01AM +0000, Peter Chen wrote:
> The main difference is compatible string, I can't include two compatible strings in one dts file,
> the dts build will fail for that.
> 
> imx6ull-14x14-evk.dts 
> / {
>         model = "Freescale i.MX6 UlltraLite 14x14 EVK Board";
>         compatible = "fsl,imx6ull-14x14-evk", "fsl,imx6ull";
> };
> 
> imx6ul-14x14-evk.dts 
> / {
>         model = "Freescale i.MX6 UltraLite 14x14 EVK Board";
>         compatible = "fsl,imx6ul-14x14-evk", "fsl,imx6ul";
> };

I created imx6ull-14x14-evk.dts like below, and DTC seems happy with it.

#include "imx6ul-14x14-evk.dts"

/ {
        model = "Freescale i.MX6 UlltraLite 14x14 EVK Board";
        compatible = "fsl,imx6ull-14x14-evk", "fsl,imx6ull";
};

Shawn
