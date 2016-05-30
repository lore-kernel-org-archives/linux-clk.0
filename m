Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 30 May 2016 09:57:30 +0200
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
Subject: Re: [PATCH 14/16] clk: sunxi-ng: Add N-K-M-P factor clock
Message-ID: <20160530075730.GB4247@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-15-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v66b7jXrAs0rBrcHWskQQPqrhRVzY6OmCSoGZg2tfDJrDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
In-Reply-To: <CAGb2v66b7jXrAs0rBrcHWskQQPqrhRVzY6OmCSoGZg2tfDJrDA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Mon, May 23, 2016 at 10:36:04PM +0800, Chen-Yu Tsai wrote:
> On Mon, May 9, 2016 at 4:01 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Introduce support for clocks that use a combination of two linear
> > multipliers (N and K factors), one linear divider (M) and one power of =
two
> > divider (P).
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/Makefile   |   1 +
> >  drivers/clk/sunxi-ng/ccu_nkmp.c | 157 ++++++++++++++++++++++++++++++++=
++++++++
> >  drivers/clk/sunxi-ng/ccu_nkmp.h |  43 +++++++++++
> >  3 files changed, 201 insertions(+)
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_nkmp.c
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_nkmp.h
> >
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > index 2bb8bc22e907..c794f57b6fb1 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -9,6 +9,7 @@ obj-y +=3D ccu_mp.o
> >  obj-y +=3D ccu_mux.o
> >  obj-y +=3D ccu_nk.o
> >  obj-y +=3D ccu_nkm.o
> > +obj-y +=3D ccu_nkmp.o
> >  obj-y +=3D ccu_nm.o
> >  obj-y +=3D ccu_p.o
> >  obj-y +=3D ccu_phase.o
> > diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu=
_nkmp.c
> > new file mode 100644
> > index 000000000000..b7da00773cd6
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
> > @@ -0,0 +1,157 @@
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
> > +#include <linux/rational.h>
> > +
> > +#include "ccu_gate.h"
> > +#include "ccu_nkmp.h"
> > +
> > +void ccu_nkmp_find_best(unsigned long parent, unsigned long rate,
> > +                       unsigned long max_n, unsigned long max_k,
> > +                       unsigned long max_m, unsigned long max_p,
> > +                       unsigned long *n, unsigned long *k,
> > +                       unsigned long *m, unsigned long *p)
>=20
> We definitely should just pass struct ccu_nkmp* here.

Ok

> > +{
> > +       unsigned long best_rate =3D 0;
> > +       unsigned long best_n =3D 0, best_k =3D 0, best_m =3D 0, best_p =
=3D 0;
> > +       unsigned long _n, _k, _m, _p;
> > +
> > +       for (_k =3D 1; _k <=3D max_k; _k++) {
> > +               for (_p =3D 0; _p <=3D max_p; _p++) {
> > +                       unsigned long tmp_rate;
> > +
> > +                       rational_best_approximation(rate / _k, parent <=
< _p,
>=20
> I think you mean "parent >> _p" ?

Indeed :/

> In general we might lose some precision if parent is too small or _p is
> too large. But the only place we see this type of clock is the CPU PLL,
> and parent (24 MHz) are divisible by all the possible values of P.
>=20
> This brings up another issue: P does not go all the way up to (1 << width=
 - 1).
> A register value of 3, or P =3D 8 is not valid, and it's not restricted in
> the driver. This is not true for all the SoCs though.
>=20
> The manual also says P should only be used when rate < 288 MHz. Moving
> P to the outer loop, and maybe adding a short circuit exit when the rate
> matches exactly would help.

This is already something that was already reported by
Jean-Francois. Apart from the P limitation this is the current logic
used in the clock driver. We should probably fix that, but without any
user (ie, cpufreq), it's just wild guesses in the middle of a massive
and very intrusive changes.

So I don't really want to actually try to figure that out for now (and
this is exactly why I don't want to convert the SoCs with a good
support for now, since we'll pretty much uncover a whole lot of bugs
that would turn into regressions).

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXS/JqAAoJEBx+YmzsjxAgKdUQAKZIRJItv2PDLx0bo6An291Q
Y03cbrHM6VrVlzKbmJdvGn33fb7hfdd1zuKnnlhudQUAX1ofxgCqjbquXhov5eLg
cCanHBE5ZEMd7y0azVGVIShlldzEI5tbVY/DwcX2wqGArtMeUN7QEvrLDkoSb+5w
Zb7/6S2hHOxTmHKeuOwu8OC88xB2NrEl+p5tTJWaiMJDvVK0uTmvynyv0XBVRfuO
3d8a51jKssJimKeVWVdSGFiYLuyjlmawJMpTyT/8tMdfAV6toaGPsP0es6xah005
V1n1cuZjjpZCYxHK1ite+vu8/+53W/wZz+cQbv7V+ciBkQQ8iPQi5lVpU9P4Gb8z
EJtS6PzYvg5zDzQWrfdYwRP23LQx+ZKhb/fl6tspcBbfT0l5WWGwAv+gHnb9UjOx
q6ng7fxtUNLwXOITy68rN8vShssVws5ugSEFc0dvT6o4JR0YmkjxicDlCkpw/cX5
GLGe5WJuckyGmn23iejE+ZgJkLSBCTCK/0Xg+ZsnxhjXNhJgEy8SbFH702gEVxc7
7Sx2h3c5j8le75Z5v4mU1Riz8ptiPC6H/fFo7SB53bnpWL0M1NQzu99eD4Fuch/Q
8h4sygVFA6EDvHHx5SML3EEH5/18qnU3CeYjWnnLfk9iC6u1hcjjMlL/a+lo78Qv
+leG63kB4CWGr92VV+Xt
=DXl2
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
