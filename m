Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 10 Jan 2016 17:56:44 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Jens Kuske <jenskuske@gmail.com>
Subject: Re: [PATCH] clk: sunxi: Drop clk.h include
Message-ID: <20160110165644.GF9631@lukather>
References: <1452302082-18580-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yH1ZJFh+qWm+VodA"
In-Reply-To: <1452302082-18580-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--yH1ZJFh+qWm+VodA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 08, 2016 at 05:14:42PM -0800, Stephen Boyd wrote:
> This file is a clock provider, not a clk consumer. Drop the clk.h
> include.
>=20
> Cc: Jens Kuske <jenskuske@gmail.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Applied, it will be part of my PR for 4.6. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--yH1ZJFh+qWm+VodA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWko1MAAoJEBx+YmzsjxAg4CYQAI67WG+GwmV//YnMApZBofXl
8OG+BDZJxNX/athEfsnJMZyWhViyKedCXdU0xgyN4X6W0vFjMEvgySKx2NVpHnmk
hAu6f1GJLv3vwat8JcbRvggGSjppo2oz+IAB+5QsDTneg1Rp8L6yEJ8OI0I8DUzj
MatsD/YQlLy1i2Fo2LwJF2sA5TSbZymu2FCwvDcANZl9VASSrrU6imPw2P17hRBf
kETX6ZFaE0kboIUwurJLRkHXDUWCoGGyAcAQW8FMsL0CyZf3UIXZoW9I0acj/BJo
IxDiEAkhB7mcvqfj91gUX536q8pHDgY5QWvoTMn+OpHiyC6ozAKWdaM6xaPgnA84
F8gosKGvxYMVyp8cS2yBGp0z+0abMO6S8bfK1XGnvKJI3nvjWn10whx1HUxY2bwd
IWoFIYPSBLD2gYChjx0xePUjcxmobwYRR/aSgXil77JvlXJYdhfMf3p7Av6Vv9Lg
+z6nqFQUhWJkjtDEcs1nKz4Vo1B+0anescT46XWUx2X+qydH2BPc7JJwzwC8nQcg
/ziZ/s91v3eX5Sz8RiUw7CG+Vs7cd1Vszy945ffjpJmWcaPgLUVzagcvux0ArYKG
3XWakFWTfdSHey2A2NG+1eP89s3oIcu9+P0jip1fdu5N2izkso8oChb1nVecaYwA
NuzguD05EidtdWpdjFvT
=PCp0
-----END PGP SIGNATURE-----

--yH1ZJFh+qWm+VodA--
