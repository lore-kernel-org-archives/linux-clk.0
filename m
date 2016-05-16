Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 16 May 2016 23:08:03 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 03/16] clk: sunxi-ng: Add fixed factor clock support
Message-ID: <20160516210803.GM27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-4-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v65LcXnMj7B-0q2MYESM9vGd9k-yChjvFdX--EivSYdVJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rZHzn+A9B7nBTGyj"
In-Reply-To: <CAGb2v65LcXnMj7B-0q2MYESM9vGd9k-yChjvFdX--EivSYdVJg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--rZHzn+A9B7nBTGyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2016 at 06:05:20PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Mon, May 9, 2016 at 4:01 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Some clocks in the Allwinner SoCs clock units are direct, fixed,
> > multipliers or dividers from their parent.
> >
> > Add support for such clocks.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/Makefile           |  2 ++
> >  drivers/clk/sunxi-ng/ccu_fixed_factor.c | 42 +++++++++++++++++++++++++=
++
> >  drivers/clk/sunxi-ng/ccu_fixed_factor.h | 50 +++++++++++++++++++++++++=
++++++++
> >  3 files changed, 94 insertions(+)
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_fixed_factor.c
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_fixed_factor.h
> >
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > index bd3461b0f38c..d76276736765 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -1,2 +1,4 @@
> >  obj-y +=3D ccu_common.o
> >  obj-y +=3D ccu_reset.o
> > +
> > +obj-y +=3D ccu_fixed_factor.o
> > diff --git a/drivers/clk/sunxi-ng/ccu_fixed_factor.c b/drivers/clk/sunx=
i-ng/ccu_fixed_factor.c
> > new file mode 100644
> > index 000000000000..75df8a854db5
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_fixed_factor.c
> > @@ -0,0 +1,42 @@
> > +/*
> > + * Copyright (C) 2016 Maxime Ripard
> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of
> > + * the License, or (at your option) any later version.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +
> > +#include "ccu_fixed_factor.h"
> > +
> > +static unsigned long ccu_fixed_factor_recalc_rate(struct clk_hw *hw,
> > +                                                 unsigned long parent_=
rate)
> > +{
> > +       struct ccu_fixed_factor *fix =3D hw_to_ccu_fixed_factor(hw);
> > +
> > +       return parent_rate * fix->mult / fix->div;
>=20
> do_div (from include/asm-generic/div64.h) is better, since this is an
> 64 bit value.

unsigned long is 32 bits, but that's true.

>=20
> > +}
> > +
> > +static long ccu_fixed_factor_round_rate(struct clk_hw *hw,
> > +                                       unsigned long rate,
> > +                                       unsigned long *parent_rate)
> > +{
> > +       struct ccu_fixed_factor *fix =3D hw_to_ccu_fixed_factor(hw);
> > +
> > +       return *parent_rate / fix->div * fix->mult;
>=20
> Why is this the other way around? With integer math it shouldn't be
> interchangeable. (Though it seems clk_fixed_factor does the same...)

I'm guessing this is so that it doesn't trip over UINT_MAX, but it
doesn't really apply in our case. I'll make it consistant.

>=20
> Also, clk_fixed_factor handles CLK_SET_RATE_PARENT. Do we need to do the
> same here?

Indeed, I'll add it.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--rZHzn+A9B7nBTGyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXOjazAAoJEBx+YmzsjxAgCi4QAKsQb04mPOUXZpqhhl7DMPQj
JE7Fp3R25muFUDVZi+f+D2Q8SH6hEJEITee3cKXF+eHWD8kZNmmWIq7HUPeZ7jhU
l1hyQOM9jPrX3VxoaPObczbDL6eFDostO+PSDg+b/HLP4CAJgGkxCOxNPTFbVv3I
+6Q2J7xva1e4kCu8tY8eUmakIbfuBKsLKKJDAXqIjwOo//OcWceXQPxnc6jXLFAc
jYTCTk18z4GpTS4fXpFPEzhSJeEQDSUxqGB6NjFeZNt8rjQ1wLyfFxm0izH/aALl
pclC5G5rvFprEqe3j5bQJV4jwMVDpF4D9HIHI9H6LbWYNTMlScCTJ5pgYaQMA8hv
vIjwZkUQTstHi8zkotjEa8yGuD2W1koRxGMbO/jil5XbZ8MxvCK0cr1uW+v1OK8l
qGPqOEgYO2W8DmZfVtOd94TNScqI/64sacCB7jQtvNGf5iHmscr4pY9RF9t6NY/+
12z3UPEPWrpaweEE4BNaWdJU8To4aDZ5O8hT2Riy5FETXzGTxU46TNSbIGy6CfIN
lfZRWixb2/jCrg7SD6HLKSRAXylBztRiKtyUaOBOMyl0THbtWKn9+drBxIP5JRKs
K/bNldU37bfT6ALgf+w1fRErIoElFCQtKQTw+2yo5+llN3ZPt3RQbmWoRNh0xiol
U6ZFzfbS2vSMx2wTgmtd
=l2Cm
-----END PGP SIGNATURE-----

--rZHzn+A9B7nBTGyj--
