Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 30 Jun 2016 22:40:01 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: megous@megous.com
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate
 application method
Message-ID: <20160630204001.GC5485@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
In-Reply-To: <20160625034511.7966-7-megous@megous.com>
List-ID: <linux-clk.vger.kernel.org>


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jun 25, 2016 at 05:45:03AM +0200, megous@megous.com wrote:
> From: Ondrej Jirman <megous@megous.com>
>=20
> PLL1 on H3 requires special factors application algorithm,
> when the rate is changed. This algorithm was extracted
> from the arisc code that handles frequency scaling
> in the BSP kernel.
>=20
> This commit adds optional apply function to
> struct factors_data, that can implement non-trivial
> factors application method, when necessary.
>=20
> Also struct clk_factors_config is extended with position
> of the PLL lock flag.

Have you tested the current implementation, and found that it was not
working, or did you duplicate the arisc code directly?

>  /**
> + * sun8i_h3_apply_pll1_factors() - applies n, k, m, p factors to the
> + * register using an algorithm that tries to reserve the PLL lock
> + */
> +
> +static void sun8i_h3_apply_pll1_factors(struct clk_factors *factors, str=
uct factors_request *req)
> +{
> +	const struct clk_factors_config *config =3D factors->config;
> +	u32 reg;
> +
> +	/* Fetch the register value */
> +	reg =3D readl(factors->reg);
> +
> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) < req->p) {
> +		reg =3D FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
> +
> +		writel(reg, factors->reg);
> +		__delay(2000);
> +	}

So there was some doubts about the fact that P was being used, or at
least that it was useful.

> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) < req->m) {
> +		reg =3D FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
> +
> +		writel(reg, factors->reg);
> +		__delay(2000);
> +	}
> +
> +	reg =3D FACTOR_SET(config->nshift, config->nwidth, reg, req->n);
> +	reg =3D FACTOR_SET(config->kshift, config->kwidth, reg, req->k);
> +
> +	writel(reg, factors->reg);
> +	__delay(20);
> +
> +	while (!(readl(factors->reg) & (1 << config->lock)));

So, they are applying the dividers first, and then applying the
multipliers, and then wait for the PLL to stabilize.

> +
> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) > req->m) {
> +		reg =3D FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
> +
> +		writel(reg, factors->reg);
> +		__delay(2000);
> +	}
> +
> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) > req->p) {
> +		reg =3D FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
> +
> +		writel(reg, factors->reg);
> +		__delay(2000);
> +	}

However, this is kind of weird, why would you need to re-apply the
dividers? Nothing really changes. Have you tried without that part?

Since this is really specific, I guess you could simply make the
clk_ops for the nkmp clocks public, and just re-implement set_rate
using that logic.

You might also need to set an upper limit on P, since the last value
(4) is not a valid one.

I guess you could do that by adding a max field in the __ccu_div
structure.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXdYOhAAoJEBx+YmzsjxAgzR4QAL1Bbup57A7vQfC+ANzgg+rq
e0jZNc/c3Z/yphg5ixmDQ2dDqrNjRKuehAcgejRaEKRVvSPhK2N+WK16n6fBXDdv
Kzi0axLyq2Jq/Hptsa+AT3EDmG0DJ8rj/lp2lEc1C7dPfVukf5rh1fFe26jHIa2t
CIHBWwBxzdytxiiY7n/MPhELRULyYe96UHjfnjCiBZG6XAB0DuBKw9+BaZvTk5rU
jrmfePNx7nPG1yvCC+OS7/Gg+p4rnlPpeP4VrmrP0OZGqGJRsP8eGJszQT+hfOjJ
oe1n2oi2I5gqc/VkZBosvRstILiFMldoMXO9dExSiqBiwDoSmcdZfbMDDC9A3d2g
xmLL4tpM4iut0Qi18acVINZ7MFogrOnFTQMUN+JmhxTgiMbfh9QipyWV892TfTk4
vTEd1zIb+hdFnsNghlUh8zpYBC52crtadsIz3HUqZbyuh3MIQP3zRK0hI2QrKUz2
2+jFxfOn1OOMdyYVggAUyhn3iJ4I+ksPQprfUAFu47PxodXdeWw7Gt0N7fVw336p
S6/w5l7kXrD+bwQFj16/bWanEwvHsIv42HhNgslQHbtPpJS0sQElxN6fs8qNLe/1
oCJJS/xk63Ku011jJYa9rvuhAT1BZlhi0hIsbnL5R6cbYm2MQqry6zVpKRFXZrNb
9B13S8poycqalBEUnxyF
=YDC5
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
