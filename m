Return-Path: <broonie@sirena.org.uk>
Date: Mon, 30 Jul 2018 11:24:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Robin Gong <yibin.gong@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Leonard Crestez <leonard.crestez@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	dl-linux-imx <linux-imx@nxp.com>,
	"A.s. Dong" <aisheng.dong@nxp.com>
Subject: Re: [PATCH v8 5/6] regulator: pfuze100-regulator: provide
 pm_power_off_prepare handler
Message-ID: <20180730102452.GH5789@sirena.org.uk>
References: <20180726092220.17250-1-o.rempel@pengutronix.de>
 <20180726092220.17250-6-o.rempel@pengutronix.de>
 <DB6PR04MB32233832762D02F1023861A1892A0@DB6PR04MB3223.eurprd04.prod.outlook.com>
 <06313062-70db-9c10-048e-78ca267da959@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ewQ5hdP4CtoTt3oD"
In-Reply-To: <06313062-70db-9c10-048e-78ca267da959@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>


--ewQ5hdP4CtoTt3oD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 30, 2018 at 09:50:55AM +0200, Oleksij Rempel wrote:
> On 27.07.2018 11:32, Robin Gong wrote:

> >>  #include <linux/slab.h>
> >> +#include <linux/kallsyms.h>

> > Is it necessary?

> yes, for pm_power_off_prepare

That's a *weird* header to have to use for that symbol, are you sure
there isn't something more specific - if there isn't there should be.

--ewQ5hdP4CtoTt3oD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlte53MACgkQJNaLcl1U
h9BsBAf9HfE13YI9qSd1GydHPbPMZnDKSMXtshjnwDivfR+hXUdAlsfgURLvs0V8
f/iR74SQjrH99baF0Fo9tSGQPkWxv4riSx2J+n4Kk7CxdcxK9OviyIdH4Ecg4uks
TdgBaVcRXwVgiRx3gIj9ij6xlEfljCPQt5uOBL/42JeJ+kH8Qt11P9BbudUvBR1R
CbjNPFILD4P5HJ+tIl3fyRru9+Q1rJAof1nP8iTczZRMutPmNGidM47Dg0/z5k/f
cr+pkjguyjyYCD6gD0S9+oAG6jcmYa6ddGPIT+47Qu+eTWpAHi+PVlzzhJ69L59K
BqyDpG9Pitz6iJDZYY51xye0o+fI3g==
=/6WQ
-----END PGP SIGNATURE-----

--ewQ5hdP4CtoTt3oD--
