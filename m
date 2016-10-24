Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 24 Oct 2016 18:26:33 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v5 2/4] arm64: dts: add Allwinner A64 SoC .dtsi
Message-ID: <20161024162633.olqhftj5tdsp6qwb@lukather>
References: <cover.f18c0f482ef4459b5c8f6eb5828fcb6762440974.1476986335.git-series.maxime.ripard@free-electrons.com>
 <eb11a71c58cd85551d9d793437db1792abd5077c.1476986335.git-series.maxime.ripard@free-electrons.com>
 <a0b71433-8302-8ac2-a695-60ac813b380f@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pqfve2ma3dkzdvyt"
In-Reply-To: <a0b71433-8302-8ac2-a695-60ac813b380f@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--pqfve2ma3dkzdvyt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andr=E9,

On Mon, Oct 24, 2016 at 12:57:04AM +0100, Andr=E9 Przywara wrote:
> > +		pio: pinctrl@1c20800 {
> > +			compatible =3D "allwinner,sun50i-a64-pinctrl";
> > +			reg =3D <0x01c20800 0x400>;
> > +			interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&ccu CLK_BUS_PIO>;
> > +			gpio-controller;
> > +			#gpio-cells =3D <3>;
> > +			interrupt-controller;
> > +			#interrupt-cells =3D <3>;
> > +
> > +			i2c1_pins: i2c1_pins {
> > +				allwinner,pins =3D "PH2", "PH3";
> > +				allwinner,function =3D "i2c1";
>=20
> So as Icenowy pointed out, we are missing the drive and pull properties
> here, at least as long as we don't have your patch (series) in place to
> cope with that.

Yeah sorry, we noticed first with Chen-Yu that the binding should not
need it, and then we realised that the driver was making the
assumption that they were... Sorry :/

> But if we rely on this series (which seems OK to me), shouldn't we then
> use the generic properties for pins and function here as well?

Definitely. I'll update this.

Thanks!
Maxime=20

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pqfve2ma3dkzdvyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYDjY1AAoJEBx+YmzsjxAg6t0QAKoWqYIhEGy6xYn6jKq5H3pj
TTOLYwb9P9kAbaahVcYxBex5Bv//e3xDMlHpBMRrWDTYEExpGTzogZKg2LfqFC9Q
0mMQeSS+HVHaa53g2CQTuKH/St6kdJxFcC9wjdoWSdtA4SEDx5x+4O7sdV1iyzwK
iVodoPezV+wTFuH7HXIEJbPz8Gm2eO+NKYJx/geAjDmA05IFbTtOknV95Yr5jaWi
07uj3UQeZ9MHkOevZyrLfbtJU42geExlHfT4jtdA2mABZ8cRa4rHM7GFNw8d/UTq
9X1ZpuMsFpM9QkOlXXHKXhxr4ZLQOn2MBAdycSq14oJKb/wP2zJTUCBns/u5l9zL
PQYrOvIMoXzKF9u+BLkzDvvcrQr8+sCQDW+0Nm9FsVRiN3izrW6xtKd+1u+ttX4+
dy5LU3zQ1ZtLh/5X9p0IfM7+1Z/mtAD5+8lbcLtk4RGMCgbr+1WBDEdRBOEK/CD+
6QOuI5gHtFdsmyCqM7P57uUUkRYBGOhnptQfjBc303vOgYzUb8Gy6XFA33cdDwXU
NZjl/B2NJeJVf4S+OGWnc5gam5RDCuMkd36Qm+Fpn1DgM6ZqhHSkyZszUcrPZk9s
MimTp+u5++UWLG7UGTB5XslxaX338V+ae2OdwTCX1q4lgi0Tw8dDBHRu7EFep06W
w9j3ZwJdVyfjw1iNAXo6
=ZLuD
-----END PGP SIGNATURE-----

--pqfve2ma3dkzdvyt--
