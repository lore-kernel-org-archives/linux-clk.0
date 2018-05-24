Return-Path: <prvs=86823ee7e6=Matti.Vaittinen@fi.rohmeurope.com>
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: Mark Brown <broonie@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "lee.jones@linaro.org"
	<lee.jones@linaro.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mutanen,
 Mikko" <Mikko.Mutanen@fi.rohmeurope.com>, "Haikola, Heikki"
	<Heikki.Haikola@fi.rohmeurope.com>
Subject: RE: [PATCH 9/9] regulator: bd71837: Build BD71837 regulator driver
Date: Thu, 24 May 2018 17:34:24 +0000
Message-ID: <042F8805D2046347BB8420BEAE397A4016C06B52@WILL-MAIL002.REu.RohmEu.com>
References: <20180524060114.GJ4249@localhost.localdomain>,<20180524140159.GT4828@sirena.org.uk>
In-Reply-To: <20180524140159.GT4828@sirena.org.uk>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

=0A=
=0A=
> On Thu, May 24, 2018 at 09:01:14AM +0300, Matti Vaittinen wrote:=0A=
> > Configurations and Makefile for BD71837 regulator driver=0A=
> >=0A=
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>=0A=
> > ---=0A=
> >  drivers/regulator/Kconfig  | 11 +++++++++++=0A=
> >  drivers/regulator/Makefile |  1 +=0A=
> >  2 files changed, 12 insertions(+)=0A=
>=0A=
> Just squash this into the single patch adding the driver, it makes life=
=0A=
> easier.=0A=
=0A=
Will do. I was wondering if it is nicer to have smaller patches and thus=0A=
decided to split this but if it is easier to read them in one patch=0A=
- no problem.=0A=
=0A=
Br,=0A=
    Matti Vaittinen=
