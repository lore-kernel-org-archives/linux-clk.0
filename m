Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 29 Aug 2016 08:39:16 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: jorik@kippendief.biz
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, wens@csie.org,
	megous@megous.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: Fix wrong reset register offsets
Message-ID: <20160829063916.GA7612@lukather>
References: <20160827121545.GT3165@lukather>
 <1472324673-11233-1-git-send-email-jorik@kippendief.biz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
In-Reply-To: <1472324673-11233-1-git-send-email-jorik@kippendief.biz>
List-ID: <linux-clk.vger.kernel.org>


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 27, 2016 at 09:04:33PM +0200, jorik@kippendief.biz wrote:
> From: Jorik Jonker <jorik@kippendief.biz>
>=20
> The reset register offsets for UART*, I2C* and SCR were off by a few byte=
s.
>=20
> Signed-off-by: Jorik Jonker <jorik@kippendief.biz>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXw9iUAAoJEBx+YmzsjxAgxrwP/ivGp7yXb9Yuz3mJYhJMmmSY
rfUAHOOpJ9OvC5Izf4yzlosuIQz3KaVP7v7AeY/c634TcBzo7HQURt0r6z/DzgCt
qikthFzXlcEc6DMs96vEMvqzmMRwoGDVRHmtHIudzxxGN7ogN2ut5UkkJ3ALgPmO
0/bKUZRuyMtFaNyy+RyeTzK3/oG+mE+nUBgaMQ6NpTqA9cFuncYl0WaZh5HRgGWN
OGtb440ajafxceUua8eK78iJieBtHMM62H1gF3mMBuesM5PNjo2sS24lL01UHbBD
BgGo2rR6wAhwSAzlQAqnTcvcBeXfSDtPHKeRtArTa75dHWHiodPEPW0y/Iptm16m
nLKinCShX0P8YvIZ6zJxSlIV2uRVZE5pJoQpdeKIRBqw+LU9QUSpCx/8AfMb/PjI
COhgOGQ2yJRixWXPwypGivkcIsdehE57XMfhdnBEgISxDKRLnL/EXzmkFf6usTQw
FHqur1d/J8D2uEqvujMmEEUw3E0kdy/uQfkGUzUQVszSVgLv8C5FN610J+FNRhk2
K2n7Svgfq8jCabVWDTcjZ9tDZOKWrH6A2Dmv3EjaQZDeT2nNBo3F9NNjiwrDcyKj
rs3Gcdmvylc5NNyQ/tqbsMNYUEKl7qNp9ScdR8caw7h1OkySp94xZp7W3t3/XQ/K
FrqhYslMxXfm57rAr0pm
=Bwcj
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
