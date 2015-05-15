Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 15 May 2015 09:46:06 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 4/8] clk: sunxi: codec clock support
Message-ID: <20150515074606.GS4004@lukather>
References: <1430565879-28113-1-git-send-email-maxime.ripard@free-electrons.com>
 <1430565879-28113-5-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v672-fdVi1iC=OTmYtY+rkzd95-KuVHZKAKA0peNvqBf2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="daC8KDjlMyCcZyAo"
In-Reply-To: <CAGb2v672-fdVi1iC=OTmYtY+rkzd95-KuVHZKAKA0peNvqBf2Q@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--daC8KDjlMyCcZyAo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2015 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
> On Sat, May 2, 2015 at 7:24 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > From: Emilio L=F3pez <emilio@elopez.com.ar>
> >
> > The codec clock on sun4i, sun5i and sun7i is a simple gate with PLL2 as
> > parent. Add a driver for such a clock.
> >
> > Signed-off-by: Emilio L=F3pez <emilio@elopez.com.ar>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi/Makefile        |  1 +
> >  drivers/clk/sunxi/clk-a10-codec.c | 45 +++++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 46 insertions(+)
> >  create mode 100644 drivers/clk/sunxi/clk-a10-codec.c
> >
> > diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> > index eb36c38d4120..6fa845e13067 100644
> > --- a/drivers/clk/sunxi/Makefile
> > +++ b/drivers/clk/sunxi/Makefile
> > @@ -3,6 +3,7 @@
> >  #
> >
> >  obj-y +=3D clk-sunxi.o clk-factors.o
> > +obj-y +=3D clk-a10-codec.o
> >  obj-y +=3D clk-a10-hosc.o
> >  obj-y +=3D clk-a10-pll2.o
> >  obj-y +=3D clk-a20-gmac.o
> > diff --git a/drivers/clk/sunxi/clk-a10-codec.c b/drivers/clk/sunxi/clk-=
a10-codec.c
> > new file mode 100644
> > index 000000000000..aaeccf8cde39
> > --- /dev/null
> > +++ b/drivers/clk/sunxi/clk-a10-codec.c
> > @@ -0,0 +1,45 @@
> > +/*
> > + * Copyright 2013 Emilio L=F3pez
> > + *
> > + * Emilio L=F3pez <emilio@elopez.com.ar>
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
> > +#include <linux/clkdev.h>
>=20
> This one is not needed.

Right, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--daC8KDjlMyCcZyAo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVVaQ+AAoJEBx+YmzsjxAgi8EP/jr+sOd/geDaPDIegUl+qwEI
CQmBH36JYrPBy0jLRHf9lKVlleVuyLUAWWcfIYQ2VuZ+eAPkGchsc/P6QVwSpyb5
mgka3jz1mb90w/FeHzlwZigFEWPcjhtc/A7LXtpS+c/VjsBevVHwT4hiHLPltQo8
zIK8kEuMJ7I8uOpVOyD88T12jIei3VnE3QvaV0g9nqn9mYfftOxnJqfXJkiULW3q
wDmcmjvaLHPC2sxwp/RXNEEkCd1Zldu2tWPA2BeNdYy5SLFds4OEqvFrMl3+WQYZ
e4BSpekoZgxw7S6TfgRZ9gMsJNl5vlAW/Ou5qBfMLIxY4DIqebqUKAaBzvsONND+
wYTtsHQUD+UFwLEamx7P16OVkmvzgGiBLoHBIIPWEEqOFIIjBx12QhjGyOZ7I46e
OnQ0AaRvQGjomww2DI7Vip2M+z8oNrp6+Yg2N1zAjeVlLoItMgkgCBKABEcC7PPx
x2C3zEvbpRvYcPcR7ZgUjSaw+8dbgqzbqyDE85VkrKpFP02U5vsxUHWf8uI10DG3
0csGOoAsgUW6IRwV+Sz3KoLQPimrHln9Aa9mrdwqRFUTbPprmbAV54Op2g0438Jt
DAkmNvO23rH72oG87Ct1sd4TXWPy23GWsj8bKvyEWlMjyiuFr/qUlZRqQhLemauB
9/v7u28YDpH9w/ImA5Mu
=S9O+
-----END PGP SIGNATURE-----

--daC8KDjlMyCcZyAo--
