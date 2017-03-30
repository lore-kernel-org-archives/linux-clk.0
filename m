Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 30 Mar 2017 15:19:28 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, xf@rock-chips.com,
	huangtao@rock-chips.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
	xxx@rock-chips.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] clk: rockchip: rk3228: make noc and some special
 clk as critical_clocks
Message-ID: <20170330131928.s6tr4rgx7bzwqiag@lukather>
References: <1490695614-3220-1-git-send-email-zhangqing@rock-chips.com>
 <1490695614-3220-3-git-send-email-zhangqing@rock-chips.com>
 <20170330124417.73ucpdkoonuiyhxz@lukather>
 <6718031.Ukr0mjLQLl@phil>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i63pmrtaaox3mivm"
In-Reply-To: <6718031.Ukr0mjLQLl@phil>
List-ID: <linux-clk.vger.kernel.org>


--i63pmrtaaox3mivm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2017 at 03:10:24PM +0200, Heiko Stuebner wrote:
> Am Donnerstag, 30. M=E4rz 2017, 14:44:17 CEST schrieb Maxime Ripard:
> > On Tue, Mar 28, 2017 at 06:06:52PM +0800, Elaine Zhang wrote:
> > > Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> > > ---
> > >  drivers/clk/rockchip/clk-rk3228.c | 30 +++++++++++++++++++++++++++++-
> > >  1 file changed, 29 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip=
/clk-rk3228.c
> > > index db6e5a9e6de6..4d3203f887e2 100644
> > > --- a/drivers/clk/rockchip/clk-rk3228.c
> > > +++ b/drivers/clk/rockchip/clk-rk3228.c
> > > @@ -445,7 +445,7 @@ enum rk3228_plls {
> > >  			RK2928_CLKGATE_CON(2), 12, GFLAGS,
> > >  			&rk3228_spdif_fracmux),
> > > =20
> > > -	GATE(0, "jtag", "ext_jtag", 0,
> > > +	GATE(0, "jtag", "ext_jtag", CLK_IGNORE_UNUSED,
> >=20
> > CLK_IGNORE_UNUSED only prevents a given clock from being gated at
> > late_initcall time, but will not prevent it from being gated later in
> > the life of the system, for example if a reparenting occurs, or if all
> > the clocks sharing the same clock tree become disabled.
> >=20
> > If your clock really should never ever be gated in order for Linux to
> > operate properly, you should use CLK_IS_CRITICAL.
>=20
> in the scope of the jtag clock, that is actually ok. As it only gates
> some clock supplied from an external source (ext_jtag).

It might, I don't know how your clocks work in general, this was just
a warning that this probably isn't sufficient if the clock is actually
critical.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--i63pmrtaaox3mivm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY3QXcAAoJEBx+YmzsjxAgmLYP/jgMtGIrfF7g5n0NVY+3ZdwO
e9Mbiy3GNcWYENxT6MOPz6fpp/+T51npll4Q9VlT2X/AupL0yhVEnPSm2qiEVV0Q
L7cVUXktpjTEZRNeDWNJF/HoSyKA9GF52mpCMzCekWUKuCqdvS4wMuIKZdJlKPWD
aIX1ilTstsRB3L4XX4+uvXbfoRzpHAyz+SnZ7P9MREMYcnHRDLx0sj0ms0hPw4fT
WRjA8lnpmxXgfq9z8B9rBUHkTX1KwX0OOIn6ux6H7HApPWsPM/Fo4mQZOoFatgnv
wGiM5REci25JmTKSFo8ifOhJGSHMJHrDw5rQV+oCPXt2h2ofKzizOmQoR7/LnBWP
Mxfi8O2lkLGnrai5Kopk6gksddKM9hJt/VndGiIofcvJ476sHXZzwQnKinAdh0gR
XlEzqp9lQMMcXUnVgQ+XgKHqkMyJhzhy8ud3qeHbBgMa6ncrfmv3OqOi12AThxbL
li0l6KYZLEkQiPRtZZTnfCgzCAINuIcS/NqWasoA1//YhjHFA5fFXXlLCcE4wboK
gDgwWQpFkKcyaHjF5ZwIHhHju2Vrptavxu3GWcokdx5oH1ooRcbZrlVoUt26QVSw
oV5ZkW8aMKzi42tCbr7HUoY/0+BT1DYIQSSuVH4vzraZcQswGw3st4hCqd1k0ga8
/Nvki3w3ygW0rLIdLuS8
=Oqll
-----END PGP SIGNATURE-----

--i63pmrtaaox3mivm--
