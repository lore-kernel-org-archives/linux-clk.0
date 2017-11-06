Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 6 Nov 2017 09:02:44 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>
Cc: wens@csie.org, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] clk: sunxi-ng: a83t: Fix i2c buses bits
Message-ID: <20171106080244.jz55hkhjgkzutx7x@flea>
References: <20171105165134.5199-1-mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7fcihelalbzlko2e"
In-Reply-To: <20171105165134.5199-1-mylene.josserand@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--7fcihelalbzlko2e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 05, 2017 at 05:51:34PM +0100, Myl=E8ne Josserand wrote:
> i2c1 and i2c2 bits for CCU are not bit 0 but bit 1 and bit 2.
> Because of that, the i2c0 (bit 0) was not correctly configured.
> Fixed the correct bits for i2c1 and i2c2.
>=20
> Fixes: 05359be1176b ("clk: sunxi-ng: Add driver for A83T CCU")
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Stephen, can you merge it directly? It's not super urgent since we
don't have i2c enabled for that SoC yet, so it can definitely be in
4.15.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7fcihelalbzlko2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaABckAAoJEBx+YmzsjxAgjJkP/jeHp9MBDpg+c53OPfJlrNC3
5BijTRWtnb+7aH+oY/R1C6eooBC8ntSvigiurOcnZ15JmQLQfJ5puRPoitzNibuG
JutAejC/iDt/5H/mauSQMG8uHGF6Si2SdKm4WAp9kU05dVcI0T6yczb2EpU1tUp8
ze13vsrQy8Y/MVhjA7OtU2ixgsLnZr1nUf8JqZEBq7rPQhBBXMdoNwCl5PJjBEK2
XakkuBDmRCY0im8Yo5a5Pxiipe91kY8O5HQEEiMozdD26EL9xC9ohVNgEy11FyP0
okv0/LMz2GR0UkEJAvQ+nz6sm+YI8VC9lMUKAIiBXJJfzTCgN9Ou9IEvf2DSQn6X
wfLe4P8+RaCJ2ZjKMyim6JYh/W+ynS9kBkCzoulQqOD9bj9P0LctZrKcvnPP4O/G
ShDHYt5B+IkD36LZQt0ZUAT5er8bWRt/Q7HF+iSUZ/e146pmmgrpbwUQhwBcJ4VV
aGSgPh1AReolVslle4HQHyB5uwJyGWPZP4MtGRoJ8No/xo81gFcY1yHrrayva/0q
kuuXaFd2A+2reeb7xX5OnvXkTrMbkqLsU19o96z1IrLKRXRJiLK/iePSAk+IdsyU
i2n4S1fYFrIgi6JOjjQI+fZZB7ujvyOIoYx6Zp+t+75npZuSis+RA/W7Qt6Z7HBp
IN02Pd3EAQlv9cQZhmO3
=cdSd
-----END PGP SIGNATURE-----

--7fcihelalbzlko2e--
