Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 30 Jul 2015 12:17:23 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 7/7] clk: sunxi: Add a simple gates driver
Message-ID: <20150730101723.GL2564@lukather>
References: <1437945270-32014-1-git-send-email-maxime.ripard@free-electrons.com>
 <1437945270-32014-8-git-send-email-maxime.ripard@free-electrons.com>
 <20150727202648.GB14521@codeaurora.org>
 <CAGb2v6517qCXmNkYihnfBmc5fL7bqTDOQwedNYjq+p2Mg45+gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U2AV99o4bq1UPJQr"
In-Reply-To: <CAGb2v6517qCXmNkYihnfBmc5fL7bqTDOQwedNYjq+p2Mg45+gQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--U2AV99o4bq1UPJQr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 03:55:17PM +0800, Chen-Yu Tsai wrote:
> On Tue, Jul 28, 2015 at 4:26 AM, Stephen Boyd <sboyd@codeaurora.org> wrot=
e:
> > On 07/26, Maxime Ripard wrote:
> >> diff --git a/drivers/clk/sunxi/clk-simple-gates.c b/drivers/clk/sunxi/=
clk-simple-gates.c
> >> new file mode 100644
> >> index 000000000000..1a3963a8a686
> >> --- /dev/null
> >> +++ b/drivers/clk/sunxi/clk-simple-gates.c
> >> @@ -0,0 +1,159 @@
> >> +/*
> >> + * Copyright 2015 Maxime Ripard
> >> + *
> >> + * Maxime Ripard <maxime.ripard@free-electrons.com>
> >> + *
> >> + * This program is free software; you can redistribute it and/or modi=
fy
> >> + * it under the terms of the GNU General Public License as published =
by
> >> + * the Free Software Foundation; either version 2 of the License, or
> >> + * (at your option) any later version.
> >> + *
> >> + * This program is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + * GNU General Public License for more details.
> >> + */
> >> +
>=20
> I'm guessing the following were copied from clk-sunxi.c.
>=20
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/clkdev.h>
> >
> > Is this used?
>=20
> clk_register_clkdev() is not used in this file, so not needed.
>=20
> >> +#include <linux/of.h>
> >> +#include <linux/of_address.h>
> >> +#include <linux/reset-controller.h>
> >
> > Is this used?
>=20
> A remnant of the USB clocks, which has been moved to clk-usb.c.
>=20
> Not needed here nor in clk-sunxi.c.
>=20
> >> +#include <linux/spinlock.h>
> >> +#include <linux/log2.h>
> >
> > Is this used?
>=20
> This is only used for clock factor calculation. Not applicable in
> clk-simple-gates.c, so no.

You're right, we don't need any of these...

> >> +static DEFINE_SPINLOCK(gates_lock);
> >> +
> > [...]
> >> +
> >> +static const int sun4i_a10_ahb_critical_clocks[] __initdata =3D {
> >
> > Shouldn't it be __initconst ?
>=20
> Not sure why our critical clocks lists are __initdata...

Why shouldn't it be?

CLK_OF_DECLARE callbacks only run at of_clk_init time, which is way
before the init memory is discarded.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--U2AV99o4bq1UPJQr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVufmzAAoJEBx+YmzsjxAgIGMQAJi3Il801R+XKMczFNKx9a+4
dWBg/2zGJq8lF6aAhHFD6zS5yza1cAaulpJSSlb+rt7QjRMnmlvZCx4ch53c+tyA
U4L6X4UijJYmUK+i9cjuQVo34uxXV3H0ZHBW+2esd7LtnZgfbicLiLOLBkZ2c3oY
cEOytZ98eEgD9JTS0+eXjvl3zpM/X0tus8PXCXqXndJJNRBFAk8w6htfRHRAo76Z
t7/BXSqATaN4zd71pst2XxluvbSSyeCXZOyA3DewI2Q3DB70NGKO0HeLPc2PKew+
Q6WHjukirONwNR14oEFzolTRyC4xs5/suMlGEjlxhtyFxT5ldSJuAvlTnARC2O5I
5ozu9CmgAaCb4ORKwT/2y63+vbaXYFnhzJ7047NVDF36qFSvSF1yAPGxho1n4KGc
9EDEdcBP5DweYjwOmYGCwt5hcCp74aGr5/hvMoo3xyBwswcwx1Glk36+wgSzzVJA
VSsq13D7+XbBUK3jIzum05qblQ2QTBWCsfpFXxtgcdwEse3CGEynPSb6PAaSt5l0
LiSfg1v9AoPbvw9DIPpHzeX3LE8YXazQ0rJ71asefxGd1ePdhV8YJL6cP+kF8bW3
GFi3OWkAP/e054YPZGGdWTTk8ojHU9wuksng6UT7vFVeAZoDQbC6kPDfgwXQgs1F
wzqiVcKRSOYTQlv4q9jC
=LjxL
-----END PGP SIGNATURE-----

--U2AV99o4bq1UPJQr--
