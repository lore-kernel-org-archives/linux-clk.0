Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:41950 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752345AbdEDOmE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2017 10:42:04 -0400
Date: Thu, 4 May 2017 16:41:52 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 03/10] pinctrl: sunxi: add A20 support to A10 driver
Message-ID: <20170504144152.34yzk424aqrizmbu@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-4-icenowy@aosc.io>
 <20170504140220.26kguf3trz7ocylv@lukather>
 <83062089-19CD-4805-A6DC-2C25D75621FF@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dlvuxrph54un2kyy"
In-Reply-To: <83062089-19CD-4805-A6DC-2C25D75621FF@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--dlvuxrph54un2kyy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2017 at 10:03:26PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=884=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:02:20, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >On Thu, May 04, 2017 at 09:49:59PM +0800, Icenowy Zheng wrote:
> >>  static const struct of_device_id sun4i_a10_pinctrl_match[] =3D {
> >> -	{ .compatible =3D "allwinner,sun4i-a10-pinctrl", },
> >> +	{
> >> +		.compatible =3D "allwinner,sun4i-a10-pinctrl",
> >> +		.data =3D (void *)PINCTRL_SUN4I_A10
> >> +	},
> >> +	{
> >> +		.compatible =3D "allwinner,sun7i-a20-pinctrl",
> >> +		.data =3D (void *)PINCTRL_SUN7I_A20
> >> +	},
> >>  	{}
> >>  };
> >
> >This means you're going to have two drivers probing for the same
> >device: this driver, and the old one. This is not ok, and probably
> >introduces some corner cases.
>=20
> The A20 driver is dropped in the next commit.

Yes, and that is an issue for bisectability. Anyone that will checkout
between those two commits will have a broken kernel, and that is not
ok. Any commit should be in a working state.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--dlvuxrph54un2kyy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZCz2wAAoJEBx+YmzsjxAgpoMQAKOM+EcFZ3GEHJz9V3sVI0Ma
h+vSiJOY1KvyeaMzAZbvHeoXvgFS7UDMXJivNoJwTamKXOY3NgXoAyodFt/9HSoM
gk4XLdoYe4LuGOlHg+KQQ1sEqYYCYPXMiTbexAobS40pa/WK+rQaDnMeiE9uaB5o
xygkA4UeBKiOais+MFJTfQt+p5iKTzlYqKAaRK0q/OWkJaii/RQ1666SAdguyyDn
5IVpfPihlYQFIHBu4k7IbrpyOe89TrBEiuFUkvUPTLx7PDm2wUTEdlmokTAQ2Tva
smWn9/hs6/DD5y9b7gDQ/lEQXNxf/njxctSUN7VVHq/H7kpzm/pdSSS/Pkxcdm+G
6K6YiXPGUUFRwajVGvNtw+eJ2iS0y0br5opOapMxA9QYJnagfOcwlrAvfQAgApTq
vqqNMSMg17SukQpvaJ8hhaXGuuznA+i7Oz3wlp/8oexcJv6QiAvD6Q9RXKaF6q+p
djab2Md25qEWgNhc+EW7zDycjsTDJoq8HO7vbm4BtacQ2lscrdDxiF2ENqCxSM6r
xfoSjl1pKY9APF+kKglUITSaqNZ+5B8ibcRPLWta+/gaMCuMlcIygYKZU2HCc+Mt
7CSqKmYM416qLZJ496SDP4XcoDiDZQG1g4FFJLEpK1V8uGshH0N5LEwCJETwqB2W
wli4/dc82++ijoRsO7wP
=WhVS
-----END PGP SIGNATURE-----

--dlvuxrph54un2kyy--
