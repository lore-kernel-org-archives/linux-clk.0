Return-Path: <andy.tang@nxp.com>
From: Andy Tang <andy.tang@nxp.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>
CC: "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Scott Wood <oss@buserror.net>
Subject: RE: [PATCH 1/2 v2] dt-bindings: qoriq-clock: Add coreclk
Date: Mon, 8 May 2017 05:59:27 +0000
Message-ID: <HE1PR0402MB2828CD7848C4C71F1526587DF3EE0@HE1PR0402MB2828.eurprd04.prod.outlook.com>
References: <1489977443-33582-1-git-send-email-andy.tang@nxp.com>
 <DB6PR0402MB283701D478A1678D28894C77F30A0@DB6PR0402MB2837.eurprd04.prod.outlook.com>
  <DB6PR0402MB2837F82134ADCBAC53ECC51FF31F0@DB6PR0402MB2837.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2837F82134ADCBAC53ECC51FF31F0@DB6PR0402MB2837.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Robh,

Could you please take a look at this patch set? They are pending for a real=
ly long time.
Don't know why they have not been merged.

Patch links:
https://patchwork.kernel.org/patch/9633007/
https://patchwork.kernel.org/patch/9633009/

Regards,
Andy

> -----Original Message-----
> From: Andy Tang
> Sent: Monday, April 24, 2017 11:15 AM
> To: mturquette@baylibre.com; sboyd@codeaurora.org
> Cc: robh+dt@kernel.org; mark.rutland@arm.com; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; Scott Wood <oss@buserror.net>
> Subject: RE: [PATCH 1/2 v2] dt-bindings: qoriq-clock: Add coreclk
>=20
> Does anyone give me a clue why this patch set can't be responded after so
> long time?
>=20
> Thanks,
> Andy
>=20
> -----Original Message-----
> From: Andy Tang
> Sent: Monday, April 17, 2017 9:37 AM
> To: 'mturquette@baylibre.com' <mturquette@baylibre.com>;
> 'sboyd@codeaurora.org' <sboyd@codeaurora.org>
> Cc: 'robh+dt@kernel.org' <robh+dt@kernel.org>; 'mark.rutland@arm.com'
> <mark.rutland@arm.com>; 'linux-clk@vger.kernel.org' <linux-
> clk@vger.kernel.org>; 'devicetree@vger.kernel.org'
> <devicetree@vger.kernel.org>; 'linux-kernel@vger.kernel.org' <linux-
> kernel@vger.kernel.org>; 'linux-arm-kernel@lists.infradead.org' <linux-ar=
m-
> kernel@lists.infradead.org>; 'Scott Wood' <oss@buserror.net>
> Subject: RE: [PATCH 1/2 v2] dt-bindings: qoriq-clock: Add coreclk
>=20
> Hi Stephen and Michael,
>=20
> This patch set has been pending for more than two months since it was fir=
st
> sent.
> I have not received any response from you until now.
>=20
> Could you give some comments on it?
>=20
> Regards,
> Andy
>=20
> -----Original Message-----
> From: Andy Tang
> Sent: Wednesday, April 05, 2017 2:16 PM
> To: mturquette@baylibre.com; sboyd@codeaurora.org
> Cc: robh+dt@kernel.org; mark.rutland@arm.com; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; Scott Wood <oss@buserror.net>
> Subject: RE: [PATCH 1/2 v2] dt-bindings: qoriq-clock: Add coreclk
>=20
> Hello
>=20
> Do you have any comments on this patch set which was acked by Rob?
>=20
> Regards,
> Andy
>=20
> > -----Original Message-----
> > From: Yuantian Tang [mailto:andy.tang@nxp.com]
> > Sent: Monday, March 20, 2017 10:37 AM
> > To: mturquette@baylibre.com
> > Cc: sboyd@codeaurora.org; robh+dt@kernel.org; mark.rutland@arm.com;
> > linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Scott
> > Wood <oss@buserror.net>; Andy Tang <andy.tang@nxp.com>
> > Subject: [PATCH 1/2 v2] dt-bindings: qoriq-clock: Add coreclk
> >
> > From: Scott Wood <oss@buserror.net>
> >
> > ls1012a has separate input root clocks for core PLLs versus the
> > platform PLL, with the latter described as sysclk in the hw docs.
> > Update the qoriq-clock binding to allow a second input clock, named
> > "coreclk".  If present, this clock will be used for the core PLLs.
> >
> > Signed-off-by: Scott Wood <oss@buserror.net>
> > Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> > v2:
> > 	-- change the author to Scott
> >  Documentation/devicetree/bindings/clock/qoriq-clock.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > index aa3526f..119cafd 100644
> > --- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > +++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > @@ -56,6 +56,11 @@ Optional properties:
> >  - clocks: If clock-frequency is not specified, sysclk may be provided
> >  	as an input clock.  Either clock-frequency or clocks must be
> >  	provided.
> > +	A second input clock, called "coreclk", may be provided if
> > +	core PLLs are based on a different input clock from the
> > +	platform PLL.
> > +- clock-names: Required if a coreclk is present.  Valid names are
> > +	"sysclk" and "coreclk".
> >
> >  2. Clock Provider
> >
> > @@ -72,6 +77,7 @@ second cell is the clock index for the specified type=
.
> >  	2	hwaccel		index (n in CLKCGnHWACSR)
> >  	3	fman		0 for fm1, 1 for fm2
> >  	4	platform pll	0=3Dpll, 1=3Dpll/2, 2=3Dpll/3, 3=3Dpll/4
> > +	5	coreclk		must be 0
> >
> >  3. Example
> >
> > --
> > 2.1.0.27.g96db324
