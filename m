Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 15 May 2016 21:18:32 +0200
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
Subject: Re: [PATCH 15/16] clk: sunxi-ng: Add H3 clocks
Message-ID: <20160515191832.GE27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-16-git-send-email-maxime.ripard@free-electrons.com>
 <20160509093958.26e9549f8ce78888c0e9586a@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="10jrOL3x2xqLmOsH"
In-Reply-To: <20160509093958.26e9549f8ce78888c0e9586a@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--10jrOL3x2xqLmOsH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2016 at 09:39:58AM +0200, Jean-Francois Moine wrote:
> On Sun,  8 May 2016 22:01:50 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > Add the list of clocks and resets found in the H3 CCU.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/Makefile        |   2 +
> >  drivers/clk/sunxi-ng/ccu-sun8i-h3.c  | 757 +++++++++++++++++++++++++++=
++++++++
> >  include/dt-bindings/clock/sun8i-h3.h | 162 ++++++++
> >  include/dt-bindings/reset/sun8i-h3.h | 103 +++++
> >  4 files changed, 1024 insertions(+)
> >  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> >  create mode 100644 include/dt-bindings/clock/sun8i-h3.h
> >  create mode 100644 include/dt-bindings/reset/sun8i-h3.h
> >=20
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > index c794f57b6fb1..67ff6a92f124 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -13,3 +13,5 @@ obj-y +=3D ccu_nkmp.o
> >  obj-y +=3D ccu_nm.o
> >  obj-y +=3D ccu_p.o
> >  obj-y +=3D ccu_phase.o
> > +
> > +obj-y +=3D ccu-sun8i-h3.o
>=20
> +obj-$(CONFIG_MACH_SUN8I) +=3D ccu-sun8i-h3.o
>=20
> should be better.

Indeed, changed.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--10jrOL3x2xqLmOsH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXOMuIAAoJEBx+YmzsjxAg2agP/1XJ/iNgYatRMPt6UiJmDwAK
U8gIymEWDmm8uWZG/y6BpHdlt8iLCniKeOD0zxXxQIAufOFoEcJjGM98JGj91MQO
5I+PwIAX0dV7nmcOLsJbTU3kLjWVVZm8SptG+D9Rgmr2owq2CWMbrYTIbdNd4sdY
XODjPMZAynSXG8Owm/kV0W6SOs6L+fq/KNcrtA36gIN6iLCHrIwchouVfhClP6pK
RHazRNQW8IVPBiFT/XLypt8RKNkgMBmwCeBEouj87z16XBYfNtYVXhwzRjLeMW7M
Ri0IXaNpwbD0GhVnjflOgXjEcIVqG2npRm9pfSY+kST6Bbx3LBvq6K4MNKoMz26P
Ib6GJ3bU917GLXoG0b0S/LpWSG7cnKyNk+nIdrT0TCzXp8gzF1JSMxCMKefcXQhc
/sYdO39PDTBB1Hc94hHOS94NOKxwF22fhj0pp4IV0wdBwQ3RQR9lChTqvK/frVz1
VlFsiuCxYCIE4Bee749fzPlI3xTCO39HN0Xb9ZJ5Pz9iEXeMhyzE1sqcQ0yoMSUa
Fu6/uPOO+Mylsod4nzBb2FD286PNilE61mf23YPIfQKKYyFqz65CMNfBaludMePn
n7a2fAVKm8fIYAy1gChDljv/BjLNfXIbCnLzfN1fiCn/ISwsf25DaMBo7uMfkxkd
Gv4AZk4UrDyQHs8AN7UA
=PTzT
-----END PGP SIGNATURE-----

--10jrOL3x2xqLmOsH--
