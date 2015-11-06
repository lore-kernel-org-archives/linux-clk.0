Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 6 Nov 2015 11:42:20 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Wynter Woods <wynter@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/19] clk: sunxi: Add display clock
Message-ID: <20151106194220.GK6114@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v65uzLgKkxKh9RN58w1FZGRJKSbMFmdhZxnRzCdCArBuPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b/6gol1SqNxk8K3i"
In-Reply-To: <CAGb2v65uzLgKkxKh9RN58w1FZGRJKSbMFmdhZxnRzCdCArBuPw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--b/6gol1SqNxk8K3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 31, 2015 at 06:28:16PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Fri, Oct 30, 2015 at 10:20 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The A10 SoCs and its relatives has a special clock controller to drive =
the
> > display engines (both frontend and backend).
> >
> > Add a driver for it.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi/Makefile            |   1 +
> >  drivers/clk/sunxi/clk-sun4i-display.c | 199 ++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 200 insertions(+)
> >  create mode 100644 drivers/clk/sunxi/clk-sun4i-display.c
> >
> > diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> > index cb4c299214ce..a9e1a5885846 100644
> > --- a/drivers/clk/sunxi/Makefile
> > +++ b/drivers/clk/sunxi/Makefile
> > @@ -9,6 +9,7 @@ obj-y +=3D clk-a10-mod1.o
> >  obj-y +=3D clk-a10-pll2.o
> >  obj-y +=3D clk-a20-gmac.o
> >  obj-y +=3D clk-mod0.o
> > +obj-y +=3D clk-sun4i-display.o
> >  obj-y +=3D clk-simple-gates.o
> >  obj-y +=3D clk-sun8i-mbus.o
> >  obj-y +=3D clk-sun9i-core.o
> > diff --git a/drivers/clk/sunxi/clk-sun4i-display.c b/drivers/clk/sunxi/=
clk-sun4i-display.c
> > new file mode 100644
> > index 000000000000..f13b095c6d7a
> > --- /dev/null
> > +++ b/drivers/clk/sunxi/clk-sun4i-display.c
> > @@ -0,0 +1,199 @@
> > +/*
> > + * Copyright 2015 Maxime Ripard
> > + *
> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/of_address.h>
> > +#include <linux/reset-controller.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +
> > +#define SUN4I_A10_DISPLAY_PARENTS      3
>=20
> Can we change this to 4, so we can reuse this for TCON clocks on
> sun4i/sun7i?

Good point, I'll change this.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--b/6gol1SqNxk8K3i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWPQKcAAoJEBx+YmzsjxAgotMQAImQAMzj4xBgrkO078gGHdH/
Iw4BR0QrYYu5Dp4Sp1Xxgib/i9S1mLjRer6Vr+R3YiFPTy7FPsogekR+xjF4lrQo
HcKPl1iXVenC1O9+R573UkDsEITgX9nHHo02iCKS+45QjaaXiZT/ny+aSqYbg4bn
4P835Hg0vhXKNtDEJY4RMKwkwt0NERwGCdHxXY2g1V7EK1AyIeaLa0UsXfyDmFEM
4AfV4GwBirxhV60hneb6RSTUREnq/MRMU1jYwHLg5rAvxp+CyVwEvxAhsOiIt596
6NQtsisZPHxcF6eXDp8mLmVBpSpdsSu39wkiCbbi1xBfYUhl6G+cnCPXAZ6o2XSX
maQDsFqeIp0gisN816pOuR+wSu9XYokzWMdbUyMj6Z/x/n1Qaypv2SyISnNxZh/n
v/LQWKO1SqKmdWVWMzXVI+XMCF7cXPld/eH+9ELNz47IrNyqlcRGJyjMTBA9cffY
mpWHEJGj0jlMG9mgqN/FYzGRmiCmwxZ60sPa/w+8u6Zc5g8V7shMxGbX345k9Owq
xaIYLqbgl7OOw/UJZuOYpw20mddwHRJ8d/5L4cKrAv/5fvNPZnYhBiSwrekaUAMs
QP9KzdrNM4po9jIdyE1FVnF778OWL1lefKNbBFu+o5We39bwzyL/Vs0DhSRBxRfT
e/rBd7dCSa4ryuFU1dmk
=vHmC
-----END PGP SIGNATURE-----

--b/6gol1SqNxk8K3i--
