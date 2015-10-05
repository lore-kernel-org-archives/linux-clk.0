Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 5 Oct 2015 11:05:19 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Emilio Lopez <emilio@elopez.com.ar>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 4/5] clk: sunxi: codec clock support
Message-ID: <20151005090519.GF2696@lukather>
References: <1443512353-28073-1-git-send-email-maxime.ripard@free-electrons.com>
 <1443512353-28073-5-git-send-email-maxime.ripard@free-electrons.com>
 <20151002204427.GZ12338@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
In-Reply-To: <20151002204427.GZ12338@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2015 at 01:44:27PM -0700, Stephen Boyd wrote:
> On 09/29, Maxime Ripard wrote:
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
> Is this include used?

It isn't, I've removed it.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWEj1PAAoJEBx+YmzsjxAgn1wP/2x/VpEMypAVyEe+RtwLnu1J
SZRa9gw9/OTXRLTyqmlOIpaYGGSy6Fw25VAHq74GBMDNF48hA5uA4Ub/aX33yCNY
n5o39K+OuLMu9Hws7k6TL1WzsXk5GoxQH+tVMXkg/3ylJmjgzhsyJtmgOT7/xBp5
hCIqf3/K89bq72Jkouy3nxQJKC2cehTQ+Ma5IL9lmqodyKyS0vciMeS8v5MTV+po
x+hW5pc2f3Y48sDZDgrbh5KvRaO514hgJJuTXZf3S8sR22QSIZ9Gl0EUYIHyuE/8
JaKUDv2SkXQILU2DiIYbEm9+37fQxmfLXy7iDqQSZvfBqZVh5G/CBOTo1XverNfj
KOYZ5BT+HM0nFxL6FAqFV80ZxH+Vx56K9b2r5Qzw+t63wfO1J2RJZbx6KsOUNTn4
pte/2C6wqQ+O02KntnTzu52hJhWGaXLJpMwFet+QSv6BUv1rvSsGEjNB8H+I/GTK
UP8GlRc/Ceau6nSlbVp5gRFpPgXCDBigjU8vw4nuvJqNNFNxyd3nMOeRkLz02icC
+FtjypJzWqckwmfzVsAw57uGIU5aFaSg0Asq/4VoJfRb8kncfBxjhKzGlWVIuseI
dNgnQ8TG6QO1z0PjnYwdtKXEaRH70ZDH92DbGhaO26FMRvuk33L1bbs8XtDSGZsd
GS2o1H+vqS08JTna5oDX
=BfOz
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
