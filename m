Return-Path: <yuantian.tang@nxp.com>
From: "Y.T. Tang" <yuantian.tang@nxp.com>
To: "mturquette@baylibre.com" <mturquette@baylibre.com>
CC: "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Scott Wood <oss@buserror.net>
Subject: RE: [PATCH 1/2] dt-bindings: qoriq-clock: Add coreclk
Date: Mon, 27 Feb 2017 02:19:16 +0000
Message-ID: <VI1PR0402MB2848DEF2D443FF507CF03D78F0570@VI1PR0402MB2848.eurprd04.prod.outlook.com>
References: <1487137656-4006-1-git-send-email-yuantian.tang@nxp.com>
In-Reply-To: <1487137656-4006-1-git-send-email-yuantian.tang@nxp.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

PING!

Regards,
Yuantian

> -----Original Message-----
> From: yuantian.tang@nxp.com [mailto:yuantian.tang@nxp.com]
> Sent: Wednesday, February 15, 2017 1:48 PM
> To: mturquette@baylibre.com
> Cc: sboyd@codeaurora.org; robh+dt@kernel.org; mark.rutland@arm.com;
> linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Y.T. Tang
> <yuantian.tang@nxp.com>; Scott Wood <oss@buserror.net>; Y.T. Tang
> <yuantian.tang@nxp.com>
> Subject: [PATCH 1/2] dt-bindings: qoriq-clock: Add coreclk
>=20
> From: Tang Yuantian <Yuantian.Tang@nxp.com>
>=20
> ls1012a has separate input root clocks for core PLLs versus the platform =
PLL,
> with the latter described as sysclk in the hw docs.
> Update the qoriq-clock binding to allow a second input clock, named
> "coreclk".  If present, this clock will be used for the core PLLs.
>=20
> Signed-off-by: Scott Wood <oss@buserror.net>
> Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>
> ---
>  Documentation/devicetree/bindings/clock/qoriq-clock.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> index df9cb5a..97a9666 100644
> --- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> @@ -55,6 +55,11 @@ Optional properties:
>  - clocks: If clock-frequency is not specified, sysclk may be provided
>  	as an input clock.  Either clock-frequency or clocks must be
>  	provided.
> +	A second input clock, called "coreclk", may be provided if
> +	core PLLs are based on a different input clock from the
> +	platform PLL.
> +- clock-names: Required if a coreclk is present.  Valid names are
> +	"sysclk" and "coreclk".
>=20
>  2. Clock Provider
>=20
> @@ -71,6 +76,7 @@ second cell is the clock index for the specified type.
>  	2	hwaccel		index (n in CLKCGnHWACSR)
>  	3	fman		0 for fm1, 1 for fm2
>  	4	platform pll	0=3Dpll, 1=3Dpll/2, 2=3Dpll/3, 3=3Dpll/4
> +	5	coreclk		must be 0
>=20
>  3. Example
>=20
> --
> 2.1.0.27.g96db324
