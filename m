Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jul 2016 09:26:10 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, dev@linux-sunxi.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] clk: sunxi-ng: mux: support fixed pre-dividers on
 multiple parents
Message-ID: <20160727072610.GE6560@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-6-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
In-Reply-To: <1469516671-19377-6-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--C94crkcyjafcjHxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 26, 2016 at 03:04:27PM +0800, Chen-Yu Tsai wrote:
> Some clocks on the A31 have fixed pre-dividers on multiple parents.
> Add support for them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.c |  9 +++++----
>  drivers/clk/sunxi-ng/ccu_mux.c      |  6 ++++--
>  drivers/clk/sunxi-ng/ccu_mux.h      | 10 ++++++----
>  3 files changed, 15 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/c=
cu-sun8i-h3.c
> index 9af359544110..5f5c900c235b 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
> @@ -184,15 +184,16 @@ static SUNXI_CCU_MP_WITH_MUX(apb2_clk, "apb2", apb2=
_parents, 0x058,
>  			     0);
> =20
>  static const char * const ahb2_parents[] =3D { "ahb1" , "pll-periph0" };
> +static const struct ccu_mux_fixed_prediv ahb2_fixed_predivs[] =3D {
> +	{ .index =3D 1, .div =3D 2},
> +	{ },
> +};
>  static struct ccu_mux ahb2_clk =3D {
>  	.mux		=3D {
>  		.shift	=3D 0,
>  		.width	=3D 1,
> =20
> -		.fixed_prediv	=3D {
> -			.index	=3D 1,
> -			.div	=3D 2,
> -		},
> +		.fixed_predivs	=3D ahb2_fixed_predivs,

I think I'd prefer to have the number of dividers too, instead of
iterating until we find a 0 one. It's easier to iterate over it, the
errors are easier to catch and it's consistent with the other arrays
we give, for example for the parents.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--C94crkcyjafcjHxo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmGISAAoJEBx+YmzsjxAgcm0P+gL2FzMTbs1XneTCfDtIqSq8
XcCdfA6/ZNMY5cZhVAcvRFYfXVCKX/DF+SOm1voJS8EH3XB+boijWYehkA0vkYMG
CP3SQ54eDk/9aZx78tPkw88G58vNCwz40m5Y/6GxJYY4mUQKrj3aIdLFh/sXsByd
xcx2O7LJv2sCbGTwMJwE41pnPXVDAi3krKgBhetP4ILWIVSZhWUqmKTafvjFfpxz
Cy1rJLO7/Jzh8lFvjbvuAZFoFPmgbltrTa8Lf948TKDCPc07OkgQhLBUFVl+Ni7B
KtvKXvTglwLcB1s+M/ANBANgYuYQdiAspn5fLgsQC7w4d+s/v/yczgh3EBKR6OoZ
L+fEat4QZwfG9BzwtEfehxSItEQvGnEzcFOOms1vHX2PrKFXBMONAWNEKXC6oDWE
2SE1iKH9PSC8cLRrhsBnMzaNu3CIEiI2LkqclTD72/boXVUmgT1E9fYPbbGafcou
mF2xPhqyctBxbsgJwD3zFIwk+QIB2e8M9NMmD0Z1djMu8R7fu2jbuw5qTN5PRhK7
38Q9hQLsAC9MaGCY381bhF8C+3vkSl09acaFrvs+WOISC5dHqsp05WWcwUm5SKo+
USpUOmkSR9hJLo05nfN1zyhnBpfVbZLuFpPylwlPADK4upMrDG6T+yNXUAhKQr2o
fVR8dPOmUfWFbcIoWCpC
=tMb2
-----END PGP SIGNATURE-----

--C94crkcyjafcjHxo--
