Return-Path: <maxime.ripard@free-electrons.com>
Date: Sat, 9 Jul 2016 10:25:32 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: weiyj_lk@163.com
Cc: emilio@elopez.com.ar, mturquette@baylibre.com, sboyd@codeaurora.org,
	wens@csie.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] clk: sunxi: pll2: Fix return value check in
 sun4i_pll2_setup()
Message-ID: <20160709082532.GG4522@lukather>
References: <1467807514-31723-1-git-send-email-weiyj_lk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
In-Reply-To: <1467807514-31723-1-git-send-email-weiyj_lk@163.com>
List-ID: <linux-clk.vger.kernel.org>


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2016 at 12:18:34PM +0000, weiyj_lk@163.com wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> In case of error, the functions clk_register_composite() and
> clk_register_divider() returns ERR_PTR() and never returns NULL.
> The NULL test in the return value check should be replaced with
> IS_ERR().
>=20
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Applied, thanks
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXgLT8AAoJEBx+YmzsjxAgVl4P/j3U+HamhDLzck0bPXhHBMsa
3A3klI0hp9Aq17bcq9RSDhYF2m83+OJCCpyfnHpectvHnyN9IkPCLsM8NoUhNz+2
/eeshjybLyWEjkgimQ1AckjodX4/IAJXMF9wkQi6Su9l9P2X8t6QjUakFTsDPqNb
TsGPYv1+GcmOOdeNwMuQf44pmzrAqRCyBaWgR0Ug4qaBQJsiIeGwTtf8xWUbWR36
RGouzpnc41LhxXKuZmTUyQLvmY1dQXsUMcTg4MIoTl6J9pn5hV4xO/IkR4eId0zL
t4hYzSFbZV/8lRsUfXLqW2eX5XuiOjn6rRYiPpGHcdRcdhUu1cSDkFzUjxzHGPfA
qE2A1iPTWq678mGlpmWGWEE9b9b/vQYDXdF9csTVcRsr5kfzViVAnXk6ixCGFjGq
5zVqOC0K6Np16xpZpmYNRZ17G7NDVyP8ifpzqo4uqwrdVlyqC5eOWpIbpd5WhWT4
NZZqpddDqTYjS7lFMdgPHweXhFCmiypd98M+AHPXaRgIj7krwFdueMYRBY7pDKcC
jupY0AEhOJPHR3dZ4G/yr0GQUHmrprTvJz8z+lNs6GrFraBz+PcvW8ttvt3SEoCA
cuqjLlsgyGJRlJJJ5+MTTJbcCBbeQoSl8D5c/kJDPxpUoJKzn/szQBYZJRxOqUMc
kBIp2nguQD2SzxurY6dC
=I3+Y
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--
