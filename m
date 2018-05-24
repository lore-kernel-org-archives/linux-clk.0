Return-Path: <prvs=3682ee18e6=Matti.Vaittinen@fi.rohmeurope.com>
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
Subject: RE: [PATCH 4/9] regulator: bd71837: Devicetree bindings for BD71837
 regulators
Date: Thu, 24 May 2018 17:30:57 +0000
Message-ID: <042F8805D2046347BB8420BEAE397A4016C06B47@WILL-MAIL002.REu.RohmEu.com>
References: <20180524055752.GE4249@localhost.localdomain>,<20180524140118.GS4828@sirena.org.uk>
In-Reply-To: <20180524140118.GS4828@sirena.org.uk>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hello Mark,=0A=
=0A=
First of all, thank you for taking your time to check the patches. I do=0A=
appreciate it. I find reading patches hard myself.=0A=
=0A=
> From: Mark Brown [broonie@kernel.org]=0A=
> Sent: Thursday, May 24, 2018 5:01 PM=0A=
> =0A=
> > On Thu, May 24, 2018 at 08:57:52AM +0300, Matti Vaittinen wrote:=0A=
>=0A=
> > +Required properties:=0A=
> > + - compatible: should be "rohm,bd71837-pmic".=0A=
> > + - regulator-name: should be "buck1", ..., "buck8" and "ldo1", ..., "l=
do7"=0A=
>=0A=
> The MFD is for a single device, there should be no need for compatibles=
=0A=
> on subfunctions.=0A=
=0A=
I will check this. I must admit I am not sure what is the de-facto mechanis=
m=0A=
for assigning the correct device-tree nodes to sub devices if compatibles=
=0A=
are not used? I think I saw device-tree node name being used for regulators=
=0A=
but how is it done for example with clk? I would be grateful if anyone coul=
d=0A=
point me to right direction with this.=0A=
=0A=
Also, another thing I was wondering is how supply regulators should be=0A=
handled? In this case the LDO5 is supplied by BUCK6 and LDO6 by=0A=
BUCK7. =0A=
=0A=
>From generic regulator bindings=0A=
/Documentation/devicetree/bindings/regulator/regulator.txt=0A=
I found statement:=0A=
=0A=
> - <name>-supply: phandle to the parent supply/regulator node=0A=
=0A=
and=0A=
=0A=
> Regulator Consumers:=0A=
> Consumer nodes can reference one or more of its supplies/=0A=
> regulators using the below bindings.=0A=
>=0A=
> - <name>-supply: phandle to the regulator node=0A=
>=0A=
> These are the same bindings that a regulator in the above=0A=
> example used to reference its own supply, in which case=0A=
> ts just seen as a special case of a regulator being a=0A=
> consumer itself.=0A=
=0A=
but I did not find handling for the supply properties from regulator core.=
=0A=
Thus I ended up hard coding the supply relation in driver. This means=0A=
that buck6 name must be fixed.=0A=
=0A=
Br,=0A=
    Matti Vaittinen=
