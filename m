Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:52813 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752321AbcCUHZt (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2016 03:25:49 -0400
Date: Mon, 21 Mar 2016 08:25:46 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@csie.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: Accept a greater rate when setting a parent
 clock
Message-ID: <20160321072546.GT30977@lukather>
References: <20160310081658.B749246B@mail.free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cN+O50sc7gZAK+8F"
In-Reply-To: <20160310081658.B749246B@mail.free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--cN+O50sc7gZAK+8F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 10, 2016 at 08:15:02AM +0100, Jean-Francois Moine wrote:
> The best rate of a clock may be a bit greater than the requested one.
> In such a case, the rate setting from a child clock was rejected.
>=20
> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> ---
> I don't know exactly why the rate constraint existed nor what can be
> the impact of setting the rate of other clocks.
>=20
> I had the problem when setting the PLL2 clock of the H3 (patch to come).
> It has 4 outputs, so, it is composed of a base clock and 4 children
> clocks pll2, pll2x2, pll2x4 and pll2x8 with a fixed factor (/4, /2, 1
> and *2).
> The pll2 clock rate may be only 24576000 (for the audio family 48000Hz)
> or 22579200 (for the audio family 44100Hz).
>=20
> Setting 24576000 asks for mul=3D86 and div=3D21,4 giving 24571428 as the
> best rate, i.e. a bit slower than requested: good.
>=20
> Setting 22579200 asks for mul=3D64 and div=3D17,4 giving 22588235, i.e.
> a bit greater: then, the rate setting was rejected (no parent clock),
> preventing audio streaming at 44100Hz.
> ---
>  drivers/clk/sunxi/clk-factors.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-fact=
ors.c
> index 59428db..d0774c2 100644
> --- a/drivers/clk/sunxi/clk-factors.c
> +++ b/drivers/clk/sunxi/clk-factors.c
> @@ -86,7 +86,7 @@ static int clk_factors_determine_rate(struct clk_hw *hw,
>  	int i, num_parents;
>  	unsigned long parent_rate, best =3D 0, child_rate, best_child_rate =3D =
0;
> =20
> -	/* find the parent that can help provide the fastest rate <=3D rate */
> +	/* find the parent that can help provide the fastest rate */
>  	num_parents =3D clk_hw_get_num_parents(hw);
>  	for (i =3D 0; i < num_parents; i++) {
>  		parent =3D clk_hw_get_parent_by_index(hw, i);
> @@ -100,7 +100,7 @@ static int clk_factors_determine_rate(struct clk_hw *=
hw,
>  		child_rate =3D clk_factors_round_rate(hw, req->rate,
>  						    &parent_rate);
> =20
> -		if (child_rate <=3D req->rate && child_rate > best_child_rate) {
> +		if (child_rate > best_child_rate) {

I'm not sure this would work, since you'll end up picking the fastest
rate without considering whether it is the closest or not.

I guess what you want here is using the absolute difference between
the requested rate and the rate you're evaluating.

That being said, we had a similar discussion for SPI around a month
ago where we wanted a rate strictly lower than the requested one. I
guess it's time to add a flag to tell how you want to round.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--cN+O50sc7gZAK+8F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW76H6AAoJEBx+YmzsjxAgg3YQAIi0hXEc6Czq0lOl5bjtxLvs
hNcFuKjV0qEpx1kFWk/MO5MlGkJ6gEIrmjJ5s0TdpsTpMjdUAtmAiDISVHz1rfS+
Q6RNpaYrCmsWC2WMKBY7xiM6AJE6VBnm1U42MkcIWCOST/lNql475YSKORWkUJrz
kyqnYwMVLL3lMK+mbSe358yg51WLFcu+G3OKqNYUrF6aAU9ErfemrmzNSkFOi2Je
PYPCYMMGA4YO07IVUzuHfwWhjdeFVXfr8CFJTLRkVb8x4nxxS6DUPNYF+rEbJJ/w
SonIjUAoB9fVutENkhFeMU5tU8U8JbdjMfhXEJHpwE8Ymo5BpC7BEdPfp+MnByqB
SnnGS/hdxuBCc41Fpssdk+aPtr/oy188ZeL6n+KtIXax3YgR8v2Q33RJarQAFqck
qYm49vvG+4VNgd7KMWoB88rUB29FRxvYnPLMD14Ei4pq/g+3ImrzBIGy+d7lR79J
6sdDD1+1dV/K66ZT5Wvwc9ebO7TQbY+6Kd+S6gXp8xTKKIS4NVHyEXYDgk9cKUw3
ZSb+USdkKywdEXAEBD1Ed9+IQyxPRK/Ikto86pg+J8u368bgbIYMyYKCchlaU5Pt
WvHn+mjXXOtM9+d3KimnvQnXPt+DY3NB0EPpAUfTqAr0jv86PhlsDUWTB7CA3pDw
+Xfo+SI8pHNe+eeavkBc
=+xGw
-----END PGP SIGNATURE-----

--cN+O50sc7gZAK+8F--
