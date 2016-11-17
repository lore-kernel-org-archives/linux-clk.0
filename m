Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 17 Nov 2016 23:35:07 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner clock changes for 4.10
Message-ID: <20161117223507.bdpwlmfzprv7vbhd@lukather>
References: <20161115212615.lm3guceyfmdjnhfp@lukather>
 <20161116192656.GJ25626@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lpg5z7runczejxeo"
In-Reply-To: <20161116192656.GJ25626@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--lpg5z7runczejxeo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2016 at 11:26:56AM -0800, Stephen Boyd wrote:
> On 11/15, Maxime Ripard wrote:
> > Hi Mike, Stephen,
> >=20
> > Please pull the following patches for the next merge window.
> >=20
> > Thanks!
> > Maxime
> >=20
> > The following changes since commit 1001354ca34179f3db924eb66672442a1731=
47dc:
> >=20
> >   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
> >=20
> > are available in the git repository at:
> >=20
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git sun=
xi-clk-for-4.10
> >=20
> > for you to fetch changes up to 0f6f9302b819ca352cfd4f42c18ec08d521f9cae:
> >=20
> >   clk: sunxi-ng: sun8i-h3: Set CLK_SET_RATE_PARENT for audio module clo=
cks (2016-11-11 21:47:41 +0100)
>=20
> Pulled into clk-next, but I get the following grumbles...
>=20
> ERROR: space prohibited before that ',' (ctx:WxW)
> #282: FILE: drivers/clk/sunxi-ng/ccu-sun50i-a64.c:206:
> +                                            "pll-cpux" , "pll-cpux" };
>                                                         ^
>=20
> ERROR: space prohibited before that ',' (ctx:WxW)
> #289: FILE: drivers/clk/sunxi-ng/ccu-sun50i-a64.c:213:
> +                                            "axi" , "pll-periph0" };
>                                                    ^
>=20
> ERROR: space prohibited before that ',' (ctx:WxE)
> #325: FILE: drivers/clk/sunxi-ng/ccu-sun50i-a64.c:249:
> +                                            "pll-periph0-2x" ,
>                                                               ^
>=20
> ERROR: space prohibited before that ',' (ctx:WxW)
> #333: FILE: drivers/clk/sunxi-ng/ccu-sun50i-a64.c:257:
> +static const char * const ahb2_parents[] =3D { "ahb1" , "pll-periph0" };
>                                                      ^
>=20
> drivers/clk/sunxi-ng/ccu-sun50i-a64.c:160:16: warning: symbol 'pll_mipi_c=
lk' was not declared. Should it be static?
> drivers/clk/sunxi-ng/ccu-sun50i-a64.c:507:16: warning: symbol 'tcon1_clk'=
 was not declared. Should it be static?
>=20
> I'll go fix them this time, but please be more careful next time.

Ugh, sorry it slipped through...

Thanks for fixing it,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lpg5z7runczejxeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYLjCWAAoJEBx+YmzsjxAgmj8QAKQjTCtD9HWz48C2dI7GQHsY
q7RZUtZzHhMICcIdz3DhBHTr70+qsUVcvoJKxKvWWlZe5a25a8Bq34Y4wHs7HzQg
H1StPfHFkP6W4ZbIOilkFlFB6MUBbJpY7nmg6Zp/FBEewnPDI28Wp+2foi3ljU76
vK0OnUvGOfv4x4akqxYjmIdA1qrMFONL/rSRJiTpnYrRDvc4m3AcmaFWW0855YIW
HD+8ByYfek3WQbBidDJzl3nZmPWklcyIPkQKwgluAyUVSjMg13fj8KEyaf1vF5jc
1BkTs7DYPgdQ8Afjjn9yXq2+f2krW7r1fG9lJx4PeQs28Qd3MYU5wfUyGkY4+eTb
ST05yjTDdrKX7VS2741DDZmm4Qh80aQNd+ykDR3KLFI9xkOMOnSoI8XN4vMAxT5N
9FuTaPi+WyCORfQITSFX9gtdO004OzuUs2PeAAuFJlzG3nV7GRHlbbpt6oKlq3DI
3M1XwHJoEyCVYy2PTIJUA6q0ed/9qko0VoUoTsq4wyXA/2DCIk71iQQvg9snn1+p
6Q+6KLuKGgwvNAfuWPClQtgsIKr8mDS1Vu3/gvfm/7vMS5b4R7qe4AnYxig6ZuyF
Sc566InZAGhILgEtXyd+jp3HaWMQmoZzhc7xtfkDfwzrn+eqsJxmanu5WwIbogi/
zbQ0LmcatOJHfNJF1KiY
=bJiq
-----END PGP SIGNATURE-----

--lpg5z7runczejxeo--
