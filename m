Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 18 Dec 2017 12:59:52 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: sun9i-mmc: Implement reset callback for
 reset controls
Message-ID: <20171218115951.ima5hahh4i3j5gxl@flea.lan>
References: <20171218035751.20661-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r4k3aad6b7gmytns"
In-Reply-To: <20171218035751.20661-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--r4k3aad6b7gmytns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2017 at 11:57:51AM +0800, Chen-Yu Tsai wrote:
> Our MMC host driver now issues a reset, instead of just deasserting
> the reset control, since commit c34eda69ad4c ("mmc: sunxi: Reset the
> device at probe time"). The sun9i-mmc clock driver does not support
> this, and will fail, which results in MMC not probing.
>=20
> This patch implements the reset callback by asserting the reset control,
> then deasserting it after a small delay.
>=20
> Fixes: 7a6fca879f59 ("clk: sunxi: Add driver for A80 MMC config clocks/re=
sets")
> Cc: <stable@vger.kernel.org> # 4.14.x
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--r4k3aad6b7gmytns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlo3rbQACgkQ0rTAlCFN
r3TpCw//ZnCKqhSIxg56gXW/6ZLwbd5uBWlsXfpXBraUtxjt3U4ewClo7sYOvZvF
GYs8lJO6LX81nAqxII4jwXLQkgopQo9HJYrZANjvyZmVpZnGQFOPQflci+rFEWpL
BzQCudkUdnZM9OHnA4kSOJ4/DIuaXMDQMyeGbgHMfnJ6vn73F+t+kzRdjMuCQ5+l
KtxDT87E7Tp3II9b4W4rzeeEXN8fVgpLA75p2ItxmZB6mw0Ac+DkkiW5hBtGY/Xv
dd2aPiL3j/zK9tsNvn80JAIcd21+AozoO6ITmDy+E9nUm//EqiI/x0vNCwE7nRyx
ZEw23j+oahKPL0ou3EzUIA6F5bVPoUcjrxje5xgwRrNp1CyMq3Xzdr9EAbUnVNfD
Orblr6/9qKJM/D3F7vwpM0BoaTpfKxz3jVfegspgmfldTz0vnOtTuYk7x4mRf8rC
8nUFAaWK2Dsuts9Zm1rpkc0+TSq6ynjY5DwhguxBNMfO6ZTJw86ElZcJ5OPbeApP
Mw3P0z5Dj7W0yYazzCfQfQCccQ1OKjeDtJ2kjl9vbn7ZFnMmdQUIASj0Hlmuhm5T
1FNjB/6nLgNsVsh8KdxgRbwekumEefdus6j2jwplgX8/ELEKsQXucDdXYoxTjs1C
6Zb42BD+l4v976P2BSAwugKq+AtuU5NFKrW9Og/QHp0bqVVUftg=
=ZqRl
-----END PGP SIGNATURE-----

--r4k3aad6b7gmytns--
