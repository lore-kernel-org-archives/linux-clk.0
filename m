Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 27 Apr 2017 09:04:36 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: wens@csie.org, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: sunxi-ng: Fix dependency on SUNXI_CCU_GATE
Message-ID: <20170427070436.3qu4mzepq4gmmymi@lukather>
References: <20170426115319.30951-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z4ql26xsvxmm4wsl"
In-Reply-To: <20170426115319.30951-1-clabbe.montjoie@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--z4ql26xsvxmm4wsl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2017 at 01:53:19PM +0200, Corentin Labbe wrote:
> When CONFIG_SUNXI_CCU is set but no other SUNXI_CCU is selected i got
> the following build error:
> drivers/built-in.o: In function `ccu_pll_notifier_cb':
> drivers/clk/sunxi-ng/ccu_common.c:71: undefined reference to `ccu_gate_he=
lper_disable'
> drivers/clk/sunxi-ng/ccu_common.c:73: undefined reference to `ccu_gate_he=
lper_enable'
>=20
> The problem is the function ccu_pll_notifier_cb in ccu_common.c need
> some function from ccu_gate.c which is not compiled since SUNXI_CCU_GATE
> is not selected.
>=20
> This patch remove SUNXI_CCU_GATE and compile ccu_gate.c unconditionnaly
> since all other combination of options select SUNXI_CCU_GATE finally.
>=20
> Fixes: 02ae2bc6febd ("clk: sunxi-ng: Add clk notifier to gate then ungate=
 PLL clocks")
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>

I think Chen-Yu had some comments that you didn't address.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--z4ql26xsvxmm4wsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZAZgAAAoJEBx+YmzsjxAgUKoP/R8c3ueaGTaY3o8itVyiNXfj
YpIb6FWUJmZoM4AA5v47lkAOgQIDMeS0in33U5dvg9UIKzRwlQloPNW0eHse5RS/
UNFK9QY+9GuXKGxBpOuCj/HhKAW6ECbgVvtFSvCOOhO71mInOTTZLc1dcf3N+3iH
ZtQ1/Sf6sC5Fz2O/v1UHz6ZWHkO42hlC7MydonR1VSfuxNrmWPXhWA/kdqUsK9y1
WNyg6RUwDWsf36OyytVDsZcUf93BhA3dcDQvt4yCD9Hp6LzrACPHaeSdtvOrBlg3
OV5TFxmAh3K5Z4BS1WMLDqcWQPE40rzGiezLuEUhALinP0JTUNvu1ytS+iPQoBVp
UixET9F9AXGxVg317wu2SCpEmqK96UnjOs1BeunC/ENk78zn5hLy3dDJ7JiqbByt
a+Q7R7xfXg4MG/bTLeLLWqnAO0NxuB/IX9m/5Krl3VtF4E8tOXl/FeTDz93kruGn
ovzAJY6Pqi/J4hZFLXUjw/BfYhSmq/lXjnGdiKEYxBcpXLMx1cLRJ/584LBcmd+e
ngTvR/vEDq3jQmf+B+rm4NnLd2Nq/OXuXXBzKNpBRsMYTlaymeDYQNn+K2+xaArc
j1PFhuxv7chpOWOJG+vMBZxa7AQ3YxxyNRvPzJmYy6Uyh7IFuOB3SLeOUbQ1HTb3
rk3AtgTz9PFm63RNTl3H
=OSKO
-----END PGP SIGNATURE-----

--z4ql26xsvxmm4wsl--
