Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 15 May 2016 20:51:12 +0200
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
Subject: Re: [PATCH 08/16] clk: sunxi-ng: Add M-factor clock support
Message-ID: <20160515185112.GB27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-9-git-send-email-maxime.ripard@free-electrons.com>
 <20160511084633.29b56effa514996ffafd56ef@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
In-Reply-To: <20160511084633.29b56effa514996ffafd56ef@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2016 at 08:46:33AM +0200, Jean-Francois Moine wrote:
> On Sun,  8 May 2016 22:01:43 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > Introduce support for clocks that divide by a linear factor.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/Makefile |   1 +
> >  drivers/clk/sunxi-ng/ccu_m.c  | 135 ++++++++++++++++++++++++++++++++++=
++++++++
> >  drivers/clk/sunxi-ng/ccu_m.h  | 101 +++++++++++++++++++++++++++++++
> >  3 files changed, 237 insertions(+)
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_m.c
> >  create mode 100644 drivers/clk/sunxi-ng/ccu_m.h
> >=20
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > index a47a3bbdf285..f41de901c607 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -4,5 +4,6 @@ obj-y +=3D ccu_reset.o
> >  obj-y +=3D ccu_div_table.o
> >  obj-y +=3D ccu_fixed_factor.o
> >  obj-y +=3D ccu_gate.o
> > +obj-y +=3D ccu_m.o
> >  obj-y +=3D ccu_mux.o
> >  obj-y +=3D ccu_phase.o
> > diff --git a/drivers/clk/sunxi-ng/ccu_m.c b/drivers/clk/sunxi-ng/ccu_m.c
> > new file mode 100644
> > index 000000000000..424eb6da0d5b
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu_m.c
> > @@ -0,0 +1,135 @@
> > +/*
> > + * Copyright (C) 2016 Maxime Ripard
> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of
> > + * the License, or (at your option) any later version.
> > + */
> 	[snip]
> > +static int ccu_m_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			  unsigned long parent_rate)
> > +{
> > +	struct ccu_m *cm =3D hw_to_ccu_m(hw);
> > +	unsigned long flags;
> > +	unsigned int m;
> > +	u32 reg;
> > +
> > +	ccu_m_find_best(parent_rate, rate, 1 << cm->m.width, &m);
> > +
> > +	spin_lock_irqsave(cm->common.lock, flags);
> > +
> > +	reg =3D readl(cm->common.base + cm->common.reg);
> > +	reg &=3D ((1 << cm->m.width) - 1) << cm->m.shift;
>=20
> Bug:
> 	reg &=3D ~GENMASK(cm->m.width + cm->m.shift, cm->m.shift);

Indeed, this one slipped in, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXOMUgAAoJEBx+YmzsjxAgL8sP/2ZsdWSfipKyMn9NA4mldSqf
eUeUy9Vz8cPvY5POVfeHH9XGyGl7XIVRDzlsYBJbk1U7C01zKaGwM/aIoOrmKjWz
Zuv9aHVpu8D8+BlAbWwKcr4TPzqj75kkdX1ZzUqPiU7Mq+ipJSpk9lLrGqWF7983
sz0z3UbHQVM7JUujBHiB7E+0bbiF7xc/fzUnq74CCqpt3eiTjy99gdfA6gmChBgf
N9kK+piBdBHjZQHkkSz1ocAn3MxSTXA2D/jttUL6yT+DvqUdgxLanduGouTy81Uy
jWgI3cjiUAYdUN7VZOCQn6ZcM89R2a8GfwJjyM2USNALhIBAeFgXlSCQtq9Z4tdn
zDkzPu8hxEB1DtjM9++GFzGS6py7U4V3DgeIXDSiR+/BYJxsZXIG3IvFisJnoFHm
mQZqYeQjPW7+P58ox0l2i0S2D2B0s/GCwA8FfG4y2nlL7nrZ8U3uUj2TAblSq6hC
gF12R460TfozKMTe75+jSbUJX755mTwn4oqOwquO1ivBaQP4tq2rEs12YVowI1IU
hF535M7alK/DprgwMHRFSrPlyL8xrsSp6QuAvONN2G1E3FY+jxO+qxHJn1znpnlU
xeqVmHZc19S6r2IkROJIm3IZKPxdWNAwwn9m9w4or5IencSDDk1H3/bHqpgH0PXO
2C+PMoPBfvF9gnjMgeZg
=tY2C
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
