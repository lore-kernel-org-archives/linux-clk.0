Return-Path: <andy.tang@nxp.com>
From: "Y.T. Tang" <andy.tang@nxp.com>
To: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@codeaurora.org" <sboyd@codeaurora.org>
CC: "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Scott Wood <oss@buserror.net>, "Rob
 Herring" <robh@kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: qoriq-clock: Add coreclk
Date: Thu, 9 Mar 2017 08:46:34 +0000
Message-ID: <DB6PR0402MB2837EB5F759C39616BF8A904F3210@DB6PR0402MB2837.eurprd04.prod.outlook.com>
References: <1487137656-4006-1-git-send-email-yuantian.tang@nxp.com>
 <20170227171837.eymnyebgn7ocsp7w@rob-hp-laptop>
In-Reply-To: <20170227171837.eymnyebgn7ocsp7w@rob-hp-laptop>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Michael and Stephen,

This patch set was acked by Rob Herring. Do you have any comments on them?

BTW:  Scott should stay in author, do I need to resend them with author cha=
nged or you can change it when applying?

Regards,
Yuantian

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, February 28, 2017 1:19 AM
> To: Y.T. Tang
> Cc: mturquette@baylibre.com; sboyd@codeaurora.org;
> mark.rutland@arm.com; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; Scott Wood
> Subject: Re: [PATCH 1/2] dt-bindings: qoriq-clock: Add coreclk
>=20
> On Wed, Feb 15, 2017 at 01:47:35PM +0800, yuantian.tang@nxp.com wrote:
> > From: Tang Yuantian <Yuantian.Tang@nxp.com>
> >
> > ls1012a has separate input root clocks for core PLLs versus the
> > platform PLL, with the latter described as sysclk in the hw docs.
> > Update the qoriq-clock binding to allow a second input clock, named
> > "coreclk".  If present, this clock will be used for the core PLLs.
> >
> > Signed-off-by: Scott Wood <oss@buserror.net>
> > Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/clock/qoriq-clock.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
>=20
> The change looks fine, but sounds like Scott should remain the author (or
> agree he shouldn't be).
>=20
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > index df9cb5a..97a9666 100644
> > --- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > +++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > @@ -55,6 +55,11 @@ Optional properties:
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
> > @@ -71,6 +76,7 @@ second cell is the clock index for the specified type=
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
> >
