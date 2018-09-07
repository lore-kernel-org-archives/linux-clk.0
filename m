Return-Path: <maxime.ripard@bootlin.com>
Date: Fri, 7 Sep 2018 10:21:03 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com, stable@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: sun4i: Set VCO and PLL bias current to
 lowest setting
Message-ID: <20180907082103.lyuubyqpojehtkz4@flea>
References: <20180906132537.20772-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4r465mu54fmqtukv"
In-Reply-To: <20180906132537.20772-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--4r465mu54fmqtukv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 06, 2018 at 09:25:37PM +0800, Chen-Yu Tsai wrote:
> The default mid-level PLL bias current setting interferes with sigma
> delta modulation. This manifests as decreased audio quality at lower
> sampling rates, which sounds like radio broadcast quality, and
> distortion noises at sampling rates at 48 kHz or above.
>=20
> Changing the bias current settings to the lowest gets rid of the
> noise.
>=20
> Fixes: de3448519194 ("clk: sunxi-ng: sun4i: Use sigma-delta modulation
> 		      for audio PLL")
> Cc: <stable@vger.kernel.org> # 4.15.x
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--4r465mu54fmqtukv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluSNO4ACgkQ0rTAlCFN
r3TMyRAAh3jAsO4qNUi+iFocPIIWANn3WoZXVWogssEqiN+p4nXmWeaMOor/6L0D
tl+U57875b8p2Tg1zvhEL3f0ysophN1JekM9GblnCJPjYQdazJ/HMzDkzQWgxrKI
/rx0TqxZrW3psXmwGlLGjkGFA067S6xkiIl6g3J+EFPyq8vg7GBbBnsGLRVP3E8f
0qJOXf3wHLv2LSZuA8ioY3tQTYPUWMtGskTHk0iOM+6ShPMwrueT+eiAmVQAA5JU
nv7xuKQlFpzsdoPTYJtTf33CS+2T7mft6Es4HhsIeSxUhMIlh0VzRDGhGehSNuFS
frGfgF8jzwQ7BBZSl2tZvoPXMOl59TJrGyXh6VaGsFqq56EZXEWMIqaHup91Pfcn
mD988om3lTeZ4HLUBGOj5I7WJmmoc3FLXK6Gq/4MSA1tq5SrqIlnEwytX2LXq5JT
PRGm83Ul5eB49RUPa57zMTNHjcFZbap0cDTjbf9R+jawhqvjSpHosZmKZwy9FQe2
UyVc9S40CD6W74a+lE2XbL4sz/uvrEBDVSQLHGeJdrtsK2mLI61wVR5ZFunIxbna
SYfG+RHknIk88WU5Ll7woWqzsZQF/kyMyK6xbyCm0dHZu5PUnShJBK1Oe2KFJ2Ge
fBaXBIpjrazq+dcbG6ClWK54XVph+IkFaU7QHKYVlB3QX+ib2D8=
=AgJO
-----END PGP SIGNATURE-----

--4r465mu54fmqtukv--
