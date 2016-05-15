Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 15 May 2016 21:08:18 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 13/16] clk: sunxi-ng: Add N-K-M Factor clock
Message-ID: <20160515190818.GD27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-14-git-send-email-maxime.ripard@free-electrons.com>
 <20160511104556.037a2c17e3a6a0503a26fbf0@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mJm6k4Vb/yFcL9ZU"
In-Reply-To: <20160511104556.037a2c17e3a6a0503a26fbf0@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--mJm6k4Vb/yFcL9ZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2016 at 10:45:56AM +0200, Jean-Francois Moine wrote:
> On Sun,  8 May 2016 22:01:48 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > Introduce support for clocks that multiply and divide using two linear
> > multipliers and one linear divider.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/Makefile  |   1 +
> >  drivers/clk/sunxi-ng/ccu_nkm.c | 144 +++++++++++++++++++++++++++++++++=
++++++++
> >  drivers/clk/sunxi-ng/ccu_nkm.h |  42 ++++++++++++
> >  3 files changed, 187 insertions(+)
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_nkm.c
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_nkm.h
> >=20
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > index fba64c7f4fcd..2bb8bc22e907 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -8,6 +8,7 @@ obj-y +=3D ccu_m.o
> >  obj-y +=3D ccu_mp.o
> >  obj-y +=3D ccu_mux.o
> >  obj-y +=3D ccu_nk.o
> > +obj-y +=3D ccu_nkm.o
> >  obj-y +=3D ccu_nm.o
> >  obj-y +=3D ccu_p.o
> >  obj-y +=3D ccu_phase.o
> > diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_=
nkm.c
> > new file mode 100644
> > index 000000000000..9019c7f6988c
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> 	[snip]
> > @@ -0,0 +1,144 @@
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
> > +#include "ccu_nkm.h"
> > +
> > +void ccu_nkm_find_best(unsigned long parent, unsigned long rate,
> > +		       unsigned long max_n, unsigned long max_k, unsigned long max_m,
> > +		       unsigned long *n, unsigned long *k, unsigned long *m)
>=20
> Should be static
>=20
> 	[snip]
>=20
> > +static int ccu_nkm_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			   unsigned long parent_rate)
> > +{
> > +	struct ccu_nkm *nkm =3D hw_to_ccu_nkm(hw);
> > +	unsigned long n, k, m;
> > +	unsigned long flags;
> > +	u32 reg;
> > +
> > +	ccu_nkm_find_best(parent_rate, rate, 1 << nkm->n.width,
> > +			  1 << nkm->k.width, 1 << nkm->m.width,
> > +			  &n, &k, &m);
> > +
> > +	spin_lock_irqsave(nkm->common.lock, flags);
> > +
> > +	reg =3D readl(nkm->common.base + nkm->common.reg);
> > +	reg &=3D ~GENMASK(nkm->n.width + nkm->n.shift, nkm->n.shift);
> > +	reg &=3D ~GENMASK(nkm->k.width + nkm->k.shift, nkm->k.shift);
> > +	reg &=3D ~GENMASK(nkm->m.width + nkm->m.shift, nkm->m.shift);
> > +
> > +	reg |=3D (n - 1) << nkm->m.shift;
> > +	reg |=3D (k - 1) << nkm->m.shift;
> > +	reg |=3D (m - 1) << nkm->m.shift;
>=20
> 	reg |=3D (n - 1) << nkm->n.shift;
> 	reg |=3D (k - 1) << nkm->k.shift;

Good catches, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--mJm6k4Vb/yFcL9ZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXOMkiAAoJEBx+YmzsjxAgJAsP/jgfIHlf6U6V4HUPOoHw07NY
N8yVAx+Bho2utRNfytLjWzkC7HITq6KWmVMvbYmXbVwrDhV7WCYijFkCW+dvO5Xz
jEWNFx/xby5VrTevLoDV6L7qxEq4xzk1jWypv/duAg6x4j+KfY+5mo6e3xrf2RPN
w6DcaCu2OxZObzHQrsNc/futoDGubkgXhpiJl74ZZkW2AK28aXnLbZAD/P+Ld9x5
8HxiVnd6HYjyJq2bilCDy8P0RxtSLndUPMencnqNyMPf2uuKmwy2OH1/XLd6Hbmv
j7sBGu61ziW8cGb/gNmsoxHINgQjbYHJfmlDjNNYOEuWQmdQHR/FAStxYFMV8BxE
ZkugFUPogaG3EHIciQjzmHgF5DFeBB4u+Jzwt9YcHJImsovcs9aBCfmvErxbLpgm
fRiaFB/VyQFELlMKRg61tbJgMed8p86AiT8DSOq7N4hulrhweL+omYQPJuYRHe5t
fj+8T6Rftc2QYNZqPMLcWVmRZkoQTKXjMxpoYo57EG+lOZN9v47MWBKiok4Vv9tC
5PChUQJboBc3ffmYze1w2odib1HvAUpWrhfqk5vYi94enCSScj8D+yDJZ8iPUEA4
HYIbWsfdZIvOCw+cAPUrWPRDXkiByhFLzhC5EJ1NyN0UW3A0ApSflnaEe4vfRu51
TeqdSKXIOv2Lun33X52n
=K6Oi
-----END PGP SIGNATURE-----

--mJm6k4Vb/yFcL9ZU--
