Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 16 Jun 2016 09:18:48 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: remove unused variable
Message-ID: <20160616071848.GD5144@lukather>
References: <20160615155537.3342366-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u65IjBhB3TIa72Vp"
In-Reply-To: <20160615155537.3342366-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>


--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 05:55:23PM +0200, Arnd Bergmann wrote:
> The only use of the local num_parents variable was remove,
> so we now get a warning:
>=20
> drivers/clk/sunxi/clk-sun4i-tcon-ch1.c: In function 'tcon_ch1_get_parent':
> drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:82:6: error: unused variable 'num_=
parents' [-Werror=3Dunused-variable]
>=20
> This removes the variable.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 4de2d58bc973 ("clk: sunxi: tcon-ch1: Do not return a negative erro=
r in get_parent")

Applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--u65IjBhB3TIa72Vp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYlLYAAoJEBx+YmzsjxAgTE0QAKVQXgQhw3JczEGzuWVKnIM4
J4rVmK11XbamLU4SiTB5H2PTntxPcRlHW4rQIgk2cpEw9zP25ZPn5UAkx9p67Xtg
wAHH5zVxl36KBxNU8StVL3PNnxsyVsau64KuuGrf2S1YKcNCtwEI5H0nEHIjOBLQ
qqvezwaRDlzsZmt9wd2PbtCmZ2oLDrVnQ7n0E72G6+rUPX3I3SlW1KStaqo1B4t/
UW3VTxL+cQo9Iz0ufKX1iNpVsEyeFnBX3F2asMnhdnZCFViWjfAKGSykp9EV8pug
2Op4kYB+yiOj6CHAUFQSPWRO1ievw6kcRDBHt4e3g8yE221/xVh0jxTbXlUup/xw
U6AfqrrEMgtyyi5zmnDF+qr++9MpjGodc2bF7ozflYieDBV53vmAQK8zXtiumNOW
xe/4SIEjm776i5/t0tXrO9XnMIRO31G5QV7C9iA7PZAdyUQHlESfI2Ud/TQLTiDk
gl6VTSJiR9BKSakuYSXeJd5rutAERGOBaTpVTHPeP52dGqUD/rtTtUtJnLu2Qhgx
W60fpCW//iKN/baJJREt9k+6F8rhorCOBaZogBueIwjJlAJovHWf8nxo14xC1WWT
egvBoZZYF4lZppQV+K2jNzfPT/17s7SrAP7Qt3rglFhEDZlVvCbv3+UxNBYAkOMV
BMPIQ43lYv6AzS0hPneX
=hx7M
-----END PGP SIGNATURE-----

--u65IjBhB3TIa72Vp--
