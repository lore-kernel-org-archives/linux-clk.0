Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 5 Jul 2017 09:43:10 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	Jonathan Liu <net147@gmail.com>
Subject: Re: [PATCH v5 1/6] clk: sunxi-ng: div: Add support for fixed
 post-divider
Message-ID: <20170705074310.b6ycyf27htv5gkxm@flea>
References: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes@plaes.org>
 <805048a548031cafc890e6ea06ee773bdfb199d0.1499197129.git-series.plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pldjrt2krdkb5i6a"
In-Reply-To: <805048a548031cafc890e6ea06ee773bdfb199d0.1499197129.git-series.plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--pldjrt2krdkb5i6a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2017 at 11:04:56PM +0300, Priit Laes wrote:
> SATA clock on sun4i/sun7i is of type (parent) / M / 6 where
> 6 is fixed post-divider.
>=20
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  drivers/clk/sunxi-ng/ccu_div.c | 18 ++++++++++++++++--
>  drivers/clk/sunxi-ng/ccu_div.h |  3 ++-
>  2 files changed, 18 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_di=
v.c
> index c0e5c10..054b12a 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -21,6 +21,9 @@ static unsigned long ccu_div_round_rate(struct ccu_mux_=
internal *mux,
>  {
>  	struct ccu_div *cd =3D data;
> =20
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		rate /=3D cd->fixed_post_div;
> +
>  	return divider_round_rate_parent(&cd->common.hw, parent,
>  					 rate, parent_rate,
>  					 cd->div.table, cd->div.width,

This doesn't work.

The rate formula is
rate =3D parent / div / 6

Which is equivalent to
div =3D rate * 6 / parent

You should be multiplying the rate, not dividing it (or dividing the
parent, but then you'll also need to multiply it back after the call
to divider_round_rate_parent).

Consider this, some driver wants to set a rate of 100MHz on this
clock. The parent is 1.2GHz, and you have your postdiv of 6.

The divider we want to compute is 2, obviously.

You're doing here:
rate / 6 =3D parent / div

Which means that you'll end up trying to find the divider between
1.2GHz and 16.6666MHz, which is going to be 72.

> @@ -62,8 +65,13 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw=
 *hw,
>  	parent_rate =3D ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
>  						  parent_rate);
> =20
> -	return divider_recalc_rate(hw, parent_rate, val, cd->div.table,
> -				   cd->div.flags);
> +	val =3D divider_recalc_rate(hw, parent_rate, val, cd->div.table,
> +				  cd->div.flags);
> +
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		val /=3D cd->fixed_post_div;
> +
> +	return val;
>  }
> =20
>  static int ccu_div_determine_rate(struct clk_hw *hw,
> @@ -71,6 +79,9 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
>  {
>  	struct ccu_div *cd =3D hw_to_ccu_div(hw);
> =20
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		req->rate *=3D cd->fixed_post_div;
> +

I guess this is why you never really saw the issue. Combined with your
division in ccu_div_round_rate, it produces the exact rate you were
given as an argument.

>  	return ccu_mux_helper_determine_rate(&cd->common, &cd->mux,
>  					     req, ccu_div_round_rate, cd);
>  }
> @@ -89,6 +100,9 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsigne=
d long rate,
>  	val =3D divider_get_val(rate, parent_rate, cd->div.table, cd->div.width,
>  			      cd->div.flags);
> =20
> +	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
> +		val /=3D cd->fixed_post_div;
> +

If you multiply the rate before calling divider_get_val, you won't
have to do the division of the divider, with all the rounding
weirdness it might create.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pldjrt2krdkb5i6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZXJiOAAoJEBx+YmzsjxAgiowP/R5LQ7KS+joicaJ8GGbQ0rvx
lkmGQT3tXydnYtIMNNqWr6054JdWsyB4WU/uZXQHsH8AaPQ2OJrFDWEQtAYNEEVG
YY6cSDqNu6GBQ+FWBUZgkRT1fNMKGRAA08lz6dKJk3RQNFeTZmZxgak+D90iwGz1
/iCdGeS0Tag39GgznGpwJBaIObHtdD5nwqv+YSM1GjkErfrPpy0+HLKWx4H6E6pE
4IvU/H1mDgMIM/MJewBBrOspEUr71HqPuuTZ7zlWDayD9r+LsuqKb0aoZqDwOyS2
BIHTQipqxyByzhwE0qjXTu9F6iwgAFano93w8xH+/RJczs+2ZBsDDXpGDrV4kRdV
X6R7YmRykNSGz+sUN4uCe0f0xrSF86YHkn59ir8M0YRY14KOPVIQ1FGyuxF41VPJ
FMYJC2IgSXNL9axxsmoxz7Wna50j4UeeOXBRLqa9aqB961lz7s/Yr7Gv+r8gWyjl
WKb3v4gCUpqnovF3lSRDYgZkFKVKuw4kHhcJlSMuq9MTjUutJqKDLo/Q6VXt3R9C
qnPHzoFLt8gZKWVLJtrmqXZDYWuTenKmHaiORJN91p/Lmp2eWR7mXiptI9ZXtpcy
3bBttVIcR9lAhocsGdSGpwEjhvBzxn8uTXM1jrcEWRBspKYvL/Xd4UpKWMdp0c8C
5EM4XGGKpUxHkhBJyRvd
=Qj7v
-----END PGP SIGNATURE-----

--pldjrt2krdkb5i6a--
